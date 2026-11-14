# Plano de Tradução ptBR - Social Diary

## Status Atual

A tradução para Português (Brasil) está **parcialmente completa**, cobrindo as seguintes áreas principais:

- ✅ `Grammar.lua` - Gramática completa (funcionalidades de plural, concordância, etc.)
- ✅ `Misc.lua` - Interface básica do jogo e controles
- ✅ `Windows.lua` - Janelas, popups e notificações (toasts)
- ✅ `Journey.lua` - Páginas de jornada, placas e descrições narrativas

## O que Falta Traduzir

### 1. Arquivo `Locale.lua` (Falta Criar)

Arquivo principal que contém as traduções gerais. Precisa ser criado com conteúdo similar ao `enUS.lua`, contendo:

#### Blocos de Conteúdo a Traduzir:

**UI/Words/Format.lua** (linhas ~1660-1790)
- Nomes de meses em português completo e abreviado
- Dias da semana em português completo
- Formatação de datas curtas
- Relações temporais ("hoje", "ontem", "há X dias")
- Referências a partidas anteriores

**UI/Words/Person.lua** (linhas ~1747-1790)
- Mensagens sobre pessoas sem nota ainda
- Informações de nível e última vez vista
- Duração conjunta ("juntos por X tempo")
- Regras de retenção de estranhos
- Links para páginas de pessoas

**UI/Words/Timeline.lua** (linhas ~1791-1936)
- Eventos de grupo, raids e dungeons
- Formas de morte com causas específicas
- Interações (troca, chat, caça)
- Progressão de nível em conjunto
- Destaques de descobertas

### 2. Arquivos que Precisam Adicionar Conteúdo

Estes arquivos já existem mas **falam inglês** em seu conteúdo atual:

#### Arquivos a Preencher:

1. **`Locale.lua`** - Principal, contém todas as strings gerais
   - ~1937 linhas no enUS.lua precisam ser localizadas

2. **`Words.lua`** (não listado na estrutura atual)
   - Formatação de datas e nomes
   - Informações de pessoas vistas
   - Linhas do timeline

### 3. Estratégia de Trabalho

#### Fase 1: Criar `Locale.lua` com traduções básicas
- Traduzir todos os meses, dias da semana
- Formatações de data padronizadas
- Mensagens de interface genérica

#### Fase 2: Preencher `Words.lua` (se necessário)
- Se o addon exigir um arquivo separados para palavras formatadas
- Caso contrário, integrar em `Locale.lua`

#### Fase 3: Tradução Sistemática por Área

Prioridade sugerida (do mais usado ao menos usado):

**Alta Prioridade:**
1. Mensagens de timeline e eventos recentes
2. Informações de pessoas ("Quem você encontrou")
3. Regras de retenção e esquecimento
4. Formatação de datas em tooltips

**Média Prioridade:**
5. Descrições de partidas e batalhas
6. Nomes de locais (se não vindos do jogo)
7. Mensagens de introdução

**Baixa Prioridade:**
8. Textos narrativos longos ("Your Diary" page)
9. Exemplos na guia "Credits"
10. Mensagens raras/especiais

## Checklist de Implementação

### 1. Criar Arquivo `Locale.lua` em ptBR

```lua
-- Portuguese (Brazil): strings gerais e formato das linhas do diário.
local addonName, ns = ...
if not ns.Locale.Is("ptBR") then return end

ns.Locale.Add("ptBR", {
    -- UI/Words/Format.lua - Datas e dias
    ["January"] = "Janeiro",
    ["February"] = "Fevereiro",
    ["March"] = "Março",
    -- ... (continua para todos os meses)
    
    ["April"] = "Abril",
    ["May##short"] = "Mai",  -- Abreviação
    ["June"] = "Junho",
    ["July"] = "Julho",
    ["August"] = "Agosto",
    ["September"] = "Setembro",
    ["October"] = "Outubro",
    ["November"] = "Novembro",
    ["December"] = "Dezembro",
    
    -- Dias da semana
    ["Monday"] = "Segunda",
    ["Tuesday"] = "Terça",
    ["Wednesday"] = "Quarta",
    ["Thursday"] = "Quinta",
    ["Friday"] = "Sexta",
    ["Saturday"] = "Sábado",
    ["Sunday"] = "Domingo",
    
    -- ... (continua com todo o restante do enUS.lua)
})
```

### 2. Traduzir UI/Words/Format.lua

