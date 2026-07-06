# 11. Registro de Decisões, Assunções e Pendências

Fonte de rastreabilidade da especificação. Três seções: **decisões** tomadas com o
responsável pelo produto (jul/2026), **assunções default** (valem até veto) e
**pendências** com dono. Ao final, o mapa de rastreabilidade das 24 perguntas de
`spec-cursor/02-perguntas-e-lacunas.md`.

## 11.1. Decisões

| # | Tema | Decisão | Onde está especificado |
| :--- | :--- | :--- | :--- |
| D1 | Entrega | `spec-final/` em PT-BR é a fonte de verdade; `spec.md` vira índice; pastas anteriores são histórico | `00` |
| D2 | Backlog | Backlog único, sem linha formal de MVP; itens com rótulo (fazer agora / avaliar bem / não fazer) + impacto + facilidade + PTMEB | `03` |
| D3 | Lançamento | Piloto MG/UEM sobre modelo de dados nacional desde o dia 1 | `01` §1.2 |
| D4 | Operador | UEM opera a plataforma; federativas aderem via acordo | `01` §1.2, `07` §7.1 |
| D5 | Verificação de casa | Julgamento do Revisor regional, sem documento obrigatório | `05` §5.1 |
| D6 | Disputa de posse | Revisor arbitra (contato + documentos simples); recurso à federativa; prazo-alvo 15 dias | `05` §5.5 |
| D7 | Menores | Contas a partir de 16 anos com consentimento verificável do responsável; < 16 sem conta | `07` §7.5 |
| D8 | Quero Ajudar | Visível só a coordenador da atividade + admin da casa; anonimização 6 meses após decisão; consentimento explícito | `07` §7.2, `04` §4.4 |
| D9 | Moderação | Pós-publicação (Reportar → Revisor); conteúdo é responsabilidade da casa; IA apenas sinaliza | `05` §5.4 |
| D10 | "Aberta agora" | Calculada de agendas + expediente + fechamento excepcional, com aviso; sem integração externa na base | `02`, `03` item 4.1 |
| D11 | API | Leitura anônima com rate limit; API keys para quotas/webhooks/plugin; escrita autenticada | `06` §6.3 |
| D12 | Runtime | PHP ≥ 8.3 e MySQL 8.x (corrige o pino anterior em PHP 8.0, em fim de vida); Docker Alpine | `10` §10.1 |
| D13 | URLs | URLs de casa/cidade planas; páginas de órgão só onde ativadas; 301 em mudanças | `06` §6.1 |
| D14 | KPIs | ~6 KPIs nomeados com metas provisórias, calibráveis após o piloto | `10` §10.6 |
| D15 | Offline | PWA somente leitura; números SOS sempre offline; sem escrita offline | `08` §8.6 |
| D16 | RBAC | Papéis granulares restaurados (órgão: presidente/área; federativa: área/presidência); Revisor com permissão explícita de status; órgãos gerenciam a própria página | `04` |
| D17 | Notificação de pessoas | Canal primário de notificação imediata é **Web Push via PWA** (VAPID, sem provedor pago; payload sem dado pessoal — o app busca o conteúdo ao receber o aviso); e-mail + painel garantidos; WhatsApp/SMS por federativa (A11); WebSocket (7.9) segue `avaliar bem` — só atualiza painéis abertos, não alcança pessoas | `03` item 7.10, `05` §5.1, `08` §8.6, `10` §10.1 |
| D18 | Webhooks diferidos | Webhooks notificam sistemas externos, que não são objetivo de curto prazo — item 7.3 rebaixado para `avaliar bem`; desenho preservado em `06` §6.4; plugin WordPress opera por consulta à API + cache TTL | `03` item 7.3, `06` §6.4 |
| D19 | Distribuição / forks | Projeto de **código aberto**; UEM opera a instância nacional de referência; federativas podem operar **fork próprio** (features/restrições próprias) sincronizando suas casas de volta ao modelo nacional (fork + federação de volta) | `01` §1.2, `06` §6.10, `GOVERNANCE.md` |
| D20 | Núcleo travado | Modelo de dados nacional + API de Federação + alinhamento doutrinário (V/M/V) são **imutáveis por forks**; um fork pode adicionar features, adicionar restrições mais estritas e re-tematizar; alterações ao núcleo só via upstream aprovado | `12-asr` ASR-01, `06` §6.10, `GOVERNANCE.md`, `VISION.md` |
| D21 | Governança do núcleo | O **Conselho de federativas** é dono do núcleo travado; mudança de núcleo exige RFC/ADR + aprovação do Conselho; forks contribuem por PR upstream; fora do núcleo, cada fork decide | `GOVERNANCE.md`, `05` §5.9, `09` §9.5 |
| D22 | Licença | **AGPL-3.0** para o repositório: não é possível proibir uso comercial numa licença open source OSI, mas a AGPL obriga qualquer serviço derivado a publicar o código-fonte — desencoraja a comercialização proprietária e mantém forks abertos, coerente com "federar de volta" (D19); resolve a P12 | `LICENSE` (texto oficial), `README.md` |

