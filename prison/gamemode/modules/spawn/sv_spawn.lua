function GM:PlayerSpawn(ply)
	ply:UnSpectate()
	ply:SetupHands()

	player_manager.OnPlayerSpawn(ply)
	player_manager.RunClass(ply, "Spawn")

	hook.Call("PlayerLoadout", GAMEMODE, ply)
	hook.Call("PlayerSetModel", GAMEMODE, ply)
end
