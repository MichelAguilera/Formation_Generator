Connode = {}
Connode.__index = Connode

function Connode.defineLine(
    -- node_number, separation, 
    -- origin_x, origin_y, origin_z, 
    -- angle_x, angle_y, angle_z, 
    -- subject_angle_x, subject_angle_y, subject_angle_z
    args
)
    print("Line defined: \nANGLE="..args.angle_x.."\nORIGIN="..args.origin_x.." "..args.origin_y.." "..args.origin_z.."\nSEPARATION="..args.separation)

    local self = setmetatable({}, Connode)
    self.separation = args.separation
    
    self.origin_x = args.origin_x
    self.origin_y = args.origin_y
    self.origin_z = args.origin_z
    
    self.angle_x = args.angle_x
    self.angle_y = args.angle_y
    self.angle_z = args.angle_z

    self.subject_angle_x = args.subject_angle_x or 0
    self.subject_angle_y = args.subject_angle_y or 0
    self.subject_angle_z = args.subject_angle_z or 0

    return self
end

function Connode:drawNode(node_number)

    local hypotenuse = self.separation * node_number

    local y = 0
    
    local x = hypotenuse * math.sin(math.rad(self.angle_y))
    print("x is", x)

    local z = math.sqrt((hypotenuse)^2 - (x)^2)
    print("z is", z)

    local Node = Vector3.new(x, y, z)
    return Node
end

return Connode