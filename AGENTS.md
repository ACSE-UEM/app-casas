# Project Context: Spiritist Center Management System (UEM)

This project contains the comprehensive specifications and documentation for a digital platform designed to coordinate and manage spiritist centers (Casas Espíritas) and their activities across Brazil, with a focus on the organizational structure of the Spiritist Movement.

## Project Overview
The platform aims to serve as a multi-tenant, multi-user system that facilitates the registration, management, and discovery of spiritist centers, their activities, events, and lectures. It emphasizes national accessibility while respecting the regional organizational variations of spiritist federatives.

### Core Technologies
- **Backend:** PHP >= 8.3, MySQL 8.x (decision D12 in `spec-final/11-decisoes.md`)
- **Integration:** WordPress (plugins/integration for resource display)
- **Frontend:** HTML5, CSS (Vanilla preferred), WebSocket, Offline support
- **Standards:** WCAG Accessibility, Secure by Design, Privacy by Default (LGPD compliance)
- **APIs:** OIDC/OAuth2/IAM for identity management, JSON-LD/OpenGraph for SEO/AEO

## Directory Structure
- `/docs/`: High-level strategic and technical documentation (e.g., `stack.md`, domain knowledge in `docs/espiritas/`).
- `/spec-final/`: The **primary source of truth**. Final consolidated specification (PT-BR):
  - `01-visao-e-contexto.md`: Product vision, operator (UEM), national hierarchy, target audiences, PTMEB alignment.
  - `02-modelo-de-dominio.md`: Complete domain entities and corrected functional-areas taxonomy.
  - `03-backlog-unificado.md`: Unified backlog — epics and stories labeled (fazer agora / avaliar bem / não fazer) with impact, ease and PTMEB criteria.
  - `04-iam-rbac.md`: Granular roles (órgão: presidente/área; federativa: área/presidência), permissions matrix, audit rules.
  - `05-fluxos-operacionais.md`: Adhesion, review (SLA), recertification, ownership disputes, post-publication moderation.
  - `06-integracoes-api-seo.md`: Public API, WordPress plugin, webhooks, JSON-LD/sitemap, URL scheme, OpenSearch/MCP rules.
  - `07-lgpd-privacidade.md`: LGPD roles, consent, minors (16+), retention, data-subject rights, sensitive-data handling.
  - `08-acessibilidade-ux.md`: WCAG, VLibras, curated themes, design system reference, PWA/offline.
  - `09-riscos-e-mitigacao.md`: Threat model and layered mitigation strategy.
  - `10-nfr-e-operacao.md`: Stack, performance, availability, backup/DR, KPIs.
  - `11-decisoes.md`: Decision log, default assumptions, pending items with owners, traceability.
- `/spec/`, `/spec-revised/`, `/spec-cursor/`: Previous specification generations, kept as history (superseded by `spec-final/`).

## Key Concepts
- **Multi-tenancy:** The system supports multiple "Casas" and regional organs, each with their own management space.
- **Regional Hierarchy:** Accommodates different naming conventions and structures across Brazilian states.
- **IAM (Identity & Access Management):** Complex RBAC system ensuring data privacy, principle of least privilege, and strict separation of duties.
- **SEO/AEO:** Heavy focus on "Answer Engine Optimization" to ensure public discovery via natural language and search engines.

## Future concepts
- **MCP (Model Context Protocol):** Future integration of AI to allow natural language queries about spiritist center data.

## Important Domain Rules & Nuances
- **Mandatory Casa Fields:** To establish a valid basic profile, a Casa *must* provide: Name, City (excluding state acronym), Contact Name (Admin), Contact Phone, Email, and Virtual Status (online-only vs. physical).
- **"Atividades" Classifications vs. Deep Records:** On the Casa's basic profile, activities are listed as general checkboxes (e.g., "Tarefas de Assistência", "Reuniões de Estudo"). Selecting these only *informs* that the Casa performs the activity generally; it does *not* create a fully detailed Activity record (which requires scheduling, coordinators, and deeper metadata).
- **The Importance of "Reuniões Públicas":** "Reuniões Públicas" (Public Meetings/Lectures) are a critically important core activity. Because of their fundamental role in public outreach, their schedule attributes (days, times, and details) are often captured directly on the Casa's basic contact profile, elevating them above standard activities.

## Usage Guidelines
When contributing to or implementing features for this project, always refer to the `spec-final/` folder first:
1. **Consult `spec-final/04-iam-rbac.md`** before implementing any new resource to ensure proper permission alignment and audit logging.
2. **Review `spec-final/01-visao-e-contexto.md`** to understand how regional hierarchies impact data filtering and display for the specific feature you are building.
3. **Adhere to `spec-final/07-lgpd-privacidade.md`** (LGPD checklists) and `spec-final/08-acessibilidade-ux.md` (accessibility standards).
4. **Follow the Domain Model** in `spec-final/02-modelo-de-dominio.md` to ensure database schemas and API endpoints match the official taxonomy.
5. **Record every new decision or assumption** in `spec-final/11-decisoes.md`.

## Technical Commands
This is a specification-only repository (no build/run commands yet). Available tooling:
- `make lint-spec`: markdownlint (via docker) over `spec-final/`, `spec.md` and `README.md`.
- `make prototipos-serve`: serves local HTML theme prototypes on port 8765.

- [TODO] Define PHP/MySQL environment setup.
- [TODO] Document WordPress plugin development/installation process.
- [TODO] Specify API documentation (OpenAPI/Swagger) location.



# Rules you MUST fulfil
- lint every asset built
- don't remove/exclude unless explicited
- you can chat in english, but documents should always be in portuguese brazilian
- my docker images preferable use alpine
- when handling tooling and repeatable processes, create makefile rules
- when final version was built, ask to create a README.md
- if a 3rd service should be used, ask to create setup/configuration/integration steps

# Minimum viable product
# Development
- use docker compose
- the AI tools is running on host or docker

# Final product
