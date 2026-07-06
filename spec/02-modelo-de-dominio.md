# 2. Modelo de Domínio e Taxonomia

Este documento define as entidades centrais e as estruturas de dados da plataforma.
Permissões sobre cada entidade: ver [04-iam-rbac.md](04-iam-rbac.md). Ciclos de vida e
fluxos: ver [05-fluxos-operacionais.md](05-fluxos-operacionais.md).

## 2.1. Entidades do núcleo institucional

### 2.1.1. Casa (instituição)

Entidade raiz que representa um Centro Espírita.

**Separação de campos (herdada do app MG):** campos da casa (prefixo conceitual
`ce_`) são públicos; campos do administrador do cadastro (prefixo `adm_`) são
**ocultos ao público** e tratados como dados pessoais (ver `07`).

- **Dados básicos obrigatórios:** nome da casa, cidade (sem sigla do estado),
  localidade, situação `virtual` (somente online) ou física; contato do
  administrador do cadastro: nome e telefone obrigatórios, e-mail opcional
  (viabiliza o cadastro por telefone).
- **Contato público (opcional):** telefone da casa, e-mail da casa, site,
  minibiografia (`ce_bio`).
- **Endereço público:** logradouro, localidade/bairro, cidade, estado, código IBGE,
  país (padrão Brasil). Obrigatório para casas físicas; casas virtuais mantêm apenas
  cidade/localidade (para vínculo federativo). Geocodificação automática gera
  latitude/longitude e plus code.
- **Redes sociais:** Instagram, YouTube, WhatsApp, Facebook, TikTok (URLs).
- **Classificações de atividades (perfil básico):** caixas de seleção que apenas
  **informam** que a casa realiza a atividade (rótulos — ver §2.5). Não substituem o
  cadastro profundo de Atividades.
- **Reuniões Públicas (caso especial):** por sua importância central para o alcance
  público, dias, horários e detalhes das reuniões públicas são capturados
  **diretamente no perfil básico da Casa**. Regra anti-duplicação: se a casa criar
  depois uma Atividade completa do tipo "Reuniões Públicas", a agenda da Atividade
  passa a ser a fonte de verdade e o perfil básico exibe esses dados (referência, não
  cópia).
- **Fontes externas de agenda (opcionais):** URL de agenda de palestras
  (`ce_lectures_url` + tipo: csv/calendar/feed) e de eventos (`ce_events_url` + tipo).
- **Expediente:** horários gerais de funcionamento, usados no cálculo de
  "aberta agora" junto com as agendas das atividades.
- **Assets:** links para documentos públicos/privados, logotipos, materiais.
- **Departamentos:** subdivisões internas às quais atividades podem pertencer.
- **Tema:** tema visual escolhido da galeria curada (ver `08`).
- **Feature toggles:** módulos ligados/desligados pela casa (eventos, palestras,
  recrutamento de voluntários etc.).
- **Status:** ver §2.7.

### 2.1.2. Departamento

Subdivisão administrativa da Casa (ex.: Assistência, Estudo, Comunicação). Atributos:
nome, descrição, coordenadores. Atividades referenciam um departamento.

### 2.1.3. Asset

Elemento cadastrado pela Casa: link para documento, logotipo, material instrucional.
Atributos: título, URL/arquivo, visibilidade (público/privado), categoria.

## 2.2. Entidades de trabalho

### 2.2.1. Atividade

Tarefa contínua e recorrente executada pela Casa. É a "intranet" e a face pública do
trabalho da casa.

- **Identidade:** slug, nome, tipo, departamento da casa.
- **Relação com áreas funcionais:** tags de área (ver §2.4) — uma atividade pode
  alinhar-se a mais de uma área. Atividades fora da taxonomia padrão são permitidas e
  **sinalizadas como personalizadas** (nota de conformidade doutrinária).
- **Logística:** funcionamento presencial / remoto / híbrido; local físico; links de
  participação online.
- **Agenda:** dias, horários, locais e links; exportável (ICS e formatos por público:
  evangelização, juventude, palestras); tipos de visualização: semanal, mensal,
  bimestral, grade, lista, tabela.
- **Visibilidade:** pública ou interna/privada.
- **Responsáveis:** coordenador(es) da atividade.
- **Engajamento:** público-alvo; indicador "aceita voluntários" (Quero Ajudar) com
  status e periodicidade; contatos públicos da atividade (nome, e-mail, telefone).
- **Material de apoio:** links categorizados — jurídico, doutrinário, gerencial,
  operacional, financeiro, modelo, técnico, design, workshops, vídeos de oficinas,
  planejamento, modelos para impressão.

### 2.2.2. Evento

Extensão de `Atividade` com **data de início e data de fim** (ocorrência esporádica).

- **Atributos especiais:** URL de inscrição, promoção destacada na página da Casa e na
  área principal do site, botão de compartilhamento em redes sociais, marcador
  especial no mapa, banner/campanha na página da casa.
- **Arte de divulgação:** opcionalmente gerada por IA a partir dos dados do evento
  (recurso rotulado "avaliar bem" — ver `03` e `06`).

