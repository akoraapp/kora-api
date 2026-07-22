# AKORA — Plataforma Operacional para Criadores de Conteúdo

## Visão Geral

A AKORA é um SaaS completo — o "sistema operacional" do criador de conteúdo — que centraliza em um único lugar tudo que hoje fica espalhado em Notion, Google Agenda, WhatsApp, planilhas e apps financeiros: gestão de clientes/marcas (CRM), produção de conteúdo, calendário editorial, geração de contratos, precificação, finanças, TikTok Shop, métricas de performance e programa de indicação — com módulos de IA integrados em pontos estratégicos do fluxo de trabalho.

Público-alvo: UGC creators, influenciadores, criadores de conteúdo, social media freelancers, videomakers, fotógrafos, gestores de conteúdo e profissionais de marketing que trabalham com marcas — no Brasil e internacionalmente (EUA, Canadá, Reino Unido, União Europeia, México, Argentina).

Existem duas versões da interface, construídas a partir da mesma lógica de dados e das mesmas regras de negócio:
- **Mobile**: navegação por barra inferior (bottom tab bar), modais em bottom sheet.
- **Desktop**: navegação por sidebar fixa lateral (estilo Notion), modais em diálogo centralizado, grids adaptativos que aproveitam telas largas.

---

## 1. Identidade Visual (Design System — seguir à risca, sem exceções)

**Personalidade da marca**: elegância, organização, sofisticação, minimalismo, acolhimento, confiança, alta qualidade, interface limpa, aparência premium. Inspiração: Apple + Notion + Linear, com personalidade própria. Nunca usar elementos chamativos, exagerados ou infantis. Evitar gradientes fortes, sombras pesadas, excesso de informação. A interface deve "respirar" — bastante espaçamento.

### Paleta de cores

**Marrom (cor principal da marca)**
- 50: `#F4EFEA`
- 100: `#E8DDD9`
- 200: `#C4A098`
- 300: `#A0736B`
- 500: `#7A4E48`
- 600: `#4A2E2A` (principal — logo, botões primários, títulos, navegação ativa)
- 800: `#2D1C19`
- 900: `#1F1918`

**Coral (accent — usar só para alertas, CTAs secundários, badges, indicadores)**
- 50: `#FDF0EE` · 100: `#F9D0C8` · 200: `#F2A898` · 400: `#E87C66` · 500: `#D85E46` · 600: `#B84030` · 800: `#7A2016`

**Interface**
- Background principal: `#FAF8F6`
- Cards: `#FFFFFF`
- Surface (fundo alternativo/hover): `#F4EFEA`
- Texto principal: `#2D1C19`
- Texto secundário: `#8A6E68`
- Texto muted: `#B8A09C`
- Borda padrão: `#E0D6D0` (sempre 1px, nunca grossa)
- Borda forte: `#C4A098`
- Sucesso: `#5D8A5A` · Aviso: `#C28A3D` · Perigo/Coral: `#C75B5B`

### Tipografia
- **Títulos/headers/hero**: Playfair Display, peso 700. Nunca usar em textos longos.
- **Interface (menus, botões, tabelas, cards, formulários, labels)**: Inter, pesos 400/500/600/700.

### Componentes
- Cards: fundo branco, `border-radius: 20px`, padding generoso, borda 1px `#E0D6D0`, sombra extremamente suave.
- Botão primário: fundo `#4A2E2A`, texto branco, hover `#7A4E48`, radius 12px, sem sombra pesada.
- Botão secundário: fundo branco, borda `#E0D6D0`, texto `#4A2E2A`.
- Botão de destaque: `#D85E46`.
- Inputs: fundo branco, borda `#E0D6D0`, radius 12px; foco → borda `#4A2E2A`.
- Espaçamento em escala consistente: 4 / 8 / 12 / 16 / 20 / 24 / 32 / 40 / 48 / 64px.
- Ícones: estilo outline, stroke 1.8 (padrão Lucide), nunca coloridos.
- Animações: 150–250ms, hover discreto, fade/slide/scale pequeno — nunca exagerado.
- Badges de status com cores por categoria (ex.: Lead = neutro, Negociação = coral claro, Contrato Enviado = âmbar, Assinado = verde claro, Em Produção = marrom claro, Finalizado = marrom sólido).

---

## 2. Navegação

### Mobile — bottom tab bar (5 itens fixos)
`Início` · `Clientes` · `Conteúdo` · `Financeiro` · `Mais`
- Botão "+" flutuante (FAB) no canto inferior, que abre o formulário de criação relevante à aba atual.
- "Mais" contém: Performance, Creator Rewards (ambos com submenu "voltar").

