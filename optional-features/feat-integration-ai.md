## Natural Language Search – OpenSearch + MCP

### Purpose
This integration enables natural language queries over [your data domain] using AI agents.

### Architecture Diagram
[Insert diagram here]

### Technical Implementation
- OpenSearch version: 
- MCP implementation: 
- Embedding model used: 
- Agent / LLM responsible for tool calling:

### Operational Limits
| Item                      | Limit                          | Notes |
|---------------------------|--------------------------------|-------|
| Queries per user/minute   |                                |       |
| Burst limit               |                                |       |
| Global QPS                |                                |       |
| Maximum results per query |                                |       |

### Estimated Costs
- Per simple semantic search: 
- Per complex agentic query: 
- Monthly projection: 

### LGPD and Data Protection Rules
**Data that can be returned via MCP tools:**
- Aggregated statistics
- Anonymized lists
- Public project information

**Data that is blocked / masked:**
- Full names of volunteers
- Contact information (email, phone)
- CPF, addresses, or any direct PII
- [Add other sensitive fields]

**Protective Measures:**
- Automatic PII redaction
- Consent verification layer
- Audit trail retention:  [X] months/years
- Right to be forgotten implementation:

### Examples

**Allowed query example:**
> "Quantos voluntários temos na região Nordeste?"

**Blocked / restricted query example:**
> "Qual o telefone do voluntário João Silva?"
→ Returns: "Desculpe, não posso fornecer dados pessoais individuais."
