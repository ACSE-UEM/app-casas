

garantir acessibilidade do site para pessoas com baixa visão ou dificuldades motoras
garantir acessibilidade da informação em vários formatos
garantir transparência dos dados agregados


# Participants Database

- [ ] cadastro: discriminar melhor os nomes dos campos que são do administrador, daqueles campos que são da casa
  - [ ] campos da casa devem usar o prefixo ce_
  - [ ] campos do admin devem usar o prefixo adm_

  - [ ] cadastro: ce_phone      , opcional    , público    , telefone da casa 
  - [ ] cadastro: ce_email      , opcional    , público    , email da casa 
  - [ ] cadastro: ce_name       , obrigatório , público    , nome da casa
  - [ ] cadastro: ce_bio        , opcional    , público    , mini biografia da casa

  - [ ] cadastro: adm_phone     , obrigatório , escondido  , telefone do Administrador do registro  
  - [ ] cadastro: adm_email     , obrigatório , escondido  , email do Administrador do registro
  - [ ] cadastro: adm_name      , obrigatório , escondido  , nome do Administrador do registro

# LGPD Segurança e Proteção de dados

- LGPD: segurança de informações
  - [ ] esconder campos pessoais do administrador
  - [ ] esconder condições particulares da casas: campo newsletter
  - [ ] cadastro: explicitar texto de ajuda detalhando a visibilidade pública
  - [ ] exibir somente campos da casa


# ACESSIBILIDADE

- [ ] melhorar acessibilidade:
  - [ ] p/ pessoas com dificuldades visuais: blind, visual impairement, elderly, color
  - [ ] p/ pessoas com dificuldades motoras
  - [ ] p/ pessoas com dificuldades cognitivas e de compreensão: 
    - [ ] dislexia
    - [ ] baixa instrução
    - [ ] tdah
  - [ ] p/ pessoas com dificuldades auditiva:
  - [ ] ARIA ?
  - [ ] WCAG ?

# SEO

- [ ] SEO: OpenGraph = meta:og = title, description, url
  - [ ] corrigir o título da página usando informações do registro

- [ ] permitir cadastro sem email (mas com telefone):
  - [X] mostrar o campo telefone, obrigatório
  - [ ] interceptar validação do email
    - [ ] limpar telefone informado
    - [ ] definir prefixo fixo de email válido
    - [ ] concatenar prefixo + telefone
    - [ ] continuar validação do email

- [ ] explicar almira funcionamento ajustes e correções de endereços

- [ ] melhorar entendimento de que é uma iniciativa para o estado de minas gerais

- [ ] garantir vocabulário inclusivo
  - [ ] evitar palavras que remetem a um sexo específico

- [ ] cadastros incompletos: o que fazer com emails que não estão corretos

# Cultura

# Outros

- [ ] banco de dados: criar tabela das atividades e áreas
- [ ] automação: atualizar CRE quando for informado corretamente a localidade
- [ ] automação: atualizar Regional quando for informado corretamente o CRE
- [ ] automação: gerar alerta (29x) quando informado corretamente o CRE 
- [ ] divulgar um email casas@uemmg.org.br para receber dúvidas
- [ ] tarefas: criar "shorts" com instruções específicas, para revisores
- [ ] cultura: discutir transparência de dados
- [ ] tarefas manuais
  - [ ] endereços errados: ruas com nomes antigos
  - [ ] endereços errados: localização incorreta
- [ ] treinamento: agendar grupo de "quarta"

- [ ] usuários-cres: notificação automática para usuário associado ao CRE
- [ ] usuários-cres: associação de usuário com campo do PDB

- [ ] disaster recovery: automatizar backup
- [ ] disaster recovery: plano de recuperação
- [ ] scalability: CDN com cloudflare
- [ ] artigos: espaço de "idéias da casa" permitir às casas sugerirem idéias ou ajustes no site
- [ ] revisão credibilidade do site
- [ ] bug de carga da fonte woff
- [ ] adicionar campo de telefone na página de inscrição
- [ ] ordenar campos para facilitar para a casa. Nota: a ordenação do lado federativo pode existir em outro local
- [ ] revisar textos de ajuda
- [ ] backups: documentar tecnicamente templates usados
- [ ] extrair casas antigas ?
- [ ] melhorar o estilo da página que exibe dados da Casa
- [ ] ajustar melhor os campos que são "federativos"
- [ ] remover o campo "regional" ou movimentá-lo para uma área administrativa

