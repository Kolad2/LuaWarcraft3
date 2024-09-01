function str(obj)
    return tostring(obj)
end


function range(len)
    local self = {}
    self.len = len
    local index = -1
    self.reset = function() index = -1 end
    
    function self.next()
        index = index + 1 
        if index < self.len then
            return index
        end
        self.reset()
        return nil
    end
    
    local mt = {}
    mt.__call = self.next
    mt.__type = function() return "range" end
    return setmetatable(self, mt)
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