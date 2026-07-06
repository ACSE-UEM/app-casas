# Especificação UX — Jornadas do Público Geral (Mapa A)

> **Escopo:** áreas públicas de descoberta e acolhimento da plataforma nacional de Casas
> Espíritas. Cobre **todas** as jornadas do público geral (audiência nº 1 da visão do produto).
> As jornadas de gestão (casas, revisores, regionais — Mapa B) serão mapeadas em especificação
> própria, na sequência.
>
> **Natureza do documento:** especificação de UX — sem código. Serve de base para protótipos e,
> depois, para o plano de implementação.

---

## 1. Fundamento

A primeira audiência do produto é a **sociedade**: pessoas que sofrem, buscam, têm curiosidade
ou querem servir. A doutrina do movimento aponta o gesto inicial: **acolher antes de
classificar**. O site deve se comportar como um bom trabalhador de recepção — recebe a pessoa,
não a consulta.

As quatro necessidades originais levantadas — mapa de casas próximas, busca por texto/voz,
atendimento espiritual e orientação — estão todas contempladas e rastreadas na seção 8.

### 1.1. Princípios transversais (valem para todas as telas)

| Princípio | Exigência |
|---|---|
| **Mobile-first** | Ações primárias na zona do polegar; alvos de toque grandes (mín. 44×44px) |
| **WCAG 2.1 AA** | Contraste, navegação completa por teclado, foco visível, landmarks semânticos, rótulos em botões de ícone, texto alternativo |
| **Movimento reduzido** | Padrão no fluxo sensível de ajuda; nenhuma animação agressiva em lugar algum |
| **Resiliência** | Conteúdo utilizável antes de o mapa carregar; degradação graciosa sem geolocalização, sem conexão e sem JavaScript pesado |
| **Voz** | Entrada por voz (ditado) na caixa de busca — ganho de acessibilidade para pessoas idosas ou com baixa alfabetização |
| **Confiança** | Selo ✓ verificada vs. status pendente exibidos com honestidade (Feat 1.4) |
| **Honestidade do “agora”** | Nunca mostrar apenas uma porta fechada: toda resposta traz algo para *este momento* + o próximo horário presencial honesto |
| **Chegada profunda** | Toda página de casa/palestra/evento é autoexplicativa para quem chega por link compartilhado, sem ter visto a home |

---

## 2. Composição da home (porta de entrada)

Organizada por **intenção humana**, não por mecanismo de busca.

```text
┌──────────────────────────────────┐
│ [logo]  Nunca visitou? O que é → │
│                                  │
│    Como podemos te acolher?      │
│  🕊️ Preciso de ajuda             │
│  🔎 Conhecer uma casa            │
│  📖 Quero estudar                │
│  🤝 Quero ajudar                 │
│                                  │
│  [ 🔎 buscar por nome/cidade 🎙️ ]│
│ ─────────────────────────────────│
│ ◀ palestras & eventos (marquee) ▶│
└──────────────────────────────────┘
```

- **4 raias de intenção** + busca rápida sempre disponível.
- **Marquee de palestras/eventos** (Tema 1) abaixo das raias — visível sem ser raia.
- Link discreto e permanente **“Nunca visitou? Entenda o que é”** no topo.
- O marquee respeita `prefers-reduced-motion` (pausa e vira lista estática).

---

## 3. Inventário completo de jornadas (Mapa A)

| # | Jornada | Estado emocional típico | Porta |
|---|---|---|---|
| J1 | Sofrimento emocional — conversar | Dor, ansiedade, solidão | 🕊️ Ajuda |
| J2 | Receber um passe / pedir prece por alguém | Aflição, esperança | 🕊️ Ajuda |
| J3 | Luto — perdi alguém querido | Luto, saudade, perguntas | 🕊️ Ajuda |
| J4 | Necessidade material — alimento, roupa, abrigo | Urgência prática, possível vergonha | 🕊️ Ajuda |
| J5 | Crise — falar agora | Crise aguda, risco | 🕊️ Ajuda (fixado no topo) |
| J6 | Conhecer / visitar uma casa | Curiosidade, cautela | 🔎 Conhecer |
| J7 | Estudar (ESDE/EADE, evangelização, mocidade) | Busca de sentido; famílias com crianças | 📖 Estudar |
| J8 | Ajudar — tempo, bens ou dinheiro | Generosidade, pertencimento | 🤝 Ajudar |
| J9 | Palestras & eventos | Interesse pontual | Marquee + chips |
| J10 | “O que é espiritismo?” | Ceticismo curioso | Link “O que é” |
| J11 | Chegada por link compartilhado (WhatsApp) | Contexto zero | Qualquer página profunda |
| J12 | Reportar dado incorreto | Zelo, frustração leve | Rodapé da página da casa |
| J13 | Busca direta por nome/cidade (texto ou voz) | Objetividade | Caixa de busca global |

