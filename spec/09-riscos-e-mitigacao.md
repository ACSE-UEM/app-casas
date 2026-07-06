# 9. Riscos, Ameaças e Estratégia de Mitigação

Consolida o modelo de ameaças e a defesa em camadas. O sucesso do sistema depende da
mitigação contínua destes riscos.

## 9.1. Riscos institucionais e doutrinários (impacto alto)

O projeto depende da confiança das federativas e do alinhamento às diretrizes do
movimento (FEB/PTMEB).

- **Desalinhamento institucional:** ser percebido como iniciativa que ignora as
  hierarquias oficiais ou o PTMEB inviabiliza a adoção pelos órgãos regionais.
- **Desvio doutrinário:** cadastro de atividades/conteúdos contrários aos princípios
  espíritas gera perda de credibilidade e boicote.
- **Fragmentação:** estados que recusem o modelo nacional tornam a plataforma um
  conjunto fragmentado de dados.
- **Dependência de operador único:** a operação inicial pela UEM concentra risco
  (continuidade, percepção de "projeto mineiro"); o acordo de adoção e a governança
  interfederativa mitigam.
- **Divergência de forks:** forks de federativas (D19) podem divergir do núcleo, ficar
  desatualizados, ser abandonados ou desviar doutrinariamente — cada um fragmenta a
  experiência nacional. Mitiga-se com o **núcleo travado** (D20), o contrato da API de
  Federação (`06` §6.10) e a propriedade do núcleo pelo **Conselho de federativas**
  (D21; ver [GOVERNANCE.md](../GOVERNANCE.md)).
- **Abuso da API de Federação:** um fork comprometido pode tentar injetar cadastros
  falsos em massa no núcleo nacional — mitigado por autenticação servidor-a-servidor,
  deduplicação e limites de taxa (`06` §6.10; desenho detalhado em P13).

## 9.2. Riscos legais e de compliance (impacto crítico)

- **Violações da LGPD:** "Quero Ajudar" e vínculos com casas tratam **dado sensível**
  (convicção religiosa). Vazamento ou falha nos mecanismos de exclusão/portabilidade
  gera multas e processos (mitigações em `07`).
- **Sequestro de cadastro:** disputas de posse de perfil são desafio operacional e
  legal permanente (fluxo formal em `05` §5.5).

## 9.3. Ameaças de segurança e integridade (frequência alta)

- **Casas falsas / golpes:** registros fraudulentos para pedir doações ou explorar
  pessoas vulneráveis em busca de atendimento fraterno.
- **Spam e envenenamento de SEO:** bots registrando entradas falsas em massa para
  gerar backlinks, destruindo a reputação da plataforma nos motores de busca.
- **Superfície WordPress/PHP:** o ecossistema de integração é alvo constante de
  exploração de falhas em plugins e temas; o runtime alvo é PHP ≥ 8.3 com suporte de
  segurança ativo (decisão em `11`; requisitos em `10`).

## 9.4. Ameaças operacionais e de qualidade de dados (impacto médio)

- **Dados desatualizados:** casas geridas por voluntários deixam horários/contatos
  envelhecerem; visitante frustrado não volta (mitigação: recertificação, `05` §5.3).
- **Atrito × integridade:** o cadastro por telefone facilita a adesão de quem tem
  pouca habilidade técnica, mas dificulta a verificação de identidade — tensão
  administrada pela revisão humana obrigatória e pela verificação de telefone.
- **Sobrecarga de revisores voluntários:** filas de revisão sem monitoramento
  degradam o SLA e a qualidade (mitigação: visibilidade de filas, remanejamento e
  substituição — `05` §5.1).

## 9.5. Mitigação em camadas

### Sistema (software)

- Isolamento de dados não verificados: rascunho/pendente fora de SEO, mapa e sitemap.
- Logs de auditoria imutáveis para todo CRUD (`04` §4.4).
- Validação e geocodificação automática de endereços; vínculo automático a
  município/órgãos, reduzindo erros e cadastros de locais inexistentes.
- Mecanismos LGPD nativos: telas de exclusão, correção e exportação (JSON).
- Rate limits no cadastro público e na API (`06` §6.3).

### Processos (fluxos humanos)

- **Human-in-the-loop obrigatório:** nenhuma casa fica ativa sem validação do Revisor
  regional (`05` §5.1).
- Ciclos de recertificação a cada 12 meses (`05` §5.3).
- Protocolo de disputa de propriedade com prazos e recurso (`05` §5.5).
- Revisões periódicas do backlog contra o PTMEB (`01` §1.8).

### Ferramentas (tecnologia)

- Monitoramento e WAF (proteção DDoS/injeção), especialmente na camada de integração
  WordPress.
- IA para detecção de anomalias e spam em cadastros (triagem humana; item 8.2 do
  backlog).
- Verificação de telefone por SMS/WhatsApp na criação de contas.
- Backup, DR e CDN (ver `10`).

### Pessoas (governança e comunidade)

- Ouvidoria comunitária: botão "Reportar" em todo perfil (`05` §5.4).
- Capacitação de multiplicadores: treinamento de revisores e admins (`05` §5.9).
- **Conselho de federativas** valida a taxonomia de atividades e evoluções
  doutrinárias do modelo, e é o **dono do núcleo travado** — aprova ou recusa mudanças
  de núcleo (D21; ver [GOVERNANCE.md](../GOVERNANCE.md)).

## 9.6. Matriz resumida

| Ameaça | Estratégia principal |
| :--- | :--- |
| Casas falsas / golpes | Isolamento de não revisados + revisão humana obrigatória |
| Multas / LGPD | Privacy by design; RBAC estrito; ferramentas de portabilidade/exclusão; tratamento de dado sensível (`07`) |
| Rejeição institucional | Aderência à taxonomia FEB/PTMEB; flexibilidade por estado; governança interfederativa |
| Dados obsoletos | Recertificação automática; painel simples; selo de desatualização |
| Spam/SEO poisoning | Rate limits, verificação de telefone, noindex de pendentes, detecção de anomalias |
| Sobrecarga de revisores | Filas visíveis, SLA monitorado, remanejamento pela federativa |
| Divergência/abandono de forks | Núcleo travado (D20); contrato de federação; Conselho dono do núcleo (D21); selo de conformidade |
| Abuso da API de Federação | Autenticação servidor-a-servidor, deduplicação, limites de taxa (`06` §6.10) |

## 9.7. Responsabilidades

| Camada | Responsável principal | Foco |
| :--- | :--- | :--- |
| Sistema | Equipe de desenvolvimento | Integridade técnica e privacidade |
| Processos | Federativas e órgãos regionais | Validação de dados e conformidade institucional |
| Ferramentas | Operações de TI (operadora) | Segurança de perímetro e automação |
| Pessoas | Comunidade espírita | Vigilância e precisão das informações locais |