### Desktop — sidebar fixa lateral (estilo Notion, 7 itens principais, SEM hub "Mais")
`Início` · `Clientes` · `Conteúdo` · `Financeiro` · `Performance` · `Creator Rewards` · `Configurações`
- Logo "AKORA" no topo da sidebar.
- Rodapé da sidebar com avatar + nome do usuário, clicável → leva à aba Configurações.
- Configurações é uma aba de página inteira (não modal) no desktop.
- Modais em diálogo centralizado (não bottom sheet), largura máx. ~560px.
- Conteúdo principal centralizado em largura confortável de leitura (~1040px) mesmo em telas ultra largas.

Topo de cada tela (topbar): saudação "Olá, [Nome]" + subtítulo contextual, sino de notificações (com badge numérico) e avatar clicável.

---

## 3. Módulos e Funcionalidades Detalhadas

### 3.1 Início (Dashboard)
- Saudação personalizada + sino de notificações inteligentes (ver seção 5).
- Cards: Receita do mês (valor real, calculado das transações pagas), Pagamentos pendentes (valor + contagem).
- Card "Sai hoje": lista os conteúdos cujo prazo é exatamente hoje, com plataforma/cliente/status.
- Card "Meta do mês": grande, destacado, cor de marca — mostra valor da meta definida pelo usuário e % já atingido (barra de progresso); clicável para editar a meta a qualquer momento (nunca mostrar meta fixa/hardcoded).
- Ações rápidas (botões grandes e centralizados no desktop): Novo Cliente, Novo Conteúdo, Novo Lançamento, IA Studio — cada um leva direto para o formulário/sub-aba certa.
- Painel de Conteúdo: filtro por status (Criados / Entregues / Pendentes de aprovação, com contador em cada) + filtro por Plataforma + filtro por Nicho (listas fixas de opções, não dependentes dos dados já cadastrados) — lista os conteúdos que batem com os filtros.
- Resumo financeiro (entradas, saídas, saldo líquido do mês).
- Lista de clientes ativos.

### 3.2 Clientes (CRM)
Dashboard no topo com 5 estatísticas: Marcas ativas, Negócios ativos, Contratos pendentes, **Contratos fechados** (contagem de contratos gerados/salvos), Pagamento pendente (soma de valores pendentes).

Duas sub-abas:
- **Marcas**: lista de clientes com filtro por status (Lead, Negociação, Contrato Enviado, Assinado, Em Produção, Finalizado). Cada card mostra nome, campanhas ativas, valor pendente, badge de status.
- **Contratos**: lista todos os contratos já gerados (de todos os clientes), com data e nome do cliente; botão "Gerar contrato com IA" que primeiro pede pra escolher o cliente.

**Cadastro de cliente**: nome da marca/agência, e-mail, telefone, Instagram, **Plataforma da parceria** (ver lista abaixo — importante: é o canal/marketplace por onde o negócio é fechado e pago, pode ser diferente da rede social onde o conteúdo é publicado), status do funil, observações.

Lista de opções de "Plataforma da parceria" (creator marketplaces usados no Brasil, EUA, Europa, Canadá): Negociação direta (sem plataforma), TikTok Creator Marketplace / TikTok Shop, Instagram/Meta Brand Collabs, YouTube BrandConnect, GRIN, Aspire (AspireIQ), Creator.co, Mavely, LTK (LikeToKnow.it), ShopMy, Levanta, CreatorIQ, Later Influence, Afluencer, Heartbeat, Amazon Influencer Program, Agência de talentos, Outro.

**Perfil do cliente** (tela de detalhe): dados de contato, badge da plataforma da parceria, stats (campanhas ativas + total, pendente de pagamento — as duas informações juntas), botão "Gerar contrato com IA", lista de contratos gerados para esse cliente, conteúdos vinculados, lançamentos financeiros vinculados. Editar/excluir cliente.

**Gerador de Contrato com IA** — requisito central: o contrato tem que ser juridicamente válido, adaptando os campos e o texto ao país/jurisdição correspondente à moeda selecionada nas Configurações (não presumir Brasil por padrão). Campos do formulário: nome/razão social do criador, documento fiscal apropriado ao país (ver tabela abaixo), endereço completo, e-mail; dados equivalentes do cliente (nome, documento, endereço, e-mail — puxados automaticamente do cadastro); descrição do conteúdo, entregáveis, plataformas, direitos de uso, exclusividade, política de revisão, condições de pagamento, prazo de entrega, multa por atraso, política de cancelamento, foro/jurisdição, valor total (na moeda selecionada).

