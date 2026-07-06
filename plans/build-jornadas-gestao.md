# Especificação UX — Jornadas de Gestão (Mapa B)

> **Escopo:** jornadas autenticadas de quem *mantém as portas abertas* — administradores de
> casa, coordenadores, tarefeiros, revisores e representantes regionais/federativas.
> Complementa o Mapa A (`build-jornadas-publico.md`), que cobre o público geral.
>
> **Natureza do documento:** especificação de UX — sem código. Base para protótipos e, depois,
> para o plano de implementação.

---

## 1. Fundamento

Quem gerencia uma casa espírita é **voluntário, não profissional**. Muitas vezes é uma pessoa
de mais idade, com pouca intimidade técnica, que cuida do bazar, visita doentes *e* recebeu a
incumbência do site. Cada tela confusa rouba tempo da caridade real.

Por isso o espaço de gestão não pode parecer um painel administrativo: deve parecer **um
companheiro na tarefa de cuidar da casa**. O sistema carrega a carga mental; o voluntário
carrega a casa.

### 1.1. Princípios transversais (valem para todas as telas de gestão)

| Princípio | Exigência |
|---|---|
| **Login obrigatório** | Toda tela de gestão exige autenticação; conteúdo delimitado por papel (RBAC) |
| **Estrutura constante** | Os 3 níveis de atenção (seção 2) valem para todos os papéis — um único modelo mental |
| **Mobile-first** | Gestão completa pelo celular; ações primárias na zona do polegar |
| **WCAG 2.1 AA** | Mesmo rigor do lado público: teclado, foco, contraste, rótulos, leitores de tela |
| **Privacidade por padrão** | PII de voluntários visível apenas ao coordenador da atividade; campos pessoais do admin nunca públicos |
| **Menor privilégio** | Tarefeiro nasce como leitura; elevação de papel é ato explícito do admin |
| **Trilha de auditoria** | Toda ação Gerenciar (criar/alterar/excluir) gera log imutável (quem, quando, o quê) — invisível no fluxo, jamais um atrito |
| **Nunca bloquear o trabalho** | Revisão pendente, campos incompletos ou perfil parcial jamais impedem o voluntário de continuar preenchendo |
| **Copy de serviço** | Tom de quem serve à casa, não de quem opera software: “A casa está bem cuidada?”, não “Dashboard” |

---

## 2. Arquitetura de atenção — os 3 níveis

Toda tela inicial de gestão, para qualquer papel, organiza-se em **três níveis de atenção**:

```text
┌──────────────────────────────────┐
│ Olá, Maria! 🏠 Casa Esperança    │
│                                  │
│ 🔴 Precisa de você agora         │
│   · 1 candidatura aguardando     │
│   · dado reportado pelo público  │
│                                  │
│ 🔵 O trabalho de sempre          │
│   Agenda · Palestras · Eventos   │
│   · Atividades                   │
│                                  │
│ ⚙️ Raramente                     │
│   Tema · Dados da casa · Pessoas │
│   · Privacidade (LGPD)           │
└──────────────────────────────────┘
```

1. **🔴 Precisa de você agora** — poucos itens, cada um com ação de um toque. Vazio é o estado
   ideal e deve ser celebrado: *“Tudo em dia. A casa agradece.”*
2. **🔵 O trabalho de sempre** — os verbos frequentes do papel.
3. **⚙️ Raramente** — a cauda longa de configurações, recolhida mas alcançável.

### 2.1. Os 3 níveis instanciados por papel

| Papel | 🔴 Urgente | 🔵 Frequente | ⚙️ Raro |
|---|---|---|---|
| **Admin de Casa** | candidatura parada, dado reportado, solicitação LGPD, “pedir informação” do revisor | agenda, palestras, eventos, atividades | tema, dados institucionais, pessoas/papéis, módulos on/off |
| **Coordenador** | candidaturas da sua atividade | suas atividades/eventos/palestras | contatos, docs de apoio |
| **Tarefeiro** | avisos da casa | agenda interna, materiais | preferências |
| **Revisor** | fila de adesões (com SLA) | casas da jurisdição | preferências de notificação |
| **Regional (CRE/Municipal/Macro)** | solicitações das casas | vitrine regional, casas vinculadas | contatos/redes do órgão |
| **Federativa** | solicitações escaladas | visão estadual, palestras estaduais | ativar regiões, features, nomes dos órgãos |

