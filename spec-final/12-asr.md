# 12. Requisitos Arquiteturalmente Significativos (ASR)

Os **ASR** são o subconjunto de requisitos que moldam a arquitetura — aqueles cujo
custo de mudança é alto e que restringem as decisões estruturais. Eles fazem a ponte
entre o **PRD** (esta pasta `spec-final/`, requisitos de produto) e os **ADR**
(decisões de arquitetura em `arquitetura/adr/`, criados por
`plans/build-architecture.md`). Ver o mapa completo da cadeia em
[`../docs/taxonomia-documentos.md`](../docs/taxonomia-documentos.md).

Cada ASR tem um identificador estável (`ASR-NN`), a justificativa da sua relevância
arquitetural e a rastreabilidade para a decisão, pendência ou ADR que o realiza. ADRs
marcados como "a criar" serão escritos na execução de
[`../plans/build-architecture.md`](../plans/build-architecture.md).

## 12.1. Núcleo, federação e distribuição

| ID | Requisito | Por que é arquiteturalmente significativo | Rastreabilidade |
| :--- | :--- | :--- | :--- |
| ASR-01 | **Núcleo travado** imutável por forks: modelo de dados nacional + API de Federação + alinhamento doutrinário | Define uma fronteira de compatibilidade que todo fork honra; separa o comum (versionado com rigor) do livre; impõe versionamento e compatibilidade retroativa do núcleo | D20; [GOVERNANCE.md](../GOVERNANCE.md); ADR de Federação (a criar) |
| ASR-02 | **API de Federação**: contrato de sincronização pelo qual um fork devolve suas casas ao modelo nacional | É superfície de integração entre instâncias independentes — exige autenticação servidor-a-servidor, deduplicação, resolução de conflitos, idempotência e antiabuso; molda modelo de dados e operação | D19/D20; `06` §6.10; pendência P13; ADR de Federação (a criar) |
| ASR-03 | **Auto-hospedabilidade do fork**: implantável por uma federativa via Docker Compose (imagens Alpine), com setup documentado | Restringe o núcleo a dependências auto-hospedáveis (evita amarração a serviços proprietários); exige configuração externalizada e guia de operação | `10` §10.1/§10.7; pendência P14; ADR-001 (monólito modular, a criar) |
| ASR-04 | **Código aberto**: o repositório de referência é aberto e forkável | Habilita o modelo de forks e a colaboração upstream; a escolha de licença condiciona o que forks podem/devem devolver | D19; pendência P12 (licença) |

## 12.2. Segurança, privacidade e integridade

| ID | Requisito | Por que é arquiteturalmente significativo | Rastreabilidade |
| :--- | :--- | :--- | :--- |
| ASR-05 | **Seguro antes de rápido** (secure-by-design): defesa em camadas, sem atalhos que gerem vulnerabilidades sutis | Atravessa todas as camadas (WAF, RBAC, validação, segredos, atualização de dependências); é critério de aceite, não otimização posterior | `09` §9.5; `10` §10.4; [VISION.md](../VISION.md) valor 7 |
| ASR-06 | **Privacidade por padrão** e tratamento de **dado sensível** (vínculo religioso, LGPD art. 5º II); RBAC estrito; PII nunca exposta em API/MCP | Molda modelo de dados (colunas `adm_*`, visões públicas), API, busca IA e retenções; erro aqui é risco legal crítico | `07`; `04` §4.4; `06` §6.3/§6.7; A9/A13 |
| ASR-07 | **Isolamento de dados não verificados**: casas pendentes/rejeitadas fora de SEO, mapa e sitemap (`noindex`) | Impõe separação entre estado do dado e superfícies públicas (renderização, sitemap, API); barreira central contra spam/golpe/SEO poisoning | `06` §6.2; `02` §2.7; A8; `09` §9.3 |

## 12.3. Arquitetura de aplicação e dados

| ID | Requisito | Por que é arquiteturalmente significativo | Rastreabilidade |
| :--- | :--- | :--- | :--- |
| ASR-08 | **Modelo de dados nacional desde o dia 1** (multi-tenant, base IBGE, hierarquia com níveis opcionais) | É o núcleo compartilhado; define particionamento por UF/tenant, vínculos território→órgãos e a taxonomia; base da unificação | D3; `01` §1.3; `02` |
| ASR-09 | **Separação renderização pública × gestão**: o cadastro passa por compilação que gera páginas/feeds/JSON-LD | Permite pré-visualização, cache agressivo e desempenho de leitura; desacopla escrita (gestão) de leitura (público) | `06` (introdução); `10` §10.2 |
| ASR-10 | **Runtime PHP ≥ 8.3 e MySQL 8.x**, empacotados em Docker (Alpine) | Fixa a plataforma de execução, o suporte de segurança ativo e o modelo de implantação (inclusive de forks) | D12; `10` §10.1; ADR-002 (framework PHP, a criar) |
| ASR-11 | **Identidade OIDC/OAuth2** com RBAC de `04` | Define autenticação/autorização de toda escrita e a integração de identidade (inclusive entre instâncias federadas) | `04`; `10` §10.1; ADR-004 (provedor OIDC, a criar) |

## 12.4. Experiência, desempenho e operação

| ID | Requisito | Por que é arquiteturalmente significativo | Rastreabilidade |
| :--- | :--- | :--- | :--- |
| ASR-12 | **Acessibilidade WCAG 2.1 AA bloqueante** (contraste, VLibras, degradação sem JS) | Restringe o front-end (temas com contraste garantido, HTML semântico, JS progressivo); é critério de aceite, não opcional | `08`; A10; `01` §1.7 (PTMEB 11) |
| ASR-13 | **PWA offline somente leitura + Web Push (VAPID)**: SOS sempre offline; notificação imediata de pessoas sem provedor pago | Define service worker, estratégia de cache, ausência de escrita offline e o canal de notificação primário sem PII no payload | D15; D17; `08` §8.6; `10` §10.1 |
| ASR-14 | **Escala leitura-dominante** com cache em camadas (CDN + cache de aplicação) e limites de mapa | Molda a topologia (CDN, consolidações em background, clustering de marcadores) para milhares de casas por estado | `10` §10.2; `10` §10.5; A5 |
| ASR-15 | **Disponibilidade e continuidade**: backup diário, teste de restauração, RPO 24 h / RTO 48 h, DR documentado | Impõe requisitos de operação, redundância e procedimentos — inclusive replicáveis por um fork auto-hospedado | `10` §10.3 |
| ASR-16 | **API pública versionada** (`/v1/`) com rate limit e escrita autenticada | Fixa o contrato externo, a política de depreciação (≥ 12 meses) e a base do plugin WordPress e da federação | D11; `06` §6.3; ver `plans/build-api.md` |
