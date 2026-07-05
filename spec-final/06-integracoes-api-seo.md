# 6. Integrações, API e SEO/AEO

O app é **autocontido**, mas seus dados públicos são transformados e servidos a
consumidores externos em formatos seguros. Princípio arquitetural: **camada de
renderização separada da camada de gestão** — o cadastro passa por compilação que
produz visualizações otimizadas (páginas públicas, feeds, JSON-LD), permitindo
pré-visualização antes de publicar.

## 6.1. Estrutura de URLs (roteamento semântico)

Rotas legíveis por humanos e máquinas. **URLs de casa são planas** — nunca codificam
níveis intermediários (que são opcionais por estado; decisão em `11`):

- `/{uf}/casa/{slug-casa}`
- `/{uf}/cidade/{slug-cidade}`
- `/{uf}/localidade/{slug-localidade}`
- `/{uf}/orgao/{slug-orgao}` — só existe onde a federativa ativou o órgão
- `/{uf}` — página da federativa

Regras:

- Slug de casa é único por UF e **não muda** com mudança de endereço; renomeações
  geram redirecionamento 301 do slug antigo.
- Breadcrumbs renderizam apenas níveis existentes
  (ex.: `Casas > DF > Brasília > Casa X` sem níveis intermediários).
- Mudança de cidade/região: páginas antigas respondem 301 (ver `05` §5.6).

## 6.2. Dados estruturados (SEO/AEO)

- **JSON-LD** por página: Casa = `NGO`; Evento e Palestra = `Event`; breadcrumbs
  hierárquicos (`BreadcrumbList`).
- **OpenGraph** (`og:title`, `og:description`, `og:url`, imagem) em todas as páginas
  públicas.
- **Sitemap XML dinâmico** — regra de conformidade: **somente casas ativas
  (verificadas)**; pendentes/rejeitadas ficam fora de sitemap e com `noindex`.
- **Robots.txt** coerente com o sitemap.
- Rich snippets/AEO: dados suficientes para motores de resposta citarem horários,
  endereço e atividades diretamente.

## 6.3. API pública (OpenAPI)

Todos os recursos do produto se apoiam em endpoints documentados (especificação
OpenAPI publicada).

| Acesso | Autenticação | Quota (provisória — calibrar no piloto) |
| :--- | :--- | :--- |
| Leitura de dados públicos | Anônima | 60 req/min por IP; CORS aberto |
| Leitura ampliada / webhooks | **API key** (por federativa/site parceiro) | 600 req/min por key |
| Escrita | OAuth2 (usuário autenticado, RBAC de `04`) | conforme papel |

Regras:

- A API **nunca expõe**: campos `adm_*`, dados de candidaturas, listas de
  tarefeiros, e-mails/telefones pessoais (ver `07`).
- Throttling responde HTTP 429 com `Retry-After`.
- Versionamento de API (`/v1/`) com política de depreciação mínima de 12 meses.

## 6.4. Webhooks (saída) — diferido

**Rótulo `avaliar bem` (D18):** webhooks notificam *sistemas externos*, o que não é
objetivo de curto prazo — a notificação imediata de *pessoas* usa Web Push (D17,
ver `05` §5.1 e `08` §8.6). O desenho abaixo fica registrado para a promoção do
item 7.3; até lá, o plugin WordPress opera por consulta à API + cache TTL (§6.5).

Eventos assinados (HMAC) entregues a URLs registradas por API key:
`casa.registrada`, `casa.aprovada`, `casa.rejeitada`, `casa.atualizada`,
`casa.recertificada`, `evento.criado`, `palestra.criada`, `solicitacao.criada`,
`denuncia.criada`. Retentativas com backoff exponencial; painel de entregas.

## 6.5. Plugin WordPress

Muitas federativas e casas usam WordPress. O plugin oficial:

- Consome **somente a API pública** (leitura, com API key opcional) — não acessa o
  banco diretamente.
- Oferece shortcodes/blocos: lista de casas, mapa regional, agenda de palestras,
  próximos eventos, busca embutida.
- Cache local com TTL configurável; degradação graciosa quando a API está
  indisponível.
