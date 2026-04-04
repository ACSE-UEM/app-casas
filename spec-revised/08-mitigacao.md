# 8. Estratégia de Mitigação de Riscos

Para combater as ameaças identificadas no item anterior, a plataforma adota uma abordagem de defesa em camadas, envolvendo software, fluxos de trabalho humanos, ferramentas externas e governança institucional.

## 8.1. Mitigação via Sistema (Software e Código)
O sistema é projetado para ser "Seguro por Design" e "Privado por Padrão".
* **Isolamento de Dados Não-Verificados:** Todo novo cadastro de Casa ou alteração crítica entra em estado de "Rascunho/Pendente". Estes dados não são indexados por motores de busca (SEO) nem exibidos no mapa público até serem aprovados.
* **Logs de Auditoria Imutáveis:** Todas as operações de criação, edição e exclusão (CRUD) geram registros que não podem ser alterados, permitindo rastrear quem mudou o quê e quando.
* **Validação e Geocodificação Automática:** O sistema valida o endereço e vincula automaticamente a Casa à sua Macro e Micro-região, reduzindo erros manuais e tentativas de cadastros em locais inexistentes.
* **Mecanismos de LGPD Nativos:** Telas específicas para solicitação de exclusão de dados e exportação em formato legível por máquina (JSON), garantindo transparência e conformidade legal.

## 8.2. Mitigação via Processos (Fluxos de Trabalho)
Processos humanos garantem que a tecnologia não seja o único ponto de falha.
* **Human-in-the-Loop (Revisão Manual):** A figura do `Revisor Regional` é obrigatória. Nenhuma Casa ganha o selo de "Verificada" sem que um representante regional valide a veracidade da instituição.
* **Ciclos de Revalidação de Dados:** O sistema dispara processos de "Recertificação" periódicos (ex: a cada 12 meses), onde o administrador da Casa deve confirmar se os horários e atividades ainda são os mesmos.
* **Protocolo de Disputa de Propriedade:** Um processo claro para quando uma diretoria legítima reclama um perfil criado por terceiros, exigindo comprovação documental simples para transferência de posse.
* **Alinhamento com o PTMEB:** Revisões periódicas do backlog de funcionalidades para garantir que novas features atendem ao Plano de Trabalho do Movimento Espírita.

## 8.3. Mitigação via Ferramentas (Tecnologia e Integrações)
Utilização de ferramentas externas para reforçar a segurança e a qualidade.
* **Monitoramento e WAF (Web Application Firewall):** Proteção contra ataques de negação de serviço (DDoS) e tentativas de injeção de código, especialmente na camada de integração com WordPress.
* **IA para Detecção de Anomalias:** Uso de modelos de linguagem e algoritmos para detectar cadastros com padrões de "Spam" ou descrições que fujam completamente da taxonomia espírita.
* **Comunicação Multicanal (WhatsApp/SMS):** Uso de verificação em duas etapas (2FA) via telefone para garantir que o administrador da Casa é uma pessoa real e rastreável.

## 8.4. Mitigação via Pessoas (Governança e Comunidade)
A força do movimento federativo é usada como camada de proteção.
* **Ouvidoria e Feedback Comunitário:** Botões de "Reportar Erro" em cada perfil de Casa permitem que a própria comunidade denuncie informações incorretas ou condutas inadequadas.
* **Capacitação de Multiplicadores:** Treinamentos para os `Revisores` e `Administradores de Casas` sobre segurança de dados e a importância da manutenção da base.
* **Conselho de Federativas:** Representantes estaduais que validam a taxonomia de atividades, garantindo que o sistema reflita a realidade doutrinária de cada região.

## Resumo de Responsabilidades

| Camada | Responsável Principal | Foco |
| :--- | :--- | :--- |
| **Sistema** | Equipe de Desenvolvimento | Integridade técnica e privacidade. |
| **Processos** | Federativas e Órgãos Regionais | Validação de dados e conformidade institucional. |
| **Ferramentas** | Operações de TI | Segurança de perímetro e automação. |
| **Pessoas** | Comunidade Espírita | Vigilância e precisão das informações locais. |