---

## 3. Inventário completo de jornadas (Mapa B)

| # | Jornada | Quem | Grupo |
|---|---|---|---|
| B1 | Cadastrar nova casa (semente mínima) | Futuro admin | Adesão |
| B2 | Reivindicar casa existente / conflito | Representante legítimo | Adesão |
| B3 | Validar nova casa (fila do revisor) | Revisor | Adesão |
| B4 | Wizard pós-adesão (completar a casa) | Admin | Adesão |
| B5 | Gerir pessoas e papéis | Admin | Vida da casa |
| B6 | Criar e cuidar de atividades | Coordenador/Admin | Vida da casa |
| B7 | Criar evento (+ arte IA) | Coordenador/Admin | Vida da casa |
| B8 | Registrar palestras | Coordenador/Admin | Vida da casa |
| B9 | Receber candidaturas de voluntários | Coordenador | Vida da casa |
| B10 | Usar a intranet como tarefeiro | Tarefeiro | Vida da casa |
| B11 | Consultar guias administrativos | Admin | Vida da casa |
| B12 | Enviar solicitação ao órgão regional | Admin | Vida da casa |
| B13 | Gerir espaço regional (vitrine) | Regional | Região |
| B14 | Ativar/configurar regiões e features | Federativa | Região |
| B15 | Diagnóstico regional (censo, IA) | Municipal+ | Região |
| B16 | Tratar dado reportado + solicitações LGPD | Admin | Governança |
| B17 | Sugerir e votar features | Admin | Governança |
| B18 | Notificações multi-canal | Todos | Transversal |

---

## 4. Adesão & confiança (B1–B4)

### 4.1. B1 — Cadastrar nova casa: a semente mínima

- **Persona/estado:** voluntário(a) decidido(a) mas apreensivo(a) com tecnologia; talvez no
  celular, talvez com ajuda de um neto.
- **Fluxo:** uma tela, **4 campos**: nome da casa · cidade · seu nome · seu telefone.
  Verificação por código SMS/WhatsApp (OTP). Nada de e-mail obrigatório, nada de
  física/virtual, nada de documentos neste momento.
- **Ao enviar:** localidade associa automaticamente macro/micro/município (webhook, Feat 1.2);
  revisor da jurisdição é notificado (B18); a pessoa entra direto no espaço da casa com status
  visível **“em análise”** — e o wizard (B4) a convida a continuar.
- **Copy:** *“Cadastre sua casa em 5 minutos. Só o essencial — o resto vem depois, no seu ritmo.”*
- **Bordas:** telefone já cadastrado → oferecer recuperação de acesso; cidade ambígua →
  seletor com estado; sem SMS → tentar WhatsApp e vice-versa.
- **Sucesso:** cadastro completo em ≤ 5 minutos, em qualquer celular, sem e-mail.

### 4.2. B2 — Reivindicar casa existente / conflito de reivindicação

- **Persona/estado:** diretor(a) que encontra sua casa já cadastrada (por terceiro ou
  migração de dados) — surpresa, possivelmente indignação.
- **Fluxo:** na página pública da casa, ação **“Sou responsável por esta casa”** → mesma
  semente mínima (nome, telefone OTP) + campo “seu vínculo com a casa” → vira **ticket de
  reivindicação** na fila do revisor, que verifica pessoa-a-pessoa.
- **Conflito** (duas reivindicações simultâneas): ambas ficam “em verificação”; o revisor
  contata as partes; a casa nunca exibe dado de contato conflitante nesse ínterim. Prazo
  máximo de resolução exposto às partes (lacuna Q3 — decisão pendente sobre prazo exato).