## 11.2. Assunções default (vetáveis)

| # | Assunção | Onde |
| :--- | :--- | :--- |
| A1 | Casa virtual = sem endereço físico público; cidade/localidade obrigatórias | `02` §2.1.1 |
| A2 | Filas de revisão visíveis à federativa, com remanejamento e substituição | `05` §5.1 |
| A3 | Prazo de resposta LGPD: 15 dias | `07` §7.6 |
| A4 | Doações somente como link externo; plataforma nunca processa pagamento | `03` (9.2, N.1) |
| A5 | Mapa com clustering e limite de marcadores por viewport | `10` §10.2 |
| A6 | MCP/busca IA só retorna dados cadastrados e públicos; nunca PII; sem inferência | `06` §6.7 |
| A7 | Arte IA: opt-in por casa, opt-out por federativa, sem pessoas reais, com crédito | `06` §6.8 |
| A8 | Casas em revisão expõem publicamente só nome + cidade + status | `02` §2.7 |
| A9 | Agregados demográficos com k-anonimato (k ≥ 5) | `07` §7.7 |
| A10 | Temas de casa: galeria curada com contraste WCAG **bloqueante** | `08` §8.4 |
| A11 | Notificações de revisor: e-mail + painel na base; WhatsApp/SMS por configuração da federativa | `05` §5.1 |
| A12 | Contato do admin no cadastro: nome + telefone obrigatórios; e-mail opcional | `02` §2.1.1 |
| A13 | Retenções: documentos de disputa (desfecho + 90 dias), logs de auditoria (5 anos), consentimentos (vínculo + 5 anos) | `07` §7.2 |
| A14 | Casa não exige comprovação formal de filiação federativa para aprovação — julgamento do Revisor (conhecimento local + contato direto) é suficiente; reconfirmado no checkpoint de alinhamento de jul/2026 | `05` §5.1, `01` §1.4 |
| A15 | Taxonomia de documentos adotada: PRD = `spec-final/`; ASR = `12-asr.md`; ADR = `arquitetura/adr/`; Épicos/Histórias = `03` + issues; rastreabilidade em `docs/taxonomia-documentos.md` | `docs/taxonomia-documentos.md`, `12-asr` |

## 11.3. Pendências (com dono)

