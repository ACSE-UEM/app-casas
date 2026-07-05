# Taxonomia e rastreabilidade de documentos

Este mapa diz **qual arquivo cumpre qual papel** na documentação do projeto e como os
níveis se conectam. Adotado como assunção **A15** (ver
[`../spec-final/11-decisoes.md`](../spec-final/11-decisoes.md)).

## A cadeia de rastreabilidade

```text
VISION.md / GOVERNANCE.md        (carta e governança — acima de tudo)
        │
        ▼
PRD  →  ASR  →  ADR  →  Épicos / Histórias  →  Issues
```

- **Carta e governança** — [VISION.md](../VISION.md) (Visão/Missão/Valores) e
  [GOVERNANCE.md](../GOVERNANCE.md) (núcleo travado, forks, Conselho). Autoridade
  máxima; tudo abaixo se subordina.
- **PRD (requisitos de produto)** — a pasta
  [`../spec-final/`](../spec-final/00-leia-me.md): o quê e para quem, regras de negócio,
  fluxos, LGPD, riscos, NFR.
- **ASR (requisitos arquiteturalmente significativos)** —
  [`../spec-final/12-asr.md`](../spec-final/12-asr.md): o subconjunto que molda a
  arquitetura; ponte entre PRD e ADR.
- **ADR (registros de decisão de arquitetura)** — `arquitetura/adr/` (criados por
  [`../plans/build-architecture.md`](../plans/build-architecture.md)). Uma decisão por
  arquivo, espelhada em `spec-final/11-decisoes.md`.
- **Épicos e histórias** —
  [`../spec-final/03-backlog-unificado.md`](../spec-final/03-backlog-unificado.md),
  rotulados (fazer agora / avaliar bem / não fazer) com impacto e facilidade.
- **Issues** — o rastreamento operacional do dia a dia (fora deste repositório de
  especificação).

## Tabela de papéis

| Papel | Onde vive | Observação |
| :--- | :--- | :--- |
| Carta (V/M/V) | `VISION.md` | Desempate normativo |
| Governança / forks | `GOVERNANCE.md` | Núcleo travado, Conselho, RFC |
| Contribuição | `CONTRIBUTING.md` | Processo de PR/RFC, gates |
| PRD | `spec-final/` (01–11) | Fonte de verdade do produto |
| ASR | `spec-final/12-asr.md` | Requisitos que moldam a arquitetura |
| ADR | `arquitetura/adr/` | Decisões de arquitetura (a criar) |
| Decisões/assunções/pendências | `spec-final/11-decisoes.md` | Registro central (D/A/P) |
| Épicos e histórias | `spec-final/03-backlog-unificado.md` | Backlog rotulado |

## Como manter a rastreabilidade

- Todo **ASR** aponta para a decisão/pendência ou ADR que o realiza.
- Todo **ADR** é espelhado como decisão em `spec-final/11-decisoes.md` (nada de decidir
  em silêncio — ver [CONTRIBUTING.md](../CONTRIBUTING.md)).
- Toda **história** relevante cita o documento de PRD/ASR que a fundamenta.
