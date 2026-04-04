# Especificação Cursor (`spec-cursor`)

Esta pasta contém uma **segunda revisão** do produto, produzida após leitura conjunta de:

- `./spec` (backlog em estado de brainstorming, em português)
- `./spec-revised` (consolidação em inglês, mais estruturada)

Objetivos desta revisão:

1. Apontar **lacunas**, **ambiguidades** e **perguntas em aberto** que um texto muito de alto nível tende a omitir.
2. Registrar **10 conceitos adicionais de tema/visualização** para inspirar telas e aspectos do produto, alinhados ao espírito de `./galeria-temas` (layouts acessíveis, responsivos, com múltiplas seções).

**Escopo de escrita:** apenas arquivos dentro de `spec-cursor/`.

## Índice

| Arquivo | Conteúdo |
|--------|-----------|
| [01-revisao-cruzada.md](./01-revisao-cruzada.md) | O que a `spec` cobre, o que `spec-revised` organiza bem, e onde ainda falta profundidade |
| [02-perguntas-e-lacunas.md](./02-perguntas-e-lacunas.md) | Perguntas que deveriam ser respondidas antes ou durante o detalhamento técnico |
| [03-galeria-10-temas-inspiracao.md](./03-galeria-10-temas-inspiracao.md) | Dez novos “temas” de galeria (aspectos de produto + ideias de tela), inspirados na pasta `galeria-temas` |

## Protótipos HTML (galeria)

Implementação visual estática (vistas públicas + telas internas de cadastro e gestão):

- Pasta: [`../galeria-temas/temas/spec-cursor-prototipos/`](../galeria-temas/temas/spec-cursor-prototipos/)
- Índice: [`../galeria-temas/temas/spec-cursor-prototipos/index.html`](../galeria-temas/temas/spec-cursor-prototipos/index.html)
- Servir localmente: na raiz do repositório, `make prototipos-serve` e abrir `http://127.0.0.1:8765/`
