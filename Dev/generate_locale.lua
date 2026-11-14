-- Script para gerar tradução do enUS para ptBR
-- Extrai as chaves e permite preencher valores

local source_file = "Locales/enUS.lua"
local target_prefix = "Locales/ptBR/"

-- Mapeamento de áreas para nomes de arquivo alvo
local area_map = {
    ["Capture/Menus"] = "Core",
    ["Core/Candidates"] = "Core",
    ["Core/Diary"] = "Core",
    ["Core/People"] = "Core",
    ["Core/Slash"] = "Core",
}

print("Gerador de Tradução - Social Diary")
print("====================================")
print("\nEsse script extrai as chaves do enUS.lua e cria arquivos no ptBR/")
print("Você precisará editar manualmente os valores traduzidos.\n")

-- Ler arquivo fonte
local f = io.open(source_file, "r")
if not f then
    print("ERRO: Não pôde abrir " .. source_file)
    os.exit(1)
end

local content = f:read("*all")
f:close()

print("Lendo chaves do enUS.lua...")

-- Dividir por seções usando ns.L["ÁREA"]
local lines = {}
for line in content:gmatch("[^\r\n]+") do
    table.insert(lines, line)
end

-- Encontrar todas as linhas com ns.L[
local keys = {}
local current_area = nil

for i, line in ipairs(lines) do
    -- Detectar início de nova área (comentários)
    if line:match("^    -- ") and not line:match("^        --") then
        -- Extrair nome da área do comentário
        local area_match = line:match("^    -- (%w+/%w+/%w+)"):gsub("[/%.%-]", "_")
        if area_match then
            current_area = area_match
        end
    elseif line:match('ns\.L\[') then
        local full_line = line:gsub("%s+", " ")
        table.insert(keys, {area = current_area or "unknown", line = full_line})
    end
end

print(string.format("Encontradas %d chaves.", #keys))
print("\nLista de áreas:")

local areas_seen = {}
for _, k in ipairs(keys) do
    if not areas_seen[k.area] then
        table.insert(areas_seen, k.area)
        print("  - " .. k.area)
    end
end

print("\n\nChaves por área:")
for area in pairs(areas_seen) do
    local count = 0
    for _, k in ipairs(keys) do
        if k.area == area then count = count + 1 end
    end
    print(string.format("  %s: %d chaves", area, count))
end

print("\n\nPronto para traduzir! Abra os arquivos em Locales/ptBR/")
