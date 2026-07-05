# Plano: Desenho da API (OpenAPI 3.1) — Plataforma Nacional de Casas Espíritas

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Objetivo:** produzir a especificação OpenAPI 3.1 completa da API do produto (leitura pública, gestão autenticada, notificações push e webhooks — estes diferidos, D18) em `api/`, validada por lint automatizado, cobrindo a decisão D11 e o épico 7 do backlog.

**Arquitetura:** especificação multi-arquivo (`api/openapi.yaml` raiz + componentes e caminhos referenciados por `$ref`), lintada com Redocly CLI via Docker. Recursos, propriedades e descrições em PT-BR. Erros no padrão RFC 9457 (`application/problem+json`); paginação por página; segurança em três degraus (anônimo → API key → OAuth2), como em `spec-final/06-integracoes-api-seo.md` §6.3.

**Stack:** OpenAPI 3.1.0, Redocly CLI (Docker, base Alpine), GNU Make, markdownlint (já existente).

## Restrições globais

Valem para **todas** as tarefas (fontes: `spec-final/`):

- Todo texto de descrição em **português brasileiro** (regra do repositório).
- Versionamento `/v1/`, política de depreciação mínima de **12 meses** (`06` §6.3).
- Quotas provisórias: anônimo **60 req/min por IP** (CORS aberto); API key **600 req/min por key**; escrita só OAuth2 (`06` §6.3, D11).
- Throttling responde **HTTP 429 com `Retry-After`** (`06` §6.3).
- A API **nunca expõe**: campos `adm_*`, dados de candidaturas em leitura pública, listas de tarefeiros/coordenadores, e-mails/telefones pessoais (`06` §6.3, `04` §4.4 regra 4).
- Estatísticas apenas **agregadas com k-anonimato (k ≥ 5)** (`07`, A9).
- Casas não ativas expõem publicamente **só nome + cidade + status** (A8).
- Usuários federativos/de órgão **não alteram dados de casas** — a API não pode ter endpoint que viole isso (anti-requisito N.5).
- Meta de desempenho: p95 da API pública ≤ 500 ms (`10` §10.2) — limite de paginação máx. 100 itens.
- Docker preferencialmente Alpine; processos repetíveis viram regra de Makefile; todo asset construído passa por lint (regras do repositório).
- **Não commitar sem o usuário pedir não se aplica à execução deste plano**: a execução aprovada do plano inclui os commits descritos nas tarefas.

## Estrutura de arquivos

```text
api/
  openapi.yaml                     # raiz: info, servers, tags, security, componentes, refs de caminhos
  componentes/
    parametros.yaml                # Pagina, PorPagina, Uf, filtros geo
    respostas.yaml                 # NaoAutorizado, Proibido, NaoEncontrado, MuitasRequisicoes, ErroPadrao
    schemas/
      problema.yaml                # Problema (RFC 9457)
      paginacao.yaml               # Paginacao (envelope de listas)
      territorio.yaml              # Federativa, OrgaoRegional, Municipio
      casa.yaml                    # CasaResumo, CasaPublica, CasaGestao, NovaCasa, HorarioSemanal
      trabalho.yaml                # AtividadePublica, EventoPublico, PalestraPublica, Agenda
      governanca.yaml              # ItemFilaRevisao, EstatisticasAgregadas, NovaDenuncia, NovaCandidatura, CandidaturaGestao, Solicitacao, TransicaoStatus
      webhooks.yaml                # EnvelopeWebhook, InscricaoWebhook
  caminhos/
    territorio.yaml                # /federativas, /orgaos, /municipios
    taxonomia.yaml                 # /taxonomia/areas, /taxonomia/classificacoes
    casas.yaml                     # /casas, /casas/{uf}/{slug}, sub-recursos públicos, agenda.ics
    trabalho.yaml                  # /atividades, /eventos, /palestras
    transparencia.yaml             # /transparencia/fila-revisao, /estatisticas
    gestao.yaml                    # /gestao/** (OAuth2)
    formularios.yaml               # /denuncias, /atividades/{id}/candidaturas
.redocly.yaml                      # config do lint
Makefile                           # + lint-api, preview-api, bundle-api
```

Convenção de `$ref`: arquivos de caminhos referenciam schemas por caminho relativo
(ex.: `$ref: '../componentes/schemas/casa.yaml#/CasaPublica'`); a raiz referencia
cada caminho (ex.: `/casas: { $ref: './caminhos/casas.yaml#/CasasColecao' }`).
Schemas ficam como chaves de topo nos arquivos de schema (sem invólucro
`components:`). `securitySchemes` ficam **inline na raiz**.

## Decisões de desenho embutidas neste plano

Registrá-las em `spec-final/11-decisoes.md` na Tarefa 10:

1. **OpenAPI 3.1.0** (suporte nativo a `webhooks` e alinhamento com JSON Schema).
2. **Nomes em PT-BR**: caminhos (`/casas`, `/palestras`), propriedades em `snake_case` (`aberta_agora`), componentes em `PascalCase` (`CasaPublica`).
3. **Paginação por página**: `pagina` (≥ 1) + `por_pagina` (1–100, padrão 25), envelope `{ dados, paginacao }`. Simples para o plugin WordPress; escala do diretório (dezenas de milhares) não exige cursor.
4. **Erros RFC 9457** (`application/problem+json`) em todas as respostas ≥ 400.
5. **Cabeçalhos de quota**: `RateLimit-Limit`, `RateLimit-Remaining`, `RateLimit-Reset` em toda resposta; `Retry-After` no 429.
6. **Escopos OAuth2 grossos** (`casa.gerenciar`, `revisao.status`, `orgao.gerenciar`, `federativa.gerenciar`) — a autorização fina é sempre decidida no servidor pelo vínculo usuário×papel×escopo (`04` §4.1). O escopo limita o token, nunca substitui o RBAC.
7. **Formulários públicos** (denúncia, candidatura) são escrita **sem OAuth2**, protegidos por rate limit estrito + token de desafio anti-abuso (provedor = nova pendência).
8. **Assinatura de webhook**: HMAC-SHA256 do corpo no cabeçalho `X-Assinatura-Hmac-Sha256`, segredo por inscrição.

---

### Tarefa 1: Ferramentas e esqueleto da especificação

**Arquivos:**

- Criar: `.redocly.yaml`
- Criar: `api/openapi.yaml`
- Modificar: `Makefile` (acrescentar alvos; não remover nada)

**Interfaces:**

