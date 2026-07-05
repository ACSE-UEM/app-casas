## MCP (Model Context Protocol) + OpenSearch Integration

### Overview
MCP is used to expose OpenSearch capabilities as standardized tools that LLMs / agents can call using natural language.

### Exposed Tools
List of MCP tools available:
- `semantic_search`
- `hybrid_search`
- `filter_by_date`
- `get_aggregate_stats`
- `list_available_indices`
- [Add your specific tools]

### Rate Limits and Usage Limits
- Requests per minute per user / per tenant: 
- Daily limit: 
- Global rate limit for MCP endpoint: 
- Rate limit strategy (token bucket, fixed window, etc.):

### Costs
- Cost per MCP tool invocation:
- Additional cost when the LLM processes the tool result:
- Total estimated cost per natural language query:

### Data Exposure Rules (LGPD Compliance)
**Allowed to expose:**
- 

**Prohibited from exposing:**
- 

**Anonymization / Masking rules:**
- 

**Consent and Rights:**
- How volunteers can exercise their rights (access, correction, deletion):
- “Forget me” / data deletion mechanism:

**Guardrails and Safety:**
- Prompt filtering / guard model used:
- Output filtering for PII:
- Audit logging policy (what is logged and for how long):

### Error Handling and Fallbacks
- Behavior when rate limit is reached:
- Behavior when tool returns sensitive data:
- Graceful degradation strategy: