-- DEPENDENCIES
local sm = require(script.Parent.sm)

--[[ CONFIGURATION ]]
config = {}

-- congig.Render
config.Render = {
    ["DataSize"] = 0;
    ["RenderAmount"] = 0; -- Keep equal or less than "DataSize"
    ["RenderFromPos"] = {x = 0, y = 3, z = 0}; -- (y = 3) Places the clones on ground level
}

return config