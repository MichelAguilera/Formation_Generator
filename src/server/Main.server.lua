
-- DEPENDENCIES
local sm = require(game:GetService("ReplicatedStorage").Common:WaitForChild("sm"))

local config = require(sm.RS.Common:WaitForChild("config")).Render
local data = require(script.Parent.FormationData)
local Render = require(script.Parent.Render)

-- MAIN
wait(1)
local test1 = Render:render_platoon(config.RenderAmount, config.MaxColumns)