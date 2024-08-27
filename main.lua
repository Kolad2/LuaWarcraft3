src_path = "/media/kolad/HardDisk/LuaProjects/src/"
dofile(src_path .. "tools.lua")
dofile(src_path .. "List.lua")
dofile(src_path .. "Set.lua")

list1 = List()

list1.append(5)
list1.append(7)
list1.append(45)
list1.append(55)
list1.append(66)

for el in iterator(list1) do
    print(el)
end