- Consome: nada (primeira tarefa).
- Produz: alvo `make lint-api` (usado como verificação por todas as tarefas seguintes); documento raiz com `info`, `servers`, `tags` e `security` que as demais tarefas estendem.

- [ ] **Passo 1: criar `.redocly.yaml`**

```yaml
# Configuração do lint da especificação OpenAPI (Redocly CLI)
extends:
  - recommended
rules:
  # Licença será definida na publicação (pendência de domínio/hospedagem P9)
  info-license: off
apis:
  casas-nacional@v1:
    root: api/openapi.yaml
```

- [ ] **Passo 2: criar `api/openapi.yaml` (esqueleto)**

```yaml
openapi: 3.1.0
info:
  title: API — Plataforma Nacional de Casas Espíritas
  version: 1.0.0-rascunho
  summary: Diretório nacional de Casas Espíritas e de suas atividades, eventos e palestras.
  description: >-
    Leitura anônima de dados públicos com rate limit (60 req/min por IP, CORS
    aberto); API keys para quota ampliada (600 req/min) e webhooks; escrita
    autenticada por OAuth2 conforme RBAC (spec-final/04). Política de
    depreciação mínima de 12 meses por versão. Esta API nunca expõe campos
    adm_*, candidaturas, listas de voluntários nem contatos pessoais.
  contact:
    name: UEM — operadora da plataforma
    email: casas@uemmg.org.br
servers:
  - url: https://{dominio}/api/v1
    variables:
      dominio:
        default: exemplo.org.br
        description: Domínio de produção pendente (P9 em spec-final/11-decisoes.md)
tags:
  - name: territorio
    description: Federativas, órgãos regionais e municípios (base IBGE)
  - name: taxonomia
    description: Áreas funcionais e classificações do perfil básico
  - name: casas
    description: Diretório público de Casas Espíritas
  - name: trabalho
    description: Atividades, eventos e palestras públicos
  - name: transparencia
    description: Fila de revisão e estatísticas agregadas
  - name: gestao
    description: Gestão autenticada (OAuth2 + RBAC)
  - name: formularios
    description: Formulários públicos protegidos contra abuso
  - name: webhooks
    description: Inscrições e eventos assinados (HMAC)
security:
  - {}
components:
  securitySchemes:
    chaveApi:
      type: apiKey
      in: header
      name: X-API-Key
      description: >-
        Chave por federativa/site parceiro. Eleva a quota para 600 req/min e
        habilita inscrição de webhooks.
    oauth2:
      type: oauth2
      description: Autenticação de usuário (OIDC/OAuth2). RBAC definido em spec-final/04.
      flows:
        authorizationCode:
          authorizationUrl: https://exemplo.org.br/oauth/autorizar
          tokenUrl: https://exemplo.org.br/oauth/token
          scopes:
            casa.gerenciar: Gerir casas, atividades, eventos e palestras nas quais o usuário tem vínculo
            revisao.status: Executar transições de status de casas na jurisdição do revisor
            orgao.gerenciar: Gerir a página e as solicitações do órgão regional
            federativa.gerenciar: Gerir federativa, níveis regionais e nomeações
paths: {}
```

- [ ] **Passo 3: acrescentar alvos ao `Makefile`**

Acrescentar ao final do arquivo (e incluir os novos alvos na linha `.PHONY`):

```makefile
# Lint, pré-visualização e bundle da especificação OpenAPI (Redocly CLI via docker)
lint-api:
	docker run --rm -v $(CURDIR):/spec -w /spec redocly/cli:latest lint api/openapi.yaml

preview-api:
	docker run --rm -p 8766:8766 -v $(CURDIR):/spec -w /spec redocly/cli:latest preview-docs api/openapi.yaml --host 0.0.0.0 --port 8766

bundle-api:
	docker run --rm -v $(CURDIR):/spec -w /spec redocly/cli:latest bundle api/openapi.yaml -o api/dist/openapi.v1.yaml
```

- [ ] **Passo 4: rodar o lint**

Rodar: `make lint-api`
Esperado: **0 errors** (warnings de `paths` vazio são aceitáveis até a Tarefa 3).

- [ ] **Passo 5: commit**

```bash
git add .redocly.yaml api/openapi.yaml Makefile
git commit -m "feat(api): esqueleto OpenAPI 3.1 e tooling de lint"
```

---

### Tarefa 2: Convenções transversais (erros, paginação, respostas, quotas)

**Arquivos:**

- Criar: `api/componentes/schemas/problema.yaml`
- Criar: `api/componentes/schemas/paginacao.yaml`
- Criar: `api/componentes/parametros.yaml`
- Criar: `api/componentes/respostas.yaml`
- Modificar: `api/openapi.yaml` (referenciar componentes)

**Interfaces:**

- Consome: raiz criada na Tarefa 1.
- Produz: `Problema`, `Paginacao`, parâmetros `Pagina`, `PorPagina`, `Uf`, respostas `NaoAutorizado`, `Proibido`, `NaoEncontrado`, `MuitasRequisicoes`, `ErroPadrao`, cabeçalhos `RateLimit-*` — usados por todas as tarefas seguintes exatamente com esses nomes.

- [ ] **Passo 1: criar `api/componentes/schemas/problema.yaml`**

```yaml
Problema:
  type: object
  description: Erro no formato RFC 9457 (application/problem+json).
  required: [title, status]
  properties:
    type:
      type: string
      format: uri
      default: about:blank
    title:
      type: string
      examples: ["Recurso não encontrado"]
    status:
      type: integer
      examples: [404]
    detail:
      type: string
      examples: ["Não existe casa com o slug informado nesta UF."]
    instance:
      type: string
      examples: ["/api/v1/casas/mg/casa-inexistente"]
```

- [ ] **Passo 2: criar `api/componentes/schemas/paginacao.yaml`**

```yaml
Paginacao:
  type: object
  description: Metadados de paginação das coleções.
  required: [pagina, por_pagina, total_itens, total_paginas]
  properties:
    pagina:
      type: integer
      minimum: 1
    por_pagina:
      type: integer
      minimum: 1
      maximum: 100
    total_itens:
      type: integer
      minimum: 0
    total_paginas:
      type: integer
      minimum: 0
```

- [ ] **Passo 3: criar `api/componentes/parametros.yaml`**

```yaml
Pagina:
  name: pagina
  in: query
  description: Página desejada (1 é a primeira).
  schema:
    type: integer
    minimum: 1
    default: 1
PorPagina:
  name: por_pagina
  in: query
  description: Itens por página.
  schema:
    type: integer
    minimum: 1
    maximum: 100
    default: 25
Uf:
  name: uf
  in: query
  description: Filtra pela unidade federativa (sigla, minúscula).
  schema:
    type: string
    pattern: '^[a-z]{2}$'
    examples: [mg]
```

