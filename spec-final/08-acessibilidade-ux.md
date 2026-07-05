# 8. Acessibilidade e Experiência do Usuário

A plataforma serve todas as demografias — incluindo pessoas idosas, com deficiência e
com baixa instrução digital. Acessibilidade é requisito de aceitação, não recurso
opcional (PTMEB diretriz 11).

## 8.1. Padrão WCAG

- **Mínimo obrigatório: WCAG 2.1 nível AA** em todas as páginas públicas e de gestão;
  nível AAA buscado onde viável (contraste de temas, linguagem).
- HTML5 **semântico** estrito (landmarks, headings hierárquicos, labels), compatível
  com leitores de tela; ARIA somente onde o HTML nativo não basta.
- Navegação completa por teclado; foco visível; alvos de toque adequados.
- Testes automatizados de acessibilidade no pipeline + verificação manual periódica
  com leitores de tela.

## 8.2. Recursos assistivos

| Recurso | Especificação |
| :--- | :--- |
| **VLibras** | Widget oficial gov.br para tradução em Libras em todas as páginas públicas; hospedagem do script e implicações de privacidade documentadas na política (pendência de revisão em `11`) |
| **Alto contraste** | Toggle de modo de alto contraste persistente |
| **Deficiência visual** | Suporte a zoom 200% sem quebra; textos alternativos obrigatórios em imagens/logos |
| **Deficiência motora** | Operação integral por teclado; sem ações dependentes de gesto fino |
| **Acessibilidade cognitiva** | Linguagem simples (público leigo, ver `01` §1.5); frases curtas; ajuda contextual nos formulários; tipografia amigável a dislexia; fluxos curtos e previsíveis (TDAH) |
| **Deficiência auditiva** | Legendas em vídeos institucionais; alternativas textuais |

## 8.3. Vocabulário e conteúdo

- Vocabulário **inclusivo** (evitar termos que presumem gênero) e não propagandista —
  tom de serviço, não de marketing.
- Siglas espíritas usadas com naturalidade; siglas técnicas evitadas ou explicadas.
- Textos de ajuda explicitam a **visibilidade pública** de cada campo no cadastro
  (herança direta do aprendizado do app MG).

## 8.4. Temas das casas

- As casas escolhem o tema numa **galeria curada** (referência de exploração:
  `galeria-temas/`).
- O sistema **garante contraste mínimo** — combinações fora do WCAG AA são
  bloqueadas, não apenas desaconselhadas (decisão em `11`).
- Todos os temas: responsivos, com modo de alto contraste e compatíveis com os
  recursos assistivos de §8.2.
- Elementos de tema: informações fixas, grid/flex, widgets de destaque, banner,
  sliders, tickers, parallax — sempre degradáveis (sem JS ⇒ conteúdo íntegro).

## 8.5. Design system

Referência visual: `docs/design/DESIGN.md` ("Ethereal Professional" / Santuário
Digital) — direção de arte, tipografia (Manrope + Public Sans), paleta e componentes.
Regras do design system subordinam-se às regras de acessibilidade deste documento
(ex.: contraste AA obrigatório sobrepõe preferências estéticas).

## 8.6. PWA e uso offline

- Aplicação instalável (PWA) com cache **somente leitura** de páginas públicas:
  perfis de casas, agendas, contatos de atendimento fraterno.
- **Números SOS (CVV 188, FEB Escuta, SOS Prece) sempre disponíveis offline.**
- Sem escrita offline (decisão em `11`); ações de gestão exigem conexão.
- Indicador claro de conteúdo possivelmente desatualizado quando offline.
- **Notificações push (Web Push)** para papéis de gestão — canal primário de
  notificação imediata de pessoas (D17; item 7.10 do backlog). Opt-in contextual
  (nunca pedir permissão no carregamento da página); o payload nunca carrega dado
  pessoal — o dispositivo busca o conteúdo no servidor ao receber o aviso.

## 8.7. Desempenho como acessibilidade

Grande parte do público acessa por celulares modestos em redes lentas. Orçamentos de
desempenho (metas provisórias em `10`): páginas públicas leves, CSS puro preferível,
JavaScript progressivo, imagens otimizadas, mapa com clustering e carregamento
preguiçoso.
