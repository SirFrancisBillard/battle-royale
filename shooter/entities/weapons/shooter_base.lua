AddCSLuaFile()

sound.Add({
	name = "Shooter.Pop",
	channel = CHAN_WEAPON,
	volume = 1.0,
	level = SNDLVL_GUNFIRE,
	pitch = {165, 195},
	sound = "weapons/pistol/pistol_fire2.wav"
})

SWEP.PrintName = "Shooter Weapon Base"
SWEP.Category = "Shooter Weapons"
SWEP.DrawWeaponInfoBox = false

SWEP.Spawnable = false
SWEP.AdminOnly = false

SWEP.HoldType = "pistol"
SWEP.IronHoldType = "revolver"

SWEP.WorldModel = Model( "models/weapons/w_pistol.mdl" )
SWEP.ViewModel = Model( "models/weapons/cstrike/c_pist_p228.mdl" )
SWEP.ViewModelFOV = 55
SWEP.UseHands = true

SWEP.Slot = 1
SWEP.SlotPos = 1

SWEP.CSMuzzleFlashes = true

SWEP.Primary.Sound = Sound( "Weapon_P228.Single" )
SWEP.Primary.Recoil = 0.8
SWEP.Primary.Damage = 5
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.03
SWEP.Primary.Delay = 0.13

SWEP.Primary.Ammo = "pistol"
SWEP.Primary.Automatic = false
SWEP.Primary.ClipSize = 12
SWEP.Primary.DefaultClip = 12

SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Automatic = false
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1

SWEP.Spread = {}
SWEP.Spread.Min = 0
SWEP.Spread.Max = 0.5
SWEP.Spread.IronsightsMod = 0.1
SWEP.Spread.CrouchMod = 0.6
SWEP.Spread.AirMod = 1.2
SWEP.Spread.RecoilMod = 0.025
SWEP.Spread.VelocityMod = 0.5

SWEP.IronsightsPos = Vector( -5.9613, -3.3101, 2.706 )
SWEP.IronsightsAng = Angle( 0, 0, 0 )
SWEP.IronsightsFOV = 0.8
SWEP.IronsightsSensitivity = 0.8
SWEP.IronsightsCrosshair = false
SWEP.UseIronsightsRecoil = true

SWEP.LoweredPos = Vector( 0, -20, -10 )
SWEP.LoweredAng = Angle( 70, 0, 0 )

SWEP.IdlePos = Vector(-4.321, 0, -2.881)
SWEP.IdleAng = Angle(0, 0, 0)

SWEP.CanLean = true
SWEP.LeanYawOffset = 1

SWEP.m_WeaponDeploySpeed = 1

function SWEP:SetIronsights(val)
	self:SetIronsights_Internal(val)
	if val then
		self:SetHoldType(self.IronHoldType)
	else
		self:SetHoldType(self.HoldType)
	end
end

function SWEP:GetIronsights()
	return self:GetIronsights_Internal()
end

function SWEP:SetupDataTables()
	self:NetworkVar( "Bool", 0, "Ironsights_Internal" )
	self:NetworkVar( "Float", 1, "IronsightsRecoil" )

	self:NetworkVar( "Float", 2, "Recoil" )

	self:NetworkVar( "Bool", 1, "Reloading" )
	self:NetworkVar( "Float", 3, "ReloadTime" )

	self:NetworkVar( "Float", 4, "NextIdle" )
end

function SWEP:Initialize()
	self:SetIronsights( false )

	self:SetReloading( false )
	self:SetReloadTime( 0 )

	self:SetRecoil( 0 )
	self:SetNextIdle( 0 )

	self:SetHoldType( self.HoldType )

	if CLIENT then
		self.Owner.LerpedLeanOffset = Vector(0, 0, 0)
	end
end

function SWEP:Deploy()
	self:SendWeaponAnim( ACT_VM_DRAW )
	self.Owner:GetViewModel():SetPlaybackRate( self.m_WeaponDeploySpeed )

	return true
end