- Redirecionamento de links legados do app MG para as novas URLs.
- Requisitos: WordPress atual, PHP compatível (ver `10`); atualização automática pelo
  diretório oficial de plugins.

## 6.6. OpenSearch

Dois itens distintos (ver nota no backlog, épico 7):

1. **Descritor OpenSearch** (`opensearchdescription.xml`): permite buscar o diretório
   pela barra de endereços do navegador. Simples; rótulo `avaliar bem`.
2. **Motor de busca semântica** (OpenSearch/vetorial): infraestrutura para busca
   híbrida (palavra-chave + vetorial). Pré-requisito do MCP (6.7). Rótulo
   `avaliar bem`; limites, custos e monitoramento devem ser preenchidos na promoção
   do item (template em `optional-features/feat-opensearch.md`; pendência em `11`).

## 6.7. MCP (Model Context Protocol)

Servidor MCP para consultas em linguagem natural sobre o diretório
("onde tem evangelização infantil perto de mim no sábado?").

**Regras de exposição (obrigatórias, qualquer implementação):**

- Ferramentas retornam **apenas dados cadastrados e públicos** — o modelo não infere
  nem completa dados ausentes; sem resultado, responde que não encontrou.
- **PII bloqueada:** nomes de voluntários, contatos pessoais, candidaturas, campos
  `adm_*` jamais transitam pelas ferramentas. Consulta por dado pessoal individual
  retorna recusa padrão.
- Estatísticas apenas **agregadas** (com k-anonimato, ver `07`).
- Rate limit por usuário/tenant e log de auditoria das consultas.
- Ferramentas mínimas: `buscar_casas`, `buscar_atividades`, `proximas_palestras`,
  `estatisticas_agregadas`.
- Limites, custos e modelo/agente responsável: preencher na promoção do item
  (template em `optional-features/feat-mcp.md`; pendência em `11`).

## 6.8. Geração de arte por IA (eventos)

Integração opcional (item 8.1): a partir dos dados do evento, sugere arte de
divulgação. Regras: opt-in por casa; opt-out por federativa; sem retratar pessoas
reais; crédito "arte gerada por IA"; conteúdo restrito à identidade visual e dados do
evento. Provedor, licença de uso e custos: pendência em `11`.

## 6.9. Serviços externos de apoio

- **Geocodificação** (endereço → lat/lng, plus code): provedor a definir
  (pendência em `11`); resultados cacheados.
- **SMS/WhatsApp** (verificação de conta e notificações): provedor e custos a definir
  (pendência em `11`); e-mail é sempre o canal de fallback.
- **VLibras** (acessibilidade): script do gov.br — ver `08`.

## 6.10. API de Federação (fork → nacional)

Parte do **núcleo travado** (D20): é o contrato pelo qual um fork de federativa devolve
suas casas ao **modelo de dados nacional**, garantindo que a busca e a descoberta
nacionais enxerguem toda casa — esteja ela na instância de referência ou em um fork
(D19; ver [GOVERNANCE.md](../GOVERNANCE.md)).

Princípios (obrigatórios para qualquer fork):

- **Sincronização de volta:** o fork publica no núcleo nacional os dados públicos das
  suas casas ativas (mesmo esquema de `02`), nunca menos do que a instância de
  referência exporia; PII permanece no fork e nunca transita (valem as regras de `07` e
  §6.3).
- **Autenticação entre instâncias:** credencial por fork (servidor-a-servidor), com
  escopo restrito à federação e auditada.
- **Idempotência e deduplicação:** identificadores estáveis de casa evitam duplicatas;
  a resolução de conflitos preserva a autoridade da jurisdição.
- **Antiabuso:** limites de taxa e validação impedem que um fork comprometido injete
  cadastros em massa.

O **desenho detalhado** (formato do payload, autenticação, deduplicação, resolução de
conflitos, cadência e antiabuso) é a pendência **P13** — não bloqueia o piloto MG, que
roda como instância única. Requisito arquitetural correspondente: **ASR-02** em
[12-asr.md](12-asr.md).