- **Sucesso:** representante legítimo assume o perfil sem criar duplicata; conflito nunca
  se resolve “no automático”.

### 4.3. B3 — Fila do revisor (Tema 5)

- **Persona/estado:** voluntário institucional com pouco tempo, zeloso pela reputação do
  movimento na sua região.
- **Estrutura:** o nível 🔴 do revisor é a **fila**: tabela com novas adesões — tempo na fila
  (SLA visível, cor por estado, nunca só decorativa), município, macro/micro. Painel lateral:
  **checklist de validação** + tudo que a casa já preencheu até ali.
- **Três ações, sempre pessoais:**
  1. **Aprovar** → casa torna-se pública (o interruptor de visibilidade — seção 4.4).
  2. **Pedir informação** → abre contato (telefone/WhatsApp registrados); status vira
     “aguardando casa”; a casa vê o pedido no seu nível 🔴.
  3. **Recusar com motivo** → auditável, motivo obrigatório, casa notificada com caminho de
     recurso (falar com o órgão regional).
- **Bordas:** revisor de férias/inativo → fila escapa para o nível acima após N dias (lacuna
  Q4 — N a decidir); fila vazia → *“Nenhuma casa aguardando. Sua região está em dia.”*
- **Sucesso:** nenhuma casa espera sem resposta além do SLA; toda recusa tem motivo e recurso.

### 4.4. B4 — Wizard pós-adesão: completar a casa no seu ritmo

- **Princípio central:** **a aprovação gateia apenas a visibilidade pública** — jamais o
  trabalho. A casa preenche tudo desde o primeiro minuto, com status “em análise” à vista.
- **Fluxo:** assistente por etapas, retomável, nunca obrigatório de uma vez:
  1. Endereço (→ geocoding automático em segundo plano)
  2. **“Marque tudo que a casa faz”** — grade de tarefas comuns (taxonomia FEB) → para cada
     marcada, só o essencial: quando? onde? (DB3 / B6)
  3. Reuniões públicas (caso especial de destaque — dados direto no perfil)
  4. Contato público, redes sociais, expediente
  5. Física/virtual e demais detalhes institucionais
- **Progresso visível e acolhedor:** *“Sua casa está 60% apresentada”* — nunca culpabilizante.
  Etapas pendentes viram lembretes gentis no nível 🔵/⚙️, não bloqueios.
- **Sucesso:** casa aprovada aparece ao público já digna; casa incompleta continua operável.

---

## 5. Vida da casa — a intranet (B5–B12)

### 5.1. B5 — Pessoas e papéis

- **Persona/estado:** admin delegando com cautela — confiança é pessoal numa casa espírita.
- **Fluxo:** convidar por telefone (mesma semente: nome + telefone OTP) → escolher papel
  (tarefeiro · coordenador de [atividade/departamento]) → convite via WhatsApp/SMS.
  Tarefeiro nasce leitura; coordenador é sempre **escopado** ao seu departamento.
- **Copy:** papéis descritos por serviço, não por permissão: *“Coordena a evangelização”*,
  não “role: coordinator”.
- **Bordas:** remoção de pessoa → o que acontece com atividades órfãs (reatribuir antes de
  concluir); último admin não pode se remover.
- **Sucesso:** delegar uma atividade leva ≤ 2 minutos; nenhuma PII exposta além do necessário.

### 5.2. B6 — Criar e cuidar de atividades

- **Persona/estado:** coordenador que só quer dizer *“temos ESDE às terças, 20h”*.
- **Criação — tarefas comuns na frente (decisão do usuário):**
  1. **“O que a casa faz?”** — grade de tarefas da taxonomia FEB (Passe, ESDE, Evangelização
     Infantil, Sopa Fraterna, Reunião Mediúnica…) + “outra” (sinalizada como personalizada,
     nota de conformidade FEB).
  2. Escolher pré-preenche tipo, área funcional, público típico e nome sugerido.
  3. Essenciais apenas: **quando? onde? quem coordena? pública ou interna?** → criada e
     publicável.
