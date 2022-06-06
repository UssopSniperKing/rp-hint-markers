include("shared.lua")

function ENT:Initialize()
	self.CSModel = ClientsideModel(RP_Hint_Markers.ModelInfo.Model)
	self.CSModel:SetModelScale(RP_Hint_Markers.ModelInfo.Scale)
end


function ENT:Draw()

	if LocalPlayer():GetPos():DistToSqr(self:GetPos()) >= 30000 then return end

	self.CSModel:SetAngles(self:GetAngles())
	self.CSModel:SetPos(self:GetPos() + RP_Hint_Markers.ModelInfo.Offset)
end

function ENT:OnRemove()
 	self.CSModel:Remove()
end