# Para COFEMG

- estruturar defesa das idéias que se deseja implementar

# IDÉIAS = PRECISA SER VALIDADO E APROVADO

https://docs.google.com/document/d/1llfCO9lrWKO-FNqwoWkZWkw7Hn0Ps93lIxItgu_Cpqw/edit?tab=t.0

- [ ] novos campos em cadastro: 
  - [ ] música
  - [ ] artes
  - [ ] esperanto, linguas
  - [ ] auxílio dependentes químicos
- [ ] uma página para transparência dos dados
  - [ ] apresentação trimestral de relatórios e dados agregados
- [ ] artigos: descrever atividades para dar precisão ao administrador da casa
- [ ] artigos: página que explica o que é cada tarefa
- [ ] uma área de "problemas" e "soluções"
- [ ] problema-solução: página que explica o que é cada tarefa
- [ ] Newsletter trimestral / semestral  ?
- [ ] <projeto>: permitir que a casa cadastre uma url, de csv, onde ela aponte a agenda de palestras
  - data, hora, tema, facilitador*
- [ ] Incluir campos de obtenção da agenda de palestras:
  - [ ] ce_lectures_url
  - [ ] ce_lectures_type: csv, calendar, feed
- [ ] Incluir campos de obtenção da agenda de eventos:
  - [ ] ce_events_url
  - [ ] ce_events_type: csv, calendar, feed
- [ ] Incluir campos de redes sociais: 
  - [ ] ce_youtube_url
  - [ ] ce_instagram_url
  - [ ] ce_facebook_url
- [ ] permitir que a Casa aponto o feed de programação
- [ ] página de novidades / newsletter ?
- [ ] organização de materiais mais acessível do que o que se encontra
- [ ] botão de pedido de ajuda
- [ ] botão para reportar problema no cadastro + descrição do problema
- [ ] criação do "meu espaço" 
- [ ] envio de material customizado (tipo um MediaKit) por Casa
  - produz um relatório PDF considerando os dados de atividades relatadas, trazendo seções com artigos sobre as atividade ou links direcionados
  - página com canais de apoio
    - contato da AME
    - contato do CRE
    - formulários
    - QR Codes
    - mensagens doutrinárias inspiradoras
    - espaço União
    - espaço Unificação 
    - similar ao Jornalzinho feito em outras regiões do estado


# Para notificar

- [x] dashboards: (Regional/CRE)
  - número de casas adesas/revisadas
  - número de casas total
  - número de casas pendentes de revisão
  - detalhamento de pendentes por CRE
  - detalhamento de aprovados por CRE
  - historico de evolução: ultimo mês, ultima semana, total, grafico linha
  - geografia:
    - mapa
    - lista de cidades com casas
  - linhas de áreas nas casas:
    - percentual de casas que realizam alguma atividade relacionada a área
    - número absoluto de casas que realizam alguma atividade relacionada a área
    - detalhamento de atividades das áreas
- [x] dashboard para presidentes
  - dashboard do CRE
- [x] dashboard para coordenadores de área:
  - dashboard da Regional
  - dashboard do CRE
- [x] dashboard para união
  - dashboard da Regional
- [x] criar um email casas@uemmg.org.br para receber dúvidas


# Concluído

Versão digital
https://docs.google.com/document/d/1wh6vm0Wzw0ks9f0dnTo8GYP1FyEk-tPX_5PQButfBBE/edit?tab=t.0#heading=h.4muqqjy2183

- [x] mapas: mapa na listagem
- [x] inscrição: revisar textos de agradecimento
- [x] inscrição: revisar textos do email
- [x] página com municípios e cres
- [x] métricas: inscrições no tempo
- [x] métricas: total
- [x] métricas: segmentado por CRE
- [x] treinamento: subir video 1
- [x] treinamento: subir video 2
- [x] mapas: mapa individual
- [x] mapas: geocoding do endereço para obter lat,lng
- [x] mapas: centralização inicial
- [x] google: habilitar search para o dominio
- [x] google: habilitar analytics para o dominio