- **Profundidade depois, por atividade:** docs de apoio (12 categorias), voluntariado,
  contatos públicos, agenda avançada/ICS — tudo na página de edição da atividade, preenchível
  **quando quiser**. O nível 🔵 sugere com gentileza: *“O ESDE pode aceitar voluntários —
  ativar?”* Nunca bloqueia.
- **Bordas:** conflito de horário/sala → aviso não-bloqueante; atividade sem coordenador
  ativo → lembrete ao admin.
- **Sucesso:** da intenção à atividade publicada em ≤ 2 minutos; nenhum campo avançado é
  exigido para publicar.

### 5.3. B7 — Criar evento

- **Fluxo:** extensão da atividade com **início e fim** + URL de inscrição + promoção
  (página da casa / site principal / pin especial no mapa) + compartilhamento social.
- **Arte IA (Feat 3.5):** oferecida **ao final**, com dados já preenchidos: *“Quer que a
  gente sugira um cartaz?”* — opcional, nunca no meio do fluxo; imagem sempre revisável pela
  casa antes de publicar (lacuna Q17: licença/opt-out por federativa registrada como pendência).
- **Sucesso:** evento criado e compartilhável (link digno para WhatsApp, Mapa A/J11) em uma
  sessão curta.

### 5.4. B8 — Registrar palestras

- **Persona/estado:** a tarefa mais recorrente de divulgação — precisa ser a **mais rápida**
  de todas.
- **Fluxo:** do nível 🔵, *“Divulgar palestra”*: tema · expositor · data/hora · online?
  (link) → pronto. Aparece automaticamente na página da casa, no marquee estadual e na página
  regional (Feat 3.4).
- **Bordas:** palestra sem tema definido → publicável como “a confirmar”, lembrete no 🔴
  próximo à data (exemplo canônico do nível urgente).
- **Sucesso:** registrar uma palestra leva ≤ 60 segundos.

### 5.5. B9 — Receber candidaturas de voluntários

- **Persona/estado:** do outro lado está alguém que estendeu a mão (Mapa A, J8) — cada
  candidatura parada é um voluntário esfriando.
- **Fluxo:** candidatura chega ao **🔴 do coordenador da atividade** (e só dele — PII
  escopada, LGPD; lacuna Q5 refinada: admin vê contagens, não dados pessoais, salvo se também
  coordenar). Ações: **conversar** (WhatsApp/telefone) · **acolher como tarefeiro** (vira B5)
  · **agradecer e arquivar** (resposta gentil obrigatória).
- **Consentimento:** registrado na candidatura (checklist LGPD); dados expiram após N meses
  sem resposta (prazo a definir — pendência registrada).
- **Sucesso:** nenhuma candidatura sem resposta > 7 dias (lembrete escala no 🔴); o
  candidato sempre recebe *alguma* devolutiva humana.

### 5.6. B10 — A intranet do tarefeiro

- **Persona/estado:** voluntário ativo que quer saber *“o que tenho esta semana e o que
  preciso levar”*.
- **Estrutura (3 níveis):** 🔴 avisos da casa · 🔵 sua agenda interna (atividades em que
  serve, exportável ICS) + materiais de apoio das suas atividades · ⚙️ preferências.
- **Somente leitura por padrão** (menor privilégio); pedir elevação = conversa com o admin,
  não botão de autosserviço.
- **Sucesso:** tarefeiro encontra sua agenda da semana em ≤ 2 toques após login.

### 5.7. B11 — Guias administrativos por atividade

- **Fluxo:** área ⚙️/🔵 do admin: guias (jurídico, doutrinário, gerencial, operacional,
  financeiro) **renderizados dinamicamente conforme as atividades da casa** — casa com
  evangelização infantil vê guias de menores; casa com bazar vê guias fiscais. Filtro por
  tipo + busca textual (Tema 10). Visível só para gestão.
- **Sucesso:** o guia certo aparece sem que o admin saiba que precisava dele.

### 5.8. B12 — Solicitações ao órgão regional

