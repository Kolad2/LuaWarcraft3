function range(len)
    local self = {}
    self._len = len
    self._index = 0 ---@type number
    function self:reset() self._index = 0 end
    function self:next()
        self._index = self._index + 1
        if self._index <= #self then
            return self._index
        end
        self:reset()
        return nil
    end

    local mt = {}
    mt.__call = self.next
    mt.__type = function() return "range" end
    function mt:__len() return self._len end
    return setmetatable(self, mt)
end