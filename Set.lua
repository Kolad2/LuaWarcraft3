---Set
---@return table
function Set()
    local self = List() ---@type table
    local meta = getmetatable(self)
    setmetatable(self, nil)
    self.super_append = self.append
    self.super_pop_swap = self.pop_swap

    self._index_table = {} ---@type table

    ---@param item any
    ---@private
    function self:_clear_index(item)
        self._index_table[item] = nil
    end

    ---@param item any
    ---@private
    function self:_get_index(item)
        return self._index_table[item]
    end

    ---@param item any
    ---@param idx number|nil
    ---@private
    function self:_set_index(item, idx)
        self._index_table[item] = idx
    end

    ---@param item any
    function self:append(item)
        if self:_get_index(item) then
            print("Ошибка: элемент уже существовал")
            return false
        end
        self:_set_index(item, #self + 1)
        self:super_append(item)
        return true
    end
    self.add = self.append

    ---@param idx number
    ---@return boolean
    function self:pop_swap(idx)
        local item = self:super_pop_swap(idx)
        if item~=nil then
            if self[idx]~=nil then self:_set_index(self[idx], idx) end
            self:_clear_index(item)
            return true
        end
        return false
    end

    ---@param item any
    function self:remove(item)
        local idx = self:_get_index(item)
        if not idx then
            print("Ошибка: элемент не существовал")
            return false
        end
        return self:pop_swap(idx)
    end

    return setmetatable(self, meta)
end
