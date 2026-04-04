# Galeria: 10 temas adicionais de inspiração (aspectos e telas)

**Contexto:** A pasta `galeria-temas` reúne protótipos HTML (Bootstrap, foco em acessibilidade, múltiplas seções, carrosséis, tickers, etc.) e um `prompt-gerador-temas.md` com critérios duros (WCAG, responsivo, claro/escuro).

Os **10 temas** abaixo não substituem os HTML existentes: são **conceitos narrativos** para inspirar **variações de layout e de jornada**, sempre alinhados ao produto (casas, atividades, regiões, público geral). Cada item sugere **telas ou blocos** que uma galeria poderia mostrar lado a lado.

---

## Tema 1 — “Marquee estadual + cartão da casa”

**Ideia visual:** faixa superior contínua (ticker) com próximas **palestras** e tema; abaixo, grade de **cards** de casas com foto, bairro, distância e selo “verificada”.

**Telas / aspectos:** home nacional ou estadual; destaque para **descoberta rápida** sem mapa.

**Inspiração em `galeria-temas`:** uso de ticker + cards (como em exemplos `galeria-melhores`).

---

## Tema 2 — “Mapa primeiro, lista depois”

**Ideia visual:** mapa em tela cheia (mobile: metade mapa, metade lista com gesto de arrastar); filtros em **chips** (atividade, horário, “aberto agora”).

**Telas / aspectos:** busca geográfica; transição suave lista ↔ pin.

**Nota de produto:** reforça Epic 4 (descoberta) e requisitos de performance em viewport.

---

## Tema 3 — “Ficha da casa — modo institucional”

**Ideia visual:** hierarquia tipográfica sóbria; blocos para **missão**, **expediente**, **redes sociais** em linha; área “Próximas reuniões públicas” em destaque.

**Telas / aspectos:** página pública da casa focada em **confiança** e clareza (menos “marketing”).

---

## Tema 4 — “Ficha da casa — modo jornada do visitante”

**Ideia visual:** passos numerados: “Como chegar” → “O que acontece esta semana” → “Quero ajudar”; CTAs grandes e contraste alto.

**Telas / aspectos:** onboarding do **visitante** leigo; acessibilidade prioritária.

---

## Tema 5 — “Painel do revisor — fila e SLA”

**Ideia visual:** tabela com **novas adesões**, tempo na fila, município, macro/micro; cores só para estado (não só decorativo); detalhe lateral com checklist de validação.

**Telas / aspectos:** espaço **revisor**; transparência operacional (sem expor dados sensíveis).

---

## Tema 6 — “Cockpit do admin da casa — atividades em grade”

**Ideia visual:** visão semanal/mensal dos **tipos** de atividade por cor de área funcional (APSE, AEE, etc.); arrastar-soltar opcional apenas se não quebrar acessibilidade (alternativa: formulário estruturado).

**Telas / aspectos:** gestão densa sem perder legibilidade; modo **impressão** ou export ICS.

---

## Tema 7 — “Evento em destaque — cartaz + compartilhar”

**Ideia visual:** hero com imagem (ou placeholder IA), bloco **Adicionar ao calendário**, botões de compartilhamento com rótulos acessíveis; JSON-LD comentado na documentação da galeria (não só no app).

**Telas / aspectos:** página de **evento**; SEO social (Open Graph) como preocupação visual (preview card).

---

## Tema 8 — “Rota de apoio emocional (SOS)”

**Ideia visual:** fluxo calmo, poucos elementos; pergunta única por tela; resultado com **CVV / FEB Escuta** e, se houver, casa com atendimento fraterno **agora**.

**Telas / aspectos:** jornada sensível; evitar gatilhos visuais (animações agressivas desligadas por padrão).

---

## Tema 9 — “Página da macro/micro-região — vitrine regional”

**Ideia visual:** cabeçalho com nome regional configurável (ex.: CR vs. CRE); mapa ou lista de **casas vinculadas**; bloco editorial opcional (notícias/campanhas).

**Telas / aspectos:** Epic 5; consistência quando o **nome do órgão** varia por estado.

---

## Tema 10 — “Biblioteca de guias — só intranet”

**Ideia visual:** área logada com **filtro por tipo** (jurídico, doutrinário, operacional); cards com ícone e “visível só para admins”; busca por texto.

**Telas / aspectos:** material de apoio vinculado a **atividades**; reforça separação **público vs. gestão**.

---

## Como usar estes 10 na galeria

| Sugestão | Descrição |
|----------|-----------|
| **Um HTML por tema** | Nome sugerido: `spec-cursor-tema-01-marquee.html` … `10-guias-intranet.html` (futuro; fora do escopo desta pasta se forem assets binários). |
| **Checklist compartilhado** | Reutilizar critérios de `galeria-temas/prompt-gerador-temas.md`: Bootstrap 5, HTML5, contraste, responsivo, teclado, modo claro/escuro. |
| **Rotulagem** | Cada protótipo pode trazer no `<title>` o nome do tema e “protótipo – não é produção”. |

Estes temas complementam os estilos já explorados em `temas/grok-1/`, `testes-chatgpt/`, `testes-gemini/` e `galeria-melhores/`, puxando o foco para **jornadas completas** (revisor, SOS, regional, intranet) e não só landing genérica.
