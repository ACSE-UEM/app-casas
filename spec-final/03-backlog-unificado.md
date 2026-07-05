# 3. Backlog Unificado

Backlog **único**, sem linha formal de MVP (decisão registrada em
[11-decisoes.md](11-decisoes.md)). Cada item recebe:

- **Rótulo:** `fazer agora` / `avaliar bem` / `não fazer`;
- **Impacto:** Alto / Médio / Baixo;
- **Facilidade:** Fácil / Mediana / Difícil;
- **PTMEB:** diretriz(es) do plano de trabalho que o item atende (nº — ver `01` §1.7).

A priorização de execução parte dos itens `fazer agora` de maior impacto, aplicando os
critérios de decisão de `01` §1.8. Itens `avaliar bem` exigem análise
(custo/risco/LGPD) antes de promoção. Itens `não fazer` são anti-requisitos: registram
o que a plataforma **não** fará.

## Épico 1 — Adesão e Onboarding

**Meta:** reduzir a fricção de entrada de novas Casas mantendo integridade e segurança.

| ID | História | Rótulo | Impacto | Facilidade | PTMEB |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1.1 | Como dirigente, cadastro minha casa **usando só telefone** (e-mail opcional), para incluir quem tem pouca habilidade técnica | fazer agora | Alto | Mediana | 04 |
| 1.2 | Como sistema, ao registrar uma casa, disparo **associação automática** de localidade → município (IBGE) → órgãos regionais, e geocodificação do endereço | fazer agora | Alto | Mediana | 06 |
| 1.3 | Como revisor regional, sou **notificado imediatamente** de novas adesões na minha jurisdição (Web Push via PWA + e-mail + painel; WhatsApp/SMS configurável por federativa — D17) | fazer agora | Alto | Mediana | 06 |
| 1.4 | Como plataforma, **isolo casas não verificadas**: sem SEO/sitemap, fora do mapa, exposição limitada a nome+cidade+status, rate limits anti-spam | fazer agora | Alto | Mediana | — |
| 1.5 | Como usuário, **verifico meu telefone** por código SMS/WhatsApp ao criar conta | fazer agora | Médio | Mediana | — |

## Épico 2 — Gestão da Casa (espaço institucional)

**Meta:** dar à casa uma "intranet" e uma vitrine pública completas.

| ID | História | Rótulo | Impacto | Facilidade | PTMEB |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 2.1 | Como admin, gerencio dados básicos, contato público, endereço, redes sociais e expediente | fazer agora | Alto | Fácil | 04 |
| 2.2 | Como admin, vejo **guias de apoio administrativo** (jurídico, doutrinário, gerencial) renderizados conforme as atividades da minha casa (visíveis só para mim) | fazer agora | Médio | Mediana | 04 |
| 2.3 | Como admin, **ligo/desligo módulos** (eventos, palestras, voluntariado) da minha casa | fazer agora | Médio | Fácil | — |
| 2.4 | Como admin, gerencio departamentos e assets (documentos, logos) | fazer agora | Médio | Fácil | — |
| 2.5 | Como admin, informo **fechamento excepcional** (afeta "aberta agora") | fazer agora | Alto | Fácil | — |
| 2.6 | Como admin, escolho o **tema visual** da casa numa galeria curada com contraste WCAG garantido | avaliar bem | Médio | Mediana | 11 |
| 2.7 | Como admin, gero **QR code** de divulgação da página da casa | avaliar bem | Baixo | Fácil | 01 |

## Épico 3 — Atividades, Eventos e Palestras

**Meta:** mapear o trabalho da casa e torná-lo descobrível.

| ID | História | Rótulo | Impacto | Facilidade | PTMEB |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 3.1 | Como coordenador, crio perfis profundos de atividades (slug, agenda, formato, responsáveis, áreas, material de apoio) | fazer agora | Alto | Difícil | 03 |
| 3.2 | Como coordenador, sinalizo "**aceita voluntários**"; candidaturas chegam com consentimento explícito, visíveis só a mim e ao admin, anonimizadas 6 meses após decisão; sou notificado imediatamente | fazer agora | Alto | Mediana | 07, 09 |
| 3.3 | Como coordenador, crio **eventos** com início/fim, URL de inscrição e compartilhamento social | fazer agora | Alto | Mediana | 01 |
| 3.4 | Como coordenador, registro **palestras** que aparecem automaticamente no marquee estadual/regional e na página da casa | fazer agora | Alto | Mediana | 01 |
| 3.5 | Como coordenador, exporto agendas (ICS e formatos por público) | fazer agora | Médio | Mediana | — |
| 3.6 | Como admin, aponto **fontes externas de agenda** (csv/calendar/feed) para palestras e eventos | avaliar bem | Médio | Difícil | 01 |

