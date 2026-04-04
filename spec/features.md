# Product Backlog

## Adesão das Casas

- permitir inscrição sem email (mas com telefone) p/ facilitar uso de pessoas sem habilidade técnica
- a solicitação de adeção de uma casa provoca uma msg que se propaga e encadeia eventos diversos
- webhook de inscrição			Facilitar automação, além daquilo que o plugin oferece
- associação automática de localidade informada com macro-regiões, micro-regiões, municípios

## Gestão IAM

Controle de Usuário e acessos a recursos
ver rbac.md

## Gestão das Casas

- cadastro de dados básicos da casa
  - departamentos de atividades
  - atividades
  - contato público
  - assets: links para documentos, logos, ...
  - campos 'rótulos' => são as atividades, mas apenas mencionadas
  - expediente

### Busca

- permitir encontrar casas espíritas por diversos critérios
- tarefa que realiza
- proximidade
- localidade
- macro/micro/municipio
- atendimento fraterno
- aberta agora

### Gestão de Atividades

O campo ATIVIDADE descreve com profundidade uma tarefa espírita. 
Ele poderá substituir outros campos que foram descritos apenas como “rótulos” nas seções básicas.

* slug
* nome
* tipo
* departamento da casa
* relação com área funcional (tag das áreas)
* exibição na interface: pública / privada  
* funcionamento: presencial / remoto / online / híbrido  
* local fisico:  
* agenda:   
  * exportável em formatos diversos: ICS, FORMATO AGENDA: PUBLICO ESPECÍFICO: EVANGELIZAÇÃO, JUVENTUDE, PALESTRAS,
  * dias e horários e locais e links para visualização pela internet  
  * tipo de visualização: semanal, mensal, bimestral, grade, lista, tabela  
* responsáveis  
* documentação de apoio, tutoriais, guias e modelos:  
  * jurídico  
  * doutrinário  
  * gerencial  
  * operacional  
  * financeiro  
  * modelo  
  * técnico  
  * canva  
  * workshops  
  * vídeos de oficinas  
  * sugestão de planejamento estratégico  
  * modelos para impressão  
* contatos públicos  
  * email  
  * telefone  
  * nome  
* indicação de aceitação de voluntários  
* relação com áreas funcionais  
* público alvo  
* quero ajudar  
* status de voluntariado:  
  * link “quero me voluntariar”  
  * mensal/bimestral/trimestral  
  * datas


## Gestão das Features
Espaço para ver quais features estão disponíveis
para cada feature
- permitir ativar/desativar
- configurar
- controlar quais features estão ativos

## Gestão de Eventos
- um tipo de atividade da casas, mas com particularidades próprias
- permitir
- permite criar arte IA com dados prontos do evento

O campo EVENTO é uma extensão do campo ATIVIDADE, mas tem início e fim

Por sua característica instrínseca de relação com o público, tem também os seguintes atributos:

* URL com link para inscrição  
* Promoção na página da Casa  
* Promoção na área principal do site  
* botão de compartilhamento em redes sociais  
* visualização especial no mapa

Com esses atributos, o site poderá mostrar a atividade de uma forma bastante intuitiva.

O conjunto de informações auxilia dar a exata dimensão da atividade para os visitantes.

Os tipos básicos de campos do PDB oferecem diversas funcionalidades, mas não atendem o contexto do participante dentro do movimento espírita.

Propomos 2 novos tipos de campos com mais atributos que servem de forma mais avançada, a praticamente todos os públicos.



## Gestão de Palestras

Grande parte do trabalho no movimento espírita se ampara na divulgação do mesmo.

As palestras são uma atividade importantíssima nas casas, e merecem atenção especial no que trata da divulgação desse tipo de atividade.

A proposta é:

* criar uma maneira unificada e simples da casa divulgar suas palestras  
* mostrar as próximas palestras na página principal  
* mostrar as próximas palestras na página da Casa  
* mostrar as próximas palestras na página do CRE  
* permitir que essas exibições sejam intuitivas e funcionais

  ## Próximas palestras da Casa

Ao visitar a página de uma casa, o site irá criar uma renderização baseada no que foi informado para a atividade de palestras públicas

Caso tenha preenchido a URL de dados das palestras, também informará o tema da palestra

## Próximas palestras no estado

Em qualquer página do site, o visitante verá, no topo, um marquee com as próximas palestras e seus temas.

Se as palestras são online, além do texto, haverá um link para direcionar o visitante diretamente ao site da palestra.

Caso tenha preenchido a URL de dados das palestras, também informará o tema da palestra

## Gestão de Assets

## Gestão de Temas
Permitir que cada casa escolha seu tema de apresentação

## Espaço de escuta

## Permitir reportar problemas no cadastro

## Permitir sugerir idéias
PERMITIR ÀS CASAS VOTAR NAS PRÓXIMAS FUNCIONALIDADES			

## Sinalização p/ Revisores
Notificar imediatamente usando tecnologia mais adequada ao REVISOR da região
NOTIFICAR ADESÃO DE NOVA CASA
- por email
- por chat
- por sms
- por websocket
- por slack,telegram,discord
NOTIFICAR AJUSTE DE CASA

## Apadrinhamento da Casa

## Integração WP - SITEMAP das casas
o sitemap é usado por engines de busca  saber quais links públicos estão disponíveis

## Integração Robots - Schema Markup das casas
Facilitar às engines de busca o reconhecimento do que está sendo representado
- casa espírita => NGO
- eventos => EVENT
- ...

## Espaço da Macro-região
Conjunto de ferramentas e funcionalidades para atender as macro-regiões
- Ativação
- Nome
- Informações de contato
- Áreas funcionais
- site
- redes sociais
- quais micro-regiões abrange

