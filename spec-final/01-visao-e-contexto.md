# 1. Visão e Contexto

## 1.1. Visão do produto

O Sistema de Gestão de Casas Espíritas é uma plataforma nacional para unificar,
organizar e facilitar a descoberta de Centros Espíritas (Casas Espíritas) e de suas
atividades em todo o Brasil. A plataforma é um ponto central de transparência
institucional, engajamento de voluntários e alcance público, **respeitando a autonomia
das Casas** e as estruturas regionais do Movimento Espírita.

O sistema evolui a experiência do aplicativo mineiro de cadastro de casas (UEM,
WordPress + Participants Database), generalizando-a para o país inteiro.

## 1.2. Operador e modelo de adoção

- **Operadora da plataforma:** União Espírita Mineira (UEM), que responde como
  controladora de dados (ver [07-lgpd-privacidade.md](07-lgpd-privacidade.md)).
- **Adoção por federativas:** cada federativa estadual adere por acordo de adoção e
  operação (modelo de acordo é pendência — ver [11-decisoes.md](11-decisoes.md)),
  passando a gerir seus órgãos regionais, revisores e casas.
- **Lançamento:** piloto em Minas Gerais (rede de revisores da UEM/COFEMG já existe),
  sobre um **modelo de dados nacional desde o primeiro dia** — todos os estados,
  municípios (base IBGE) e federativas já representados.
- **Distribuição e forks (código aberto):** o projeto é de código aberto; a UEM opera
  a **instância nacional de referência**. Uma federativa pode operar seu **próprio
  fork**, com features e restrições próprias, desde que **sincronize suas casas de
  volta ao modelo nacional** pela API de Federação (fork + federação de volta — D19).
  Um **núcleo travado** (modelo de dados nacional + API de Federação + alinhamento
  doutrinário) é imutável por forks (D20). Isso **reforça** — não contradiz — o modelo
  nacional único: o modelo nacional é justamente o núcleo compartilhado. Governança em
  [GOVERNANCE.md](../GOVERNANCE.md).
- **Carta normativa:** [`VISION.md`](../VISION.md) (Visão, Missão e Valores) e
  [`GOVERNANCE.md`](../GOVERNANCE.md) estão **acima** desta especificação e a arbitram
  em caso de dúvida ou conflito.

## 1.3. Escopo nacional e hierarquia organizacional

O sistema acomoda as variações estruturais de todos os estados (federativas). A
hierarquia geral é:

1. **Federativa (estadual):** entidade estadual de unificação (ex.: UEM em MG).
2. **Macro-região:** agrupamentos regionais (em MG, as 5 Comissões Regionais — CRs:
   Leste, Centro-Norte, Sul, Triângulo, Zona da Mata).
3. **Micro-região:** agrupamentos sub-regionais (em MG, os 29 Conselhos Regionais
   Espíritas — CREs).
4. **Órgão municipal / intermunicipal:** alianças locais (em MG, as Alianças
   Espíritas Municipais — AMEs).
5. **Centro Espírita (Casa):** a instituição autônoma.

Regras estruturais:

- Os **nomes dos níveis variam por estado** — o modelo guarda o nome local de cada
  órgão (ver `ÓrgãoRegional` em [02-modelo-de-dominio.md](02-modelo-de-dominio.md)).
- **Níveis intermediários são opcionais.** Estados como o Distrito Federal têm apenas
  Federativa → Casas. URLs e navegação nunca dependem de níveis intermediários
  (ver [06-integracoes-api-seo.md](06-integracoes-api-seo.md)).
- A relação hierárquica não é de comando: os Órgãos de Unificação atuam por
  **autoridade moral e cooperação voluntária**, preservando a autonomia das Casas.

## 1.4. Definição de Casa Espírita

Um Centro Espírita é uma organização espírita autônoma que serve a comunidade local
por meio de atividades contínuas e eventos específicos. É sustentado por voluntários
(tarefeiros) e administrado por dirigentes e coordenadores. Uma Casa pode ser
**física** ou **virtual** (somente online); mesmo as virtuais têm localidade/cidade
obrigatória, pois é a localidade que define qual federativa e quais órgãos regionais a
servem.

**Admissão sem exigência de filiação formal:** o cadastro é aberto a qualquer Casa; a
aprovação não exige comprovação documental de filiação federativa — o vínculo à
federativa e aos órgãos regionais é automático pela localidade, e o julgamento do
Revisor (conhecimento local, sem documento obrigatório) é o critério de aceite (A14,
ver [11-decisoes.md](11-decisoes.md); fluxo completo em
[05-fluxos-operacionais.md](05-fluxos-operacionais.md) §5.1).

## 1.5. Públicos-alvo e prioridade de serviço

A plataforma serve públicos diversos, priorizados por uma lógica de serviço
(servir primeiro quem mais precisa):