Se este módulo não existir em ptBR, criar junto com `Locale.lua`:

- Nomes de meses abreviados: "Jan", "Feb", etc. → "jan", "fev", etc.
- Dias da semana abreviados
- Formatos de data curta (dia mesc ano)
- Relações temporais ("hoje", "ontem", "há X dias/semanas")
- Números de mortes/trocas/chat/caminhos cruzados

### 3. Traduzir UI/Words/Person.lua

- Mensagens iniciais para pessoas sem nota
- Informações básicas (nível, última vez vista)
- Tempo juntas em conjunto
- Regras de retenção ("Estranhos são esquecidos após")
- Botões e ações ("Adicionar ao diário", "Ver sua página")

### 4. Traduzir UI/Words/Timeline.lua

- Eventos do timeline (grouped, raided, hunted, etc.)
- Formas de morte detalhadas
- Interações em dungeons/raids
- Progressão de níveis juntos
- Destaques e curiosidades

## Dicas para a Tradução

### Voz e Estilo (Baseado no guia existente)
A tradução deve seguir as decisões de voz documentadas em:
`.claude/skills/translate/voices/ptBR.md`

**Princípios:**
- Usar linguagem natural em português do Brasil
- Manter o tom narrativo/poético onde aplicável
- Respeitar estruturas de pluralidade (1 vs outros)
- Adaptar expressões idiomáticas quando necessário

### Formatação Específica

#### Pluralização
O `Grammar.lua` já está configurado com:
```lua
G.PluralForm = function(n) return n == 1 and 1 or 2 end
```

Isso significa que:
- Números terminando em 1 → singular (exceto "21", "31", etc.)
- Zero e outros números → plural
- A estrutura `|...##plural` no código já separa as formas

#### Variáveis de Template
Mantenha todas as variáveis `%d`, `%s`, `%1$s`, etc. intactas nas traduções.

Marcadores como:
- `##zone` - zona/local
- `##plural` - controle de plural
- `##match`, `##death`, etc. - marcadores contextuais
- `|...` - separador de formas plurais

### Testes Necessários

Após cada bloco de tradução:
1. Verificar que todas as variáveis foram mantidas
2. Confirmar que o plural está correto para o ptBR
3. Testar visualmente no jogo (se possível)

## Cronograma Sugerido

**Semana 1:** Criar `Locale.lua` com estrutura básica e formatos de data
- Dias da semana, meses
- Formatações temporais básicas
- Mensagens de interface comum

**Semana 2:** UI/Words/Format.lua e UI/Words/Person.lua
- Tradução completa das palavras formatadas
- Informações de pessoas
- Tooltip text

**Semana 3:** UI/Words/Timeline.lua
- Eventos do timeline
- Interações e mortes
- Destaques especiais

**Semana 4:** Revisão e ajustes finos
- Testes completos
- Ajustes de voz/estilo
- Correção de inconsistências

## Arquivos Atuais vs. Necessários

### ✅ Já existe (completo ou parcialmente):
- `Locale/Grammar.lua` - Gramática funcional
- `Locale/Misc.lua` - Interface básica
- `Locale/Windows.lua` - Janelas e notificações
- `Locale/Journey.lua` - Páginas de jornada

### ❌ Falta (ou precisa de expansão):
- `Locale/Locale.lua` - **PRECISA SER CRIADO** (~1900 linhas)
- `Locale/Words.lua` - **VERIFICAR NECESSIDADE** (podem estar em Locale.lua)

## Resumo Rápido

| Arquivo | Status | Linhas Atraduzir | Prioridade |
|---------|--------|------------------|------------|
| Grammar.lua | ✅ Completo | 0 | — |
| Misc.lua | ✅ Parcialmente | ~20% | Baixa |
| Windows.lua | ✅ Completo | 0 | — |
| Journey.lua | ✅ Completo | 0 | — |
| **Locale.lua** | ❌ FALTA | ~1937 | **CRÍTICA** |
| Words/* | ❓ Verificar | Vários blocos | Média |

## Próximos Passos Imediatos

1. [ ] Criar `Locale/Locale.lua` com estrutura completa
2. [ ] Traduzir todos os nomes de meses e dias da semana
3. [ ] Traduzir formatações de data básicas
4. [ ] Testar funcionalidade no jogo
5. [ ] Continuar blocos prioritários

---

*Última atualização: Conforme análise do repositório atual*  
*Baseado em enUS.lua total de ~1937 linhas*
