---List
function List()
    ---@type boolean
    local DEBUG_MODE = true
    ---@type table
    local self = {}
    self._array = {}
    self.len = 0

    function self.append(item)
        self[self.len] = item
        self.len = self.len + 1
    end
    
    function self.pop_swap(idx)
        if idx >= self.len then
            print("Ошибка")
            return nil
        end
        local item = self[idx]
        local len = self.len - 1
        self[idx] = self[len]
        self[len] = nil
        self.len = len
        return item
    end
    
    function self.pop(idx)
        for i = idx, self.len-2 do
            self[i] = self[i+1]
        end        
        self[self.len] = nil
        self.len = self.len - 1
    end
    
    function self.get_random_index()
        if self.len == 0 then return nil end
        return math.random(0, self.len-1)
    end
    
    function self.get_random()
        local idx = self.get_random_index()
        if idx == nil then return nil end
        return self[idx]
    end
    
    local meta = {}
    if DEBUG_MODE then
        debug_tools(self, meta)
    end
    
    return setmetatable(self, meta)
end


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

function ListTest(list)
    print("Тест списка")
    iterator1 = iterator(list)
    print("Тест итератора списка 1")
    for elem in iterator1.next do
        print(elem)
    end
    
    iterator1 = iterator(list)
    print("Тест итератора списка 2")
    for elem in iterator1 do
        print(elem)
    end
    
    print("Тест итератора списка 3")
    for elem in iterator(list) do
        print(elem)
    end
    
    print("Следующие 2 ошибки контролируеммые")
    print(list.error_value)
    list.error_value = 1
end