- [ ] **Passo 4: criar `api/componentes/respostas.yaml`**

Cada resposta usa `application/problem+json` com `$ref` para `Problema` e inclui os
cabeçalhos de quota. Conteúdo completo:

```yaml
CabecalhosQuota:
  RateLimit-Limit:
    description: Quota da janela corrente (req/min).
    schema: { type: integer }
  RateLimit-Remaining:
    description: Requisições restantes na janela.
    schema: { type: integer }
  RateLimit-Reset:
    description: Segundos até o reinício da janela.
    schema: { type: integer }
NaoAutorizado:
  description: Autenticação ausente ou inválida.
  content:
    application/problem+json:
      schema:
        $ref: './schemas/problema.yaml#/Problema'
Proibido:
  description: Autenticado, porém sem permissão (RBAC de spec-final/04).
  content:
    application/problem+json:
      schema:
        $ref: './schemas/problema.yaml#/Problema'
NaoEncontrado:
  description: Recurso inexistente ou não público.
  content:
    application/problem+json:
      schema:
        $ref: './schemas/problema.yaml#/Problema'
MuitasRequisicoes:
  description: Quota excedida (60 req/min anônimo; 600 req/min com API key).
  headers:
    Retry-After:
      description: Segundos até poder tentar de novo.
      schema: { type: integer }
  content:
    application/problem+json:
      schema:
        $ref: './schemas/problema.yaml#/Problema'
ErroPadrao:
  description: Erro inesperado.
  content:
    application/problem+json:
      schema:
        $ref: './schemas/problema.yaml#/Problema'
```

- [ ] **Passo 5: rodar `make lint-api`** — esperado: 0 errors.

- [ ] **Passo 6: commit**

```bash
git add api/componentes
git commit -m "feat(api): convenções transversais (RFC 9457, paginação, quotas)"
```

---

### Tarefa 3: Território e taxonomia (leitura pública)

**Arquivos:**

- Criar: `api/componentes/schemas/territorio.yaml`
- Criar: `api/caminhos/territorio.yaml`
- Criar: `api/caminhos/taxonomia.yaml`
- Modificar: `api/openapi.yaml` (registrar caminhos)

**Interfaces:**

- Consome: `Paginacao`, parâmetros e respostas da Tarefa 2.
- Produz: schemas `Federativa`, `OrgaoRegional`, `Municipio` (referenciados por `casa.yaml` na Tarefa 4).

- [ ] **Passo 1: escrever `territorio.yaml` (schemas)**

Campos, todos de `spec-final/02` §2.5 (nada além disso):

| Schema | Campos (tipo) — obrigatórios em negrito |
| :--- | :--- |
| `Federativa` | **`uf`** (string), **`sigla`** (string), **`nome`** (string), `site` (uri), `contatos` (objeto: telefone, email), `redes_sociais` (objeto: instagram, youtube, whatsapp, facebook, tiktok — uris), `niveis_ativos` (array enum: macro, micro, municipal), `areas_ativas` (array de siglas de área) |
| `OrgaoRegional` | **`id`** (uuid), **`nivel`** (enum: macro, micro, municipal), **`nome_local`** (string, ex.: "CRE", "AME"), **`nome`** (string), **`slug`** (string), **`uf`** (string), `numero_ordem` (integer), `site` (uri), `contatos`, `redes_sociais`, `areas` (array de siglas), `url_publica` (uri) |
| `Municipio` | **`codigo_ibge`** (string), **`nome`** (string), **`uf`** (string), `orgao_municipal_id` (uuid \| null), `micro_regiao_id` (uuid \| null), `macro_regiao_id` (uuid \| null), `atributos` (objeto livre chave-valor, ex.: telefone de atendimento fraterno municipal) |

- [ ] **Passo 2: escrever `caminhos/territorio.yaml`**

Operações (todas `security: []`, respostas 200 + `MuitasRequisicoes` + `ErroPadrao`; coleções paginadas com envelope `{ dados, paginacao }`):

| operationId | Verbo e caminho | Parâmetros | Resposta 200 |
| :--- | :--- | :--- | :--- |
| `listarFederativas` | `GET /federativas` | — | array de `Federativa` (27 itens; sem paginação) |
| `obterFederativa` | `GET /federativas/{uf}` | path `uf` | `Federativa` (+ `NaoEncontrado`) |
| `listarOrgaos` | `GET /orgaos` | `Uf`, `nivel` (enum), `Pagina`, `PorPagina` | envelope de `OrgaoRegional` |
| `obterOrgao` | `GET /orgaos/{uf}/{slug}` | path `uf`, `slug` | `OrgaoRegional` (+ `NaoEncontrado`) |
| `listarMunicipios` | `GET /municipios` | `Uf` (obrigatório), `q` (busca por nome), `Pagina`, `PorPagina` | envelope de `Municipio` |

- [ ] **Passo 3: escrever `caminhos/taxonomia.yaml`**

Dados estáticos da taxonomia (`spec-final/02` §2.6 e §2.6.1):

| operationId | Verbo e caminho | Resposta 200 |
| :--- | :--- | :--- |
| `listarAreas` | `GET /taxonomia/areas` | array de `{ sigla, nome, exemplos }` — as 11 áreas: AAE, AOM, AEE, AEEJ, AIJ, AFam, APSE, ACSE, AA, AESP, AG |
| `listarClassificacoes` | `GET /taxonomia/classificacoes` | array de `{ termo, rotulo, secao }` — os termos exatos de `02` §2.6.1: `reuniao_publica`, `mocidade`, `evangelizacao`, `atendimentofraterno`, `reuniao_mediunica`, `divulgacao`, `livraria`, `magnetismo`, `uniao`, `unificacao`, `biblioteca`, `esde`, `eade`, `miudinho`, `estudomediunidade`, `obras`, `principiosbasicos`, `cestabasica`, `sopa`, `alimento`, `agasalho`, `quilo`, `bazar`, `enxovalbebe`, `banho`, `melhoridade`, `visitafraterna`, `cursos`, `oficinas`, `medico`, `psicologo`, `artesanato`, `juridico`; `secao` enum: `atividades_gerais`, `reunioes_de_estudo`, `tarefas_de_assistencia`, `atividades_especializadas` |

- [ ] **Passo 4: registrar os caminhos na raiz**

Em `api/openapi.yaml`, substituir `paths: {}` por:

