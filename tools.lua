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


function table_max(t)
    local max = t[1]  -- Предполагаем, что первый элемент - максимальный
    for i = 2, #t do
        if t[i] > max then
            max = t[i]
        end
    end
    return max
end