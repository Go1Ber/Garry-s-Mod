local toHide = {
        ["DarkRP_HUD"] = true,
        ["DarkRP_Hungermod"] = true, 
        ["DarkRP_LocalPlayerHUD"] = true,
        ["DarkRP_EntityDisplay"] = false,
        ["DarkRP_Agenda"] = true,
        ["DarkRP_LockdownHUD"] = true,
        ["DarkRP_ArrestedHUD"] = true,
        ["CHudHealth"] = true,
        ["CHudBattery"] = true,
        ["CHudAmmo"] = true,
        ["CHudSecondaryAmmo"] = true,
        ["CHudPoisonDamageIndicator"] = true,
        ["CHudSquadStatus"] = true,
        ["CHudBattery"] = true
}
hook.Add('HUDShouldDraw','HideHUD', function(name)
    if toHide[name] then return false end    
end)

local x = 15
local y = ScrH() - 150
local rbx = draw.RoundedBox
local stt = draw.SimpleText
local hadd = hook.Add
local c = Color
local tal = TEXT_ALIGN_LEFT
local tat = TEXT_ALIGN_TOP
local tac = TEXT_ALIGN_CENTER

surface.CreateFont('default',{
    font = 'Open Sans Bold',
    size = 24,
    weight = 600,
})

local function firsthud()

local pl = LocalPlayer()
local salary = pl:getDarkRPVar( 'salary' )
local hp = pl:Health()
local maxhp = pl:GetMaxHealth()
local armor = pl:Armor()
local maxar = pl:GetMaxArmor()
local money = pl:getDarkRPVar( 'money' )
local job = pl:getDarkRPVar( 'job' )
local lockdown = GetGlobalBool('DarkRP_LockDown')
local ct = team.GetColor( pl:Team() )
local wanted = pl:getDarkRPVar( 'wanted' )
local wantedr = pl:getDarkRPVar( 'wantedReason' )
-- local energy = pl:GetDarkRPVar( 'energy' )

rbx(1,x, y - 170, 450, 300, c(0,0,0,254))
stt('Name : '..pl:Nick(), 'default', x + 4, y - 170, c(255,255,255), tal, tap)
stt('HP : '..hp..'% / '..maxhp..'%','default',x + 4 , y - 145, c(255,255,255,255), tal, tap)
stt('AR : '..armor..'% / '..maxar..'%','default',x + 4 , y - 120, c(255,255,255,255), tal, tap)
stt('Работа : '..job,'default',x + 4,y -95, c(255,255,255,255), tal, tap)
stt('Деньги : $'..money, 'default', x + 4, y - 70, c(255,255,255,255), tal, tap)
stt('Зарплата : + $'..salary, 'default', x + 4, y - 45, c(255,255,255,255), tal, tap)
if ( lockdown ) then
    stt('Коменданский час!', 'default', x + 4, y - 20, c(255,255,255,255), tal, tap)
end
if ( wanted ) then
    stt('Вы в розыске! По причине : '.. wantedr, 'default', x+ 4, y + 5, c(255,255,255,255), tal, tap)
end
end
hadd('HUDPaint','firsthud',firsthud)
