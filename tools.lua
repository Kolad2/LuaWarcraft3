function str(obj)
    return tostring(obj)
end


function debug_tools(self, meta)
    local keys = {}
    for i, key in ipairs(self) do
        keys[key] = i
    end
        
    function meta:__newindex(key, value)
        if type(key) == "number" then 
            rawset(self, key, value) 
            return
        end
        print("Ошибка: попытка внести новый параметр " .. tostring(key) .. " отклоненна")
    end
    
    function meta:__index(key)
        if type(key) == "number" then return rawget(self, key) end
        if keys[key] ~= nil then return rawget(self, key) end
        print("Ошибка: попытка доступа к несуществующему ключу: " .. key)
    end
end

tools = {}

function tools.max(table)
    if #table == 0 then return nil end
    local max = table[1]  -- Предполагаем, что первый элемент - максимальный
    if #table == 1 then return max end
    for i = 2, #table do
        if table[i] > max then
            max = table[i]
        end
    end
    return max
end




