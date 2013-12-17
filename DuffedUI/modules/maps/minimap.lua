local D, C, L = select(2, ...):unpack()

local _G = _G
local Map = _G["Minimap"]
local Panels = D["Panels"]
local Maps = D["Maps"]

function Maps:DisableMinimapElements()
	local North = _G["MinimapNorthTag"]
	local HiddenFrames = {
		"MinimapCluster",
		"MinimapBorder",
		"MinimapBorderTop",
		"MinimapZoomIn",
		"MinimapZoomOut",
		"MiniMapVoiceChatFrame",
		"MinimapNorthTag",
		"MinimapZoneTextButton",
		"MiniMapTracking",
		"GameTimeFrame",
		"MiniMapWorldMapButton",
	}
	
	for i, Frame in pairs(HiddenFrames) do
		local f = _G[Frame]
		f:Hide()
	end
	
	North:SetTexture(nil)
end

function Maps:StyleMinimap()
	local Mail = _G["MiniMapMailFrame"]
	local MailBorder = _G["MiniMapMailBorder"]
	local MailIcon = _G["MiniMapMailIcon"]
	
	Map:SetMaskTexture(C.Medias.Blank)
	Map:CreateBackdrop()
	Map.Backdrop:SetOutside()
	Map.Backdrop:SetFrameLevel(Map:GetFrameLevel() + 1)
	Map.Backdrop:SetBackdropColor(0, 0, 0, 0)
	
	Mail:ClearAllPoints()
	Mail:Point("TOPRIGHT", 3, 3)
	Mail:SetFrameLevel(Map:GetFrameLevel() + 2)
	MailBorder:Hide()
	MailIcon:SetTexture("Interface\\AddOns\\DuffedUI\\Medias\\Textures\\mail")
end

function Maps:PositionMinimap()
	Map:SetParent(Panels.PetBattleHider)
	Map:ClearAllPoints()
	Map:Point("TOPRIGHT", -30, -30)
end

function Maps:AddMinimapDataTexts()
	local MinimapDataTextOne = CreateFrame("Frame", nil, Map)
	MinimapDataTextOne:Size(Map:GetWidth() / 2 + 2, 19)
	MinimapDataTextOne:SetPoint("TOPLEFT", Map, "BOTTOMLEFT", -2, -3)
	MinimapDataTextOne:SetTemplate()
	MinimapDataTextOne:SetFrameStrata("LOW")

	local MinimapDataTextTwo = CreateFrame("Frame", nil, Map)
	MinimapDataTextTwo:Size(Map:GetWidth() / 2 + 1, 19)
	MinimapDataTextTwo:SetPoint("TOPRIGHT", Map, "BOTTOMRIGHT", 2, -3)
	MinimapDataTextTwo:SetTemplate()
	MinimapDataTextTwo:SetFrameStrata("LOW")

	Panels.MinimapDataTextOne = MinimapDataTextOne
	Panels.MinimapDataTextTwo = MinimapDataTextTwo
end

function GetMinimapShape() 
	return "SQUARE"
end