RP_Hint_Markers = RP_Hint_Markers or {}


function RP_Hint_Markers.AddHintMarker(ply)
	local NumberOfHintMarkers = ply:GetPData("NumberOfHintMarkers")
	ply:SetPData("NumberOfHintMarkers", NumberOfHintMarkers + 1)
end


function RP_Hint_Markers.RemoveHintMarker(ply)
	local NumberOfHintMarkers = ply:GetPData("NumberOfHintMarkers")
	ply:SetPData("NumberOfHintMarkers", NumberOfHintMarkers - 1)
end


function RP_Hint_Markers.ResetHintMarker(ply)
	ply:SetPData("NumberOfHintMarkers", 0)
end


function RP_Hint_Markers.CanPlaceHintMarker(ply)

	local NumberOfHintMarkers = ply:GetPData("NumberOfHintMarkers")

	if tonumber(NumberOfHintMarkers) < RP_Hint_Markers.Limit then
		return true
	else 
		return false 
	end
end


hook.Add("PlayerInitialSpawn", "ResetNumberOfHintMarkers", function(ply)
	RP_Hint_Markers.ResetHintMarker(ply)
end)


hook.Add("PlayerSay", "hint_ply_chat_command", function (ply, txt) 

	local txt = string.lower(txt)
	local cmdPart = string.sub(txt, 1, string.len(RP_Hint_Markers.Cmd))
	local msgPart = string.sub(txt, (string.len(RP_Hint_Markers.Cmd) + 2))

	if cmdPart == RP_Hint_Markers.Cmd then

		print(ply:GetPData("NumberOfHintMarkers"))

		if RP_Hint_Markers.CanPlaceHintMarker(ply) then 
			local pos = ply:GetPos() + Vector(0, 0, 25)

			local hintMarker = ents.Create("hint_marker")
			hintMarker:SetPos(pos)
			hintMarker:SetAngles(ply:GetAngles())
			hintMarker:SetHintText(msgPart)
			hintMarker:SetSpawner(ply)
			hintMarker:Spawn()

			RP_Hint_Markers.AddHintMarker(ply)

			print("[Hint Marker] The player : ".. ply:Nick() .." (".. ply:SteamID() ..") has placed an hint marker with the following text: ".. msgPart )

			return "" -- supress the command in the chatbox
		end
	end
end)