function SWEP:ShootEffects()
	if not self:GetIronsights() or not self.UseIronsightsRecoil then
		--self:SendWeaponAnim( self:Clip1() > 0 and ACT_VM_PRIMARYATTACK or ACT_VM_DRYFIRE )
		self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
		self:QueueIdle()
	else
		self:SetIronsightsRecoil( math.Clamp( 7.5 * self.Primary.Recoil, 0, 10 ) )

		local vm = self.Owner:GetViewModel()
		local posang = vm:GetAttachment( 1 )

		if posang then
			local ef = EffectData()
			ef:SetFlags( 0 )
			ef:SetEntity( self.Owner:GetViewModel() )
			ef:SetAttachment( 1 )
			ef:SetScale( 1 )

			util.Effect( "CS_MuzzleFlash", ef )
		end
	end

	self.Owner:MuzzleFlash()
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
end

function SWEP:IsSprinting()
	return ( self.Owner:GetVelocity():Length2D() > self.Owner:GetRunSpeed() - 50 )
		and self.Owner:IsOnGround()
end

function SWEP:OwnerLeanOffset()
	local left = self.Owner:GetNWBool("lean_left", false)
	local right = self.Owner:GetNWBool("lean_right", false)
	if (left and right) or not (left or right) then return vector_origin end
	local ang = self.Owner:EyeAngles()
	if left then
		return (ang:Up() * -6) + (ang:Right() * -14)
	end
	if right then
		return (ang:Up() * -6) + (ang:Right() * 14)
	end
	return vector_origin -- how ???
end

function SWEP:OwnerShootPos()
	return self.Owner:GetShootPos() + self:OwnerLeanOffset()
end

function SWEP:ShootBullet( damage, num_bullets, aimcone )
	local bullet = {}

	bullet.Num 	= num_bullets
	bullet.Src 	= self:OwnerShootPos() -- Source
	bullet.Dir 	= self.Owner:GetAimVector() -- Dir of bullet
	bullet.Spread 	= Vector( aimcone, aimcone, 0 )	-- Aim Cone
	bullet.Tracer	= 5 -- Show a tracer on every x bullets
	bullet.Force	= 1 -- Amount of force to give to phys objects
	bullet.Damage	= damage
	bullet.AmmoType = "Pistol"

	if IsFirstTimePredicted() then
		bullet.Callback = function(atk, tr, dmg)
			sound.Play("weapons/fx/rics/ric" .. math.random(5) .. ".wav", tr.HitPos, 60, math.random(90, 110), 1)
		end
	end

	self.Owner:FireBullets( bullet )

	self:ShootEffects()
end

local shake = CreateConVar("shooter_shootshake", 1, FCVAR_NONE, "Should the screen shake when shooting?")

function SWEP:PrimaryAttack()
	if not self:CanShoot() then return end

	local items_enabled = isfunction(self.Owner.HasItem)

	self:TakePrimaryAmmo( 1 )

	if items_enabled and self.Owner:HasItem(ITEM_BUCKSHOT) then
		self:ShootBullet( self.Primary.Damage, self.Primary.ModdedNumShots or self.Primary.NumShots, self:CalculateSpread() * (self.Primary.ModdedConeMult or 1) )
	else
		self:ShootBullet( self.Primary.Damage, self.Primary.NumShots, self:CalculateSpread() )
	end

	if IsFirstTimePredicted() and shake:GetBool() then util.ScreenShake(self:GetPos(), .1, 500, 0.1, 512) end

	self:AddRecoil()
	self:ViewPunch()

	if items_enabled and self.Primary.SilencedSound ~= nil and self.Owner:HasItem(ITEM_SILENCER) then
		self:EmitSound(self.Primary.SilencedSound)
	else
		self:EmitSound(self.Primary.Sound)
	end

	local delay = self.Primary.Delay
	if items_enabled and self.Primary.BumpStockDelay ~= nil and self.Owner:HasItem(ITEM_BUMPSTOCK) then
		delay = self.Primary.BumpStockDelay
	end

	self:SetNextPrimaryFire( CurTime() + delay )
	self:SetReloadTime( CurTime() + delay )
end

function SWEP:SecondaryAttack()
end

function SWEP:Holster()
	-- reset everything when we holster
	self:SetIronsights( false )
	self:SetIronsightsRecoil( 0 )

	self:SetReloading( false )
	self:SetReloadTime( 0 )

	self:SetRecoil( 0 )
	self:SetNextIdle( 0 )

	if CLIENT then
		self.ViewModelPos = Vector( 0, 0, 0 )
		self.ViewModelAng = Angle( 0, 0, 0 )
		self.FOV = nil
	end

	return true
end

