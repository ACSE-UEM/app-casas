# 10. Requisitos Não Funcionais e Operação

Metas marcadas **(provisório)** devem ser calibradas com dados do piloto MG.

## 10.1. Stack tecnológica

| Item | Especificação |
| :--- | :--- |
| Backend | PHP **≥ 8.3** (versão com suporte de segurança ativo; decisão em `11`) |
| Banco de dados | MySQL 8.x |
| Frontend | HTML5 semântico; CSS puro preferencial; JavaScript progressivo |
| Identidade | OIDC / OAuth2 (IAM conforme `04`) |
| Integração | WordPress via plugin consumidor da API (`06` §6.5) |
| Notificações | **Web Push (VAPID)** via service worker do PWA — canal primário para pessoas (D17); e-mail sempre como fallback; payload sem dado pessoal |
| Tempo real | WebSocket para atualização de painéis abertos (item 7.9, `avaliar bem`) |
| Empacotamento | Docker Compose para desenvolvimento; imagens preferencialmente Alpine |
| API | OpenAPI publicada; versionamento `/v1/` |
| Distribuição | Código aberto e forkável; instância nacional de referência operada pela UEM; forks auto-hospedáveis via Docker Compose com setup documentado (D19; ASR-03 em `12-asr`) |

## 10.2. Escala e desempenho

Dimensionamento de referência: milhares de casas por estado e dezenas de milhares no
país; tráfego dominado por leitura pública.

| Métrica | Meta (provisório) |
| :--- | :--- |
| Resposta de páginas públicas (p95) | ≤ 2 s em 4G modesto |
| Resposta da API pública (p95) | ≤ 500 ms |
| Mapa | clustering server-side/client-side; máx. ~200 marcadores por viewport; lazy loading |
| Peso de página pública | ≤ 500 KB transferidos na primeira visita (sem mapa) |
| Busca | resultados em ≤ 1 s para filtros padrão |

Cache em camadas: CDN (ex.: Cloudflare) para páginas públicas e assets; cache de
aplicação para consolidações (contagens, sumários) recalculadas em background.

## 10.3. Disponibilidade e continuidade

| Item | Meta (provisório) |
| :--- | :--- |
| Disponibilidade do site público | 99,5 % mensal |
| Backup | diário, automatizado, com retenção de 30 dias |
| Teste de restauração | trimestral, documentado |
| RPO (perda máxima de dados) | 24 h |
| RTO (tempo máximo de recuperação) | 48 h |
| Plano de recuperação de desastres | documentado e revisado anualmente |

## 10.4. Segurança operacional

- WAF e proteção DDoS na borda (CDN).
- TLS obrigatório; criptografia em repouso para dados pessoais.
- Segredos fora do código; princípio de menor privilégio também na infraestrutura.
- Atualizações de dependências monitoradas (especialmente ecossistema WordPress).
- Logs centralizados; alertas para: fila de revisão acima do SLA, picos de cadastro
  (suspeita de bot), falhas de webhook, erros 5xx.

## 10.5. Tarefas de background

Fila de trabalhos assíncronos: geocodificação; vínculos território↔órgãos;
consolidações (filtros, contagens, sumários); lembretes de recertificação;
anonimização programada de candidaturas (6 meses); entrega de notificações push
(com e-mail de fallback quando a inscrição push expira); entrega de webhooks com
retentativa (quando o item 7.3 for promovido — D18); geração de sitemap.

## 10.6. KPIs (metas provisórias — calibrar após o piloto MG)

| KPI | Definição | Meta inicial |
| :--- | :--- | :--- |
| Tempo médio de revisão | da submissão à decisão do Revisor | ≤ 15 dias |
| Recertificação em dia | % de casas ativas confirmadas nos últimos 12 meses | ≥ 80 % |
| Casas ativas no piloto | casas verificadas publicadas em MG | crescimento mensal positivo; meta absoluta definida com a UEM (pendência em `11`) |
| Busca útil | % de buscas públicas com ao menos 1 resultado clicado | ≥ 60 % |
| Voluntariado | candidaturas "Quero Ajudar" por mês | tendência crescente após 6 meses |
| Qualidade de dados | % de denúncias de dados resolvidas em ≤ 30 dias | ≥ 90 % |

Instrumentação com respeito à privacidade: métricas agregadas, sem rastreamento
individual desnecessário; feedback anonimizado antes do armazenamento (`07` §7.6).

## 10.7. Ambientes

- **Desenvolvimento:** Docker Compose local; ferramentas de IA rodando no host ou em
  container.
- **Homologação:** réplica reduzida com dados sintéticos (nunca dados pessoais reais).
- **Produção:** definida pela operadora; requisitos mínimos = §10.3 e §10.4.
- **Fork de federativa:** implantável de forma independente (mesma stack, Docker
  Compose/Alpine), sincronizando ao núcleo nacional pela API de Federação (`06` §6.10);
  o guia de setup do operador de fork é a pendência P14. Requisitos mínimos de operação
  também = §10.3 e §10.4.
