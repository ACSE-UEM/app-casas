# Revisão cruzada: `./spec` × `./spec-revised`

## 1. Propósito desta revisão

A `spec` original é rica em **intenções** e **lista de funcionalidades**, mas mistura níveis (produto, jurídico, SEO, operação) sem priorização explícita nem critérios de corte. A `spec-revised` faz um trabalho valioso ao:

- Fixar **visão**, **hierarquia federativa** e **públicos-alvo** (`01-vision-and-context.md`).
- Consolidar **modelo de domínio** e **taxonomia de áreas** (`02-domain-model.md`).
- Organizar um **backlog por épicos** (`03-features-backlog.md`).
- Detalhar **RBAC**, **integrações/SEO**, **compliance/LGPD** e **riscos** (`04`–`08`).

O problema relatado — especificação “concisa demais” e **perda de perguntas importantes** — não é tanto falta de texto na `spec-revised`, e sim **subespecificação de decisões de produto e operação** que a `spec` levanta mas não fecha. Abaixo, o que está bem coberto e o que ainda exige aprofundamento.

## 2. O que a `spec-revised` cobre bem em relação à `spec`

| Tema na `spec` | Onde aparece na `spec-revised` |
|----------------|--------------------------------|
| Hierarquia nacional / variação por estado | `01-vision-and-context` |
| Casa, atividade, evento, palestra, “visões” | `02-domain-model` |
| Cadastro com telefone, revisão, webhooks, notificações | Épicos 1 e 5 em `03-features-backlog` |
| Busca, mapa, atendimento fraterno / encaminhamento | Épicos 3–4 |
| LGPD, acessibilidade, casas não verificadas | `06-compliance-and-risks` + trechos do backlog |
| SEO, JSON-LD, sitemap, WordPress | `05-integrations-and-seo` |
| Papéis e matriz de permissões (visão geral) | `04-access-control-rbac` |

## 3. Lacunas relevantes (presentes na `spec`, pouco ou mal “fechadas” na `spec-revised`)

### 3.1. Produto e escopo

- **Blog**, **campanhas**, **doações**, **recomendação de casas**, **diagnóstico regional com IA**: aparecem na `spec` como ideias fortes; na `spec-revised` não há épicos dedicados nem critério explícito de **inclusão/fora de escopo** do MVP.
- **Gestão de páginas por cidade** (ex.: telefone de atendimento fraterno por município): citado na `spec`; na revisão, não há modelo de dados nem dono do conteúdo (federativa vs. municipal vs. plataforma).
- **“Renderização ≠ gestão”** e **compilação** de página pública: conceito importante na `spec`; falta fluxo (estados, quem aprova, preview).

### 3.2. Operação e governança

- **Quem valida conteúdo doutrinário ou sensível** além do revisor cadastral? A `spec` menciona alinhamento FEB; a `spec-revised` cita risco, mas não define **processo** (filas, prazos, recurso).
- **SLA de revisão**, **escalação** e **conflito** entre revisores/regiões: ausentes na forma de requisitos testáveis.

### 3.3. Dados e integrações

- **OpenSearch** e **MCP para busca em linguagem natural**: na `spec` e em `05-integrations-and-seo` há menção técnica; faltam **limites de uso**, **rate limit**, **custos**, e **o que o MCP pode ou não expor** (LGPD, dados pessoais de voluntários).
- **Plugin WordPress**: necessidade clara na `spec`; na revisão, não há **contrato mínimo de API**, versionamento nem autenticação.

### 3.4. Experiência e temas

- A `spec` detalha **temas por casa** (grid, widgets, banner, parallax, etc.). O backlog fala em “theme & branding”, mas não liga a **requisitos de acessibilidade** (WCAG) por tema — enquanto `galeria-temas` e `prompt-gerador-temas.md` exigem alto padrão (Bootstrap, AAA, responsivo).

### 3.5. RBAC granular

- A `spec` e `rbac.md` distinguem **CRE presidente** vs. **área**, **federativa área**, etc. A `spec-revised` simplifica para “CRE / Municipal” e “Federativa”, o que pode **apagar nuances** necessárias para permissões reais.

## 4. Síntese

| Avaliação | Comentário |
|-----------|------------|
| **spec-revised como organização** | Forte: boa base para roadmap e compliance. |
| **Risco principal** | Decisões de **corte de escopo**, **processos operacionais** e **contratos de integração** ainda implícitas; a `spec` original continha pistas que precisam virar **perguntas obrigatórias** (ver `02-perguntas-e-lacunas.md`). |
| **Próximo passo sugerido** | Priorizar épicos do MVP, listar **não objetivos** explícitos, e responder às perguntas de `02` com donos (produto/jurídico/ops). |
