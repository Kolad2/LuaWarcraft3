do

local function create_nda(shape)
    local array = {}
    local nd = #shape
    if nd == 1 then return array end
    for i = 1, shape[1] do
        array[i] = {}
    end
    return array
end

local function fill_2d(ndarray, value)
    for i = 1, ndarray.shape[1] do
        for j = 1, ndarray.shape[2] do
            ndarray[i][j] = value
        end
    end
end

local function to_str2d(ndarray)
    local _str = ""
    for i = 1, ndarray.shape[1] do
        for j = 1, ndarray.shape[2] do
            _str = _str .. tostring(ndarray[i][j]) .. " " 
        end
        _str = _str .. "\n"
    end
    return _str
end

function NDArray(shape)
    local self = {}
    local keys = nil
    self.shape = shape
    self.ndim = #self.shape
    array = create_nda(self.shape)
    
    self.fill = function(value) fill_2d(self, value) end
    
    meta = {}
    function meta:__index(key) return array[key] end
    function meta:__newindex(key, value) array[key]=value end
    if self.ndim == 2 then
        meta.__tostring = to_str2d
    end
    
    print("NDArray created")
    return setmetatable(self, meta)
end

end
