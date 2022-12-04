
-- DEPENDENCIES
local sm = require(game:GetService("ReplicatedStorage").Common:WaitForChild("sm"))
local config = require(sm.RS.Common:WaitForChild("config")).Render
local data = require(script.Parent.DummyData)

-- CLASS
local Render = {} 			-- Render Class
local RenderInstance = {} 	-- Render Class Instance
RenderInstance.__index = RenderInstance

-- CLASS CONSTRUCTOR / RETURNS NEW OBJECT
function Render.new()
	return setmetatable({}, RenderInstance) -- Creates RenderInstace object
end
setmetatable(Render, {__call = Render.new})

-- CLASS FUNCTIONS
function Render:render_platoon(num --[[Number of persons in formation]])
	
	-- GET DATA
	data = require(script.Parent.DummyData)
	-- print(num, data)
	
	-- CREATE CLASS (Required to work)
	local obj = Render.new()
	local pos = config.RenderFromPos
	
	-- Iterator: Render every person in formation
	local iter = 0
	repeat
		pos["x"] = pos["x"] + 5 	-- Spacing between spawns
		obj:define(data[iter], pos) -- Gets data from the data module and embeds it into the new RenderInstance object
		obj:render() 				-- Spawns the RenderInstance using data previously defined above
		iter = iter + 1
	until iter == num
	
	-- Resets pos["x"] value
	pos["x"] = 0
end

-- OBJECT FUNCTIONS
function RenderInstance:define(args, pos) -- args = data, pos = the spawn position
	-- print(args)
	self.Name = args["Name"] or "DEFAULT_NAME"
	self.Skin = args["Skin"] or Color3.fromRGB(50, 23, 50)
	self.Face = args["Face"] or 0
	self.Rank = args["Rank"] or "Civilian"
	self.Shirt = args["Shirt"]
	self.Pants = args["Pants"]
	self.Pos = pos or config.RenderFromPos
end

function RenderInstance:render()
	print("Rendering Clone", self.Pos)
	local subj = sm.RS.Template.humanoid_template:Clone()
	subj.PrimaryPart.Position = Vector3.new(self.Pos["x"], self.Pos["y"], self.Pos["z"])
	subj.Parent = game.Workspace
	
	-- SETS PROPERTIES
	-- Name
	subj.Name = self.Name.." RANK "..self.Rank
	
	-- Skin
	subj["Body Colors"].HeadColor3 = self.Skin
	subj["Body Colors"].LeftArmColor3 = self.Skin
	subj["Body Colors"].LeftLegColor3 = self.Skin
	subj["Body Colors"].RightArmColor3 = self.Skin
	subj["Body Colors"].RightLegColor3 = self.Skin
	subj["Body Colors"].TorsoColor3 = self.Skin
	
	-- Clothing
	local shirt = Instance.new("Shirt")
	local pants = Instance.new("Pants")
	shirt.ShirtTemplate = self.Shirt
	pants.PantsTemplate = self.Pants
	shirt.Parent = subj
	pants.Parent = subj

	--
end

return Render