```yaml
paths:
  /federativas:
    $ref: './caminhos/territorio.yaml#/FederativasColecao'
  /federativas/{uf}:
    $ref: './caminhos/territorio.yaml#/FederativaDetalhe'
  /orgaos:
    $ref: './caminhos/territorio.yaml#/OrgaosColecao'
  /orgaos/{uf}/{slug}:
    $ref: './caminhos/territorio.yaml#/OrgaoDetalhe'
  /municipios:
    $ref: './caminhos/territorio.yaml#/MunicipiosColecao'
  /taxonomia/areas:
    $ref: './caminhos/taxonomia.yaml#/Areas'
  /taxonomia/classificacoes:
    $ref: './caminhos/taxonomia.yaml#/Classificacoes'
```

(As tarefas seguintes acrescentam entradas a esse mapa no mesmo padrão.)

- [ ] **Passo 5: rodar `make lint-api`** — esperado: 0 errors, 0 warnings.

- [ ] **Passo 6: commit**

```bash
git add api
git commit -m "feat(api): território e taxonomia (leitura pública)"
```

---

### Tarefa 4: Casas — diretório público

**Arquivos:**

- Criar: `api/componentes/schemas/casa.yaml`
- Criar: `api/caminhos/casas.yaml`
- Modificar: `api/openapi.yaml` (registrar caminhos)

**Interfaces:**

- Consome: `Federativa`/`OrgaoRegional` (Tarefa 3), convenções da Tarefa 2.
- Produz: `CasaResumo`, `CasaPublica`, `HorarioSemanal` (usados nas Tarefas 5–9); caminho `/casas/{uf}/{slug}` (padrão de identidade pública: slug único por UF, D13).

- [ ] **Passo 1: escrever `casa.yaml`**

`CasaPublica` completo (fonte: `02` §2.1.1 — **somente campos públicos `ce_`**; jamais `adm_*`):

```yaml
HorarioSemanal:
  type: object
  required: [dia_semana, hora_inicio]
  properties:
    dia_semana:
      type: integer
      minimum: 0
      maximum: 6
      description: 0 = domingo … 6 = sábado.
    hora_inicio: { type: string, pattern: '^\d{2}:\d{2}$' }
    hora_fim: { type: string, pattern: '^\d{2}:\d{2}$' }
    detalhes: { type: string }
CasaResumo:
  type: object
  description: Projeção mínima da casa (listas, webhooks, mapa).
  required: [id, slug, uf, nome, cidade, virtual, status]
  properties:
    id: { type: string, format: uuid }
    slug: { type: string }
    uf: { type: string }
    nome: { type: string }
    cidade: { type: string }
    localidade: { type: string }
    virtual: { type: boolean }
    status: { type: string, enum: [ativa, inativa] }
    latitude: { type: [number, 'null'] }
    longitude: { type: [number, 'null'] }
    url_publica: { type: string, format: uri }
CasaPublica:
  allOf:
    - $ref: '#/CasaResumo'
    - type: object
      properties:
        bio: { type: string }
        telefone: { type: string, description: Telefone público da casa (nunca o do administrador). }
        email: { type: string, format: email, description: E-mail público da casa. }
        site: { type: string, format: uri }
        redes_sociais:
          type: object
          properties:
            instagram: { type: string, format: uri }
            youtube: { type: string, format: uri }
            whatsapp: { type: string, format: uri }
            facebook: { type: string, format: uri }
            tiktok: { type: string, format: uri }
        endereco:
          type: [object, 'null']
          description: Nulo para casas virtuais (A1).
          properties:
            logradouro: { type: string }
            localidade: { type: string }
            cidade: { type: string }
            uf: { type: string }
            codigo_ibge: { type: string }
            pais: { type: string, default: Brasil }
            plus_code: { type: string }
        classificacoes:
          type: array
          description: Termos de /taxonomia/classificacoes marcados no perfil básico.
          items: { type: string }
        reunioes_publicas:
          type: array
          description: Agenda das reuniões públicas (perfil básico ou Atividade completa — fonte única, ver 02 §2.1.1).
          items: { $ref: '#/HorarioSemanal' }
        expediente:
          type: array
          items: { $ref: '#/HorarioSemanal' }
        aberta_agora:
          type: [boolean, 'null']
          description: Calculada de agendas + expediente + fechamento excepcional (D10). Sempre exibir com o aviso "confirme por telefone".
        selo_desatualizada:
          type: boolean
          description: Verdadeiro se a recertificação venceu há mais de 12 meses.
        orgaos:
          type: array
          description: Cadeia de jurisdição (apenas níveis ativados na UF).
          items: { $ref: './territorio.yaml#/OrgaoRegional' }
        atualizado_em: { type: string, format: date-time }
```

- [ ] **Passo 2: escrever `caminhos/casas.yaml` — busca**

```yaml
CasasColecao:
  get:
    operationId: buscarCasas
    tags: [casas]
    summary: Busca casas ativas do diretório público
    description: >-
      Só retorna casas ativas (e inativas quando incluir_inativas=true).
      Casas em revisão não aparecem aqui — ver /transparencia/fila-revisao.
    security: []
    parameters:
      - $ref: '../componentes/parametros.yaml#/Uf'
      - name: cidade
        in: query
        schema: { type: string }
      - name: localidade
        in: query
        schema: { type: string }
      - name: orgao
        in: query
        description: Slug do órgão regional (jurisdição).
        schema: { type: string }
      - name: classificacao
        in: query
        description: Termo do perfil básico (ex., atendimentofraterno).
        schema: { type: string }
      - name: area
        in: query
        description: Sigla da área funcional (ex., AIJ).
        schema: { type: string }
      - name: q
        in: query
        description: Busca textual por nome/bio.
        schema: { type: string }
      - name: virtual
        in: query
        schema: { type: boolean }
      - name: aberta_agora
        in: query
        description: Filtra pelo cálculo "aberta agora" (D10).
        schema: { type: boolean }
      - name: lat
        in: query
        schema: { type: number }
      - name: lng
        in: query
        schema: { type: number }
      - name: raio_km
        in: query
        description: Exige lat e lng. Mutuamente exclusivo com bbox.
        schema: { type: number, minimum: 1, maximum: 100, default: 25 }
      - name: bbox
        in: query
        description: "min_lng,min_lat,max_lng,max_lat (viewport do mapa)."
        schema: { type: string }
      - name: incluir_inativas
        in: query
        schema: { type: boolean, default: false }
      - name: ordenar
        in: query
        schema:
          type: string
          enum: [relevancia, nome, distancia, atualizacao]
          default: relevancia
      - $ref: '../componentes/parametros.yaml#/Pagina'
      - $ref: '../componentes/parametros.yaml#/PorPagina'
    responses:
      '200':
        description: Resultado paginado.
        headers:
          $ref: '../componentes/respostas.yaml#/CabecalhosQuota'
        content:
          application/json:
            schema:
              type: object
              required: [dados, paginacao]
              properties:
                dados:
                  type: array
                  items:
                    $ref: '../componentes/schemas/casa.yaml#/CasaResumo'
                paginacao:
                  $ref: '../componentes/schemas/paginacao.yaml#/Paginacao'
      '429':
        $ref: '../componentes/respostas.yaml#/MuitasRequisicoes'
      default:
        $ref: '../componentes/respostas.yaml#/ErroPadrao'
```

