# 4. Identidade e Controle de Acesso (IAM / RBAC)

Controle de acesso baseado em papéis, com **privacidade por padrão** e **menor
privilégio**. Autenticação via OIDC/OAuth2; contas verificam telefone por SMS/WhatsApp
(item 1.5 do backlog).

## 4.1. Papéis

Um papel é sempre um **vínculo com escopo**: usuário × papel × escopo (casa, órgão
regional, federativa ou plataforma). Um mesmo usuário pode acumular vínculos.

| Papel | Escopo | Descrição |
| :--- | :--- | :--- |
| **Visitante** | público | Usuário não autenticado |
| **Tarefeiro** | casa | Voluntário vinculado a uma casa, participante de atividades |
| **Coordenador** | casa (atividade/departamento) | Voluntário que administra atividades/departamentos específicos |
| **Admin de Casa** | casa | Autoridade máxima dentro de uma casa |
| **Revisor** | jurisdição regional | Valida adesões e alterações críticas de casas da sua jurisdição; arbitra disputas em primeira instância |
| **Órgão: presidente** | órgão (municipal/micro/macro) | Dirigente do órgão de unificação; gerencia a página do órgão |
| **Órgão: área** | órgão + área funcional | Coordenador de área funcional no órgão (ex.: "CRE: área AIJ") |
| **Federativa: área** | federativa + área funcional | Coordenador estadual de área funcional |
| **Federativa: presidência** | federativa | Gestão da federativa: ativa níveis regionais, nomeia revisores, gerencia features federativas |
| **Admin da plataforma** | plataforma | Equipe da operadora (UEM); gestão global, incluindo IAM |

## 4.2. Matriz de permissões

`Ver` = leitura conforme visibilidade; `Gerenciar` = criar/atualizar/excluir;
`—` = sem acesso.

| Papel | Atividades / Eventos / Palestras (casa) | Assets (casa) | Usuários da casa | Candidaturas | Página do órgão | Features federativas | Aprovar/rejeitar casas | Solicitações | Visões |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Visitante** | Ver (públicos) | Ver (públicos) | — | — | Ver | — | — | — | Públicas |
| **Tarefeiro** | Ver (inclui internos da casa) | Ver | — | — | Ver | — | — | — | Casa / públicas |
| **Coordenador** | Gerenciar\* | Gerenciar\* | — | Gerenciar\* (da sua atividade) | Ver | — | — | — | Casa / públicas |
| **Admin de Casa** | Gerenciar | Gerenciar | Gerenciar | Gerenciar (da casa) | Ver | — | — | Gerenciar (criar da casa) | Casa / públicas |
| **Revisor** | Ver | Ver | — | — | Ver | — | **Gerenciar (status)** | Ver | Jurisdição / casa |
| **Órgão: presidente** | Ver | Ver | — | — | **Gerenciar (a sua)** | — | — | Gerenciar (da jurisdição) | Jurisdição / casa |
| **Órgão: área** | Ver | Ver | — | — | Gerenciar (seção da sua área) | — | — | Ver (da sua área) | Jurisdição / casa |
| **Federativa: área** | Ver | Ver | — | — | Ver | Gerenciar (da sua área) | — | Ver | Estadual / todas do estado |
| **Federativa: presidência** | Ver | Ver | — | — | Gerenciar (estadual) | Gerenciar | Nomeia revisores | Gerenciar | Estadual / todas do estado |
| **Admin da plataforma** | Gerenciar† | Gerenciar† | Gerenciar† | Ver† | Gerenciar† | Gerenciar† | Gerenciar† | Gerenciar† | Todas |

\* Coordenadores só gerenciam recursos do seu departamento/atividade.
† Uso excepcional, sempre auditado e justificado (suporte, incidente, ordem legal).

**Permissão do Revisor sobre casas:** exclusivamente **transições de status**
(aprovar, rejeitar, devolver para ajuste, iniciar disputa) e anotações de revisão. O
Revisor **não edita** o conteúdo do cadastro da casa.

## 4.3. Atribuição de papéis

| Papel | Quem atribui |
| :--- | :--- |
| Tarefeiro, Coordenador | Admin de Casa |
| Admin de Casa (adicional ou transferência) | Admin de Casa atual; em disputa, o Revisor (ver `05`) |
| Revisor | Federativa: presidência (que também remaneja jurisdições e cobre férias/ausências) |
| Órgão: presidente / área | Federativa: presidência |
| Federativa: área / presidência | Admin da plataforma, mediante acordo de adoção |
| Admin da plataforma | Operadora (UEM), com registro formal |

## 4.4. Regras de conformidade

1. **Segregação de funções:** usuários federativos e de órgãos **não alteram dados de
   casas** — apenas veem. Somente Admin de Casa e Coordenadores modificam dados da
   casa. (Anti-requisito N.5 do backlog.)
2. **Menor privilégio:** Tarefeiros têm acesso somente-leitura à intranet da casa,
   salvo atribuição explícita de coordenação.
3. **Auditoria imutável:** toda ação `Gerenciar` gera registro imutável — usuário,
   timestamp, recurso, ação, valores antes/depois. Transições de status por Revisor
   incluem justificativa.
4. **Dado sensível:** o vínculo pessoa↔casa espírita revela convicção religiosa
   (LGPD art. 5º, II). Listas de tarefeiros/coordenadores são visíveis apenas dentro
   da própria casa; nunca em APIs públicas, exportações regionais ou dashboards.
5. **Candidaturas:** visíveis somente ao(s) coordenador(es) da atividade e ao Admin
   da casa; dashboards regionais veem apenas contagens agregadas.
6. **Visões regionais:** dashboards e censos de órgãos/federativas usam **dados
   institucionais e agregados** — nunca dados pessoais de voluntários (k-anonimato,
   ver `07`).
