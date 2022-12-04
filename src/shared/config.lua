-- DEPENDENCIES
local sm = require(script.Parent.sm)

--[[ CONFIGURATION ]]
config = {}

-- congig.Render
config.Render = {
    ["DataSize"] = 500;
    ["RenderAmount"] = 500; -- Keep equal or less than "DataSize"
    ["MaxColumns"] = 50;
}

function config.Render.getRenderFromPos()
    return {x = 0, y = 3, z = 0}; -- (y = 3) Places the clones on ground level
end

return config