Tabela de documento fiscal por moeda/país:

| Moeda | País | Documento |
|---|---|---|
| BRL | Brasil | CPF ou CNPJ |
| USD | Estados Unidos | SSN ou EIN (Tax ID) |
| CAD | Canadá | SIN ou Business Number (BN) |
| GBP | Reino Unido | UTR ou Company Number (CRN) |
| EUR | União Europeia | VAT Number / Tax ID |
| MXN | México | RFC |
| ARS | Argentina | CUIT/CUIL |

O prompt de sistema da IA deve instruir a gerar um Contrato de Prestação de Serviços de Criação de Conteúdo contendo obrigatoriamente: 1) qualificação completa das partes; 2) objeto do contrato; 3) entregáveis e prazos; 4) valor e forma de pagamento; 5) direitos de uso e propriedade intelectual; 6) cláusula de exclusividade; 7) obrigações de cada parte; 8) confidencialidade; 9) multa por atraso e rescisão; 10) foro/jurisdição compatível com o país informado; 11) espaço para assinatura de ambas as partes (e testemunhas, se costume local). Resultado exibido em área editável, com opções de copiar ou salvar vinculado ao cliente.

**Avanço automático de status com confirmação**: ao salvar um contrato para um cliente que ainda está em "Lead" ou "Negociação", perguntar se quer avançar o status para "Contrato Enviado" (sim/manter como está) — nunca forçar automaticamente sem confirmação.

### 3.3 Conteúdo (hub de criação)
4 sub-abas internas: **Fluxo** · **Ideias** · **IA Studio** · **Preço**.

**Fluxo**:
- Calendário mensal no topo (estilo Notion) — cada dia mostra até 2 títulos de conteúdo em miniatura (chip) direto na célula, com "+N" se houver mais, e destaque colorido para conteúdos já publicados. Navegação entre meses.
- Clicar num dia **vazio** abre direto o formulário de criar conteúdo com a data pré-preenchida.
- Clicar num dia **com conteúdo** abre um modal com a lista daquele dia, permitindo editar status rapidamente (dropdown por item), editar completo ou excluir, e adicionar mais um conteúdo para o mesmo dia.
- Abaixo do calendário: "Toda a grade de conteúdo" — lista completa agrupada por etapa (Ideia, Roteiro, Gravação, Edição, Enviado, Aprovado, Publicado), com **filtro por etapa** (chips: Todos + cada etapa) para visualizar só uma fase por vez, e **seletor de status rápido** por item (dropdown inline, sem precisar abrir edição completa).
- Cadastro de conteúdo: título, plataforma, formato (Reels/Carrossel/Foto/Vídeo/Story/Outro), nicho, prazo, cliente vinculado, etapa, opção de vincular a uma ideia já existente do banco (autopreenchendo título/plataforma/nicho/formato).

**Ideias (banco de ideias)**: título, plataforma, formato, nicho, link de referência, descrição, prioridade (Baixa/Média/Alta). Filtro por nicho. Botão "Converter em conteúdo" (marca a ideia como convertida e cria o item correspondente em Fluxo).

**IA Studio** — 3 ferramentas com geração real via IA:
1. **Gerador de Roteiro**: tema, idioma (PT/EN/ES), tipo de conteúdo, objetivo (Vender/Educar/Engajar/Entreter/Viralizar), duração, plataforma, nicho (lista fixa de nichos), marca vinculada (opcional), **estilo de fala** (Voice over/narração, Falado direto para câmera/talking head, Estilo vlog/dia a dia, Review/Análise de produto, Tutorial passo a passo, Unboxing — categorias validadas do mercado de UGC/creator briefs). Gera roteiro estruturado (gancho, desenvolvimento, CTA), editável, com opção de criar conteúdo direto a partir dele.
2. **Brand Assistant**: monta briefing de campanha pra apresentar à marca — marca vinculada (opcional), objetivo da campanha (lista fixa: reconhecimento, vendas, lançamento, engajamento, fidelização, educação, tráfego, outro), público-alvo, mensagem principal, entregáveis, tom de voz. Gera briefing estruturado (visão geral, público, mensagem-chave, entregáveis, tom, cronograma sugerido).
3. **Content Creator**: gera legenda/post para perfil pessoal ou marca — propósito, marca (opcional), objetivo (lista fixa: atrair seguidores, vendas, engajamento, educar, marca pessoal, viralizar), plataforma, idioma, assunto, tipo de conteúdo (Legenda/Ideia de roteiro/Stories/Carrossel/Ideia de vídeo/Post longo), tom (lista fixa de 8 tons), estilo de entrega (mesma lista do Gerador de Roteiro), toggle de CTA. Gera texto + 5 hashtags.