*Nenhuma jornada do público fica fora deste inventário; a verificação de completude está na seção 8.*

---

## 4. Tela de acolhimento — “Preciso de ajuda” (J1–J5)

### 4.1. Decisão de estrutura

**Uma porta, caminhos calorosos dentro.** A pessoa não precisa se rotular na rua: entra por uma
única raia acolhedora e nomeia sua necessidade em privacidade, um toque adiante.

```text
┌─────────────────────────────┐
│ ☎ Em crise? Ligue 188 (CVV) │  ← fixado, sempre visível
│                             │
│  Você não está sozinho(a).  │
│  Respire. Estamos aqui.     │
│ ─────────────────────────── │
│  🗣️ Conversar com alguém    │
│  🕊️ Receber um passe        │
│  🤍 Perdi alguém querido    │
│  🍞 Alimento, roupa, abrigo │
│  🌙 Falar agora (online 24h)│
└─────────────────────────────┘
```

- **Sem triagem interrogativa, sem mapa, sem filtros.** Uma tela calma.
- Visual sóbrio (Tema 8): poucos elementos, sem gatilhos visuais, movimento reduzido por padrão.
- A linha de apoio (188 / FEB Escuta) permanece fixada em **todas** as subtelas deste fluxo.

### 4.2. J1 — Conversar com alguém (atendimento fraterno)

- **Persona/estado:** pessoa em dor emocional que precisa ser ouvida; pode estar exausta.
- **Fluxo:** toque → lista curta de casas próximas com atendimento fraterno, ordenada por
  “disponível mais cedo”; cada item com dia/hora honestos e “como chegar”.
- **Honestidade do agora:** se nada aberto, oferecer em pé de igualdade: 🌙 falar agora online
  (24h) + o próximo horário presencial + uma leitura/prece curta de consolo opcional.
- **Copy:** tom de quem recebe na porta. Nunca “resultados encontrados: 3”. Sim: *“Há pessoas
  prontas para te ouvir. A mais próxima atende quinta, 19h.”*
- **Borda:** sem geolocalização → pedir cidade com gentileza; sem resultado na cidade →
  ampliar raio + 24h online sempre presente.
- **Sucesso:** ninguém sai da tela sem pelo menos uma opção *para agora*.

### 4.3. J2 — Receber um passe / pedir prece por alguém

- **Persona/estado:** aflição própria **ou por um ente querido** (filho doente, familiar
  internado) — pedido clássico de prece/vibração, atendível inclusive a distância.
- **Fluxo:** toque → duas opções lado a lado: *“Para mim”* (casas próximas com passe/irradiação
  + horários) e *“Por alguém que amo”* (formulário mínimo de pedido de prece — apenas primeiro
  nome, opcional — enviado às casas que mantêm irradiação; confirmação acolhedora).
- **Privacidade:** o pedido de prece não exige cadastro; dados mínimos, LGPD por padrão.
- **Copy:** *“O passe é gratuito e aberto a todos. Não é preciso ser espírita.”*
- **Sucesso:** o pedido por terceiro completa em ≤ 1 minuto, sem cadastro.

### 4.4. J3 — Perdi alguém querido (luto)

- **Persona/estado:** enlutado(a); a consolação sobre a vida após a morte é o encontro mais
  profundo que o espiritismo oferece. Copy própria, ainda mais suave.
- **Fluxo:** toque → tela dedicada com três blocos: (1) palavra breve de consolo (sem jargão
  doutrinário pesado); (2) grupos de apoio ao luto e atendimento fraterno próximos; (3)
  palestras/estudos sobre a imortalidade da alma (agenda + gravações, quando houver).
- **Borda:** cidade sem grupo de luto → atendimento fraterno como caminho + conteúdo de consolo.
- **Sucesso:** a pessoa encontra *alguém* (grupo ou atendimento) e *algo* (conteúdo) — nunca só
  um “não há resultados”.

### 4.5. J4 — Alimento, roupa, abrigo (APSE)

- **Persona/estado:** necessidade material urgente; possível constrangimento. Dignidade acima
  de tudo — tom **prático**, nunca clínico, nunca vitrine de caridade.
- **Fluxo:** toque → lista direta: o que há perto (cesta básica, sopa fraterna, bazar, banho,
  campanha do agasalho), com **quando** e **onde**, sem pré-requisitos exibidos como barreira.
