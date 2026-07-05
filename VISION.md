# Visão, Missão e Valores

> **Carta normativa do projeto.** Este documento é a instância de revisão quando as
> decisões ficam nebulosas: em caso de dúvida ou conflito entre requisitos, features
> ou propostas, prevalece o que estiver aqui. A `spec-final/` (o PRD) e todos os forks
> subordinam-se a esta carta. Alterá-la exige o processo de governança
> (ver [GOVERNANCE.md](GOVERNANCE.md)). Idioma: português brasileiro.

## Visão

Uma plataforma nacional que unifica, organiza e torna descobríveis as Casas Espíritas
do Brasil e suas atividades — respeitando a autonomia de cada Casa e as estruturas
regionais do Movimento Espírita — para que quem precisa de ajuda, conhecimento ou um
lugar para servir encontre o caminho com dignidade e rapidez.

## Missão

Servir ao Movimento Espírita Brasileiro com tecnologia segura, acessível e
respeitosa, colocando a difusão da Doutrina Espírita e o atendimento a quem mais
precisa acima de qualquer conveniência técnica ou comercial.

## Valores

Os valores estão em ordem de prioridade: quando dois entrarem em conflito, o que
aparece primeiro prevalece.

1. **Alinhamento doutrinário.** O produto serve à Doutrina Espírita (Codificação de
   Allan Kardec e diretrizes FEB/PTMEB). Nada no sistema deve contrariar, distorcer
   ou banalizar seus princípios. É o primeiro filtro de qualquer decisão.
2. **Serviço a quem mais precisa.** Priorizamos primeiro o público em fragilidade
   (atendimento fraterno, rota SOS), depois voluntários, coordenadores, dirigentes e
   órgãos — nessa ordem (ver `spec-final/01-visao-e-contexto.md` §1.5).
3. **Unificação com respeito à autonomia.** Buscamos a unificação nacional dos dados,
   mas respeitamos a decisão de cada Casa, órgão e federativa **além do núcleo comum**.
   Unir não é uniformizar nem comandar (autoridade moral, não hierárquica).
4. **Colaboração sem quebrar o todo.** A colaboração é obrigatória e bem-vinda, mas
   nunca pode desviar da especificação nem quebrar o sistema: há um núcleo
   compartilhado protegido e liberdade fora dele (ver [GOVERNANCE.md](GOVERNANCE.md)).
5. **Privacidade e proteção de dados.** O vínculo religioso é dado sensível (LGPD
   art. 5º, II). Privacidade por padrão, minimização e transparência não são opcionais
   (ver `spec-final/07-lgpd-privacidade.md`).
6. **Acessibilidade e inclusão.** WCAG, VLibras, cadastro por telefone, temas de alto
   contraste. Ninguém fica de fora por limitação técnica, sensorial ou econômica.
7. **Seguro antes de rápido.** Não trocamos práticas seguras — ainda que mais lentas —
   por velocidade. Recusamos atalhos que cultivem vulnerabilidades sutis.

## Como usar esta carta

- **Critério de novos recursos:** antes de aprovar um item de backlog, aplique os
  valores acima e os critérios de `spec-final/01-visao-e-contexto.md` §1.8.
- **Desempate:** quando uma discussão de produto, arquitetura ou fork não tiver
  resposta óbvia, releia esta carta antes de decidir; registre a decisão em
  `spec-final/11-decisoes.md`.
- **Forks:** um fork pode ir além desta carta (adicionar features ou restrições mais
  estritas), mas não pode contrariá-la — o alinhamento doutrinário e o núcleo comum
  são invariáveis (ver [GOVERNANCE.md](GOVERNANCE.md), decisão D20).

## Referências

- [GOVERNANCE.md](GOVERNANCE.md) — governança, núcleo travado e regras de fork.
- [CONTRIBUTING.md](CONTRIBUTING.md) — como contribuir sem quebrar o sistema.
- [`spec-final/`](spec-final/00-leia-me.md) — o PRD (requisitos de produto).
- [`docs/taxonomia-documentos.md`](docs/taxonomia-documentos.md) — mapa dos documentos.
