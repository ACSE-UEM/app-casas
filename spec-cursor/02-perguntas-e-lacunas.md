# Perguntas em aberto e lacunas (efeito “alto nível demais”)

Este documento lista **perguntas que deveriam existir** numa especificação executável, mas que costumam sumir quando o texto permanece genérico. Não são respostas definitivas — são **itens para decisão** com impacto direto em engenharia, UX e compliance.

## A. Identidade, cadastro e revisão

1. **Prova de vínculo com a casa:** além do revisor regional, haverá documento comprobatório obrigatório? Quais tipos são aceitos e por quanto tempo são armazenados (LGPD)?
2. **Casa “virtual”:** critérios exatos para marcar `virtual` vs. física; endereço obrigatório para ambas — como tratar DPO sem endereço público?
3. **Conflito de reivindicação:** duas pessoas reivindicam a mesma casa — qual fluxo (fila, ticket, evidência, prazo máximo)?
4. **Revisor:** é sempre voluntário institucional? Há **limite de fila** por revisor e **substituição** em férias?

## B. Dados pessoais e LGPD

5. **Voluntário “Quero ajudar”:** quais dados são coletados, por quanto tempo, e quem na casa pode ver nome, telefone, e-mail (coordenador só da atividade ou admin global)?
6. **Menores:** atividades infantis/juventude — há coleta de dados de responsáveis apenas? Idade mínima para cadastro na plataforma?
7. **Exportação e exclusão:** prazo de atendimento à solicitação; se a casa recusa apagar dados institucionais, qual arbitragem?
8. **Feedback “despersonalizado”:** quem define regras de anonimização antes de analytics — produto ou DPO?

## C. Conteúdo institucional e moderação

9. **Material doutrinário / jurídico** anexado às atividades: há **moderação pré-publicação** ou apenas denúncia posterior?
10. **Campanhas e doações:** se existirem, são sempre links externos? A plataforma processa pagamento ou só encaminha?
11. **Blog:** conteúdo é só da casa, ou haverá editorial nacional? Quem responde legalmente por um post?

## D. Geografia e hierarquia

12. **Estados sem macro/micro:** como nomear URLs e breadcrumbs de forma consistente sem níveis intermediários?
13. **Mudança de município/CRE:** quando a casa muda de endereço entre regiões, quem revalida e o que acontece com URLs antigas (redirect 301, tempo de cache)?

## E. Busca, mapa e “acontece agora / aqui”

14. **“Aberta agora”:** fonte da verdade é só cadastro manual ou integração futura com calendário/fechamento excepcional?
15. **Mapa:** limites de pins por viewport; agregação em cluster; performance mínima em mobile fraco?

## F. Integrações e IA

16. **MCP / busca em linguagem natural:** o modelo pode inferir dados que não estão no cadastro? Como evitar **alucinação** em contexto sensível (saúde, crise)?
17. **Arte de evento por IA:** licença de uso, crédito, opt-out por federativa; conteúdo proibido (símbolos, pessoas reais)?
18. **WordPress / API pública:** autenticação por API key, OAuth, ou aberto só para leitura? **CORS** e **quotas** por domínio?

## G. Acessibilidade e temas

19. **Temas personalizados da casa:** contraste mínimo garantido pelo sistema (bloqueio de combinações) ou apenas recomendação?
20. **VLibras e terceiros:** quem hospeda o script; política de privacidade unificada?

## H. Métricas e transparência

21. **“Transparência das casas em revisão”:** o que é público (nome, cidade, status) vs. oculto, e por quanto tempo após aprovação?
22. **Censo / demografia regional:** agregação mínima para não reidentificar casos pequenos (k-anonymity)?

## I. Priorização

23. **MVP:** lista fechada de épicos para primeiro release; o que é explicitamente **fora** (ex.: doações, blog, campanhas)?
24. **Indicadores de sucesso:** exemplo — tempo médio de revisão, % casas com atividades atualizadas no trimestre, taxa de erro em dados reportados pelo público.

---

**Uso sugerido:** transformar cada pergunta em item de workshop ou RFC curta, com **responsável** e **data alvo**. Isso compensa a concisão da primeira rodada de especificação sem perder a clareza da `spec-revised`.