| # | Pendência | Dono | Quando resolver |
| :--- | :--- | :--- | :--- |
| P1 | Modelo do acordo de adoção UEM ↔ federativas, incl. papel LGPD (controladora conjunta × operadora) | UEM / jurídico | antes da 2ª federativa aderir |
| P2 | Nomeação do Encarregado (DPO) e publicação da política de privacidade | UEM | antes do lançamento público |
| P3 | Provedor e custos de SMS/WhatsApp (verificação e notificações) | Operações | antes do lançamento |
| P4 | Provedor de geocodificação (custos, termos) | Dev/Ops | antes do piloto |
| P5 | Limites, custos e arquitetura do motor de busca semântica e do MCP — preencher `optional-features/feat-opensearch.md` e `feat-mcp.md` | Produto + Ops | na promoção dos itens 7.7/7.8 |
| P6 | Provedor e licença de uso da geração de arte por IA — preencher `optional-features/feat-integration-ai.md` | Produto | na promoção do item 8.1 |
| P7 | Meta absoluta de casas ativas no piloto MG | UEM | início do piloto |
| P8 | Revisão de privacidade do widget VLibras (script de terceiro) | Encarregado | antes do lançamento |
| P9 | Domínio, hospedagem e responsável de produção | Operadora | antes do piloto |
| P10 | Plano de migração/importação dos dados do app legado da UEM (WordPress + Participants Database) — casas já cadastradas em produção existem, mas não é prioridade agora | UEM / Dev-Ops | a decidir; não antes do piloto ser confirmado |
| P11 | Revisão da decisão de stack de frontend (renderização no servidor sem framework vs. SPA/React) à luz do protótipo funcional em `local/mvp-local/` — **bloqueia o início da Tarefa 1 de `plans/build-frontend.md`** | Produto + arquitetura | antes de iniciar `plans/build-frontend.md` |
| P12 | ~~Licença de código aberto do repositório~~ **Resolvida (jul/2026): AGPL-3.0 — ver D22.** Resta materializar o arquivo `LICENSE` com o texto oficial (download pendente por falta de rede no ambiente) | Dev-Ops | antes de abrir o repositório publicamente |
| P13 | Desenho detalhado da API de Federação (formato do payload, autenticação servidor-a-servidor, deduplicação, resolução de conflitos, cadência, antiabuso) — ver `06` §6.10 | Arquitetura + Conselho | antes do 1º fork em produção; não bloqueia o piloto MG (instância única) |
| P14 | Guia de setup/integração do operador de fork (bootstrap Docker/Alpine + configuração da sincronização) | Dev-Ops | com o item P13 |

## 11.4. Rastreabilidade — 24 perguntas de `spec-cursor/02`

| Q | Pergunta (resumo) | Resposta |
| :--- | :--- | :--- |
| 1 | Prova de vínculo obrigatória? | Não — D5; documentos só em disputa (`05` §5.5), retidos por prazo limitado (A13) |
| 2 | Critérios de casa virtual | A1 (`02` §2.1.1) |
| 3 | Conflito de reivindicação | D6 — fluxo formal com prazos (`05` §5.5) |
| 4 | Limites de fila / substituição de revisor | A2 (`05` §5.1); nomeação pela federativa (`04` §4.3) |
| 5 | Quero Ajudar: dados, visibilidade, retenção | D8 (`07` §7.2) |
| 6 | Menores | D7 (`07` §7.5) |
| 7 | Prazo de exportação/exclusão; arbitragem | A3; arbitragem do Encarregado (`07` §7.6) |
| 8 | Quem define anonimização de feedback | Encarregado + produto (`07` §7.6) |
| 9 | Moderação pré ou pós-publicação | D9 — pós (`05` §5.4) |
| 10 | Campanhas e doações | A4 — só links externos (`03` 9.2, N.1) |
| 11 | Blog: dono e responsabilidade | Backlog `avaliar bem` (9.1); conteúdo e responsabilidade da casa |
| 12 | URLs sem níveis intermediários | D13 (`06` §6.1) |
| 13 | Mudança de município/CRE | Fluxo `05` §5.6 — revalidação na nova jurisdição + 301 |
| 14 | Fonte da verdade de "aberta agora" | D10 |
| 15 | Limites do mapa | A5 (`10` §10.2) |
| 16 | MCP: alucinação em contexto sensível | A6 (`06` §6.7) |
| 17 | Arte IA: licença, crédito, opt-out | A7 (`06` §6.8); licença/provedor = P6 |
| 18 | Autenticação da API pública / CORS / quotas | D11 (`06` §6.3) |
| 19 | Temas: contraste garantido ou recomendado | A10 — bloqueante (`08` §8.4) |
| 20 | VLibras: hospedagem e privacidade | Script gov.br; revisão = P8 (`08` §8.2) |
| 21 | Transparência das casas em revisão | A8 (`02` §2.7) |
| 22 | Censo: agregação mínima | A9 — k ≥ 5 (`07` §7.7) |
| 23 | Lista fechada de MVP | D2 — backlog único rotulado substitui a linha de MVP (`03`) |
| 24 | Indicadores de sucesso | D14 (`10` §10.6) |