- **Copy:** frases curtas e concretas: *“Sopa fraterna: terças, 18h, Rua X. Pode chegar.”*
  Proibido: linguagem de pena ou de marketing social.
- **Borda:** nada na cidade → apontar a casa mais próxima que orienta + serviços públicos
  (CRAS) como complemento honesto.
- **Sucesso:** em ≤ 2 toques a pessoa sabe onde comer/vestir-se e quando.

### 4.6. J5 — Falar agora (online, 24h)

- **Persona/estado:** crise aguda, madrugada, risco.
- **Fluxo:** toque → contatos imediatos com ação de um toque: **ligar 188**, chat CVV,
  FEB Escuta — botões grandes, telefone discável direto (`tel:`).
- **Este caminho também é o destino do banner fixado** presente em todo o fluxo de ajuda.
- **Sucesso:** do home à ligação em ≤ 3 toques. (Feat 4.3 — roteamento SOS.)

---

## 5. Descoberta — “Conhecer uma casa” (J6, J13) e raias reutilizadas (J7, J8)

### 5.1. Superfície principal: lista primeiro, mapa a um toque (J6)

```text
┌──────────────────────────────┐
│ [🔎 buscar / 🎙️]   [🗺️ mapa] │
│ [perto][aberto agora][passe] │
│ ┌──────────────────────────┐ │
│ │ Casa X · Centro · 1,2km ✓│ │
│ │ Reunião pública: qui 20h │ │
│ ├──────────────────────────┤ │
│ │ Casa Y · Jd Sul · 3km  ✓ │ │
│ │ Passe: ter e qui 19h30   │ │
│ └──────────────────────────┘ │
└──────────────────────────────┘
```

- **Cards ranqueados** carregam primeiro (proximidade · ✓ verificada · próxima reunião pública
  / horários de passe). Funcionam sem geolocalização, em conexão fraca e com leitor de tela.
- **Mapa é um alternador de primeira classe** (comportamento do Tema 2), não o herói padrão.
- **Chips de filtro:** `perto` · `aberto agora` · tipo de atividade (passe, evangelização,
  ESDE…) — mapeados à taxonomia de áreas funcionais (APSE, AAE, AEE, AIJ…).
- **Busca por texto ou voz (J13):** o 🎙️ dita para a caixa de busca comum (v1, sem IA).
  Busca semântica por linguagem natural (Feat 4.4 / MCP) entra depois, **na mesma caixa**,
  como aprimoramento progressivo.
- **Bordas:** sem geolocalização → pedir cidade; sem resultados → ampliar raio + sugerir casas
  virtuais; offline → última lista em cache com aviso claro.
- **Sucesso:** primeira lista visível < 2s em 3G; toda casa alcançável sem mapa e sem mouse.

### 5.2. J7 — Quero estudar (reuso com filtro)

Mesma superfície da 5.1, **pré-filtrada** para atividades de estudo (ESDE, EADE, estudo de
obras, princípios básicos) e **infância/juventude** (evangelização infantil, mocidade).

- **Copy reenquadrada:** *“Encontre um grupo para estudar e compreender.”*
- **Nuance de audiência:** chamada explícita para **famílias com crianças** — chip
  `evangelização infantil` em destaque.
- **Sucesso:** pai/mãe encontra evangelização infantil no bairro em ≤ 3 toques.

### 5.3. J8 — Quero ajudar: tempo, bens ou dinheiro (reuso com filtro + 3 portas)

Tempo, bens e dinheiro são três formas do mesmo impulso — **uma raia, três portas internas**:

1. **Doar meu tempo** → superfície 5.1 filtrada por atividades com selo “aceita voluntários”
   (Feat 3.2); copy: *“onde suas mãos fazem falta”*. Candidatura direta na atividade.
2. **Doar bens** → campanhas ativas próximas (agasalho, cesta, bazar) com o que doar e onde
   entregar.
3. **Contribuir financeiramente** → repasse ao canal oficial **da casa escolhida** (nunca
   intermediação central), com transparência sobre quem recebe.

- **Sucesso:** do impulso à ação concreta (candidatura, endereço de entrega ou canal de doação)
  em ≤ 3 toques.

---

## 6. Páginas de destino

### 6.1. Página da casa — acolhida primeiro, confiança logo abaixo (J6, J11)

Ordem dos blocos (Tema 3 + Tema 4 combinados):

1. **“É sua primeira vez?”** — *gratuito · aberto a todos · não é preciso se converter · pode
   só assistir* — responde os medos não ditos do recém-chegado.
2. **Como chegar** · **Contato/WhatsApp** · **O que acontece esta semana** (agenda, próxima
   reunião pública, horários de passe, exportar ICS).
