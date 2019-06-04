local SPEED_MULTIPLIER = 0.175
local SPEED_OFFSET = 141.75

--[[Default Values 
Mult: 0.2418 
offset: 141.75
--]]

local function calculateDamage( ply, speed )
    local damage = ( SPEED_MULTIPLIER * speed ) - SPEED_OFFSET
    damage = math.max( 0, math.ceil( damage ) )
    
    return damage
end

local function getFallDamage( ply, speed )
    local damage = calculateDamage( ply, speed )
    
    return damage
end

-- Bastards arbitrarily returning "10" before we can get to it
hook.Remove( "GetFallDamage", "prone.FallDamage" )
hook.Remove( "GetFallDamage", "Get Fall Damage" )


hook.Remove( "GetFallDamage", "CFC_FallDamage" )
hook.Add( "GetFallDamage", "CFC_FallDamage", getFallDamage )