- [ ] **Passo 3: acrescentar detalhe, sub-recursos e agenda ICS no mesmo arquivo**

| Chave | operationId | Verbo e caminho | Resposta 200 |
| :--- | :--- | :--- | :--- |
| `CasaDetalhe` | `obterCasa` | `GET /casas/{uf}/{slug}` | `CasaPublica` (+ `NaoEncontrado`; casas não ativas retornam 404 aqui — A8) |
| `CasaAtividades` | `listarAtividadesDaCasa` | `GET /casas/{uf}/{slug}/atividades` | envelope de `AtividadePublica` (Tarefa 5; só visibilidade pública) |
| `CasaEventos` | `listarEventosDaCasa` | `GET /casas/{uf}/{slug}/eventos` | envelope de `EventoPublico` |
| `CasaPalestras` | `listarPalestrasDaCasa` | `GET /casas/{uf}/{slug}/palestras` | envelope de `PalestraPublica` |
| `CasaAgendaIcs` | `exportarAgendaIcs` | `GET /casas/{uf}/{slug}/agenda.ics` | `text/calendar` (string; agendas públicas consolidadas — item 3.5) |

(As referências a `AtividadePublica`/`EventoPublico`/`PalestraPublica` só passam no
lint após a Tarefa 5 — executar as Tarefas 4 e 5 em sequência antes do lint final, ou
criar os sub-recursos na Tarefa 5. Escolha do executor; o commit de cada tarefa deve
lintar limpo, então **mover os 4 sub-recursos para a Tarefa 5 é o caminho seguro**.)

- [ ] **Passo 4: registrar `/casas` e `/casas/{uf}/{slug}` na raiz** (mesmo padrão da Tarefa 3, Passo 4).

- [ ] **Passo 5: rodar `make lint-api`** — esperado: 0 errors.

- [ ] **Passo 6: commit**

```bash
git add api
git commit -m "feat(api): diretório público de casas (busca, detalhe)"
```

---

### Tarefa 5: Atividades, eventos e palestras públicos

**Arquivos:**

- Criar: `api/componentes/schemas/trabalho.yaml`
- Criar: `api/caminhos/trabalho.yaml`
- Modificar: `api/caminhos/casas.yaml` (sub-recursos da casa, ver nota da Tarefa 4)
- Modificar: `api/openapi.yaml`

**Interfaces:**

- Consome: `CasaResumo` (Tarefa 4), taxonomia (Tarefa 3).
- Produz: `AtividadePublica`, `EventoPublico`, `PalestraPublica`, `Agenda` (usados na Tarefa 9 pelos webhooks).

- [ ] **Passo 1: escrever `trabalho.yaml`**

Campos de `02` §2.2 (apenas dados de visibilidade pública; contatos públicos da
atividade são permitidos — contatos pessoais de voluntários, não):

| Schema | Campos — obrigatórios em negrito |
| :--- | :--- |
| `Agenda` | array de `HorarioSemanal` + `local` (string) + `link_online` (uri) por item |
| `AtividadePublica` | **`id`** (uuid), **`slug`**, **`nome`**, **`tipo`** (enum: atividade, evento, palestra), `descricao`, `areas` (array de siglas), `personalizada` (boolean — fora da taxonomia, sinalizada), `formato` (enum: presencial, remoto, hibrido), `agenda` (`Agenda`), `publico_alvo` (string), `aceita_voluntarios` (boolean), `contato_publico` (objeto: nome, email, telefone — da atividade, não de pessoa física privada), `casa` (`CasaResumo`), `atualizado_em` |
| `EventoPublico` | `allOf` de `AtividadePublica` + **`inicio`** (date-time), **`fim`** (date-time), `url_inscricao` (uri), `imagem` (uri), `destaque` (boolean) |
| `PalestraPublica` | `allOf` de `AtividadePublica` + **`tema`** (string), `palestrante` (string), `link` (uri), `proxima_ocorrencia` (date-time) |

- [ ] **Passo 2: escrever `caminhos/trabalho.yaml`**

Todas anônimas, paginadas, com filtros:

| operationId | Verbo e caminho | Filtros |
| :--- | :--- | :--- |
| `buscarAtividades` | `GET /atividades` | `Uf`, `cidade`, `area`, `classificacao`, `aceita_voluntarios`, `formato`, `q`, paginação |
| `buscarEventos` | `GET /eventos` | `Uf`, `cidade`, `desde` (date, padrão hoje), `ate` (date), `area`, paginação; ordenado por `inicio` |
| `buscarPalestras` | `GET /palestras` | `Uf`, `cidade`, `orgao`, `desde`/`ate`, paginação — alimenta o marquee estadual/regional (item 3.4) |

- [ ] **Passo 3: acrescentar os 4 sub-recursos da casa** (`CasaAtividades`, `CasaEventos`, `CasaPalestras`, `CasaAgendaIcs` — tabela da Tarefa 4 Passo 3) em `caminhos/casas.yaml` e registrá-los na raiz.

- [ ] **Passo 4: rodar `make lint-api`** — esperado: 0 errors.

- [ ] **Passo 5: commit**

```bash
git add api
git commit -m "feat(api): atividades, eventos e palestras públicos"
```

---

### Tarefa 6: Transparência e estatísticas agregadas

**Arquivos:**

- Criar: `api/componentes/schemas/governanca.yaml` (parcial: `ItemFilaRevisao`, `EstatisticasAgregadas`)
- Criar: `api/caminhos/transparencia.yaml`
- Modificar: `api/openapi.yaml`

**Interfaces:**

- Consome: convenções da Tarefa 2.
- Produz: `governanca.yaml` (estendido nas Tarefas 7–8).