## Épico 4 — Busca e Descoberta (público)

**Meta:** permitir que o público encontre ajuda, palestras e casas com facilidade.

| ID | História | Rótulo | Impacto | Facilidade | PTMEB |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 4.1 | Como visitante, busco casas por tarefa, proximidade, localidade, órgão regional, atendimento fraterno e "**aberta agora**" (calculada de agendas + expediente + fechamento excepcional, com aviso "confirme por telefone") | fazer agora | Alto | Difícil | 01, 09 |
| 4.2 | Como visitante, vejo "o que acontece agora/aqui" em **mapa interativo** com clustering e limites por viewport | fazer agora | Alto | Difícil | 01 |
| 4.3 | Como pessoa em dificuldade, encontro **atendimento fraterno** próximo e aberto; sem opção local, sou roteado a serviços 24h (CVV 188, FEB Escuta, SOS Prece) — números disponíveis **offline** | fazer agora | Alto | Mediana | 09 |
| 4.4 | Como visitante, vejo atividades divulgadas em formatos variados (carrossel na home) | avaliar bem | Médio | Mediana | 01 |
| 4.5 | Como visitante, faço perguntas em **linguagem natural** ("onde tem evangelização infantil perto de mim no sábado?") via MCP | avaliar bem | Médio | Difícil | 01 |

## Épico 5 — Espaços Federativos e Regionais

**Meta:** servir os órgãos de unificação nas suas jurisdições.

| ID | História | Rótulo | Impacto | Facilidade | PTMEB |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 5.1 | Como federativa, **ativo níveis regionais** (macro/micro/municipal), cadastro órgãos com nomes locais e associo abrangências (micros→macros, cidades→micros, casas→municipais) | fazer agora | Alto | Mediana | 06 |
| 5.2 | Como representante regional, tenho **página própria do órgão** (contatos, redes, áreas, casas da jurisdição) que eu mesmo gerencio | fazer agora | Alto | Mediana | 06 |
| 5.3 | Como representante regional, vejo **dashboards** (casas adesas/pendentes/total, evolução temporal, mapa, % de casas por área funcional) | fazer agora | Alto | Mediana | 06 |
| 5.4 | Como representante regional, vejo o widget de **Solicitações** das casas da minha região, com delegação automática | fazer agora | Médio | Mediana | 06 |
| 5.5 | Como representante regional, extraio **dados demográficos** (censo) agregados com k-anonimato para planejar projetos | avaliar bem | Médio | Difícil | 05 |
| 5.6 | Como representante regional, uso **diagnóstico assistido por IA** da minha região (prompts sobre dados agregados) | avaliar bem | Médio | Difícil | 05 |

## Épico 6 — Governança, Conformidade e Feedback

**Meta:** manter a base precisa, auditável e conforme à LGPD.

| ID | História | Rótulo | Impacto | Facilidade | PTMEB |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 6.1 | Como visitante, **reporto erro** em um perfil (denúncia roteada ao revisor regional) | fazer agora | Alto | Fácil | — |
| 6.2 | Como plataforma, executo **recertificação anual**: lembretes automáticos ("a casa ainda está ativa?"), selo de desatualização após 12 meses sem confirmação | fazer agora | Alto | Mediana | 04 |
| 6.3 | Como titular, solicito **exclusão, correção e exportação** (JSON) dos meus dados; como representante legítimo, **reivindico** um perfil criado por terceiros | fazer agora | Alto | Mediana | — |
| 6.4 | Como plataforma, gero **auditoria imutável** de toda ação de gestão | fazer agora | Alto | Mediana | — |
| 6.5 | Como visitante, vejo a **fila de revisão** com transparência (nome + cidade + status) | fazer agora | Médio | Fácil | — |
| 6.6 | Como admin de casa, **sugiro e voto** em próximas funcionalidades | avaliar bem | Baixo | Mediana | 06 |

## Épico 7 — Plataforma, API e Integrações

**Meta:** app autocontido cujos dados públicos servem a consumidores externos.
Detalhes técnicos em [06-integracoes-api-seo.md](06-integracoes-api-seo.md).

