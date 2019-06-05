-- Bastards arbitrarily returning "10" before we can get to it
hook.Remove( "GetFallDamage", "prone.FallDamage" )
hook.Remove( "GetFallDamage", "Get Fall Damage" )

--[[Default Values 
    SPEED_MULTIPLIER: 0.2418 
    SPEED_OFFSET: 141.75
--]]
local SPEED_MULTIPLIER = 0.175
local SPEED_OFFSET = 141.75

local DEATH_MESSAGE = "Did you know you can reduce the amount of damage you take from falling by crouching and looking down before you impact a surface?"

local function getFallDamage( ply, speed )
    -- Based on CS:S fall damage algorithm
    local damage = ( SPEED_MULTIPLIER * speed ) - SPEED_OFFSET
    damage = math.max( 0, math.ceil( damage ) )
    
    return damage
end

hook.Remove( "GetFallDamage", "CFC_FallDamage" )
hook.Add( "GetFallDamage", "CFC_FallDamage", getFallDamage )


local function onPlayerDeath( ply, attacker, dmg )
    if not dmg:IsFallDamage() then return end
    if not IsValid( ply ) and ply:IsPlayer() then return end
    
    ply:ChatPrint( DEATH_MESSAGE )
end

hook.Remove( "DoPlayerDeath", "CFC_FallDamageCheck" )
hook.Add( "DoPlayerDeath", "CFC_FallDamageCheck", onPlayerDeath )
