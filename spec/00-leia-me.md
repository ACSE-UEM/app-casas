# Especificação Final — Plataforma Nacional de Casas Espíritas

Esta pasta contém a **especificação final e consolidada** do projeto. Ela substitui,
como fonte de verdade, as gerações anteriores de especificação, que permanecem no
repositório como histórico:

| Pasta | Papel atual |
| :--- | :--- |
| `spec/` | Material bruto original (brainstorm). Histórico. |
| `spec-revised/` | Primeira consolidação (parcialmente em inglês). Histórico. |
| `spec-cursor/` | Revisão cruzada e perguntas abertas. Histórico; as 24 perguntas estão respondidas ou endereçadas em [11-decisoes.md](11-decisoes.md). |
| `spec-final/` | **Fonte de verdade.** |

## Documentos

| Nº | Documento | Conteúdo |
| :--- | :--- | :--- |
| 01 | [Visão e Contexto](01-visao-e-contexto.md) | Visão do produto, operador, hierarquia federativa, públicos e personas, alinhamento ao PTMEB |
| 02 | [Modelo de Domínio](02-modelo-de-dominio.md) | Entidades, taxonomia de áreas e atividades, visões e camadas, ciclo de vida da Casa |
| 03 | [Backlog Unificado](03-backlog-unificado.md) | Épicos e histórias com rótulo, impacto, facilidade e critérios PTMEB |
| 04 | [IAM e RBAC](04-iam-rbac.md) | Papéis granulares, matriz de permissões, auditoria |
| 05 | [Fluxos Operacionais](05-fluxos-operacionais.md) | Adesão, revisão, recertificação, disputas, moderação, mudanças de endereço |
| 06 | [Integrações, API e SEO](06-integracoes-api-seo.md) | API pública, plugin WordPress, webhooks, JSON-LD, sitemap, URLs, OpenSearch, MCP |
| 07 | [LGPD e Privacidade](07-lgpd-privacidade.md) | Papéis LGPD, consentimentos, menores, retenção, direitos dos titulares |
| 08 | [Acessibilidade e UX](08-acessibilidade-ux.md) | WCAG, VLibras, temas, design system, PWA/offline |
| 09 | [Riscos e Mitigação](09-riscos-e-mitigacao.md) | Modelo de ameaças e estratégia de mitigação em camadas |
| 10 | [NFRs e Operação](10-nfr-e-operacao.md) | Desempenho, disponibilidade, backup/DR, KPIs com metas provisórias |
| 11 | [Decisões](11-decisoes.md) | Registro de decisões, assunções default e pendências com dono |
| 12 | [Requisitos Arquiteturais (ASR)](12-asr.md) | Requisitos que moldam a arquitetura; ponte entre o PRD e os ADR |

## Acima da especificação

Esta pasta é o **PRD** (requisitos de produto). Acima dela ficam a carta e a
governança do projeto, na raiz do repositório: [`VISION.md`](../VISION.md)
(Visão/Missão/Valores — desempate normativo), [`GOVERNANCE.md`](../GOVERNANCE.md)
(núcleo travado, forks e Conselho de federativas) e
[`CONTRIBUTING.md`](../CONTRIBUTING.md). O mapa de todos os papéis de documento está em
[`../docs/taxonomia-documentos.md`](../docs/taxonomia-documentos.md).

## Como usar

1. Novos recursos: verifique permissões em `04`, entidades em `02` e classifique a
   história em `03` antes de implementar.
2. Qualquer tratamento de dado pessoal: consulte `07` (LGPD) — atenção especial ao
   caráter **sensível** do vínculo religioso (LGPD art. 5º, II).
3. Divergências ou lacunas: registre em `11-decisoes.md` (nunca decida em silêncio).

## Convenções

- Idioma: português brasileiro (regra do repositório).
- Siglas espíritas (CRE, AME, COFEMG, FEB, PTMEB) são usadas livremente; siglas
  técnicas são explicadas na primeira ocorrência. Glossário ao final de `01`.