| ID | História | Rótulo | Impacto | Facilidade | PTMEB |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 7.1 | API pública **OpenAPI**: leitura anônima de dados públicos com rate limit; API keys para quotas maiores; escrita só autenticada | fazer agora | Alto | Difícil | — |
| 7.2 | **Plugin WordPress** que consome a API e exibe recursos (listas, mapas, agendas) em sites de federativas/casas | fazer agora | Alto | Difícil | 01 |
| 7.3 | **Webhooks** de eventos do sistema para *sistemas externos* (casa registrada, casa aprovada, evento criado…) — notificação de *pessoas* é o item 7.10 | avaliar bem | Baixo | Mediana | — |
| 7.4 | **JSON-LD** (Casa=NGO, Evento/Palestra=Event), OpenGraph, breadcrumbs, sitemap dinâmico (só casas ativas), robots | fazer agora | Alto | Mediana | 01 |
| 7.5 | **PWA offline** somente leitura (páginas públicas, números SOS) | fazer agora | Médio | Mediana | 11 |
| 7.6 | Descritor **OpenSearch** (busca pela barra de endereços do navegador) | avaliar bem | Baixo | Fácil | 01 |
| 7.7 | Motor de **busca semântica** (OpenSearch/vetorial) | avaliar bem | Médio | Difícil | 01 |
| 7.8 | Servidor **MCP** expondo ferramentas de busca a agentes de IA (sem PII, sem inferência) | avaliar bem | Médio | Difícil | 01 |
| 7.9 | Atualização em tempo real (WebSocket) de painéis **abertos** — complemento do 7.10, não substituto | avaliar bem | Baixo | Difícil | — |
| 7.10 | **Notificações push** (Web Push via PWA) para papéis de gestão: adesões, candidaturas, denúncias e solicitações chegam ao celular mesmo com o app fechado; e-mail + painel garantidos como fallback (D17) | fazer agora | Alto | Mediana | 06 |

*Nota 1:* "OpenSearch" designa duas coisas distintas nas fontes: o **descritor** de
busca do navegador (7.6, trivial) e o **motor de busca** homônimo (7.7, projeto
grande). O backlog os separa deliberadamente.

*Nota 2:* notificação também se desdobra em dois itens deliberadamente: webhooks
(7.3) avisam **máquinas**; Web Push (7.10) avisa **pessoas**. O objetivo do produto é
o segundo (D17/D18); o payload do push nunca carrega dado pessoal (ver `07`).

## Épico 8 — Recursos de IA

| ID | História | Rótulo | Impacto | Facilidade | PTMEB |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 8.1 | Como coordenador, gero **arte de divulgação por IA** com os dados do evento (opt-in, sem pessoas reais, opt-out por federativa) | avaliar bem | Médio | Mediana | 01 |
| 8.2 | Como plataforma, uso IA para **detectar anomalias/spam** em cadastros (descrições fora da taxonomia, padrões de bot) | avaliar bem | Médio | Difícil | — |
| 8.3 | Como admin, recebo **dicas de IA** contextuais ao final de cadastros | avaliar bem | Baixo | Fácil | — |

## Épico 9 — Conteúdo e Engajamento

Itens vindos da lista "fora do escopo do MVP" da especificação original — mantidos no
backlog com rótulo explícito.

| ID | História | Rótulo | Impacto | Facilidade | PTMEB |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 9.1 | Blog/artigos (atividades, aprofundamento, inspiração) | avaliar bem | Médio | Difícil | 01 |
| 9.2 | Doações: casa exibe **link externo** de doação | avaliar bem | Médio | Fácil | — |
| 9.3 | Recomendação de casa por terceiros (equipe regional contata e auxilia a adesão) | avaliar bem | Médio | Fácil | 06 |
| 9.4 | MediaKit em PDF por casa (relatório com artigos, QR codes, contatos de AME/CRE) | avaliar bem | Baixo | Difícil | 01 |
| 9.5 | Newsletter periódica | avaliar bem | Baixo | Mediana | 01 |
| 9.6 | Espaço de estudo/guias/tutoriais relacionados às casas | avaliar bem | Médio | Mediana | 07 |

## Anti-requisitos (rótulo: não fazer)

| ID | Item | Justificativa |
| :--- | :--- | :--- |
| N.1 | **Processar pagamentos/doações** na plataforma | Risco legal/financeiro desproporcional; doações são sempre links externos (9.2) |
| N.2 | **Armazenar dados de pessoas atendidas** pelo atendimento fraterno (conteúdo de atendimentos, quem buscou ajuda) | Dado sensível de pessoa vulnerável; a plataforma roteia, não registra |
| N.3 | **Contas de menores de 16 anos** | LGPD; ver `07` (16–17 com consentimento do responsável) |
| N.4 | **Moderação pré-publicação universal** | Insustentável para revisores voluntários; modelo é pós-publicação com denúncia (ver `05`) |
| N.5 | **Alterar dados de casas por usuários federativos** | Segregação de funções (ver `04`); órgãos veem, não editam |
