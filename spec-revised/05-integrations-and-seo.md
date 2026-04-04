# 5. Integrations and SEO/AEO Strategy

This section covers how the platform exposes its data to external systems, search engines, and AI models.

## 5.1. External Integrations
*   **WordPress Integration:** The platform operates as an independent backend but must expose endpoints/plugins that allow WordPress sites (used by Federatives/Casas) to fetch and display resources seamlessly.
*   **Webhooks:** Outbound webhooks trigger upon specific events (e.g., "New Casa Registered", "New Regional Event Created") to allow external automation.

## 5.2. SEO and AEO (Answer Engine Optimization)
Because a primary goal is public discovery, the platform relies heavily on structured data.

### 5.2.1. URL Structure (Semantic Routing)
Routes must be human and machine-readable:
- `/{estado}/cidade/{cidade}`
- `/{estado}/orgao/{slug-macro}`
- `/{estado}/casa/{slug-casa}`

### 5.2.2. Schema Markup (JSON-LD)
Pages must dynamically generate JSON-LD to feed Google Knowledge Graph and AI bots:
- **Casas Espíritas:** Marked up as `NGO` (Non-Governmental Organization).
- **Eventos / Palestras:** Marked up as `Event`.
- **Breadcrumbs:** Strict hierarchical breadcrumb markup (`Casas > MG > Belo Horizonte > Casa Name`).

### 5.2.3. Sitemap and Robots
- Dynamic XML sitemap generation.
- **Compliance Rule:** ONLY "Active" and verified Casas are included in the public sitemap. Pending/Unverified Casas must be excluded from indexing to prevent abuse.

## 5.3. OpenSearch Specification
Implementation of the OpenSearch standard to allow browsers and external systems to search the platform's directory directly from the address bar.