**Preço (Pricing Engine)** — calculadora determinística com resultado no estilo "Market Evaluation":
- Campos: faixa de seguidores (Menos de 1K, 1K–10K, 10K–50K, 50K–100K, 100K–500K, 500K+), estilo de conteúdo (UGC, Tutorial, Social Content, Lifestyle, Aesthetic Demo, Unboxing, Testimonial, Entretenimento), plataforma, quantidade, complexidade (Basic/Semi/Advanced Production, com descrição de cada), direitos de uso (Organic Only, Paid Ads 30/60/90 dias, Unlimited Distribution), prazo de entrega (Standard 7 dias / Priority Rush 72h / Critical 24h), toggles de roteiro incluso/voice over/raw files/edição/retainer mensal.
- Todos os textos das opções (complexidade, direitos de uso, prazo) mudam de idioma conforme configurado (PT/EN/ES).
- Resultado: valor sugerido + faixa recomendada (min–max), breakdown do cálculo, "Negotiation Impact Matrix" mostrando o impacto percentual de cada fator (direitos de uso, prazo, complexidade), com ações: Gerar Proposta (com seletor de moeda), Gerar Contrato (leva pro fluxo de contrato do cliente), Criar Negócio, Salvar Estimativa.

### 3.4 Financeiro
- Card fixo em destaque sempre visível: **Receita deste mês (atual)**, independente do filtro selecionado.
- Sub-abas: **Geral** e **TikTok Shop**.
- **Geral**: filtro por Ano (2026–2030) e Mês (Todos ou específico). Gráfico de barras mensal (receita em verde vs. despesa em coral) do ano selecionado, com o mês filtrado destacado e os demais esmaecidos. Cards de Receita/Despesas do período filtrado, Lucro líquido, lista de lançamentos.
- Cadastro de lançamento: descrição, tipo (Receita/Despesa), valor (na moeda configurada), data, status (Pendente/Pago), cliente vinculado, **forma de pagamento** (lista que muda conforme idioma — em PT inclui Pix, cartão, boleto, transferência, dinheiro, PayPal, Stripe; em EN/ES não inclui Pix, só as opções internacionais), **plataforma da parceria** (mesma lista do cadastro de cliente, pré-preenchida automaticamente ao selecionar o cliente, mas editável).
- **TikTok Shop**: sub-abas Produtos (cadastro com categoria em lista fixa: Beleza, Moda, Casa e Decoração, Eletrônicos, Fitness, Alimentação, Pets, Bebê e Maternidade, Acessórios, Saúde e Bem-estar, Outro; comissão, vendas, ganhos, link), Links (lista de links de afiliado com copiar rápido), Performance (ranking de produtos por vendas), Ganhos (total e por produto).
- Todos os valores em qualquer parte do financeiro respeitam a moeda selecionada nas Configurações.

### 3.5 Performance (rastreamento manual — sem OAuth ainda)
- Filtro por plataforma (Instagram/TikTok/YouTube).
- Registro manual de métricas: seguidores, views, curtidas, comentários, compartilhamentos, salvamentos, data.
- Cálculo automático: crescimento desde a última medição, views totais, engajamento médio.
- Histórico editável/excluível.
- Observação de produto: integração automática via API oficial das redes é trabalho futuro (exige backend real, aprovação de app em cada plataforma, armazenamento seguro de tokens) — não fake, nunca inventar dado.

### 3.6 Creator Rewards (programa de indicação)
- Código e link de indicação únicos, gerados automaticamente (nome + sufixo aleatório), com botões de copiar.
- Contadores: Convidados, Cadastrados, Assinantes Ativos.
- Regras de recompensa: 4 indicações ativas → 1 mês grátis; 8 → 2 meses grátis; 12 → Selo Premium. Barra de progresso até o próximo nível.
- Registro manual de indicações (nome, status: Convidado/Cadastrado/Assinante Ativo, data) — sem dado fake, começa zerado.

