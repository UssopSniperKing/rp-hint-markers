ENT.Type = "anim"

ENT.PrintName = "Hint Marker"
ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("String", 0, "HintText")
	self:NetworkVar("Entity", 0, "Spawner")
end

