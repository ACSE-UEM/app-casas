This is the product backlog of the system, and its at 'brainstorm' state.
It must be prioritized, reviewed, classified, improved and enriched, in every major aspect of a public facing system.
Also, it must comply with LGPD (brazilian law similar to GPRD) 

## Adesão das Casas

- toda casa deve ter uma localidade, mesmo as virtuais, pois é através da localidade que se relaciona qual federativa irá servi-la e auxiliá-la.
- permitir inscrição sem email (mas com telefone) p/ facilitar uso de pessoas sem habilidade técnica
- a submissão de um registro provoca uma solicitação de adesão
- a solicitação de adeção de uma casa provoca uma msg que se propaga e encadeia eventos diversos
- webhook de inscrição			Facilitar automação, além daquilo que o plugin oferece
- associação automática de localidade informada com macro-regiões, micro-regiões, municípios

## Background tasks

- geocoding do endereço para coordenadas lat,lng, plus codes
- atualiza consolidação de filtros, contagens, sumários, ...
- 
- 

## Admin space

- manage users
- user's profile
- set user's managed region

### Gestão das Features

Features gerais do app
Espaço para ver quais features estão disponíveis
para cada feature
- permitir ativar/desativar
- configurar

Features das Federativas 
- a partir das features ativadas para o site
- permitir ativar/desativar
- configurar

### Gestão IAM

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

### REDES SOCIAIS DA CASA

- instagram
- youtube
- whatsapp
- facebook
- tiktok

Permite informá-la, e exibir links de compartilhamento para as mesmas


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


### Gestão de Eventos
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

Pode ser exibido como campanha / banner gigante na página da casa


### Gestão de Palestras

Grande parte do trabalho no movimento espírita se ampara na divulgação do mesmo.

As palestras são uma atividade importantíssima nas casas, e merecem atenção especial no que trata da divulgação desse tipo de atividade.

A proposta é:

* criar uma maneira unificada e simples da casa divulgar suas palestras  
* mostrar as próximas palestras na página principal  
* mostrar as próximas palestras na página da Casa  
* mostrar as próximas palestras na página do CRE  
* permitir que essas exibições sejam intuitivas e funcionais

### Próximas palestras da Casa

Ao visitar a página de uma casa, o site irá criar uma renderização baseada no que foi informado para a atividade de palestras públicas

Caso tenha preenchido a URL de dados das palestras, também informará o tema da palestra

### Próximas palestras no estado

Em qualquer página do site, o visitante verá, no topo, um marquee com as próximas palestras e seus temas.

Se as palestras são online, além do texto, haverá um link para direcionar o visitante diretamente ao site da palestra.

Caso tenha preenchido a URL de dados das palestras, também informará o tema da palestra


## Busca
- permitir encontrar casas espíritas por diversos critérios
- tarefa que realiza
- proximidade
- localidade
- macro/micro/municipio
- atendimento fraterno
- aberta agora
- permitir visualizar no mapa/tabela

## Gestão de Assets
- links p/ documentos
- logos
- ...

## Gestão de Temas
Permitir que cada casa escolha seu tema de apresentação
- fixed info
- grid/flex
- widgets enfatizando 
- banner
- sliders
- tickers
- paralax


## Permitir sugerir idéias

- permitir que as casas possam sugerir e votar nas próximas funcionalidades.

## Espaço de Revisores

- qual sua "jurisdição" (federativa/macro/micro)

Notificar imediatamente usando tecnologia mais adequada ao REVISOR da região
NOTIFICAR ADESÃO DE NOVA CASA
- por email
- por chat
- por sms
- por websocket
- por slack,telegram,discord
NOTIFICAR AJUSTE DE CASA

## Integração externa

O app é auto-contido,
mas seus dados podem ser transformados e acessados por lugares diversos para servir a meios diversos

O site será consumido por inúmeros serviços externos
Portanto deve ter camadas acessar dados públicos diversos em formatos seguros com transformação apropriada.

- json-ld
- schema markup
  - casa = ngo
  - evento = event
- opengraph
- rich snippets , breadcrumb
- e.g.: Casas > MG > Belo Horizonte 
- e.g.: Casas > SP > São Paulo