- **Persona/estado:** casa pequena que precisa de apoio (jurídico, doutrinário, material) e
  não sabe a quem recorrer.
- **Fluxo:** *“Pedir apoio ao órgão regional”* — formulário curto (tema, descrição) →
  **delegação automática** ao órgão correto da hierarquia (municipal → micro → macro →
  federativa) → aparece no 🔴 do órgão (B13). Casa acompanha status (recebida · em
  atendimento · respondida).
- **Sucesso:** a casa nunca precisa conhecer a hierarquia para ser ouvida por ela.

---

## 6. Região & federativa (B13–B15)

### 6.1. B13 — Espaço regional (vitrine + cuidado)

- **Persona/estado:** representante regional que serve dezenas de casas com horas escassas.
- **Estrutura (3 níveis):** 🔴 solicitações das casas (B12) e adesões escaladas · 🔵 vitrine
  regional (página pública: contatos, redes, notícias/campanhas — Tema 9) + lista/mapa das
  casas vinculadas com sinais de saúde (perfil incompleto, sem atividade há N meses) · ⚙️
  dados do órgão.
- **Nomes variáveis por estado** (CR vs CRE vs AME): o rótulo do órgão é configurável pela
  federativa (B14) e usado consistentemente em URLs/breadcrumbs.
- **Sucesso:** o regional enxerga em um relance quais casas precisam de visita.

### 6.2. B14 — Federativa: ativar regiões e features

- **Fluxo (⚙️ da federativa):** ativar macro-regiões → associar micro-regiões → associar
  municípios (herança automática: ativar macro ativa suas micros); nomear os órgãos conforme
  a cultura local; ativar/configurar features estaduais a partir das features do app.
- **Estados sem níveis intermediários** (ex.: DF): pular níveis é um estado de primeira
  classe, não uma exceção — URLs e breadcrumbs encurtam com naturalidade (lacuna Q12).
- **Segregação (RBAC):** federativa **vê** casas, mas **não edita** dados de casa — apenas
  features federativas. A UI nunca oferece o que o papel não pode.
- **Sucesso:** montar a hierarquia de um estado é tarefa de uma tarde, não de um projeto.

### 6.3. B15 — Diagnóstico regional (censo, demografia, IA)

- **Fluxo:** usuários municipais+ acessam visão agregada: casas, atividades por área
  funcional, cobertura territorial, dados demográficos (IBGE) — com **k-anonimato** para
  nunca reidentificar casas/pessoas em recortes pequenos (lacuna Q22). Prompts de IA sugerem
  projetos regionais a partir do diagnóstico (recurso assistivo, decisão sempre humana).
- **Sucesso:** um plano regional nasce de dados, não de impressão — sem expor ninguém.

---

## 7. Governança & conformidade (B16–B18)

### 7.1. B16 — Dado reportado pelo público + solicitações LGPD

- **Fluxo (dado reportado, vindo do Mapa A/J12):** chega ao 🔴 do admin da casa: *“Uma
  pessoa avisou que o horário do passe mudou. Confere?”* — ações: corrigir (um toque abre o
  campo) · marcar como correto · pedir mais detalhe. Reporter anônimo recebe (se deixou
  contato) um agradecimento.
- **Solicitações LGPD:** exclusão, correção e exportação (JSON estruturado) de dados —
  para pessoas e para casas — com prazo visível e trilha auditável. Recusa da casa em apagar
  dado institucional → arbitragem pelo órgão regional (lacuna Q7).
- **Sucesso:** todo reporte tem desfecho registrado; toda solicitação LGPD tem prazo e dono.

### 7.2. B17 — Sugerir e votar features

- **Fluxo (⚙️ do admin):** espaço simples de ideias — sugerir (título + parágrafo), votar
  nas existentes, ver status (avaliando · planejada · entregue). Critérios de decisão do
  produto (serve à doutrina? PTMEB? seguro? simplifica?) exibidos com transparência.
- **Sucesso:** a casa sente que a plataforma é construída *com* ela.

### 7.3. B18 — Notificações multi-canal (transversal)

