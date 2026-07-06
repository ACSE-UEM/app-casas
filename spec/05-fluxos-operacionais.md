# 5. Fluxos Operacionais

Processos humanos e automáticos que sustentam a integridade da base. Estados da Casa:
ver `02` §2.7. Papéis: ver `04`.

## 5.1. Adesão de uma Casa

1. Qualquer pessoa preenche o cadastro público (dados mínimos de `02` §2.1.1;
   conta com telefone verificado).
2. O sistema executa em segundo plano: geocodificação do endereço; vínculo
   cidade → município IBGE → órgãos regionais → federativa; atualização de
   consolidações (filtros, contagens, sumários); disparo de webhooks
   (`casa.registrada`) quando o item 7.3 for promovido (D18).
3. A casa entra em **pendente de revisão**: sem indexação SEO, fora do mapa,
   transparência limitada (nome + cidade + status).
4. O(s) Revisor(es) da jurisdição são notificados imediatamente — **Web Push** via
   PWA como canal primário (D17), e-mail + painel garantidos; WhatsApp/SMS se a
   federativa configurar.
5. O Revisor valida por conhecimento local e contato direto — **sem documento
   obrigatório** — e aprova, rejeita ou devolve para ajuste, com justificativa
   auditada. A ausência de exigência documental é intencional, não uma lacuna:
   o produto não exige comprovação formal de filiação federativa como condição de
   aprovação (A14).
6. Aprovada, a casa torna-se **ativa**: entra no sitemap, mapa e buscas; webhook
   `casa.aprovada`.

**SLA de revisão (meta provisória):** 15 dias corridos. A fila de cada revisor é
visível à federativa, que pode remanejar jurisdições ou designar substitutos
(férias/ausência). Filas acima do SLA geram alerta à federativa.

## 5.2. Alterações críticas

Alterações de campos críticos de casa ativa (nome, cidade, endereço, status virtual)
entram em estado de rascunho pendente e passam pelo mesmo fluxo de revisão leve do
§5.1 (notificação ao revisor; a versão anterior permanece pública até aprovação).
Alterações não críticas (agendas, descrições, contatos de atividades) publicam
imediatamente — modelo de moderação pós-publicação (§5.4).

## 5.3. Recertificação anual

- A cada **12 meses** da última confirmação, o admin recebe lembretes automáticos
  ("A casa ainda está ativa? Os horários continuam válidos?") por e-mail/WhatsApp.
- Confirmação em um clique (com login) renova o ciclo.
- Sem confirmação após a sequência de lembretes (3 tentativas em 60 dias), a casa
  recebe selo público "dados possivelmente desatualizados" e prioridade na fila do
  revisor para contato ativo. Persistindo o silêncio por mais 6 meses, o revisor pode
  movê-la para **inativa**.

## 5.4. Moderação de conteúdo (pós-publicação)

- O conteúdo publicado pela casa (descrições, materiais, links) é de **inteira
  responsabilidade da casa**.
- Todo perfil exibe **"Reportar erro/conduta"**; denúncias roteiam ao Revisor da
  jurisdição com fila e prazos (meta provisória: primeira resposta em 7 dias,
  resolução em 30).
- Detecção automática (rótulo `avaliar bem`, item 8.2): sinalização de cadastros com
  padrão de spam ou descrições incompatíveis com a taxonomia espírita, para triagem
  humana — nunca remoção automática.
- Medidas do Revisor: contato com a casa, solicitação de ajuste, despublicação do
  item, escalada à federativa (casos doutrinários ou legais).

## 5.5. Disputa de propriedade (reivindicação de perfil)

Cenário: representante legítimo afirma que a casa foi cadastrada por terceiro não
autorizado.

1. Reivindicação aberta pelo formulário LGPD/reivindicação (ver `07`), criando um
   ticket para o Revisor da jurisdição; a casa entra em estado **em disputa**
   (permanece pública, com edições suspensas).
2. O Revisor contata as duas partes. Se o contato não resolver, solicita comprovação
   documental simples (ata de diretoria, estatuto, declaração assinada).
3. Decisão do Revisor: transferir posse (novo Admin de Casa), manter, ou inativar o
   perfil. Tudo auditado.
4. **Recurso:** qualquer parte pode recorrer à federativa (decisão final).
5. **Prazo-alvo:** 15 dias para a decisão de primeira instância.
6. Documentos recebidos são retidos apenas até o desfecho + 90 dias, depois excluídos
   (ver `07`).

## 5.6. Mudança de endereço / região

1. Alteração de cidade/endereço é alteração crítica (§5.2) — revalidação pelo Revisor
   da **nova** jurisdição.
2. O sistema refaz os vínculos município → órgãos → federativa e as consolidações.
3. URLs antigas de cidade/órgão respondem **301** para as novas (ver `06`); o slug da
   casa não muda por mudança de endereço.
4. Órgãos de origem e destino são notificados.

## 5.7. Solicitações das casas

Casa preenche formulário de demanda (apoio jurídico, doutrinário, treinamento…);
delegação automática ao órgão da jurisdição mais próximo com a área correspondente;
widget de acompanhamento nos dois lados; escalada manual ao nível acima quando não
atendida (meta provisória de primeira resposta: 15 dias).

## 5.8. Solicitações LGPD

Fluxos de titular (exclusão, correção, exportação, revogação de consentimento) e de
reivindicação de perfil: prazo de resposta **15 dias**; detalhes, bases legais e
arbitragem em [07-lgpd-privacidade.md](07-lgpd-privacidade.md).

## 5.9. Capacitação e comunidade

- Treinamento de Revisores e Admins de Casa (segurança de dados, manutenção da base) —
  materiais curtos ("shorts") por tarefa.
- Canal de dúvidas por e-mail institucional da federativa (padrão MG:
  `casas@uemmg.org.br`).
- Conselho de federativas valida evoluções da taxonomia de áreas (ver `09`).
