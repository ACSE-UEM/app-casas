# Plataforma Nacional de Casas Espíritas

Especificação de uma plataforma nacional para **unificar, organizar e facilitar a
descoberta de Casas Espíritas** e de suas atividades, eventos e palestras em todo o
Brasil — respeitando a autonomia das casas e as estruturas regionais do Movimento
Espírita (FEB → Federativa estadual → Macro-região → Micro-região → Órgão municipal →
Casa). O projeto evolui a experiência do aplicativo mineiro de cadastro de casas
(UEM), com lançamento em piloto por Minas Gerais sobre um modelo de dados nacional.

## Estado do projeto

Este repositório contém a **especificação do produto** — ainda não há implementação
de entrega. A fonte de verdade é a pasta [`spec-final/`](spec-final/00-leia-me.md)
(índice também em [`spec.md`](spec.md)).

O projeto é de **código aberto** e **forkável**, sob licença **AGPL-3.0** (decisão
D22 — qualquer serviço derivado deve publicar seu código-fonte): a UEM opera a
instância nacional de referência e cada federativa pode operar seu próprio fork,
sincronizando suas casas de volta ao modelo nacional (decisões D19/D20). A carta e as regras vivem em
[`VISION.md`](VISION.md) (Visão/Missão/Valores — desempate normativo),
[`GOVERNANCE.md`](GOVERNANCE.md) (núcleo travado, forks e Conselho) e
[`CONTRIBUTING.md`](CONTRIBUTING.md); o mapa de todos os documentos está em
[`docs/taxonomia-documentos.md`](docs/taxonomia-documentos.md).

Existem protótipos exploratórios locais (React e mockups HTML, pasta `local/`, fora
do controle de versão) usados para validar ideias de fluxo/UX — eles não representam
a decisão de stack da entrega (ver pendência P11 em
[`11-decisoes.md`](spec-final/11-decisoes.md)).

## Comece por aqui

1. [Visão e contexto](spec-final/01-visao-e-contexto.md) — o que é o produto, para
   quem, e como o movimento federativo se organiza.
2. [Backlog unificado](spec-final/03-backlog-unificado.md) — épicos e histórias com
   rótulos de priorização (fazer agora / avaliar bem / não fazer).
3. [Registro de decisões](spec-final/11-decisoes.md) — decisões tomadas, assunções
   default e pendências com dono.

## Estrutura do repositório

| Pasta | Conteúdo |
| :--- | :--- |
| `spec-final/` | **Especificação final (fonte de verdade)** — 13 documentos em PT-BR (inclui o ASR em `12-asr.md`) |
| `spec.md` | Índice da especificação |
| `VISION.md`, `GOVERNANCE.md`, `CONTRIBUTING.md` | Carta (Visão/Missão/Valores), governança de forks e guia de contribuição |
| `spec/`, `spec-revised/`, `spec-cursor/` | Gerações anteriores da especificação (histórico) |
| `docs/espiritas/` | Conhecimento de domínio: movimento federativo, áreas funcionais, públicos |
| `docs/design/` | Design system de referência ("Ethereal Professional") |
| `docs/taxonomia-documentos.md` | Mapa de rastreabilidade PRD → ASR → ADR → épicos |
| `docs/stack.md` | Restrições originais de stack |
| `optional-features/` | Templates de avaliação de recursos opcionais (OpenSearch, MCP, IA) |
| `galeria-temas/` | Exploração de temas visuais e protótipos |
| `local/` | Experimentos locais (protótipo de MVP e assunções) |

## Ferramentas

Requer Docker (imagens preferencialmente Alpine) e GNU Make.

```bash
make lint-spec         # lint (markdownlint) da especificação, planos e governança
make prototipos-serve  # serve os protótipos HTML locais na porta 8765
```

## Como contribuir com a especificação

- Documentos sempre em **português brasileiro**.
- Antes de propor um recurso, aplique os critérios de decisão de
  [`01-visao-e-contexto.md` §1.8](spec-final/01-visao-e-contexto.md) e classifique-o
  no [backlog](spec-final/03-backlog-unificado.md).
- Toda decisão nova ou assunção deve ser registrada em
  [`11-decisoes.md`](spec-final/11-decisoes.md) — nada de decidir em silêncio.
- Rode `make lint-spec` antes de submeter alterações.