## Espaço da Micro-região
Conjunto de ferramentas e funcionalidades para atender as micro-regiões
- Ativação
- Nome
- Informações de contato
- Áreas funcionais
- site
- redes sociais
- quais municípios abrange
Facilitar com que as casas obtenham auxílio com o seu CRE

## Espaço da Municipal
Conjunto de ferramentas e funcionalidades para atender os órgõas municipais
- Ativação
- Nome
- Informações de contato
- Áreas funcionais
- site
- redes sociais
- quais casas atende
Facilitar acompanhamento das Casas a partir da "unidade" da AME: 
- inscrição
- listagem
- página própria
- contato, documentos instrução, 
...

## Tratamento diferenciado para casas não revisadas
a inscrição é pública, deve existir proteções diversas para evitar ataques direcionados


## MCP (IA)
MCP do site Casas Espíritas			Permitir a qualquer pessoa buscar informações das casas usando linguagem natural

## REDES SOCIAIS DA CASA

Permite informá-la, e exibir links de compartilhamento para as mesmas

## Acessibilidade
- permitir controlar acessibilidade
- vlibras, contraste, auditiva, visual

## Transparência de dados
- produzir exportação de dados em formato acessível
- json estruturado + visões

## Camada de renderização != da camada de gestão
Separar área de cadastro da etapa de visualização			Permitir que o cadastro passe por uma etapa de compilação para construir uma renderização melhorada

Dúvidas:
- é suficiente
- instrução para configurar intranet a partir do conhecimento que se tem da casa

## Gestão de voluntariado para casa
Quero trabalhar / me candidatar 			Facilitar que as pessoas se voluntariem nas atividades da casa
Informar que está aceitando voluntários			

## Gestão de solicitações da Casa
FORM DEMANDAS DA CASA C/ DELEGAÇÃO AUTOMÁTICA			
WIDGET DEMANDAS DA CASA			
Novo campo: SOLICITAÇÕES			Encaminha demandas das casas para órgãos

## Blog
BLOG: ARTIGOS DESCREVENDO TAREFAS E ATIVIDADES DA CASA			Inspirar o público a se tornar tarefeiro
Criar páginas sobre as tarefas dando uma visão mais abrangente e profunda			Esclarecer, Inspirar, Sustentar os interessados na tarefa

## LGPD
- permitir solicitação de exclusão de dados
- permitir solicitação de correção de dados
- permitir reportar problema de dados de outras casas 


## Apoio administrativo
- guias de apoio à casa
- renderizado em função das atividades que a casa informa (visível apenas para admin da casa)

## Cuidado com AEO+SEO (ANSWER/SEARCH ENGINE OPTIMIZATION)
Exemplo: 
- \<site>/estado/cidade/\<cidade>
- \<site>/estado/localidade/\<localidade>
- \<site>/estado/orgao/\<slug-macro>/\<id-macro-regiao>
- \<site>/estado/orgao/\<slug-micro>/\<id-macro-regiao>

Facilita encontrar casas por região

DIVULGAÇÃO DAS ATIVIDADES EM FORMATOS VARIADOS			Inspirar o usuário a participar do voluntariado, Espaço de "carrosel" para apresentar atividades das casas espíritas

QR CODE DE DIVULGAÇÃO DA PÁGINA DA CASA			

OBTENÇÃO DE FEEDBACK / DESPERSONALIZAR			Conversar com representantes dos públicos-alvos para que eles indiquem melhorias nos processos, no site, nos documentos.

## Links do site
- DOCUMENTAÇÃO DE NOVIDADES
- TECNICO AVANÇADO: Implementar OPENSEARCH SPECIFICATION			"Mecanismo de busca interno" - Facilitar encontrar coisas no site

## Recomendação de Casa
BOTÃO PARA RECOMENDAR CASAS ESPÍRITA			NOTIFICA UM DIVULGADOR PRÓXIMO, PARA QUE ELE APRESENTA O SITE PARA UMA CASA

AUTOMAÇÃO CIDADE/DISTRITO/CRE/REVISOR/APOIO			
Facilitar que determinados campos sejam preenchidos automaticamente, e com isso, automações possam ser construídas

## Espaço de estudo
- RELACIONAR INFORMAÇÕES COM CASAS ESPÍRITAS
Permitir que os CREs possam desenvolver projetos com base no conhecimento demográfico da região

## Transparência
TRANSPARÊNCIA DAS CASAS EM REVISÃO			

## Busca
- permitir navegar no mapa e usar filtros de busca com critérios diversos.

## Acontece agora
- visão das palestras e eventos online

## Acontece no mapa
- visão das palestras e eventos online

## Atendimento Fraterno / CVV / Valoriza a vida

Permitir que a pessoa obtenha atendimento fraterno
- em função do horário, em função das casas atendidas
- se não tem casa na região, usar os serviços conhecidos:
  - cvv
  - feb escuta
  - sos preces
  De acordo com possibilidades online (no horário do acesso)
- Permitir que a pessoa seja encaminhada a algum atendimento fraterno online

FALE E SEJA ENCAMINHADO			REDIR PARA ATENDIMENTO FRATERNO ONLINE OU 24h
LINKS P/ SERVIÇOS PERMANENTES: CVV, FEB ESCUTA, SOS PRECE			


## Gestão de páginas da cidade
- permitir editar chave valor para coisas que valem somente para uma cidade
- Nº TELEFONE ATENDIMENTO FRATERNO POR CIDADE

## Campanhas
- permitir que à casa crie campanhas 
- Banner gigante
- Similar à evento ???

## Doação
- permitir que à casa solicitar DOAÇÕES ?

## Dicas IA
Mostrar como a casa pode criar coisas com IA

