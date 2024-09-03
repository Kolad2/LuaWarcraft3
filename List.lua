---List
---@param table? table
---@return table
function List(table)
    ---@type table
    local self = {}
    self._array = table or {}

    function self:check_bounds(idx)
        return  idx > 0 and idx <= #self
    end

    function self:append(item)
        if item == nil then
            print("Warning: попытка добавть nil в List")
            return
        end
        self[#self + 1] = item
    end

    function self:pop_back()
        self[#self] = nil
    end

    function self:pop_swap(idx)
        if not self:check_bounds(idx) then
            print("Ошибка: индекс в pop_swap(idx) превышает размер массива")
            return nil
        end
        local item = self[idx]
        self[idx] = self[#self]
        self:pop_back()
        return item
    end
    
    function self:pop(idx)
        if not self:check_bounds(idx) then
            print("Ошибка: индекс в pop(idx) превышает размер массива")
            return nil
        end
        for i = idx, #self-1 do
            self[i] = self[i+1]
        end
        self:pop_back()
    end

    ---@return number
    function self:get_random_index()
        if #self == 0 then return nil end
        return math.random(1, #self)
    end

    function self:get_random()
        local idx = self:get_random_index() ---@type number
        if idx == nil then return nil end
        return self[idx]
    end

    function self:max()
        if #self == 0 then return nil end
        local max = self._array[1]  -- Предполагаем, что первый элемент - максимальный
        if #self == 1 then return max end
        for i = 2, #self do
            if self[i] > max then
                max = self[i]
            end
        end
        return max
    end

    local meta = {}
    function meta:__newindex(key, value)
        if type(key) == "number" then
            rawset(self._array, key, value)
        end
    end

    -- перенаправление self[i] в #self._array[i]
    function meta:__index(key)
        if type(key) ~= "number" then return rawget(self, key) end
        if key > 0 and key <= #self then
            return rawget(self._array, key)
        end
        print("Ошибка: ключ к списку выходит за рамки его размера")
    end

    -- перенаправление #self в #self._array
    function meta:__len()
        return #self._array
    end

    return setmetatable(self, meta)
end