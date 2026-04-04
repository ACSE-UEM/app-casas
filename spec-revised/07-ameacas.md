# 7. Ameaças e Riscos Principais

Com base nas especificações do projeto e na natureza da plataforma, as principais ameaças podem ser categorizadas em quatro áreas fundamentais. O sucesso do sistema depende da mitigação contínua destes riscos.

## 7.1. Riscos Institucionais e Doutrinários (Impacto Alto)
O sucesso do projeto depende inteiramente da confiança e do apoio das Federativas Espíritas e das diretrizes do movimento (como a FEB).
* **Desalinhamento Institucional:** Se a plataforma for percebida como algo que ignora as hierarquias oficiais ou que não atende ao Plano de Trabalho do Movimento Espírita Brasileiro (PTMEB), ela pode perder a adoção pelos órgãos regionais.
* **Desvio Doutrinário:** Permitir o cadastro de atividades ou conteúdos que contrariem os princípios espíritas pode levar à perda de credibilidade e ao boicote por parte de Casas e Federativas.
* **Fragmentação:** Se diferentes estados se recusarem a adotar o modelo nacional de hierarquia (Macro/Micro/Regional), a plataforma pode se tornar um conjunto fragmentado de dados em vez de um diretório nacional unificado.

## 7.2. Riscos Legais e de Compliance (Impacto Crítico)
Lidar com dados pessoais de voluntários (Tarefeiros) e dados sensíveis do público (como os do Atendimento Fraterno) gera uma exposição legal significativa.
* **Violações da LGPD (Privacidade de Dados):** As funcionalidades de "Quero Ajudar" (Recrutamento de Voluntários) e "Atendimento Fraterno" lidam com dados sensíveis. O vazamento de dados ou a falha em fornecer mecanismos de exclusão/portabilidade (Privacy by Default) pode resultar em multas pesadas e processos legais.
* **Sequestro de Cadastro (Shadow Management):** Representantes legítimos podem relatar que sua "Casa" foi cadastrada por uma pessoa não autorizada. Lidar com essas disputas de propriedade de perfil é um grande desafio operacional e legal.

## 7.3. Ameaças de Segurança e Integridade (Frequência Alta)
Como um diretório público com funcionalidades de auto-cadastro (adesão), a plataforma é um alvo atrativo para abusos.
* **Casas Falsas / Golpes:** Atores mal-intencionados podem registrar Centros Espíritas falsos para aplicar golpes (pedindo doações) ou para explorar pessoas em busca de Atendimento Fraterno, que frequentemente estão em estado de vulnerabilidade psicológica.
* **Spam e Envenenamento de SEO:** Como o projeto prioriza AEO (Answer Engine Optimization) e SEO, bots podem tentar registrar milhares de entradas falsas para gerar *backlinks*, o que destruiria a reputação da plataforma nos motores de busca (Google).
* **Vulnerabilidades de Stack (WordPress/PHP):** A integração e dependência do ecossistema WordPress exigem rigor na segurança, pois são alvos constantes de exploração de falhas em plugins e temas.

## 7.4. Ameaças Operacionais e de Qualidade de Dados (Impacto Médio)
* **Dados Desatualizados:** Os Centros Espíritas são geridos por voluntários. Se as informações (horários, contatos, atividades) mudarem e não forem atualizadas no portal, a experiência do usuário será severamente prejudicada (ex: visitante vai a uma casa que está fechada).
* **Atrito vs. Integridade:** A funcionalidade de "inscrição sem email (apenas telefone)" foi criada para facilitar a adesão de pessoas sem habilidade técnica, mas isso dificulta a verificação de identidade, criando um conflito direto entre a facilidade de uso e a integridade da base de dados.

## Matriz de Mitigação Resumida

| Ameaça | Estratégia de Mitigação |
| :--- | :--- |
| **Casas Falsas / Golpes** | Isolamento de registros "Não Revisados/Aprovados"; os registros só ficam públicos após revisão manual pelo papel de `Revisor` regional. |
| **Multas / LGPD** | Engenharia orientada a "Privacy by Design"; limitação estrita de acesso via RBAC; ferramentas automatizadas de portabilidade e exclusão de dados. |
| **Rejeição Institucional** | Aderência estrita à taxonomia do movimento espírita; flexibilidade no modelo de dados para refletir as diferentes hierarquias estaduais. |
| **Dados Obsoletos** | Gatilhos automatizados via email/SMS (ex: "A Casa ainda está ativa?"); painel simplificado para os administradores das Casas manterem os dados atualizados. |