### Wordpress

- Plugin(s) que permita acessar os recursos mencionados e mostrá-los no wordpress
Tais como um sitemap, template, e outros.
Redirecionamento de links.

o sitemap é usado por engines de busca  saber quais links públicos estão disponíveis

### Integração Robots - Schema Markup das casas
Facilitar às engines de busca o reconhecimento do que está sendo representado
- casa espírita => NGO
- eventos => EVENT
- ...

## Espaço das Federativas

Permitir que usuários com permissão de "federativa" possa gerenciar recursos que valem para aquela federativa

- ver um mapa
- se há macro-regiões, quais seus nomes, quais micro-regiões abrangem
- se há micro-regiões, quais seus nomes, quais cidades abrangem

### Espaço da Macro-região

Os usuários com acesso federativo podem ativar macro-regiões para a federativa.

As federativas podem ter órgãos e/ou coordenações que cuidam das macro-regiões do estado.

Gestão de macro-regiões:
- cadastrar macro-regiões
- associar micro-regiões (do estado) às macro-regiões
- a ativação das macro-regiões ativa as micro-regiões

Conjunto de ferramentas e funcionalidades para atender as macro-regiões
- Ativação
- id
- número de ordem
- slug
- Nome
- Informações de contato
- Áreas funcionais
- site
- redes sociais
- quais micro-regiões abrange

As casas de uma determinada localidade serão atendidas pelas macro-regiões que englobam a micro-região que atende a cidade.

Cada macro-região terá várias páginas próprias, que servirá aos diferentes perfis de acesso.


### Espaço da Micro-região

Os usuários com acesso federativo podem ativar micro-regiões para a federativa.

As federativas podem ter órgãos e/ou coordenações que cuidam das micro-regiões do estado.

Gestão de micro-regiões:
- cadastrar micro-regiões
- associar cidades (do estado) às micro-regiões

Conjunto de ferramentas e funcionalidades para atender as micro-regiões
- Ativação
- id
- número de ordem
- slug
- Nome
- Informações de contato
- Áreas funcionais
- site
- redes sociais
- quais municípios abrange

As casas de uma determinada localidade serão atendidas pelas micro-regiões que englobam a cidade.

Cada micro-região terá várias páginas próprias, que servirá aos diferentes perfis de acesso. 

### Espaço da Municipal

Os usuários com acesso federativo podem ativar as 'municipais' para a federativa.

As federativas podem ter órgãos e/ou coordenações que cuidam das regiões municipais do estado.

Gestão de micro-regiões:
- cadastrar micro-regiões
- associar cidades (do estado) às micro-regiões

Conjunto de ferramentas e funcionalidades para atender as micro-regiões
- Ativação
- id
- número de ordem
- slug
- Nome
- Informações de contato
- Áreas funcionais
- site
- redes sociais
- quais municípios abrange

As casas de uma determinada localidade serão atendidas pelas micro-regiões que englobam a cidade.

Cada micro-região terá várias páginas próprias, que servirá aos diferentes perfis de acesso. 





As federativas podem ter órgãos e/ou coordenações que cuidam de municípios.

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


## Acessibilidade
geral:
- garantir acessibilidade mínima
tema da casa
- criação de temas vlibras, contraste, auditiva, visual

## Transparência de dados

- produzir exportação de dados em formato acessível
- json estruturado + visões
- schema markup
- agendas
- mapas

## Camada de renderização != da camada de gestão
Separar área de cadastro da etapa de visualização			Permitir que o cadastro passe por uma etapa de compilação para construir uma renderização melhorada

Dúvidas:
- é suficiente
- instrução para configurar intranet a partir do conhecimento que se tem da casa

## Gestão de voluntariado
no espaço da casa, permití-la informar que está aceitando voluntários	

no espaço da atividade
Quero trabalhar / me candidatar 			Facilitar que as pessoas se voluntariem nas atividades da casa

## Gestão de solicitações
FORM DEMANDAS DA CASA C/ DELEGAÇÃO AUTOMÁTICA			
WIDGET DEMANDAS DA CASA			
Novo campo: SOLICITAÇÕES			Encaminha demandas das casas para órgãos