3. **CTA “Quero ajudar”** (quando a casa aceita voluntários).
4. **Bloco institucional:** sobre / missão / expediente / diretoria / redes / ✓ verificada.
5. **Rodapé:** utilidade discreta **“Encontrou um dado incorreto? Avise-nos.”** (J12, Feat 6.1)
   — formulário mínimo, sem cadastro, com agradecimento.

**Pronta para chegada profunda (J11):** cabeçalho com caminho de volta à home, bloco “primeira
vez?” sempre presente, metadados Open Graph corretos (preview digno no WhatsApp).

### 6.2. Página de palestra/evento (J9)

- Cartaz (ou arte gerada, Feat 3.5) · tema e expositor · data/hora · casa anfitriã (link) ·
  **Adicionar ao calendário (ICS)** · inscrição quando houver · botões de compartilhar com
  rótulos acessíveis (Tema 7).
- **Pronta para chegada profunda (J11):** mesmos requisitos da 6.1.
- **Descoberta:** alimenta o marquee da home e os chips `palestras` / `eventos` da superfície 5.1.

### 6.3. Página “O que é espiritismo?” (J10)

- Tom calmo e informativo, sem proselitismo. FAQ direto aos medos práticos:
  *É gratuito? Preciso acreditar em algo? Como é uma reunião? Posso só assistir? Preciso me
  vestir de algum jeito? Vão me cobrar algo?*
- Encerramento suave: *“Quando quiser, uma casa perto de você”* → superfície 5.1.
- Acessível pelo link permanente da home e referenciada nos blocos “primeira vez?”.

---

## 7. Estados de borda globais

| Estado | Comportamento exigido |
|---|---|
| Sem geolocalização | Pedir cidade gentilmente; nunca bloquear o fluxo |
| Sem resultados | Ampliar raio; oferecer casas virtuais/online; no fluxo de ajuda, 24h sempre |
| Nada aberto agora | Próximo horário honesto + alternativa para o momento (24h, conteúdo) |
| Offline | Cache da última lista/página com aviso; telefone 188 sempre exibível |
| Conexão lenta | Conteúdo textual antes de mapa/imagens; mapa nunca bloqueia a lista |
| Casa não verificada | Exibir status com honestidade, sem estigmatizar (Feat 1.4) |

---

## 8. Verificação de completude

**Rastreamento das quatro necessidades originais:**

| Necessidade original | Jornada(s) |
|---|---|
| Encontrar CE próximas no mapa | J6 (alternador de mapa na superfície 5.1) |
| Buscar CE por texto/voz | J13 (+ J6) |
| CE com atendimento espiritual (passe) | J2 (+ chip `passe` em J6) |
| CE que dá orientação | J1 (atendimento fraterno) |

**Rastreamento do backlog:** Epic 4 completo (4.1 filtros → 5.1; 4.2 mapa → 5.1; 4.3 SOS →
seção 4; 4.4 linguagem natural → 5.1 como aprimoramento progressivo); Feat 3.2 → 5.3;
Feat 3.4 → 6.2 + marquee; Feat 6.1 → 6.1 rodapé.

**Checklist de aceitação da especificação:**

- [ ] Toda jornada J1–J13 tem fluxo, copy, bordas e critério de sucesso definidos
- [ ] Nenhuma tela nova além do conjunto da seção “Telas” (reuso antes de criação)
- [ ] Todos os fluxos completáveis por teclado e leitor de tela
- [ ] Fluxo de ajuda auditado com `prefers-reduced-motion` e em 3G

---

## 9. Conjunto de telas (resumo)

1. **Home** — 4 raias + busca/voz + marquee + link “o que é”
2. **Preciso de ajuda** — tela calma, 5 caminhos, linha de apoio fixada
3. **Descoberta** — lista/cards + mapa alternável + chips (reutilizada por Estudar e Ajudar)
4. **Página da casa** — acolhida primeiro, confiança abaixo
5. **Página de palestra/evento** — cartaz, calendário, compartilhar
6. **“O que é espiritismo?”** — FAQ calmo

---

## 10. Próximo passo — Mapa B (especificação seguinte)

Jornadas de gestão, a mapear em documento próprio:

- Adesão de nova casa (Epic 1: cadastro por telefone, salvaguardas de não verificadas)
- Fila do revisor regional / SLA (Feats 1.3–1.4, Tema 5)
- Intranet do coordenador e do administrador (Epics 2–3: CRUD de atividades, temas, guias)
- Acompanhamento da candidatura de voluntário (continuação da J8/Feat 3.2)
- Espaço regional/federativo (Epic 5: vitrine, censo, solicitações)
- Votação de funcionalidades (Feat 6.2)