function SWEP:QueueIdle()
	self:SetNextIdle( CurTime() + self.Owner:GetViewModel():SequenceDuration() + 0.1 )
end

function SWEP:IdleThink()
	if self:GetNextIdle() == 0 then return end

	if CurTime() > self:GetNextIdle() then
		self:SetNextIdle( 0 )
		self:SendWeaponAnim( self:Clip1() > 0 and ACT_VM_IDLE or ACT_VM_IDLE_EMPTY )
	end
end

function SWEP:Suicide()
	sound.Play(self.Primary.Sound, self:GetPos())
	sound.Play("physics/body/body_medium_break" .. math.random(2, 3) .. ".wav", self:GetPos())

	local edata = EffectData()
	edata:SetOrigin(self.Owner:EyePos())
	util.Effect("blood_spatter", edata)

	self.Owner:Kill()
	self.Owner:Freeze(false)
end

function SWEP:Think()
	self:IronsightsThink()
	self:RecoilThink()
	self:IdleThink()

	if self:GetReloading() then self:ReloadThink() end

	if SERVER and IsRoundState(ROUND_OVER) and CurTime() - 3 > LastRoundStateChange() and not self.KilledSelf and (self.Owner:Team() == TEAM_SHOOTERS or self.Owner:IsBot()) then
		self.KilledSelf = true
		self:Suicide()
	end
end

hook.Add("CalcView", "ThirdPersonShooterKYS", function(ply, pos, ang, fov)
	if IsRoundState(ROUND_OVER) and ply:Team() == TEAM_SHOOTERS then
		local view = {}

		view.origin = pos - (ang:Forward() * 100)
		view.angles = angles
		view.fov = fov
		view.drawviewer = true

		return view
	end
end)

function SWEP:AddRecoil()
	self:SetRecoil( math.Clamp( self:GetRecoil() + self.Primary.Recoil * 0.4, 0, 1 ) )
end

function SWEP:RecoilThink()
	self:SetRecoil( math.Clamp( self:GetRecoil() - FrameTime() * 1.4, 0, 1 ) )
end

function SWEP:CanShoot()
	if self:Clip1() < 1 then
		self:Reload()
	end

	return self:CanPrimaryAttack() and not self:IsSprinting() and self:GetReloadTime() < CurTime()
end

function SWEP:ViewPunch()
	local punch = Angle()

	local mul = self:GetIronsights() and 0.65 or 1
	punch.p = util.SharedRandom( "ViewPunch", -0.5, 0.5 ) * self.Primary.Recoil * mul
	punch.y = util.SharedRandom( "ViewPunch", -0.5, 0.5 ) * self.Primary.Recoil * mul
	punch.r = 0

	self.Owner:ViewPunch( punch )

	if IsFirstTimePredicted() and ( CLIENT or game.SinglePlayer() ) then
		self.Owner:SetEyeAngles( self.Owner:EyeAngles() -
			Angle( self.Primary.Recoil * ( self:GetIronsights() and 0.5 or 1 ), 0, 0 ) )
	end
end

function SWEP:CanIronsight()
	return not self:IsSprinting() and not self:GetReloading() and self.Owner:IsOnGround()
end

function SWEP:IronsightsThink()
	self:SetIronsightsRecoil( math.Approach( self:GetIronsightsRecoil(), 0, FrameTime() * 100 ) )

	self.BobScale = self:GetIronsights() and 0.1 or 1
	self.SwayScae = self:GetIronsights() and 0.1 or 1

	if not self:CanIronsight() then
		self:SetIronsights( false )
		return
	end

	if self.Owner:KeyDown( IN_ATTACK2 ) and not self:GetIronsights() then
		self:SetIronsights( true )
	elseif not self.Owner:KeyDown( IN_ATTACK2 ) and self:GetIronsights() then
		self:SetIronsights( false )
	end
end

function SWEP:CanReload()
	return self:Ammo1() > 0 and self:Clip1() < self.Primary.ClipSize
		and not self:GetReloading() and self:GetNextPrimaryFire() < CurTime()
end

function SWEP:Reload()
	if not self:CanReload() then return end

	self.Owner:DoReloadEvent()
	self:SendWeaponAnim( ACT_VM_RELOAD )
	self:QueueIdle()

	if self.ReloadSound then self:EmitSound( self.ReloadSound ) end

	self:SetReloading( true )
	self:SetReloadTime( CurTime() + self.Owner:GetViewModel():SequenceDuration() )
