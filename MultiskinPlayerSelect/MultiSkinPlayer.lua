-- Register the behaviour
behaviour("MultiSkinPlayer")

local skins
local teams

function MultiSkinPlayer:Start()
    print("MultiSkin Player Select")
    GameEvents.onActorSpawn.AddListener(self, "OnActorSpawn")

    self.playerBool = self.script.mutator.GetConfigurationBool('playerBool')
    team = self.script.mutator.GetConfigurationDropdown('team')
	if team == 0 then
		team = Team.Blue
	elseif team == 1 then
		team = Team.Red
	elseif team == 2 then	
		team = 'Both'
	end	

    skins = self.targets.export.GetActorSkinArray("Skin")
end

function MultiSkinPlayer:OnActorSpawn(actor)
    if actor.team == team or 'Both' == team then
		actor.SetSkin(skins[math.random(#skins)])
        if not self.playerBool then
            Player.actor.ApplyTeamSkin()
        else
            actor.SetSkin(skins[math.random(#skins)])
	    end
    end
end