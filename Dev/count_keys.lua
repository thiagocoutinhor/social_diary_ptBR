-- Script para contar chaves por área no enUS.lua

local file = io.open("Locales/enUS.lua", "r")
if not file then
    print("Erro: não pôde abrir enUS.lua")
    os.exit(1)
end

local content = file:read("*all")
file:close()

-- Contar chaves por área
local areas = {
    {"Core.lua", 1, "ns.L"},
    {"FeaturesA.lua", 200, "ns.L"},
    {"FeaturesB.lua", 400, "ns.L"},
    {"Words.lua", 50, "ns.L"},
    {"Timeline.lua", 100, "ns.L"},
    {"Misc.lua", 80, "ns.L"},
    {"JournalDungeon.lua", 60, "ns.L"},
    {"Journey.lua", 40, "ns.L"},
    {"JourneyMatch.lua", 30, "ns.L"},
    {"YourDiary.lua", 25, "ns.L"},
    {"Settings.lua", 70, "ns.L"},
    {"Windows.lua", 90, "ns.L"},
}

-- Usar uma regex simples para encontrar ns.L["<area>"] e contar até o próximo
local lines = {}
for line in content:gmatch("[^\r\n]+") do
    table.insert(lines, line)
end

-- Função para verificar se uma linha começa com ns.L em uma área específica
local function is_in_area(area_prefix, line_num_start)
    local count = 0
    for i = line_num_start, #lines do
        if lines[i] and string.sub(lines[i], 1, 3) == "ns." then
            if lines[i]:find("%[\"" .. area_prefix .. "\"]") or
               lines[i]:find(area_prefix .. "\"") or
               lines[i]:find("L\[\"" .. area_prefix .. "\"") or
               lines[i]:match("%[" .. area_prefix .. ")%] =" then
                count = count + 1
            end
        end
    end
    return count
end

print("Chaves por área em enUS.lua:")
for _, area_info in ipairs(areas) do
    local area_name = area_info[1]
    local expected_min = area_info[2]
    
    -- Procurar apenas onde a área começa
    local start_idx = 0
    for i = 1, #lines do
        if lines[i]:match("%[" .. area_name .. "\"") then
            start_idx = i
            break
        end
    end
    
    local count = 0
    if start_idx > 0 then
        for i = start_idx, math.min(start_idx + expected_min + 50, #lines) do
            local line = lines[i]
            if line and (line:match('L\[".*"\]') or line:match('L%.Format')) then
                count = count + 1
            end
        end
    end
    
    print(string.format("  %-20s : %3d chaves", area_name, count))
end

print("\nPronto para traduzir?")