### 2.2.3. Palestra

Tipo especializado de `Atividade` focado em difusão doutrinária.

- **Atributos especiais:** nome do palestrante, tema, link (quando online).
- **Exibição:** marquee de "próximas palestras" no topo das páginas (estadual e
  regional), na página principal e na página da Casa e do CRE.
- **Fonte externa:** quando a casa informa `ce_lectures_url`, a agenda e os temas são
  importados dessa fonte (csv/calendar/feed).

## 2.3. Entidades de pessoas e acesso

### 2.3.1. Usuário

Conta autenticada (OIDC/OAuth2). Atributos: nome, telefone (verificado por
SMS/WhatsApp), e-mail (opcional), data de nascimento (para regra 16+, ver `07`),
preferências de notificação. O vínculo de um usuário a uma casa espírita é **dado
pessoal sensível** (convicção religiosa — LGPD art. 5º, II) e recebe proteção
reforçada.

### 2.3.2. Vínculo (papel do usuário)

Associação Usuário × escopo × papel: tarefeiro/coordenador/admin numa Casa; revisor,
presidente ou coordenador de área num Órgão Regional ou Federativa; admin da
plataforma. Ver matriz em `04`.

### 2.3.3. Candidatura (Quero Ajudar)

Manifestação de interesse de voluntariado em uma Atividade. Atributos: nome, contato,
mensagem, atividade, consentimento explícito registrado, status
(nova/aceita/recusada), datas. **Visibilidade:** somente coordenador(es) da atividade
e admin da casa. **Retenção:** anonimização automática 6 meses após a decisão.

### 2.3.4. Consentimento

Registro imutável de consentimentos (candidatura, conta 16–17 com responsável,
comunicações). Atributos: titular, finalidade, texto exibido, data/hora, origem.

## 2.4. Entidades de governança

| Entidade | Descrição | Atributos principais |
| :--- | :--- | :--- |
| **Solicitação** | Demanda de apoio enviada por uma Casa ao seu órgão regional (delegação automática pela jurisdição) | casa, tipo, descrição, órgão destinatário, status, prazos |
| **Denúncia / Reporte** | Aviso do público sobre dado incorreto ou conduta inadequada em um perfil | alvo (casa/atividade), descrição, contato opcional do denunciante, status, revisor responsável |
| **Recertificação** | Ciclo periódico (12 meses) de confirmação dos dados da casa | casa, data-limite, status (confirmada/vencida), lembretes enviados |
| **Registro de Auditoria** | Log imutável de toda ação `gerenciar` (criar/atualizar/excluir) | usuário, ação, recurso, timestamp, valores antes/depois |

## 2.5. Entidades de território

### 2.5.1. Município (base nacional)

A plataforma mantém a base completa de municípios e distritos do Brasil.

- **Atributos:** nome, UF, **código IBGE** (chave para indicadores nacionais:
  população, IDH etc.), federativa correspondente (derivada da UF).
- **Vínculos regionais:** quando a federativa ativa macro-regiões, micro-regiões ou
  órgãos municipais, o município ganha as colunas de vínculo correspondentes.
- **Atributos livres:** conjunto chave-valor exibível no template da cidade (ex.:
  telefone de atendimento fraterno municipal).

### 2.5.2. Federativa

Entidade estadual. Atributos: nome, sigla, UF, site, contatos, redes sociais, áreas
funcionais ativas, níveis regionais ativados (macro/micro/municipal), features
habilitadas. A lista de referência das 27 federativas está em
`docs/espiritas/movimento-federativo/federativas.md`.

### 2.5.3. Órgão Regional