end

function SWEP:ReloadThink()
	if self:GetReloadTime() < CurTime() then self:FinishReload() end
end

function SWEP:FinishReload()
	self:SetReloading( false )

	local amount = math.min( self:GetMaxClip1() - self:Clip1(), self:Ammo1() )

	self:SetClip1( self:Clip1() + amount )
	self.Owner:RemoveAmmo( amount, self:GetPrimaryAmmoType() )
end

function SWEP:CalculateSpread()
	local spread = self.Primary.Cone
	spread = spread + self.Primary.Cone * math.Clamp( self.Owner:GetVelocity():Length2D() / self.Owner:GetRunSpeed(), 0, self.Spread.VelocityMod )
	spread = spread + self:GetRecoil() * self.Spread.RecoilMod

	if not self.Owner:IsOnGround() then
		spread = spread * self.Spread.AirMod
	end

	if self.Owner:IsOnGround() and self.Owner:Crouching() then
		spread = spread * self.Spread.CrouchMod
	end

	if self:GetIronsights() then
		spread = spread * self.Spread.IronsightsMod
	end

	spread = math.Clamp( spread, self.Spread.Min, self.Spread.Max )

	return spread
end

local function ChangeLean(ply, right, toggle)
	if not IsValid(ply) or not ply:IsPlayer() then return end
	local first, second
	if right then
		first = "lean_right"
		second = "lean_left"
	else
		first = "lean_left"
		second = "lean_right"
	end
	ply:SetNWBool(first, toggle)
	if toggle then
		ply:StopLuaAnimation(second)
		ply:SetNWBool(second, false)
		ply:SetLuaAnimation(first)
	else
		ply:StopLuaAnimation(first)
	end
end

local function CanLean(ply)
	if not IsValid(ply) or not ply:Alive() then return false end
	local wep = ply:GetActiveWeapon()
	if not IsValid(wep) or not wep.CanLean then return false end
	return true
end

hook.Add("PlayerButtonDown", "LeanDetection", function(ply, btn)
	if not CanLean(ply) then return end
	if btn == KEY_Q then
		ChangeLean(ply, false, true)
	elseif btn == KEY_E then
		ChangeLean(ply, true, true)
	end
end)

hook.Add("PlayerButtonUp", "LeanDetection", function(ply, btn)
	-- no check
	if btn == KEY_Q then
		ChangeLean(ply, false, false)
	elseif btn == KEY_E then
		ChangeLean(ply, true, false)
	end
end)

if SERVER then
	return
end

function SWEP:CalcView(ply, pos, ang, fov)
	-- if not ply.LerpedLeanOffset then ply.LerpedLeanOffset = Vector(0, 0, 0) end
	if ply:GetNWBool("lean_left", false) or ply:GetNWBool("lean_right", false) then
		ply.LerpedLeanOffset = LerpVector(FrameTime() * 5, ply.LerpedLeanOffset, self:OwnerLeanOffset())
	else
		ply.LerpedLeanOffset = LerpVector(FrameTime() * 5, ply.LerpedLeanOffset, vector_origin)
	end
	pos = pos + ply.LerpedLeanOffset
	return pos, ang, fov
end

SWEP.CrosshairAlpha = 1
SWEP.CrosshairSpread = 0

function SWEP:ShouldDrawCrosshair()
	return not self:GetReloading() and not self:IsSprinting() and
		self:HasAmmo() and ( not self:GetIronsights() or self.IronsightsCrosshair )
end

function SWEP:DrawCrosshairSegment( x, y, w, h )
	surface.SetDrawColor( 0, 0, 0, self.CrosshairAlpha * 255 )
	surface.DrawRect( x - 1, y - 1, w, h )

	surface.SetDrawColor( 255, 255, 255, self.CrosshairAlpha * 255 )
	surface.DrawRect( x, y, w - 2, h - 2 )
end