- [ ] **Passo 1: schemas**

```yaml
ItemFilaRevisao:
  type: object
  description: Transparência da fila de revisão (A8 — só nome + cidade + status).
  required: [nome, cidade, uf, status, desde]
  properties:
    nome: { type: string }
    cidade: { type: string }
    uf: { type: string }
    status: { type: string, enum: [pendente_de_revisao, em_disputa] }
    desde: { type: string, format: date }
EstatisticasAgregadas:
  type: object
  description: Contagens agregadas com k-anonimato (k >= 5, A9). Valores < 5 são omitidos.
  required: [escopo, referencia, contagens]
  properties:
    escopo: { type: string, enum: [nacional, uf, orgao] }
    referencia: { type: string, description: UF ou slug do órgão (vazio para nacional). }
    contagens:
      type: object
      properties:
        casas_ativas: { type: integer }
        casas_pendentes: { type: integer }
        casas_por_area:
          type: object
          additionalProperties: { type: integer }
        eventos_futuros: { type: integer }
        palestras_futuras: { type: integer }
```

- [ ] **Passo 2: caminhos**

| operationId | Verbo e caminho | Parâmetros | Resposta |
| :--- | :--- | :--- | :--- |
| `listarFilaRevisao` | `GET /transparencia/fila-revisao` | `Uf`, paginação | envelope de `ItemFilaRevisao` (item 6.5 do backlog) |
| `obterEstatisticas` | `GET /estatisticas` | `escopo` (enum, obrigatório), `uf`, `orgao` | `EstatisticasAgregadas` |

- [ ] **Passo 3: registrar na raiz; rodar `make lint-api`** — esperado: 0 errors.

- [ ] **Passo 4: commit**

```bash
git add api
git commit -m "feat(api): fila de revisão e estatísticas com k-anonimato"
```

---

### Tarefa 7: Gestão autenticada (OAuth2 + RBAC)

**Arquivos:**

- Modificar: `api/componentes/schemas/casa.yaml` (acrescentar `CasaGestao`, `NovaCasa`)
- Modificar: `api/componentes/schemas/governanca.yaml` (acrescentar `TransicaoStatus`, `Solicitacao`, `CandidaturaGestao`)
- Criar: `api/caminhos/gestao.yaml`
- Modificar: `api/openapi.yaml`

**Interfaces:**

- Consome: tudo das Tarefas 2–6.
- Produz: caminhos `/gestao/**`; payload `TransicaoStatus` (referenciado pelos webhooks da Tarefa 9).

**Regra de ouro (verificar em cada operação):** o RBAC de `spec-final/04` §4.2 decide
quem pode o quê; a especificação documenta o papel exigido na `description` de cada
operação. Nenhuma operação pode permitir que papel federativo/de órgão altere dados de
casa (N.5). O Revisor só transita **status** — nunca edita conteúdo (`04` §4.2).

- [ ] **Passo 1: schemas de gestão**

| Schema | Conteúdo |
| :--- | :--- |
| `NovaCasa` | Campos obrigatórios do cadastro (`02` §2.1.1): **`nome`**, **`cidade`**, **`localidade`**, **`virtual`** (boolean), **`adm_nome`**, **`adm_telefone`**; opcionais: `adm_email`, demais campos públicos de `CasaPublica`. Descrição do schema deixa explícito: campos `adm_*` nunca aparecem em leitura pública. |
| `CasaGestao` | `allOf` de `CasaPublica` + `adm_nome`, `adm_telefone`, `adm_email`, `status` completo (enum: rascunho, pendente_de_revisao, ativa, inativa, rejeitada, em_disputa), `recertificacao` (objeto: data_limite, status), `feature_toggles` (objeto de booleans: eventos, palestras, voluntariado), `tema` (string) |
| `TransicaoStatus` | **`acao`** (enum: `aprovar`, `rejeitar`, `devolver_para_ajuste`, `iniciar_disputa`, `encerrar_disputa`), **`justificativa`** (string, minLength 10 — auditoria exige justificativa, `04` §4.4) |
| `Solicitacao` | **`id`**, **`casa_id`**, **`tipo`** (string), **`descricao`**, `orgao_destinatario_id` (delegação automática pela jurisdição), **`status`** (enum: aberta, em_andamento, resolvida), `criada_em` |
| `CandidaturaGestao` | **`id`**, **`atividade_id`**, **`nome`**, **`contato`**, `mensagem`, **`consentimento_em`** (date-time), **`status`** (enum: nova, aceita, recusada), `decidida_em`. Descrição: visível só a coordenador da atividade + admin da casa (D8); anonimizada 6 meses após decisão. |

- [ ] **Passo 2: escrever `caminhos/gestao.yaml`**

Todas com `security: [{ oauth2: [<escopo>] }]`, respostas `401`/`403`/`404`/`429`/`default` pelos componentes da Tarefa 2:

