-- DEPENDENCIES
local data = require(script.Parent.DummyData)

local sm = require(game:GetService("ReplicatedStorage").Common:WaitForChild("sm"))
local config = require(sm.RS.Common:WaitForChild("config")).Render
local data = require(script.Parent.DummyData)

local num = config.DataSize

-- print(data)

local iter = 0
repeat
	local color = {r = math.random(220, 240), g = math.random(180, 200), b = math.random(160, 180)}
	data[iter] = {
		['Name'] = "NAME "..tostring(iter),
		['Skin'] = Color3.fromRGB(color["r"], color["g"], color["b"]), -- Milk White
		['Face'] = nil,
		['Rank'] = nil,
		['Shirt'] = "http://www.roblox.com/asset/?id=4868556255",
		['Pants'] = "http://www.roblox.com/asset/?id=4868557442",
	}
	iter = iter + 1
until iter == num

-- print(data)