function SWEP:DoDrawCrosshair( x, y )
	self.CrosshairAlpha = Lerp( FrameTime() * 10, self.CrosshairAlpha, self:ShouldDrawCrosshair() and 1 or 0 )

	-- no dot
	-- self:DrawCrosshairSegment( x, y, 3, 3 )

	if self.CrosshairAlpha > 0 then
		self.CrosshairSpread = Lerp( FrameTime() * 10, self.CrosshairSpread, self:CalculateSpread() * 500 )
		self:DrawCrosshairSegment( x - 13 - self.CrosshairSpread, y, 10, 3 )
		self:DrawCrosshairSegment( x + 5 + self.CrosshairSpread, y, 10, 3 )
		self:DrawCrosshairSegment( x, y - 13 - self.CrosshairSpread, 3, 10 )
		self:DrawCrosshairSegment( x, y + 5 + self.CrosshairSpread, 3, 10 )
	end

	return true
end

function SWEP:GetOffset()
	if self:GetReloading() then return self.IdlePos, self.IdleAng end

	if IsRoundState(ROUND_OVER) and CurTime() - 1 > LastRoundStateChange() and self.SuicidePos and self.Owner:Team() == TEAM_SHOOTERS then
		return self.SuicidePos, self.SuicideAng
	end

	if self:IsSprinting() then
		return self.LoweredPos, self.LoweredAng
	end

	if self:GetIronsights() then
		return self.IronsightsPos + Vector( 0, -self:GetIronsightsRecoil(), 0 ), self.IronsightsAng
	end

	return self.IdlePos, self.IdleAng
end

SWEP.ViewModelPos = Vector( 0, 0, 0 )
SWEP.ViewModelAngle = Angle( 0, 0, 0 )

function SWEP:OffsetThink()
	local offset_pos, offset_ang = self:GetOffset()

	if not offset_pos then offset_pos = vector_origin end
	if not offset_ang then offset_ang = angle_zero end -- note to fucking self: angles are mutable

	local lean_offset = Angle(0, 0, 0)
	if self.Owner:GetNWBool("lean_left", false) then
		lean_offset.r = lean_offset.r - 25
		lean_offset.y = lean_offset.y + self.LeanYawOffset
	end
	if self.Owner:GetNWBool("lean_right", false) then
		lean_offset.r = lean_offset.r + 25
		lean_offset.y = lean_offset.y - self.LeanYawOffset
	end

	self.ViewModelPos = LerpVector( FrameTime() * 10, self.ViewModelPos, offset_pos )--+ lean_pos )
	self.ViewModelAngle = LerpAngle( FrameTime() * 10, self.ViewModelAngle, offset_ang + lean_offset )
end

function SWEP:PreDrawViewModel()
	self:OffsetThink()
end

function SWEP:GetViewModelPosition( pos, ang )
	ang:RotateAroundAxis( ang:Right(), self.ViewModelAngle.p )
	ang:RotateAroundAxis( ang:Up(), self.ViewModelAngle.y )
	ang:RotateAroundAxis( ang:Forward(), self.ViewModelAngle.r )
	
	pos = pos + self.Owner.LerpedLeanOffset
	
	pos = pos + self.ViewModelPos.x * ang:Right()
	pos = pos + self.ViewModelPos.y * ang:Forward()
	pos = pos + self.ViewModelPos.z * ang:Up()

	return pos, ang
end

SWEP.FOVMultiplier = 1
SWEP.LastFOVUpdate = 0 -- gets called many times per frame... weird.
function SWEP:TranslateFOV( fov )
	if self.LastFOVUpdate < CurTime() then
		self.FOVMultiplier = Lerp( FrameTime() * 15, self.FOVMultiplier, self:GetIronsights() and self.IronsightsFOV or 1 )
		self.LastFOVUpdate = CurTime()
	end

	return fov * self.FOVMultiplier
end

function SWEP:AdjustMouseSensitivity()
	if self:GetIronsights() then return self.IronsightsSensitivity end
end

SWEP.SelectColor = Color( 255, 210, 0 )
SWEP.EmptySelectColor = Color( 255, 50, 0 )
function SWEP:DrawWeaponSelection( x, y, w, h, a )
	local col = self:HasAmmo() and self.SelectColor or self.EmptySelectColor

	draw.SimpleText( self.IconLetter, "CSSelectIcons", x + w / 2, y + h * 0.65,
		Color( col.r, col.g, col.b, a ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
end

surface.CreateFont( "CSKillIcons", {
	size = ScreenScale( 30 ),
	weight = 500,
	antialiasing = true,
	additive = true,
	font = "csd"
} )

surface.CreateFont( "CSSelectIcons", {
	size = ScreenScale( 60 ),
	weight = 500,
	antialiasing = true,
	additive = true,
	font = "csd"
} )