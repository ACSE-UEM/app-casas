# Governança

> Conteúdo em português brasileiro. Este documento define **quem decide o quê** e
> **como uma mudança entra sem quebrar o sistema**. Subordina-se à carta de
> [VISION.md](VISION.md).

## Propósito

Permitir colaboração ampla e a existência de versões próprias das federativas (forks)
**sem** fragmentar a base nacional nem desviar da Doutrina. Isso se sustenta em três
ideias: um **núcleo travado** comum a todos, um **dono** desse núcleo e um **processo**
claro de mudança.

## Princípios de governança

- **Colaboração obrigatória, sem desvio.** Toda contribuição é bem-vinda desde que não
  desvie da especificação nem quebre o sistema.
- **Unificar, respeitando a autonomia.** O núcleo garante a unificação nacional; tudo
  além do núcleo é decisão de cada Casa, órgão ou federativa.
- **Autoridade moral, não de comando.** Órgãos e Conselho atuam por cooperação, não
  por imposição (ver `spec-final/01-visao-e-contexto.md` §1.3).

## O núcleo travado (invariável)

O **núcleo** é o contrato compartilhado que todo fork deve honrar. É **imutável por
forks** — só muda por upstream aprovado (ver processo abaixo). O núcleo é composto por:

1. **Modelo de dados nacional** — entidades, taxonomia de áreas e atividades,
   hierarquia federativa e base IBGE (`spec-final/02-modelo-de-dominio.md`).
2. **API de Federação** — o contrato de sincronização pelo qual um fork devolve suas
   casas ao modelo nacional (`spec-final/06-integracoes-api-seo.md`; desenho detalhado
   é a pendência P13).
3. **Alinhamento doutrinário** — a Visão, Missão e Valores de [VISION.md](VISION.md).

Referência de decisão: **D20** em `spec-final/11-decisoes.md`.

## Modelo de distribuição e forks

O projeto é de **código aberto**. A **UEM opera a instância nacional de referência**.
Uma federativa pode operar seu **próprio fork** (decisão D19).

**Um fork PODE:**

- adicionar features próprias (integrações, relatórios, campos extras não
  conflitantes);
- adicionar restrições **mais estritas** que o núcleo (ex.: exigir um documento que o
  núcleo não exige);
- re-tematizar a interface (identidade visual, textos), respeitando a acessibilidade.

**Um fork NÃO PODE:**

- alterar o modelo de dados do núcleo de forma incompatível;
- quebrar ou deixar de cumprir o contrato da API de Federação (deve sincronizar suas
  casas de volta ao modelo nacional);
- contrariar o alinhamento doutrinário ([VISION.md](VISION.md)).

Mudanças que um fork queira ver no núcleo devem ser **propostas upstream** (PR ao
repositório de referência), não mantidas apenas no fork.

## Quem decide — o Conselho de federativas

O **Conselho de federativas** (já previsto em `spec-final/05-fluxos-operacionais.md`
§5.9 e `spec-final/09-riscos-e-mitigacao.md`) é o **dono do núcleo travado** (decisão
D21). Compete a ele aprovar ou recusar mudanças de núcleo e zelar pelo alinhamento
doutrinário e pela taxonomia. A UEM, como operadora e mantenedora do repositório de
referência, executa o processo e mantém a instância nacional.

## Processo de mudança do núcleo

1. **Proposta (RFC).** Quem propõe abre uma RFC descrevendo o problema, a mudança e o
   impacto no núcleo (ver [CONTRIBUTING.md](CONTRIBUTING.md)).
2. **Discussão.** Revisão técnica e doutrinária; a proposta pode ser ajustada.
3. **Decisão registrada (ADR).** Se for arquiteturalmente significativa, vira um ADR em
   `arquitetura/adr/` e é espelhada em `spec-final/11-decisoes.md` (nada de decidir em
   silêncio).
4. **Aprovação do Conselho.** Mudança de núcleo só é mesclada após aprovação do
   Conselho de federativas.
5. **Publicação.** A mudança entra no repositório de referência; os forks a incorporam
   pela atualização upstream.

Mudanças **fora do núcleo** não exigem aprovação do Conselho — cada fork decide, desde
que continue cumprindo o contrato de federação.

## Referências

- [VISION.md](VISION.md) — carta de Visão/Missão/Valores (autoridade máxima).
- [CONTRIBUTING.md](CONTRIBUTING.md) — processo de RFC e o que é mudança de núcleo.
- [`spec-final/11-decisoes.md`](spec-final/11-decisoes.md) — D19, D20, D21 e pendências.
- [`spec-final/12-asr.md`](spec-final/12-asr.md) — requisitos arquiteturais (ASR).
