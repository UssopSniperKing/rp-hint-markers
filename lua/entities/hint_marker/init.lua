AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/hunter/blocks/cube1x1x1.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_VPHYSICS)

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
	self:SetCollisionGroup(COLLISION_GROUP_WEAPON)

	self:DrawShadow(false)
	self:SetUseType(SIMPLE_USE)

	self.timer = timer.Simple(RP_Hint_Markers.Delay, function()
		RP_Hint_Markers.RemoveHintMarker(self:GetSpawner()) 
		self:Remove() 
	end)
end

function ENT:Use()
	print(self:GetHintText())
end