### 3.7 Configurações
- Nome/negócio, documento fiscal (rótulo dinâmico conforme moeda/país — ver tabela da seção 3.2), e-mail, endereço completo.
- Idioma do app (Português/Inglês/Espanhol) — afeta os textos da Calculadora de Preço e do Gerador de Roteiro/Content Creator.
- Moeda padrão (BRL, USD, CAD, EUR, GBP, MXN, ARS) — afeta todos os valores exibidos no app e o rótulo de documento fiscal usado nos contratos.
- Meta de receita mensal.

---

## 4. Assistente de IA nas Notificações (sino)

O sino não é decorativo — ao clicar, abre um painel "Assistente AKORA" que:
1. Calcula notificações reais a partir dos dados do usuário (nunca fake): conteúdo atrasado (prazo passado, ainda não publicado), entregas nos próximos 3 dias, pagamentos pendentes, contratos aguardando resposta do cliente (status "Contrato Enviado").
2. Envia esses dados reais para a IA, que responde num tom de assistente pessoal, acolhedor e direto, priorizando o mais urgente — máximo 3 frases.
3. Mostra a lista detalhada de cada pendência logo abaixo do resumo da IA.
4. Badge numérico no ícone do sino com a contagem total de pendências.

---

## 5. Integração com IA

Todas as funcionalidades de IA (Gerador de Roteiro, Brand Assistant, Content Creator, Gerador de Contrato, Gerador de Proposta, Assistente de Notificações) devem usar uma chamada real a um modelo de linguagem (ex.: Anthropic Claude ou equivalente) via API — nunca simular ou usar texto de template estático. Cada chamada deve ter um `system prompt` especializado na tarefa (roteirista, assistente jurídico, estrategista de marketing, etc.) e um prompt de usuário construído dinamicamente a partir dos campos preenchidos no formulário. Resultado sempre exibido em área editável (contenteditable), com botão de copiar e, quando aplicável, botão de salvar vinculado à entidade correspondente (cliente, conteúdo).

---

## 6. Modelo de Dados (entidades principais)

- **profile**: name, doc (documento fiscal), email, address.
- **settings**: language (pt/en/es), currency (BRL/USD/CAD/EUR/GBP/MXN/ARS), goal (meta mensal), referralCode.
- **clients**: id, name, contact, phone, instagram, dealPlatform, status, notes.
- **content**: id, title, platform, format, niche, client, status, dueDate, script.
- **ideas**: id, title, platform, format, niche, referenceLink, description, priority, converted.
- **transactions**: id, description, type (Receita/Despesa), amount, date, status (Pendente/Pago), client, method (forma de pagamento), dealPlatform.
- **tiktok** (produtos afiliados): id, product, category, commission, sales, earnings, link.
- **contracts**: id, clientId, text, createdAt.
- **estimates** (calculadora de preço salva): id, date, total, style, platform, qty.
- **performance**: id, platform, date, followers, views, likes, comments, shares, saves.
- **referrals**: id, name, status, date.

Todos os dados devem persistir de verdade (nunca resetar ao recarregar) e nunca exibir informação fictícia — todo módulo começa vazio e só mostra o que o usuário realmente cadastrou.

---

## 7. Regras de UX obrigatórias

- Nenhum menu duplicado, nenhuma página duplicada, nenhum botão falso, nenhum placeholder sem função.
- Todo botão precisa funcionar de verdade; todo formulário precisa salvar de verdade; todo dashboard precisa atualizar automaticamente ao mudar os dados.
- Módulos ainda não implementados (ex.: integração real de redes sociais) devem ser sinalizados honestamente como manuais/futuros — nunca fingir uma funcionalidade que não existe.
- Toda tela deve seguir exatamente a paleta, tipografia e espaçamento definidos na seção 1 — nunca criar um estilo visual diferente em componentes novos.
- Experiência rápida, minimalista, elegante, com hierarquia visual forte e sensação de calma — como Apple, Notion, Linear, Raycast, Arc Browser.

---

## 8. Stack técnico sugerido

Frontend: React + TypeScript (ou equivalente); Styling: Tailwind CSS ou CSS com variáveis customizadas seguindo a paleta acima; Componentes: shadcn/ui; Backend: Supabase (PostgreSQL); Autenticação: Supabase Auth (Email, Google, Apple); Storage: Supabase Storage; IA: Anthropic Claude API (ou OpenAI/Gemini, configurável); Gráficos: Recharts ou SVG/CSS nativo; Formulários: React Hook Form + Zod; Internacionalização: EN-US, PT-BR, ES; Multi-moeda: USD, EUR, GBP, BRL, CAD, MXN, ARS; Arquitetura responsiva (mobile com bottom tab bar + desktop com sidebar, conforme seção 2).