- **Princípio:** a notificação vai **até onde a pessoa está** — WhatsApp, SMS, e-mail,
  push/websocket — conforme preferência individual (⚙️ de cada papel).
- **Eventos mínimos:** nova adesão → revisor · candidatura → coordenador · dado reportado /
  pedido do revisor / solicitação LGPD → admin · resposta de solicitação → casa · convite de
  papel → convidado.
- **Regra de ouro:** tudo que notifica aparece também no 🔴 do papel — canal externo é
  aviso, o espaço é a fonte da verdade. Frequência agrupada (digest) configurável para não
  virar ruído.

---

## 8. Estados de borda globais (gestão)

| Estado | Comportamento exigido |
|---|---|
| Casa “em análise” | Banner permanente e digno; trabalho jamais bloqueado; invisível ao público e a buscadores |
| Revisor ausente | Escalada automática ao nível acima após N dias (N a decidir) |
| Papel sem permissão | A ação não aparece (nunca botão desabilitado sem explicação) |
| Conexão fraca | Formulários salvam rascunho local; wizard retomável de onde parou |
| Sessão expirada no meio de um formulário | Reautenticar por OTP sem perder o que foi digitado |
| Item urgente ignorado | Escala com gentileza (🔴 + notificação), nunca com culpa |
| Fila/lista vazia | Estado celebrado: *“Tudo em dia. A casa agradece.”* |

---

## 9. Rastreabilidade

| Fonte | Cobertura |
|---|---|
| Epic 1 (Adesão) | B1 (1.1), B18 (1.3), B3/4.4 (1.4), webhooks (1.2 — B1) |
| Epic 2 (Gestão da casa) | B4 (2.1), tema em B4/⚙️ (2.2), B11 (2.3), toggles ⚙️ (2.4) |
| Epic 3 (Atividades) | B6 (3.1), B9+B6 (3.2), B7 (3.3, 3.5), B8 (3.4) |
| Epic 5 (Regional) | B13 (5.1), B15 (5.2), B12+B13 (5.3) |
| Epic 6 (Governança) | B16 (6.1), B17 (6.2) |
| Matriz RBAC | Seção 2.1 (conteúdo por papel); segregação federativa em B14; escopo do coordenador em B6/B9 |
| Checklist LGPD | B16 (exclusão/correção/exportação), B9 (consentimento), B15 (anonimização) |

**Pendências herdadas de `spec-cursor/02-perguntas-e-lacunas.md` com impacto UX** (a decidir
em RFC própria, com dono e prazo): prazo máximo de conflito de reivindicação (Q3) · limite de
fila e substituição de revisor (Q4) · retenção de dados de candidatura (Q5) · menores e
responsáveis (Q6) · arbitragem de exclusão institucional (Q7) · licença/opt-out da arte IA
(Q17) · contraste mínimo imposto em temas de casa (Q19).

---

## 10. Conjunto de telas (resumo)

1. **Cadastro semente** — 4 campos + OTP
2. **Espaço da casa (3 níveis)** — home de admin/coordenador/tarefeiro (conteúdo por papel)
3. **Wizard pós-adesão** — retomável, com progresso acolhedor
4. **Criar/editar atividade** — grade de tarefas comuns → essenciais → profundidade depois
5. **Criar evento / palestra** — fluxos curtos; arte IA opcional ao final
6. **Fila do revisor** — tabela + painel de validação + 3 ações
7. **Espaço regional/federativa (3 níveis)** — vitrine, casas vinculadas, solicitações, ativação de regiões
8. **Governança** — reportes, LGPD, votação de features (dentro dos níveis ⚙️/🔴)

---

## 11. Próximos passos

1. **Revisão deste documento** pelo usuário.
2. Protótipos HTML acessíveis das telas-chave (worktree `ui-mockups` — galeria existente como base).
3. RFCs curtas para as pendências da seção 9.
4. Plano de implementação (Mapa A + Mapa B) sobre a stack definida (PHP 8 / WordPress / MySQL).
