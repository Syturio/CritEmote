-- Developed by Lord Syturio
-- WoTLK Patch 3.3.5
-- Version: 1.0

CritEmote = AceLibrary("AceAddon-2.0");
CritEmote_setCrit = 7000

local CritEmoteFrame = CreateFrame("Frame", "CritEmoteFrame")
CritEmoteFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
CritEmoteFrame:SetScript("OnEvent", function() CritEmote:CritEmote_OnEvent(event) end)

function CritEmote:CritEmote_OnEvent()
	if(event == "COMBAT_LOG_EVENT_UNFILTERED"
	and arg4 == UnitName("player")
	and arg2 == "SPELL_DAMAGE") then
		local SpellName = arg10
		local DmgAmount = arg12
		local IsCritical = arg18
		local SpellLink = GetSpellLink(SpellName)

		if IsCritical == 1 and DmgAmount > CritEmote_setCrit then
			SendChatMessage("{moon} critted for "..DmgAmount.." damage with "..SpellLink.." !", EMOTE, nil, 1)
		end
	end
end