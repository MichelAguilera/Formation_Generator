-- DEPENDENCIES
local sm = require(game:GetService("ReplicatedStorage").Common:WaitForChild("sm"))
local Connode = require(sm.RS.Common.Connode)

-- TESTING
local line = Connode.defineLine({
    node_number = 0, 
    separation = 5 * (math.sqrt(2)), 
    origin_x = 0,
    origin_y = 0,
    origin_z = 0,
    angle_x = 0,
    angle_y = 90,
    angle_z = 0,
    subject_angle_x = 0,
    subject_angle_y = 0,
    subject_angle_z = 0
})

local iter = 0
repeat 

    print("working "..tostring(iter))

    local part = Instance.new("Part")
    part.Name = "part"..tostring(iter)
    part.Anchored = true
    part.Position = line:drawNode(iter)
    part.Size = Vector3.new(2, 2, 2)

    print(part.Position)

    part.Parent = sm.Workspace
    
    iter += 1

until iter == 10