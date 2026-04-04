# Project Context: Spiritist Center Management System (UEM)

This project contains the comprehensive specifications and documentation for a digital platform designed to coordinate and manage spiritist centers (Casas Espíritas) and their activities across Brazil, with a focus on the organizational structure of the Spiritist Movement.

## Project Overview
The platform aims to serve as a multi-tenant, multi-user system that facilitates the registration, management, and discovery of spiritist centers, their activities, events, and lectures. It emphasizes national accessibility while respecting the regional organizational variations of spiritist federatives.

### Core Technologies
- **Backend:** PHP 8.0, MySQL 8.0
- **Integration:** WordPress (plugins/integration for resource display)
- **Frontend:** HTML5, CSS (Vanilla preferred), WebSocket, Offline support
- **Standards:** WCAG Accessibility, Secure by Design, Privacy by Default (LGPD compliance)
- **APIs:** OIDC/OAuth2/IAM for identity management, JSON-LD/OpenGraph for SEO/AEO

## Directory Structure
- `/docs/`: High-level strategic and technical documentation (e.g., `stack.md`, raw ideas backlog).
- `/spec/`: Original, raw specification files and notes.
- `/spec-revised/`: The **primary source of truth**. These are the consolidated, expertly organized product specifications:
  - `01-vision-and-context.md`: Product vision, national hierarchy (Federativas -> Macro/Micro -> Casa), and target audience prioritization.
  - `02-domain-model.md`: Core entities (Casa, Atividade, Evento, Palestra) and the functional taxonomy aligned with institutional guidelines.
  - `03-features-backlog.md`: Agile Epics and user stories detailing the functional requirements.
  - `04-access-control-rbac.md`: Identity and Access Management matrix, detailing roles (Visitante, Tarefeiro, Admin, Revisor, etc.) and audit rules.
  - `05-integrations-and-seo.md`: SEO/AEO strategy, structured data (JSON-LD), URL structures, and external integrations like WordPress.
  - `06-compliance-and-risks.md`: Mandatory LGPD checklists (data deletion, export), WCAG accessibility, and risk mitigation strategies.
  - `07-ameacas.md`: Comprehensive threat model (in PT-BR) covering Institutional, Legal (LGPD), Security (Spam/Scams), and Operational risks.
  - `08-mitigacao.md`: Risk mitigation strategy (in PT-BR) through software, processes, tools, and human oversight.

## Key Concepts
- **Multi-tenancy:** The system supports multiple "Casas" and regional organs, each with their own management space.
- **Regional Hierarchy:** Accommodates different naming conventions and structures across Brazilian states.
- **IAM (Identity & Access Management):** Complex RBAC system ensuring data privacy, principle of least privilege, and strict separation of duties.
- **SEO/AEO:** Heavy focus on "Answer Engine Optimization" to ensure public discovery via natural language and search engines.
- **MCP (Model Context Protocol):** Future integration of AI to allow natural language queries about spiritist center data.

## Important Domain Rules & Nuances
- **Mandatory Casa Fields:** To establish a valid basic profile, a Casa *must* provide: Name, City (excluding state acronym), Contact Name (Admin), Contact Phone, Email, and Virtual Status (online-only vs. physical).
- **"Atividades" Classifications vs. Deep Records:** On the Casa's basic profile, activities are listed as general checkboxes (e.g., "Tarefas de Assistência", "Reuniões de Estudo"). Selecting these only *informs* that the Casa performs the activity generally; it does *not* create a fully detailed Activity record (which requires scheduling, coordinators, and deeper metadata).
- **The Importance of "Reuniões Públicas":** "Reuniões Públicas" (Public Meetings/Lectures) are a critically important core activity. Because of their fundamental role in public outreach, their schedule attributes (days, times, and details) are often captured directly on the Casa's basic contact profile, elevating them above standard activities.

## Usage Guidelines
When contributing to or implementing features for this project, always refer to the `spec-revised/` folder first:
1. **Consult `spec-revised/04-access-control-rbac.md`** before implementing any new resource to ensure proper permission alignment and audit logging.
2. **Review `spec-revised/01-vision-and-context.md`** to understand how regional hierarchies impact data filtering and display for the specific feature you are building.
3. **Adhere to `spec-revised/06-compliance-and-risks.md`**, specifically the LGPD checklists and accessibility standards.
4. **Follow the Domain Model** in `spec-revised/02-domain-model.md` to ensure database schemas and API endpoints match the official taxonomy.

## Technical Commands (Inferred/TODO)
As this is currently a specification-only repository, no build or run commands are present. 
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