## LGPD
- permitir solicitação de exclusão de dados
- permitir solicitação de correção de dados
- permitir reportar problema de dados de outras casas 
- cumprir LGPD
- campos do administrador e/ou pessoais não devem ficar visíveis


## Apoio administrativo
- guias de apoio à casa
- renderizado em função das atividades que a casa informa (visível apenas para admin da casa)

## AEO+SEO (ANSWER/SEARCH ENGINE OPTIMIZATION)

Exemplo: 
- \<site>/estado/cidade/\<cidade>
- \<site>/estado/localidade/\<localidade>
- \<site>/estado/orgao/\<slug-macro>/\<id-macro-regiao>
- \<site>/estado/orgao/\<slug-micro>/\<id-macro-regiao>

Facilita encontrar casas por região

DIVULGAÇÃO DAS ATIVIDADES EM FORMATOS VARIADOS			Inspirar o usuário a participar do voluntariado, Espaço de "carrosel" para apresentar atividades das casas espíritas

QR CODE DE DIVULGAÇÃO DA PÁGINA DA CASA			

OBTENÇÃO DE FEEDBACK / DESPERSONALIZAR			Conversar com representantes dos públicos-alvos para que eles indiquem melhorias nos processos, no site, nos documentos.

## Features internos ou técnicos

- Rastreamento de novidades
- Implementar OPENSEARCH SPECIFICATION
- Facilitar que determinados campos sejam preenchidos automaticamente, e com isso, automações possam ser construídas

## Espaço de diagnóstico "local"

Usuários autenticados, com abrangência municipal e acima, podem realizar diagnóstico da região
- fornecer controles ou prompts
- facilitar o diagnóstico regional da IA: federativa/macro/micro/cidade/casa
- Produzir sugestões de projetos e ações a desenvolver com base no conhecimento demográfico da região

## Espaço de estudo/guias/tutoriais
- RELACIONAR INFORMAÇÕES COM CASAS ESPÍRITAS

## Transparência
TRANSPARÊNCIA DAS CASAS EM REVISÃO			

## Acontece 
- agora: visão das atividades offline/online naquele momento
- aqui: visão das atividades/eventos em uma região

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


## Gestão de cidade

- O app deve manter uma base de todas os municipios e distritos do brasil.
- Cada cidade deve também ter o códigos de bases nacionais (como IBGE) para facilitar buscar dados de indicadores nacionais, como população, indice de desenvolvimento e outros
- Cada cidade, em função do estado, está associado a uma federativa.

Se a federativa tem macro-regiões cadastradas, deve existir uma coluna relacionando a cidade com essa informação.

Se a federativa tem micro-regiões cadastradas, deve existir uma coluna relacionando a cidade com essa informação.

Se a federativa tem órgãos municipais, deve existir uma coluna relacionando a cidade com essa informação.

 que serão relacionadas com federativas, macro-regiões 

- permitir editar chave valor para coisas que valem somente para uma cidade


## Dicas IA

Quando um admin/coordenador da casa adicionar novo evento ou atividade, mostrar ao final do cadastro (depois dos dados obrigatórios preenchidos), uma opção para enviar um prompt para IA de maneira a construir a arte para aquele evento.

Ter outros pontos para  Mostrar como a casa pode criar coisas com IA


## Technical stuff

### API

Todos os recursos deverão se amparar num endpoint de api (OpenAPI)

### MCP - Model Context Protocol
MCP do site Casas Espíritas			Permitir a qualquer pessoa buscar informações das casas usando linguagem natural


# Fora do escopo do MVP

Alguns recursos demandarão mais avaliação ou serão atendidos em outros lugares.

## Blog

- artigos descrevendo atividades, tarefas e aprofundamento espiritual
- artigos inspiradores
- dar visão mais abrangente e profunda das tarefas de auxílio 
- Esclarecer, Inspirar, Sustentar os interessados na tarefa


## Doação
- permitir que à casa solicitar DOAÇÕES ?

## Recomendação de Casa

- como público externo posso querer recomendar uma casa espírita pra fazer parte desse site. As equipes regionais podem entrar em contato com a casa e auxiliá-la na inscrição/adesao.