1. **Sociedade / público geral:** pessoas em busca de ajuda (atendimento fraterno),
   conhecimento ou um lugar para visitar. Inclui não espíritas, simpatizantes e leigos.
2. **Voluntários / tarefeiros:** pessoas que desejam ajudar ou participar de
   atividades específicas.
3. **Coordenadores de tarefas:** voluntários que administram atividades ou
   departamentos de uma Casa.
4. **Dirigentes de Casa (admin):** responsáveis pela gestão geral e pela presença
   institucional do Centro.
5. **Representantes federativos (municipal/micro/macro/estadual):** coordenadores
   regionais que apoiam grupos de Casas e precisam de visões consolidadas.

O vocabulário do produto deve ser acessível a um público leigo com formação média,
evitar siglas técnicas e usar as siglas espíritas com naturalidade
(fonte: `docs/espiritas/publicos/publico-alvo.md`).

## 1.6. Personas mínimas

| Persona | Quem é | O que busca na plataforma | Momento crítico |
| :--- | :--- | :--- | :--- |
| **Leigo em busca de ajuda** | Pessoa em fragilidade emocional, sem familiaridade com o Espiritismo | Encontrar atendimento fraterno próximo e aberto agora; um telefone que atenda | Ansiedade: se não encontrar rápido, desiste. Precisa de rota SOS (CVV 188, FEB Escuta) quando não houver casa aberta |
| **Tarefeiro / voluntário em potencial** | Espírita ou simpatizante com tempo disponível | Descobrir atividades que aceitam voluntários e candidatar-se ("Quero Ajudar") | Confiança: quer saber que os dados pessoais ficam restritos à casa escolhida |
| **Coordenador de tarefa** | Voluntário experiente que administra uma atividade | Manter agenda e dados da atividade atualizados com o mínimo de fricção; receber candidaturas | Tempo escasso: cadastros longos são abandonados |
| **Dirigente de Casa** | Presidente/diretor, às vezes com pouca habilidade técnica | Dar visibilidade institucional à Casa; cumprir obrigações com simplicidade | Inclusão: cadastro por telefone, sem exigir e-mail |
| **Representante regional (AME/CRE/CR/Federativa)** | Voluntário de órgão de unificação | Visão consolidada da sua jurisdição; revisar adesões; atender solicitações das casas | Sobrecarga: filas de revisão precisam ser visíveis e remanejáveis |

## 1.7. Alinhamento com o PTMEB

O Plano de Trabalho para o Movimento Espírita Brasileiro (PTMEB, 2018–2028, CFN/FEB)
oferece as diretrizes que fundamentam as decisões de produto. Diretrizes mais
diretamente servidas pela plataforma:

- **01 — Difundir a doutrina espírita** (busca pública, SEO/AEO, palestras).
- **03 — Integração das áreas funcionais** (taxonomia de áreas em `02`).
- **04 — Adequação dos Centros Espíritas** (guias de apoio administrativo).
- **06 — União dos espíritas e unificação** (espaços dos órgãos regionais).
- **09 — Participação do espírita na sociedade** (atendimento fraterno, assistência).
- **10 — Engajamento da juventude** (mocidades; contas 16+ com consentimento).
- **11 — Inclusão e acessibilidade** (WCAG, VLibras, temas de alto contraste).

## 1.8. Critérios de decisão para novos recursos

Antes de aprovar um item do backlog (ver [03-backlog-unificado.md](03-backlog-unificado.md)):

1. Serve à missão da Doutrina Espírita?
2. Alinha-se ao PTMEB (qual diretriz)?
3. É seguro jurídica e tecnicamente (LGPD, ver `07`)?
4. Simplifica a vida do usuário em vez de criar pressão?
5. Qual o impacto (alto/médio/baixo) × facilidade (fácil/mediano/difícil)?

## Glossário

| Sigla | Significado |
| :--- | :--- |
| FEB | Federação Espírita Brasileira (órgão nacional de unificação) |
| CFN | Conselho Federativo Nacional (da FEB) |
| PTMEB | Plano de Trabalho para o Movimento Espírita Brasileiro |
| UEM | União Espírita Mineira (federativa de MG; operadora da plataforma) |
| COFEMG | Conselho Federativo Espírita de Minas Gerais |
| CR | Comissão Regional (macro-região, em MG) |
| CRE | Conselho Regional Espírita (micro-região, em MG) |
| AME | Aliança Municipal Espírita (órgão municipal, em MG) |
| LGPD | Lei Geral de Proteção de Dados (Lei 13.709/2018) |
| IBGE | Instituto Brasileiro de Geografia e Estatística (base de municípios) |
| SEO/AEO | Otimização para motores de busca / motores de resposta (IA) |
| MCP | Model Context Protocol (integração com agentes de IA) |
