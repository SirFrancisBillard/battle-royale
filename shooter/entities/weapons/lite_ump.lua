AddCSLuaFile()

SWEP.Base = "lite_base"

SWEP.PrintName = "UMP"
SWEP.Category = "Lite Weapons"
SWEP.DrawWeaponInfoBox = false
SWEP.IconLetter = "q"

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.HoldType = "smg"

SWEP.WorldModel = Model( "models/weapons/w_smg_ump45.mdl" )
SWEP.ViewModel = Model( "models/weapons/cstrike/c_smg_ump45.mdl" )
SWEP.ViewModelFOV = 55
SWEP.UseHands = true

SWEP.Slot = 2
SWEP.SlotPos = 1

SWEP.CSMuzzleFlashes = true

SWEP.Primary.Sound = Sound( "Weapon_UMP45.Single" )
SWEP.Primary.Recoil = 0.7
SWEP.Primary.Damage = 12
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.03
SWEP.Primary.Delay = 0.09

SWEP.Primary.Ammo = "smg1"
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize = 25
SWEP.Primary.DefaultClip = 25

SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Automatic = false
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1

SWEP.Spread = {}
SWEP.Spread.Min = 0
SWEP.Spread.Max = 0.25
SWEP.Spread.IronsightsMod = 0.2
SWEP.Spread.CrouchMod = 0.6
SWEP.Spread.AirMod = 1.2
SWEP.Spread.RecoilMod = 0.05
SWEP.Spread.VelocityMod = 0.5

SWEP.IronsightsPos = Vector( -8.7, -7, 4.2 )
SWEP.IronsightsAng = Angle( -1.3, 0, -3 )
SWEP.IronsightsFOV = 0.8
SWEP.IronsightsSensitivity = 0.8
SWEP.IronsightsCrosshair = false

SWEP.LoweredPos = Vector( 1.6397, -5.089, 4 )
SWEP.LoweredAng = Angle( -17.2767, 28.3565, -0.4145 )

if CLIENT then
	killicon.AddFont( "lite_ump", "CSKillIcons", SWEP.IconLetter, Color( 255, 80, 0, 255 ) )
end