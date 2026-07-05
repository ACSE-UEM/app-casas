# 7. LGPD e Privacidade

O sistema é projetado com **privacidade por padrão** (privacy by default) e
**segurança por concepção** (secure by design). Este documento define papéis, bases,
retenções e direitos. Fluxos de atendimento: `05` §5.8.

## 7.1. Papéis LGPD

- **Controladora:** União Espírita Mineira (UEM), operadora da plataforma.
- **Federativas aderentes:** o acordo de adoção define seu papel (controladoras
  conjuntas ou operadoras) — **pendência jurídica** em `11`.
- **Encarregado (DPO):** indicado pela UEM; contato publicado na política de
  privacidade. **Pendência** em `11`.

## 7.2. Inventário de dados pessoais

| Conjunto | Dados | Visibilidade | Retenção |
| :--- | :--- | :--- | :--- |
| Conta de usuário | nome, telefone (verificado), e-mail opcional, data de nascimento | privada | enquanto a conta existir |
| Campos `adm_*` da casa | nome, telefone, e-mail do administrador do cadastro | **ocultos ao público** | enquanto for admin + 1 ano |
| Candidaturas (Quero Ajudar) | nome, contato, mensagem | coordenador da atividade + admin da casa | anonimização automática 6 meses após decisão |
| Consentimentos | titular, finalidade, texto, data | interna/auditoria | vínculo + 5 anos (provisório) |
| Denúncias | contato opcional do denunciante | revisor responsável | resolução + 1 ano |
| Documentos de disputa | atas, estatutos, declarações | revisor + federativa (recurso) | desfecho + 90 dias, depois excluídos |
| Logs de auditoria | usuário, ação, timestamp | interna | 5 anos (provisório) |
| Inscrições Web Push (D17) | endpoint do dispositivo, chaves de criptografia | interna | até revogação, saída da conta ou expiração; o payload do push **nunca** contém dado pessoal — o conteúdo é buscado pelo app autenticado ao receber o aviso |

**Vínculos públicos por função:** contatos públicos de atividades e órgãos exibem
dados de pessoas **no exercício de função institucional**, informados pela própria
casa/órgão com ciência do titular; o titular pode pedir remoção a qualquer momento.

## 7.3. Dado sensível: convicção religiosa

O vínculo de uma pessoa a uma casa espírita revela convicção religiosa —
**dado pessoal sensível** (LGPD art. 5º, II; art. 11). Consequências de projeto:

- Vínculos (tarefeiro, coordenador, candidato) tratados sob **consentimento
  específico e destacado**.
- Nunca expostos em APIs públicas, exportações regionais, dashboards ou MCP
  (regras em `04` §4.4 e `06` §6.7).
- Minimização: a plataforma não registra frequência, participação em atendimentos
  nem qualquer dado de **pessoas atendidas** (anti-requisito N.2).

## 7.4. Bases legais (mapa resumido)

| Tratamento | Base legal |
| :--- | :--- |
| Dados institucionais públicos da casa | legítimo interesse / execução do serviço |
| Conta de usuário e campos `adm_*` | execução de contrato (termos de uso) |
| Candidaturas e vínculos com casas | **consentimento** (art. 11, dado sensível) |
| Comunicações (lembretes, recertificação) | execução do serviço; opt-out para não essenciais |
| Logs de auditoria e antifraude | obrigação legal / legítimo interesse |

## 7.5. Menores de idade

- **Contas a partir de 16 anos**, mediante **consentimento verificável do
  responsável legal**: o cadastro coleta contato do responsável, envia confirmação e
  registra o consentimento (entidade Consentimento).
- Usuários 16–17: nunca aparecem em páginas públicas nem em contatos públicos de
  atividades; candidaturas sinalizadas ao coordenador como "menor de idade";
  exclusão de dados tratada com prioridade.
- **Menores de 16 não têm conta** (anti-requisito N.3). Atividades infantojuvenis
  existem como informação pública de agenda; inscrição de crianças ocorre
  presencialmente na casa, fora da plataforma.

## 7.6. Direitos dos titulares (checklist obrigatório)

- [ ] **Exclusão:** usuários e casas solicitam exclusão total; prazo de 15 dias.
- [ ] **Correção:** solicitação de correção de dados inexatos; prazo de 15 dias.
- [ ] **Exportação/portabilidade:** JSON estruturado dos dados do titular/da casa.
- [ ] **Reivindicação de perfil:** representante legítimo reporta perfil criado por
  terceiro (fluxo em `05` §5.5).
- [ ] **Revogação de consentimento:** a qualquer momento, com efeito imediato.
- [ ] **Registro de consentimento:** explícito, granular, auditável (Quero Ajudar,
  contas 16–17, comunicações).
- [ ] **Feedback anonimizado:** mecanismos de feedback removem PII antes do
  armazenamento analítico (regras de anonimização definidas pelo Encarregado com o
  produto).

**Arbitragem:** se uma casa recusar excluir dados que o titular alega serem seus, o
Encarregado decide; dados institucionais da casa (nome, endereço, agenda) não são
dados pessoais do solicitante e não se excluem por esse fluxo.

## 7.7. Agregação e estatísticas

Dashboards regionais, censos e MCP publicam apenas agregados com **k-anonimato**
(k ≥ 5, provisório): nenhuma célula estatística com menos de 5 indivíduos/casas é
exibida, evitando reidentificação em regiões pequenas.

## 7.8. Incidentes de segurança

Plano de resposta: contenção, avaliação de risco ao titular, comunicação à ANPD e aos
afetados nos prazos regulamentares, registro post-mortem. Detalhes operacionais
(backup/DR) em `10`.
