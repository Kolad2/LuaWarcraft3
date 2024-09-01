numlua = {}
function numlua.empty(shape)
    local self = NDArray(shape)
    return self
end

function numlua.full(shape, value)
    local self = NDArray(shape)
    self.fill(value)
    return self
end

function numlua.zeros(shape)
    local self = NDArray(shape)
    self.fill(0)
    return self
end