# Como contribuir

> Conteúdo em português brasileiro. Obrigado por colaborar. A colaboração é um
> princípio do projeto — e este guia existe para que ela aconteça **sem desviar da
> especificação nem quebrar o sistema** (ver [VISION.md](VISION.md) e
> [GOVERNANCE.md](GOVERNANCE.md)).

## Princípios para quem contribui

- **Seguro antes de rápido.** Não trocamos práticas seguras por velocidade; preferimos
  o caminho mais lento e seguro a atalhos que cultivem vulnerabilidades sutis.
- **Documentos em português brasileiro.** Toda documentação é escrita em PT-BR.
- **Nada decidido em silêncio.** Toda decisão ou assunção nova vai para
  `spec-final/11-decisoes.md`.
- **Lint sempre.** Rode `make lint-spec` antes de submeter — espera-se 0 erros.

## O que você pode contribuir

- Correções e melhorias de especificação (`spec-final/`).
- Novas histórias/épicos no backlog (`spec-final/03-backlog-unificado.md`).
- Features e integrações (quando houver código).
- Propostas de mudança do núcleo (ver abaixo — exigem mais cuidado).

## Mudança de núcleo × mudança fora do núcleo

Antes de abrir uma contribuição, classifique-a:

- **Fora do núcleo** (feature de fork, tema, restrição adicional, texto): siga o fluxo
  normal de PR; não precisa de aprovação do Conselho.
- **Mudança de núcleo** (modelo de dados nacional, API de Federação, ou algo que toque
  o alinhamento doutrinário): é **breaking** para a unificação e exige o processo de
  RFC + aprovação do Conselho de federativas (ver [GOVERNANCE.md](GOVERNANCE.md),
  decisões D20/D21).

Na dúvida sobre se algo é núcleo, trate como núcleo e pergunte.

## Processo de RFC (para mudança de núcleo)

1. Abra uma RFC (issue/documento) com: problema, proposta, impacto no núcleo,
   alternativas e riscos.
2. Participe da discussão técnica e doutrinária.
3. Se aprovada e arquiteturalmente significativa, registre um ADR em `arquitetura/adr/`
   e espelhe a decisão em `spec-final/11-decisoes.md`.
4. A mescla ocorre após aprovação do Conselho de federativas.

## Gates de revisão (checklist do PR)

- [ ] Documentação em PT-BR.
- [ ] `make lint-spec` em 0 erros.
- [ ] Decisões/assunções novas registradas em `spec-final/11-decisoes.md`.
- [ ] Se toca o núcleo: RFC aberta e classificada; ADR quando aplicável.
- [ ] Sem regressão de acessibilidade, privacidade (LGPD) ou segurança.
- [ ] (Com código) testes acompanham a mudança e passam.

## Forks

Um fork de federativa contribui de volta ao núcleo **abrindo PRs upstream** — não
mantendo divergências de núcleo apenas no fork. Features fora do núcleo podem viver só
no fork. Ver direitos e deveres do fork em [GOVERNANCE.md](GOVERNANCE.md).

## Onde cada coisa mora

Ver o mapa de documentos em
[`docs/taxonomia-documentos.md`](docs/taxonomia-documentos.md): PRD (`spec-final/`) →
ASR (`spec-final/12-asr.md`) → ADR (`arquitetura/adr/`) → Épicos/Histórias
(`spec-final/03-backlog-unificado.md` + issues).
