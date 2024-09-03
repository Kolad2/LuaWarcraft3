--- iterator
function iterator(list)
    local self = {}
    self.index = 0
    self.list = list

    function self.next()
        if self.index < self.list.len then
            local item = self.list[self.index]
            self.index = self.index + 1
            return item
        end
        self.index = 0
        return nil
    end

    local meta = {}
    meta.__call = self.next
    return setmetatable(self, meta)
end