| operationId | Verbo e caminho | Escopo | Papel exigido (descrição) |
| :--- | :--- | :--- | :--- |
| `criarCasa` | `POST /gestao/casas` | `casa.gerenciar` | qualquer conta; cria rascunho e vincula o autor como Admin de Casa; 201 com `CasaGestao` |
| `obterCasaGestao` | `GET /gestao/casas/{id}` | `casa.gerenciar` | Admin/Coordenador da casa (Revisor da jurisdição: leitura) |
| `atualizarCasa` | `PATCH /gestao/casas/{id}` | `casa.gerenciar` | Admin de Casa; body = `NovaCasa` parcial; alterações críticas reabrem revisão (`05` §5.3) |
| `submeterCasa` | `POST /gestao/casas/{id}/submissao` | `casa.gerenciar` | Admin de Casa; rascunho → pendente_de_revisao; 202 |
| `transitarStatusCasa` | `POST /gestao/casas/{id}/status` | `revisao.status` | **Revisor da jurisdição**; body `TransicaoStatus`; 200 com `CasaGestao` |
| `confirmarRecertificacao` | `POST /gestao/casas/{id}/recertificacao` | `casa.gerenciar` | Admin de Casa; confirma dados do ciclo de 12 meses (item 6.2) |
| `informarFechamento` | `POST /gestao/casas/{id}/fechamento-excepcional` | `casa.gerenciar` | Admin; body `{ inicio, fim, motivo }` — afeta "aberta agora" (item 2.5) |
| `criarAtividade` / `atualizarAtividade` / `removerAtividade` | `POST/PATCH/DELETE /gestao/casas/{id}/atividades[/{atividadeId}]` | `casa.gerenciar` | Admin ou Coordenador do departamento/atividade; body espelha `AtividadePublica` + `visibilidade` (publica/interna) + `departamento_id`; eventos e palestras usam o mesmo trio com `tipo` correspondente |
| `listarCandidaturas` | `GET /gestao/atividades/{id}/candidaturas` | `casa.gerenciar` | Coordenador da atividade ou Admin da casa (D8); envelope de `CandidaturaGestao` |
| `decidirCandidatura` | `PATCH /gestao/candidaturas/{id}` | `casa.gerenciar` | idem; body `{ status: aceita \| recusada }` |
| `criarSolicitacao` | `POST /gestao/casas/{id}/solicitacoes` | `casa.gerenciar` | Admin de Casa; roteada automaticamente ao órgão da jurisdição |
| `listarSolicitacoesOrgao` | `GET /gestao/orgaos/{id}/solicitacoes` | `orgao.gerenciar` | Órgão: presidente/área da jurisdição |
| `atualizarPaginaOrgao` | `PATCH /gestao/orgaos/{id}` | `orgao.gerenciar` | Órgão: presidente (a própria página — D16) |
| `criarInscricaoPush` | `POST /gestao/notificacoes/push` | qualquer escopo | usuário autenticado registra a própria inscrição Web Push (D17): body `{ endpoint (uri), chaves: { p256dh, auth } }`; 201. Uma inscrição por dispositivo; payloads de push nunca carregam dado pessoal |
| `removerInscricaoPush` | `DELETE /gestao/notificacoes/push/{id}` | qualquer escopo | dono da inscrição; 204 |
| `preferenciasNotificacao` | `PATCH /gestao/notificacoes/preferencias` | qualquer escopo | body `{ canal: push \| email, eventos: [adesoes, candidaturas, denuncias, solicitacoes] }` — e-mail + painel permanecem sempre ativos (A11) |

- [ ] **Passo 3: registrar na raiz; rodar `make lint-api`** — esperado: 0 errors.

- [ ] **Passo 4: commit**

```bash
git add api
git commit -m "feat(api): gestão autenticada (casas, revisão, atividades, solicitações)"
```

---

### Tarefa 8: Formulários públicos protegidos (denúncia e candidatura)

**Arquivos:**

- Modificar: `api/componentes/schemas/governanca.yaml` (acrescentar `NovaDenuncia`, `NovaCandidatura`)
- Criar: `api/caminhos/formularios.yaml`
- Modificar: `api/openapi.yaml`

**Interfaces:**

- Consome: convenções da Tarefa 2; `/atividades` da Tarefa 5.
- Produz: caminhos `/denuncias` e `/atividades/{id}/candidaturas`.

Escrita **sem OAuth2** (visitantes), com proteção anti-abuso: rate limit estrito
(documentar na descrição: 5 req/hora por IP, provisório) + campo `token_desafio`
(desafio anti-bot; provedor é pendência — registrar na Tarefa 10).

- [ ] **Passo 1: schemas**

```yaml
NovaDenuncia:
  type: object
  description: Reporte público de dado incorreto ou conduta (roteado ao Revisor — item 6.1).
  required: [alvo_tipo, alvo, descricao, token_desafio]
  properties:
    alvo_tipo: { type: string, enum: [casa, atividade] }
    alvo: { type: string, description: "uf/slug da casa ou id da atividade." }
    descricao: { type: string, minLength: 20, maxLength: 4000 }
    contato: { type: string, description: Opcional; usado só para retorno sobre a denúncia. }
    token_desafio: { type: string }
NovaCandidatura:
  type: object
  description: Quero Ajudar (D8). Consentimento explícito obrigatório; dados visíveis só ao coordenador e ao admin; anonimização 6 meses após a decisão.
  required: [nome, contato, consentimento, token_desafio]
  properties:
    nome: { type: string }
    contato: { type: string, description: Telefone ou e-mail. }
    mensagem: { type: string, maxLength: 2000 }
    consentimento:
      type: boolean
      const: true
      description: Aceite do texto de consentimento exibido (registrado como Consentimento imutável, 02 §2.3.4).
    token_desafio: { type: string }
```

- [ ] **Passo 2: caminhos**

| operationId | Verbo e caminho | Body | Resposta |
| :--- | :--- | :--- | :--- |
| `criarDenuncia` | `POST /denuncias` | `NovaDenuncia` | 201 `{ protocolo: string }`; 400 `Problema` (validação); 429 |
| `criarCandidatura` | `POST /atividades/{id}/candidaturas` | `NovaCandidatura` | 201 `{ protocolo: string }`; 404 se a atividade não aceita voluntários ou não é pública; 429 |

- [ ] **Passo 3: registrar na raiz; rodar `make lint-api`** — esperado: 0 errors.

- [ ] **Passo 4: commit**

```bash
git add api
git commit -m "feat(api): formulários públicos de denúncia e candidatura"
```

---

### Tarefa 9: Webhooks (eventos assinados) e inscrições — **diferida (D18)**

> **Executar somente na promoção do item 7.3 do backlog** (`avaliar bem` — D18 em
> `spec-final/11-decisoes.md`). Webhooks avisam sistemas externos; a notificação
> imediata de pessoas é Web Push (D17), coberta pelos endpoints de inscrição push da
> Tarefa 7. O conteúdo abaixo fica pronto para quando a promoção acontecer; as
> Tarefas 8 e 10 não dependem dele.

**Arquivos:**

- Criar: `api/componentes/schemas/webhooks.yaml`
- Modificar: `api/caminhos/gestao.yaml` (inscrições por API key)
- Modificar: `api/openapi.yaml` (bloco `webhooks` do OpenAPI 3.1)

**Interfaces:**

- Consome: `CasaResumo` (Tarefa 4), `EventoPublico`/`PalestraPublica` (Tarefa 5), `Solicitacao` (Tarefa 7).
- Produz: os 9 eventos de `06` §6.4.

- [ ] **Passo 1: schemas**

```yaml
EnvelopeWebhook:
  type: object
  description: Envelope comum de todos os eventos. Assinado com HMAC-SHA256 do corpo (cabeçalho X-Assinatura-Hmac-Sha256, segredo da inscrição). Entrega com retentativa e backoff exponencial.
  required: [id, evento, ocorrido_em, dados]
  properties:
    id: { type: string, format: uuid }
    evento:
      type: string
      enum:
        - casa.registrada
        - casa.aprovada
        - casa.rejeitada
        - casa.atualizada
        - casa.recertificada
        - evento.criado
        - palestra.criada
        - solicitacao.criada
        - denuncia.criada
    ocorrido_em: { type: string, format: date-time }
    dados:
      description: Payload específico do evento (só dados públicos; eventos de casa carregam CasaResumo).
      type: object
InscricaoWebhook:
  type: object
  required: [id, url, eventos, ativa]
  properties:
    id: { type: string, format: uuid }
    url: { type: string, format: uri }
    eventos:
      type: array
      items: { type: string }
    ativa: { type: boolean }
    segredo:
      type: string
      description: Retornado apenas na criação (write-only depois).
```