Entidade única para macro-região, micro-região e órgão municipal, diferenciada por
`nível`. Atributos: nível (macro/micro/municipal), **nome local** (ex.: "Comissão
Regional", "CRE", "AME"), número de ordem, slug, contatos, site, redes sociais, áreas
funcionais, abrangência (macro→micros; micro→municípios; municipal→casas). Cada órgão
tem página pública própria.

**Resolução de jurisdição:** a casa pertence à cidade; a cidade aponta para o órgão
municipal (se houver), a micro-região (se houver) e a macro-região (se houver). Na
ausência de níveis intermediários, a casa liga-se diretamente à federativa.

## 2.6. Taxonomia de áreas funcionais

O movimento federativo estrutura seu trabalho em áreas funcionais; as casas executam
atividades autônomas que podem alinhar-se a uma ou mais áreas. Fonte canônica:
`docs/espiritas/movimento-federativo/areas/` (CFN/FEB e federativas).

| Sigla | Área | Exemplos de atividades |
| :--- | :--- | :--- |
| **AAE** | Atendimento Espiritual | Atendimento fraterno, passe/irradiação/magnetismo, atendimento à melhor idade, visita fraterna |
| **AOM** | Orientação Mediúnica | Desenvolvimento mediúnico, reuniões mediúnicas |
| **AEE** | Estudo do Espiritismo | ESDE, EADE, estudo de obras, princípios básicos da Doutrina |
| **AEEJ** | Estudo do Evangelho de Jesus | Estudo do Evangelho (EMEJ/"miudinho") |
| **AIJ** | Infância e Juventude | Evangelização infantil, mocidade e juventude |
| **AFam** | Família | Culto do Evangelho no lar, reuniões de pais, acolhimento a famílias em crise ou luto (área transversal) |
| **APSE** | Promoção Social Espírita | Cesta básica, sopa fraterna, distribuição de alimento, campanha do agasalho, campanha do quilo, bazar/brechó, enxoval de bebê, banho para pessoas em situação de rua |
| **ACSE** | Comunicação Social Espírita | Divulgação da Doutrina, livraria, biblioteca, reuniões públicas, união dos espíritas, unificação do movimento |
| **AA** | Arte | Música e coral, teatro, oficinas de arte, artesanato doutrinário |
| **AESP** | Esperanto | Estudo e prática do Esperanto |
| **AG** | Administração Geral | Secretaria, tesouraria, planejamento estratégico, gestão de voluntários |

Notas de conformidade:

- A taxonomia deve permanecer mapeada às diretrizes do CFN/FEB; atualizações passam
  pelo conselho de federativas (ver `09`).
- Atividades especializadas de classificação ambígua (cursos, oficinas
  profissionalizantes, atendimento médico/psicológico/jurídico, artesanato) podem
  vincular-se a mais de uma área; a plataforma permite múltiplas tags.
- Atividades personalizadas (fora da taxonomia) são permitidas e claramente
  sinalizadas.

### 2.6.1. Classificações do perfil básico (rótulos)

O perfil básico da Casa agrupa as classificações em quatro seções, com os termos
técnicos herdados do app MG (usados em URLs de filtro e integrações):

| Seção | Itens (termo) |
| :--- | :--- |
| **Atividades gerais** | Reuniões públicas (`reuniao_publica`), Mocidade e Juventude (`mocidade`), Evangelização Infantil (`evangelizacao`), Atendimento Fraterno (`atendimentofraterno`), Reuniões Mediúnicas (`reuniao_mediunica`), Divulgação da Doutrina (`divulgacao`), Livraria (`livraria`), Passe/Irradiação/Magnetismo (`magnetismo`), União dos Espíritas (`uniao`), Unificação do Movimento (`unificacao`), Biblioteca (`biblioteca`) |
| **Reuniões de estudo** | ESDE (`esde`), EADE (`eade`), Estudo do Evangelho (`miudinho`), Desenvolvimento Mediúnico (`estudomediunidade`), Estudo de Obras (`obras`), Princípios Básicos (`principiosbasicos`) |
| **Tarefas de assistência** | Cesta básica (`cestabasica`), Sopa fraterna (`sopa`), Distribuição de alimento (`alimento`), Campanha do agasalho (`agasalho`), Campanha do quilo (`quilo`), Bazar/Brechó (`bazar`), Enxoval de bebê (`enxovalbebe`), Banho para pessoas em situação de rua (`banho`), Atendimento à melhor idade (`melhoridade`), Visita fraterna (`visitafraterna`) |
| **Atividades especializadas** | Cursos (`cursos`), Oficinas profissionalizantes (`oficinas`), Atendimento médico (`medico`), Atendimento psicológico (`psicologo`), Artesanato (`artesanato`), Apoio jurídico (`juridico`) |

Candidatos a novos rótulos (backlog, rótulo "avaliar bem"): música, artes,
esperanto/línguas, auxílio a dependentes químicos.

## 2.7. Ciclo de vida da Casa

```text
rascunho → pendente de revisão → ativa ⇄ inativa
                    ↓                ↓
                rejeitada        em disputa → ativa (nova posse)
```

- **Rascunho/Pendente:** não indexada (SEO), fora do mapa público; exposição pública
  limitada a nome + cidade + status (transparência da fila de revisão).
- **Ativa:** verificada por Revisor; indexada, no mapa, no sitemap.
- **Inativa:** mantida com histórico, fora da busca padrão.
- **Em disputa:** posse reclamada; ver fluxo em `05`.
- **Recertificação vencida:** casa ativa que não confirmou dados em 12 meses recebe
  selo "dados possivelmente desatualizados" e lembretes automáticos.

## 2.8. Visões e camadas

**Visões** são filtros dinâmicos dos dados pela hierarquia geográfica/organizacional:
Estadual, Macro, Micro, Municipal, Casa, Atividade e Localidade/Bairro. Cada visão
pode renderizar-se como mapa (com marcadores), tabela ou widgets regionais.

**Camadas** são conjuntos de elementos do mesmo tipo exibidos numa visão (ex.:
palestras da macro-região Norte; eventos do 22º CRE).

## 2.9. PTMEB

O Plano de Trabalho do Movimento Espírita Brasileiro oferece as diretrizes de trabalho
do movimento nacional (lista completa em
`docs/espiritas/movimento-federativo/orgao-nacional/plano-trabalho.md`). Todo item de
backlog referencia a diretriz PTMEB que atende (ver `03`).