- [ ] **Passo 2: bloco `webhooks` na raiz**

Um item por evento, todos no mesmo padrão (exemplar completo — repetir para os 9
eventos do enum acima, trocando `summary` e o schema de `dados`):

```yaml
webhooks:
  casa.aprovada:
    post:
      summary: Casa aprovada por um Revisor e publicada no diretório.
      operationId: webhookCasaAprovada
      parameters:
        - name: X-Assinatura-Hmac-Sha256
          in: header
          required: true
          schema: { type: string }
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: './componentes/schemas/webhooks.yaml#/EnvelopeWebhook'
      responses:
        '200':
          description: Confirmação de recebimento (qualquer 2xx evita retentativa).
```

Payload `dados` por evento: `casa.*` → `CasaResumo`; `evento.criado` →
`EventoPublico`; `palestra.criada` → `PalestraPublica`; `solicitacao.criada` →
`Solicitacao` (sem dados pessoais); `denuncia.criada` → `{ protocolo, alvo_tipo, uf }`
(nunca a descrição nem o contato do denunciante — dado potencialmente pessoal).

- [ ] **Passo 3: inscrições em `caminhos/gestao.yaml`** (segurança: `chaveApi`)

| operationId | Verbo e caminho | Resposta |
| :--- | :--- | :--- |
| `listarInscricoesWebhook` | `GET /gestao/webhooks` | array de `InscricaoWebhook` |
| `criarInscricaoWebhook` | `POST /gestao/webhooks` | 201 `InscricaoWebhook` (única resposta que inclui `segredo`) |
| `removerInscricaoWebhook` | `DELETE /gestao/webhooks/{id}` | 204 |

- [ ] **Passo 4: rodar `make lint-api`** — esperado: 0 errors.

- [ ] **Passo 5: commit**

```bash
git add api
git commit -m "feat(api): webhooks assinados e inscrições por API key"
```

---

### Tarefa 10: Integração no repositório e auto-revisão

**Arquivos:**

- Modificar: `spec-final/06-integracoes-api-seo.md` (§6.3: apontar para `api/openapi.yaml`)
- Modificar: `spec-final/11-decisoes.md` (novas decisões e pendência)
- Modificar: `GEMINI.md` (resolver o TODO "Specify API documentation location")
- Modificar: `README.md` (ferramentas: `lint-api`, `preview-api`, `bundle-api`; estrutura: pasta `api/`)
- Modificar: `Makefile` (incluir a especificação da API nos assets lintados, se ainda não estiver)

**Interfaces:**

- Consome: tudo das Tarefas 1–9.
- Produz: rastreabilidade completa (nenhuma decisão silenciosa).

- [ ] **Passo 1: registrar em `spec-final/11-decisoes.md`**

Acrescentar à tabela de decisões (numeração = próxima disponível no momento da
execução; D17/D18 já foram usadas pela decisão de notificações/webhooks):

| # | Tema | Decisão |
| :--- | :--- | :--- |
| D19 | Formato da API | OpenAPI 3.1; especificação em `api/openapi.yaml`; nomes de recursos e propriedades em PT-BR (`snake_case`) |
| D20 | Convenções da API | Paginação `pagina`/`por_pagina` (máx. 100); erros RFC 9457; cabeçalhos `RateLimit-*`; escopos OAuth2 grossos com RBAC no servidor |
| D21 | Formulários públicos | Denúncia e candidatura sem OAuth2, com rate limit estrito + token de desafio anti-bot |

E à tabela de pendências (numeração = próximo número livre em `11-decisoes.md` no
momento da execução — hoje P10 e P11 já estão em uso):

| # | Pendência | Dono | Quando resolver |
| :--- | :--- | :--- | :--- |
| P__ | Provedor do desafio anti-bot dos formulários públicos (custo, LGPD, acessibilidade — o desafio não pode barrar leitores de tela) | Produto + Encarregado | antes do piloto |

- [ ] **Passo 2: atualizar `06` §6.3, `GEMINI.md` e `README.md`** conforme lista de arquivos acima (uma frase de referência em cada; não duplicar conteúdo da especificação OpenAPI em markdown).

- [ ] **Passo 3: auto-revisão da especificação** (checklist objetivo):

1. `grep -rn "adm_" api/caminhos api/componentes/schemas/casa.yaml` — `adm_*` só pode aparecer em `NovaCasa`/`CasaGestao` (gestão) e nunca em schemas públicos.
2. Épico 7 `fazer agora` coberto: 7.1 (API) ✔ tarefas 3–8; 7.10 (push — D17) ✔ inscrições na tarefa 7. Item 7.3 (webhooks) é `avaliar bem` — tarefa 9 só na promoção (D18). Conferir também 3.2/3.5/6.1/6.5 (candidaturas, ICS, denúncia, fila).
3. Toda operação de escrita tem `security` e papel documentado; nenhuma viola N.5.
4. Todos os `$ref` resolvem: `make bundle-api` gera `api/dist/openapi.v1.yaml` sem erro.
5. 100% das descrições em PT-BR.
6. `make lint-api` e `make lint-spec` sem erros.

- [ ] **Passo 4: commit final**

```bash
git add api spec-final/06-integracoes-api-seo.md spec-final/11-decisoes.md GEMINI.md README.md Makefile
git commit -m "docs(api): integra especificação OpenAPI ao repositório e registra decisões"
```

---

## Verificação global do plano

- A especificação descreve **contratos**, não implementação — coerente com o estado do repositório (spec-only).
- Fora do escopo deste plano: implementação do servidor, portal de desenvolvedor, especificação do MCP (item 7.8, `avaliar bem`), motor de busca semântica (7.7), descritor OpenSearch (7.6) e endpoints de LGPD self-service (item 6.3 — fluxo via painel, não via API pública v1; se o produto decidir expor via API, será nova decisão em `11`).
- Critério de pronto: `make lint-api` e `make bundle-api` limpos; checklist da Tarefa 10 Passo 3 concluído; decisões D17–D19 e pendência P10 registradas.
