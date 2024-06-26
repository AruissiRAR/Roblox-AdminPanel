-- // rays moderation script, super shit but oh well... \\ --

--[[
	
	HOW TO USE [
	
		1. Put this script inside of 'ServerScriptService'
		
		2. Tweak the super admins (super_admin), and normal admins (allowed) [
			Superadmin can admin players in the menu, normal admins cannot!
		]
		3. Set the 'hook' variable to ur discord webhook
		4. Put the 'AdminPanel' script inside of 'StarterPlayerScripts'
		5. Go in game and test!
	
	]
]]


local hook = "discord-webhook-here"
local HttpService = game:GetService("HttpService")
local allowed = {1993814692, -1}
local super_admin = {1993814692, -1}


local function ADMIN(caller)
	if table.find(allowed, caller.UserId) then
		if not caller:GetAttribute("Admined") then
			caller:SetAttribute("Admined", true)
		end
		return true
	else
		return false
	end
end



local function NotifyUsage(plr, targeted, ModerationID)
	local ModerationType = (ModerationID == 1 and "Kick" or ModerationID == 2 and "Warn" or ModerationID == 3 and "Ban" or ModerationID == 4 and "Unban" or ModerationID == 5 and "Bring" or ModerationID == 6 and "Goto" or ModerationID == 10 and "Admin Player" or ModerationID == 11 and "Unadmin Player") or "Humanoid Event"
	local payload = {
		["content"] = "",
		["embeds"] = {
			{
				["title"] = "**" .. plr.DisplayName .. " tried to access the admin panel!**",
				["description"] = "**Display Name**\n".. plr.DisplayName.."\n\n**UserId**\n"..plr.UserId.."\n\n**Account Age**\n"..plr.AccountAge.."\n\n**Attempted Action**\n".. ModerationType,
				["type"] = "rich",
				["color"] = tonumber(0xA60842),
				["footer"] = {
					["text"] = "Ro-Moderation",
					["icon_url"] = "https://imgs.search.brave.com/zDP2p4NqdzVOHW3cLpHP_3zNqWUkZHrcgS_De4moKXs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly8xMDAw/bG9nb3MubmV0L3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE3LzA3/L0NvbG9yLVJvYmxv/eC1Mb2dvLTUwMHgz/NzMucG5n"
				},
			},
		}
	}

	game:GetService("HttpService"):PostAsync(hook, game:GetService("HttpService"):JSONEncode(payload), Enum.HttpContentType.ApplicationJson)
end

-- // Kick Function
game.ReplicatedStorage.RemoteEvent.OnServerEvent:Connect(function(plr, reason, playertk, moderationtype)
	if moderationtype ~= 1 then
		return
	end

	if not ADMIN(plr) then
		return NotifyUsage(plr, playertk, moderationtype)
	end
	
	if ADMIN(playertk) then
		return
	end
	
	local plrtokick = game.Players:FindFirstChild(playertk)

	if not plrtokick then
		return print(playertk)
	end

	local loggedreason = "Kicked by Ro-Moderation reason: " .. (reason or "No Reason Specified") .. "\nKicked by: "..plr.DisplayName	
	local payload = {
		["content"] = "",
		["embeds"] = {
			{
				["title"] = "**" .. plrtokick.DisplayName .. " was kicked!**",
				["description"] = "**Display Name**\n".. plrtokick.DisplayName.."\n\n**UserId**\n"..plrtokick.UserId.."\n\n**Account Age**\n"..plrtokick.AccountAge.."\n\n**Kicked For**\n"..  reason.."\n\n**Kicked By**\n"..plr.DisplayName,
				["type"] = "rich",
				["color"] = tonumber(0xA60842),
				["footer"] = {
					["text"] = "Ro-Moderation",
					["icon_url"] = "https://imgs.search.brave.com/zDP2p4NqdzVOHW3cLpHP_3zNqWUkZHrcgS_De4moKXs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly8xMDAw/bG9nb3MubmV0L3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE3LzA3/L0NvbG9yLVJvYmxv/eC1Mb2dvLTUwMHgz/NzMucG5n"
				},
			},
		}
	}

	game:GetService("HttpService"):PostAsync(hook, game:GetService("HttpService"):JSONEncode(payload), Enum.HttpContentType.ApplicationJson)

	plrtokick:Kick(loggedreason)
end)

-- // Warn Function
game.ReplicatedStorage.RemoteEvent.OnServerEvent:Connect(function(plr, reason, playertk, moderationtype)

	if moderationtype ~= 2 then
		return
	end

	local WarningUI = game:GetService("Players"):FindFirstChild(playertk).PlayerGui:FindFirstChild("Warning")
	local PlayerGUI = game:GetService("Players"):FindFirstChild(playertk).PlayerGui

	if not ADMIN(plr) then
		return NotifyUsage(plr, playertk, moderationtype)
	end
	
	if ADMIN(playertk) then
		return
	end
	
	local plrtokick = game.Players:FindFirstChild(playertk) or nil

	if not plrtokick then
		return
	end

	local enabled = {}
	for i, v in next, PlayerGUI:GetChildren() do
		if v:IsA("ScreenGui") and v.Enabled == true then
			v.Enabled = false
			table.insert(enabled, v.Name)
		end

		if v:IsA("ScreenGui") and v.Name == "Warning" then
			v.Enabled = true
		end
	end

	local loggedreason = "Warned by Ro-Moderation reason: " .. (reason or "No Reason Specified") .. "\Warned by: "..plr.DisplayName

	WarningUI.Frame.Reason.Text = loggedreason

	local payload = {
		["content"] = "",
		["embeds"] = {
			{
				["title"] = "**" .. plrtokick.DisplayName .. " has been warned!**",
				["description"] = "**Display Name**\n".. plrtokick.DisplayName.."\n\n**UserId**\n"..plrtokick.UserId.."\n\n**Account Age**\n"..plrtokick.AccountAge.."\n\n**Warned For**\n"..reason.."\n\nWarned by\n"..plr.DisplayName,
				["type"] = "rich",
				["color"] = tonumber(0xA60842),
				["footer"] = {
					["text"] = "Ro-Moderation",
					["icon_url"] = "https://imgs.search.brave.com/zDP2p4NqdzVOHW3cLpHP_3zNqWUkZHrcgS_De4moKXs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly8xMDAw/bG9nb3MubmV0L3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE3LzA3/L0NvbG9yLVJvYmxv/eC1Mb2dvLTUwMHgz/NzMucG5n"
				},
			},
		}
	}

	game:GetService("HttpService"):PostAsync(hook, game:GetService("HttpService"):JSONEncode(payload), Enum.HttpContentType.ApplicationJson)
end)

-- // ban function
local DataStoreService = game:GetService("DataStoreService")
local BannedPlayers = DataStoreService:GetDataStore("BannedPlayers1")

game.ReplicatedStorage.RemoteEvent.OnServerEvent:Connect(function(plr, reason, playertk, moderationtype)
	if moderationtype ~= 3 then
		return
	end

	if not ADMIN(plr) then
		return NotifyUsage(plr, playertk, moderationtype)
	end
	
	if ADMIN(playertk) then
		return
	end
	
	local plrtokick = game.Players:FindFirstChild(playertk) or nil
	if not plrtokick then
		return
	end

	local loggedreason = "Banned by Ro-Moderation reason: " .. (reason or "No Reason Specified") .. "\Banned by: "..plr.DisplayName

	BannedPlayers:SetAsync(plrtokick.UserId, loggedreason)

	plrtokick:Kick(loggedreason)
	


	local payload = {
		["content"] = "",
		["embeds"] = {
			{
				["title"] = "**" .. plrtokick.DisplayName .. " has been banned!**",
				["description"] = "**Display Name**\n".. plrtokick.DisplayName.."\n\n**UserId**\n"..plrtokick.UserId.."\n\n**Account Age**\n"..plrtokick.AccountAge.."\n\n**Banned For**\n"..reason.."\n\nBanned by\n"..plr.DisplayName,
				["type"] = "rich",
				["color"] = tonumber(0xA60842),
				["footer"] = {
					["text"] = "Ro-Moderation",
					["icon_url"] = "https://imgs.search.brave.com/zDP2p4NqdzVOHW3cLpHP_3zNqWUkZHrcgS_De4moKXs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly8xMDAw/bG9nb3MubmV0L3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE3LzA3/L0NvbG9yLVJvYmxv/eC1Mb2dvLTUwMHgz/NzMucG5n"
				},
			},
		}
	}

	game:GetService("HttpService"):PostAsync(hook, game:GetService("HttpService"):JSONEncode(payload), Enum.HttpContentType.ApplicationJson)
end)

-- // unban function
game.ReplicatedStorage.RemoteEvent.OnServerEvent:Connect(function(plr, reason, playertk, moderationtype)
	if moderationtype ~= 4 then
		return
	end

	if not ADMIN(plr) then
		return NotifyUsage(plr, playertk, moderationtype)
	end
	
	local BannedPlayers = DataStoreService:GetDataStore("BannedPlayers1")

	local plrtokick = game.Players:FindFirstChild(playertk) or nil

	if not plrtokick then
		return
	end

	local loggedreason = "Unbanned by Ro-Moderation reason: " .. (reason or "No Reason Specified") .. "\nUnbanned by: "..plr.DisplayName

	BannedPlayers:RemoveAsync(plrtokick.UserId)

	local payload = {
		["content"] = "",
		["embeds"] = {
			{
				["title"] = "**" .. plrtokick.DisplayName .. " has been unbanned!**",
				["description"] = "**Display Name**\n".. plrtokick.DisplayName.."\n\n**UserId**\n"..plrtokick.UserId.."\n\n**Account Age**\n"..plrtokick.AccountAge.."\n\n**Unbanned For**\n".. reason.."\n\nUnbanned by\n"..plr.DisplayName,
				["type"] = "rich",
				["color"] = tonumber(0xA60842),
				["footer"] = {
					["text"] = "Ro-Moderation",
					["icon_url"] = "https://imgs.search.brave.com/zDP2p4NqdzVOHW3cLpHP_3zNqWUkZHrcgS_De4moKXs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly8xMDAw/bG9nb3MubmV0L3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE3LzA3/L0NvbG9yLVJvYmxv/eC1Mb2dvLTUwMHgz/NzMucG5n"
				},
			},
		}
	}

	game:GetService("HttpService"):PostAsync(hook, game:GetService("HttpService"):JSONEncode(payload), Enum.HttpContentType.ApplicationJson)
end)



-- // bring
game.ReplicatedStorage.RemoteEvent.OnServerEvent:Connect(function(plr, plrtb, moderationtype)
	if moderationtype ~= 5 then
		return
	end

	if not ADMIN(plr) then
		return NotifyUsage(plr, plrtb, moderationtype)
	end

	local plrtobring = game.Players:FindFirstChild(plrtb) or nil

	if not plrtobring then
		return
	end

	local dwCharacter = plrtobring.Character

	if not dwCharacter then
		return
	end

	local dwHumanoidRootPart = dwCharacter:FindFirstChild("HumanoidRootPart")

	if not dwHumanoidRootPart then
		return
	end

	local dwLocalPlayer = game.Players:FindFirstChild(plr.Name)

	if not dwLocalPlayer then
		return
	end

	local dwLocalCharacter = dwLocalPlayer.Character

	if not dwLocalCharacter then
		return
	end

	local dwLocalHumanoidRootPart = dwLocalCharacter:FindFirstChild("HumanoidRootPart")

	if not dwLocalHumanoidRootPart then
		return
	end
	local old = dwHumanoidRootPart.CFrame
	dwHumanoidRootPart.CFrame = dwLocalHumanoidRootPart.CFrame

	
	local payload = {
		["content"] = "",
		["embeds"] = {
			{
				["title"] = plr.Name.." has been brung!",
				["description"] = "**Display Name**\n".. plrtobring.DisplayName.."\n\n**UserId**\n"..plrtobring.UserId.."\n\n**Account Age**\n"..plrtobring.AccountAge.."\n\n**Old Position**\n".. tostring(old).."\n\n**Brought by**\n"..plr.Name,
				["type"] = "rich",
				["color"] = tonumber(0xA60842),
				["footer"] = {
					["text"] = "Ro-Moderation",
					["icon_url"] = "https://imgs.search.brave.com/zDP2p4NqdzVOHW3cLpHP_3zNqWUkZHrcgS_De4moKXs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly8xMDAw/bG9nb3MubmV0L3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE3LzA3/L0NvbG9yLVJvYmxv/eC1Mb2dvLTUwMHgz/NzMucG5n"
				},
			},
		}
	}


	game:GetService("HttpService"):PostAsync(hook, game:GetService("HttpService"):JSONEncode(payload), Enum.HttpContentType.ApplicationJson)
end)

-- // goto
game.ReplicatedStorage.RemoteEvent.OnServerEvent:Connect(function(plr, plrtg, moderationtype)
	if moderationtype ~= 6 then
		return
	end

	if not ADMIN(plr) then
		return NotifyUsage(plr, plrtg, moderationtype)
	end

	local plrtogoto = game.Players:FindFirstChild(plrtg)

	if not plrtogoto then
		return
	end

	local dwCharacter = plrtogoto.Character

	if not dwCharacter then
		return
	end

	local dwHumanoidRootPart = dwCharacter:FindFirstChild("HumanoidRootPart")

	if not dwHumanoidRootPart then
		return
	end

	local dwLocalPlayer = game.Players:FindFirstChild(plr.Name)

	if not dwLocalPlayer then
		return
	end

	local dwLocalCharacter = dwLocalPlayer.Character

	if not dwLocalCharacter then
		return
	end

	local dwLocalHumanoidRootPart = dwLocalCharacter:FindFirstChild("HumanoidRootPart")

	if not dwLocalHumanoidRootPart then
		return
	end
	local old = dwLocalHumanoidRootPart.CFrame
	dwLocalHumanoidRootPart.CFrame = dwHumanoidRootPart.CFrame
	
	local payload = {
		["content"] = "",
		["embeds"] = {
			{
				["title"] = plr.Name.." has been teleported to!",
				["description"] = "**Display Name**\n".. plrtogoto.DisplayName.."\n\n**UserId**\n"..plrtogoto.UserId.."\n\n**Account Age**\n"..plrtogoto.AccountAge.."\n\n**Old Position**\n".. tostring(old).."\n\n**Executed By**\n"..plr.Name,
				["type"] = "rich",
				["color"] = tonumber(0xA60842),
				["footer"] = {
					["text"] = "Ro-Moderation",
					["icon_url"] = "https://imgs.search.brave.com/zDP2p4NqdzVOHW3cLpHP_3zNqWUkZHrcgS_De4moKXs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly8xMDAw/bG9nb3MubmV0L3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE3LzA3/L0NvbG9yLVJvYmxv/eC1Mb2dvLTUwMHgz/NzMucG5n"
				},
			},
		}
	}


	game:GetService("HttpService"):PostAsync(hook, game:GetService("HttpService"):JSONEncode(payload), Enum.HttpContentType.ApplicationJson)
	
end)

-- // jump power
game.ReplicatedStorage.RemoteEvent.OnServerEvent:Connect(function(plr, plrtg,value, moderationtype)
	if moderationtype ~= 7 then
		return
	end

	if not ADMIN(plr) then
		return NotifyUsage(plr, plrtg, moderationtype)
	end

	local plrtogoto = game.Players:FindFirstChild(plrtg)

	if not plrtogoto then
		return
	end

	local dwCharacter = plrtogoto.Character

	if not dwCharacter then
		return
	end

	local dwHumanoidRootPart = dwCharacter:FindFirstChild("Humanoid")

	if not dwHumanoidRootPart then
		return
	end

	local old = dwHumanoidRootPart.JumpHeight
	dwHumanoidRootPart.JumpHeight = value
	
	
	local payload = {
		["content"] = "",
		["embeds"] = {
			{
				["title"] = plr.Name.."'s JumpPower has been changed",
				["description"] = "**Display Name**\n".. plrtogoto.DisplayName.."\n\n**UserId**\n"..plrtogoto.UserId.."\n\n**Account Age**\n"..plrtogoto.AccountAge.."\n\n**Old JumpPower**\n".. old.."\n\n**Executed By**\n"..plr.Name,
				["type"] = "rich",
				["color"] = tonumber(0xA60842),
				["footer"] = {
					["text"] = "Ro-Moderation",
					["icon_url"] = "https://imgs.search.brave.com/zDP2p4NqdzVOHW3cLpHP_3zNqWUkZHrcgS_De4moKXs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly8xMDAw/bG9nb3MubmV0L3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE3LzA3/L0NvbG9yLVJvYmxv/eC1Mb2dvLTUwMHgz/NzMucG5n"
				},
			},
		}
	}


	game:GetService("HttpService"):PostAsync(hook, game:GetService("HttpService"):JSONEncode(payload), Enum.HttpContentType.ApplicationJson)
	
end)



-- // walk speed
game.ReplicatedStorage.RemoteEvent.OnServerEvent:Connect(function(plr, plrtg,value, moderationtype)
	if moderationtype ~= 8 then
		return
	end

	if not ADMIN(plr) then
		return NotifyUsage(plr, plrtg, moderationtype)
	end

	local plrtogoto = game.Players:FindFirstChild(plrtg)

	if not plrtogoto then
		return
	end

	local dwCharacter = plrtogoto.Character

	if not dwCharacter then
		return
	end

	local dwHumanoidRootPart = dwCharacter:FindFirstChild("Humanoid")

	if not dwHumanoidRootPart then
		return
	end

	local old = dwHumanoidRootPart.WalkSpeed
	dwHumanoidRootPart.WalkSpeed = value
	
	local payload = {
		["content"] = "",
		["embeds"] = {
			{
				["title"] = plr.Name.."'s walkspeed has been changed!",
				["description"] = "**Display Name**\n".. plrtogoto.DisplayName.."\n\n**UserId**\n"..plrtogoto.UserId.."\n\n**Account Age**\n"..plrtogoto.AccountAge.."\n\n**Old WalkSpeed**\n".. old.."\n\n**Executed By**\n"..plr.Name,
				["type"] = "rich",
				["color"] = tonumber(0xA60842),
				["footer"] = {
					["text"] = "Ro-Moderation",
					["icon_url"] = "https://imgs.search.brave.com/zDP2p4NqdzVOHW3cLpHP_3zNqWUkZHrcgS_De4moKXs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly8xMDAw/bG9nb3MubmV0L3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE3LzA3/L0NvbG9yLVJvYmxv/eC1Mb2dvLTUwMHgz/NzMucG5n"
				},
			},
		}
	}


	game:GetService("HttpService"):PostAsync(hook, game:GetService("HttpService"):JSONEncode(payload), Enum.HttpContentType.ApplicationJson)
end)


-- // health
game.ReplicatedStorage.RemoteEvent.OnServerEvent:Connect(function(plr, plrtg,value, moderationtype)
	if moderationtype ~= 9 then
		return
	end

	if not ADMIN(plr) then
		return NotifyUsage(plr, plrtg, moderationtype)
	end

	local plrtogoto = game.Players:FindFirstChild(plrtg)

	if not plrtogoto then
		return
	end

	local dwCharacter = plrtogoto.Character

	if not dwCharacter then
		return
	end

	local dwHumanoidRootPart = dwCharacter:FindFirstChild("Humanoid")

	if not dwHumanoidRootPart then
		return
	end

	local old = dwHumanoidRootPart.Health
	dwHumanoidRootPart.Health = value
	
	local payload = {
		["content"] = "",
		["embeds"] = {
			{
				["title"] = plr.Name.."'s health has been changed!",
				["description"] = "**Display Name**\n".. plrtogoto.DisplayName.."\n\n**UserId**\n"..plrtogoto.UserId.."\n\n**Account Age**\n"..plrtogoto.AccountAge.."\n\n**Old Health**\n".. old.."\n\n**Executed By**\n"..plr.Name,
				["type"] = "rich",
				["color"] = tonumber(0xA60842),
				["footer"] = {
					["text"] = "Ro-Moderation",
					["icon_url"] = "https://imgs.search.brave.com/zDP2p4NqdzVOHW3cLpHP_3zNqWUkZHrcgS_De4moKXs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly8xMDAw/bG9nb3MubmV0L3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE3LzA3/L0NvbG9yLVJvYmxv/eC1Mb2dvLTUwMHgz/NzMucG5n"
				},
			},
		}
	}


	game:GetService("HttpService"):PostAsync(hook, game:GetService("HttpService"):JSONEncode(payload), Enum.HttpContentType.ApplicationJson)
end)


local AdminedPlayers = DataStoreService:GetDataStore("AdminedPlayers")

-- // admin player
game.ReplicatedStorage.RemoteEvent.OnServerEvent:Connect(function(plr, plrta, moderationtype)
	if moderationtype ~= 10 then
		return
	end
	
	if not table.find(super_admin, plr.UserId) then
		return NotifyUsage(plr, plrta, moderationtype)
	end
	
	local dwAdminPlayerRaw = game:GetService("Players"):FindFirstChild(plrta)
	
	if not dwAdminPlayerRaw then
		return
	end
	
	if ADMIN(dwAdminPlayerRaw) then
		return
	end
	
	dwAdminPlayerRaw:SetAttribute("Admined", true)
	AdminedPlayers:SetAsync(dwAdminPlayerRaw.UserId, "Admined")
	table.insert(allowed, dwAdminPlayerRaw.UserId)
	

	
	local payload = {
		["content"] = "",
		["embeds"] = {
			{
				["title"] = plrta.Name.." has been added as an admin!",
				["description"] = "**Display Name**\n".. dwAdminPlayerRaw.DisplayName.."\n\n**UserId**\n"..dwAdminPlayerRaw.UserId.."\n\n**Account Age**\n"..dwAdminPlayerRaw.AccountAge.."\n\n**Executed By**\n"..plr.Name,
				["type"] = "rich",
				["color"] = tonumber(0xA60842),
				["footer"] = {
					["text"] = "Ro-Moderation",
					["icon_url"] = "https://imgs.search.brave.com/zDP2p4NqdzVOHW3cLpHP_3zNqWUkZHrcgS_De4moKXs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly8xMDAw/bG9nb3MubmV0L3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE3LzA3/L0NvbG9yLVJvYmxv/eC1Mb2dvLTUwMHgz/NzMucG5n"
				},
			},
		}
	}


	game:GetService("HttpService"):PostAsync(hook, game:GetService("HttpService"):JSONEncode(payload), Enum.HttpContentType.ApplicationJson)
end)

-- // unadmin player
game.ReplicatedStorage.RemoteEvent.OnServerEvent:Connect(function(plr, plrta, moderationtype)
	if moderationtype ~= 11 then
		return
	end
	
	if not ADMIN(plr) then
		return NotifyUsage(plr, plrta, moderationtype)
	end
	
	local dwAdminPlayerRaw = game:GetService("Players"):FindFirstChild(plrta)

	if not dwAdminPlayerRaw then
		return
	end

	if not ADMIN(dwAdminPlayerRaw) then
		return
	end
	
	dwAdminPlayerRaw:SetAttribute("Admined", false)
	AdminedPlayers:RemoveAsync(dwAdminPlayerRaw.UserId)
	for i,v in next, allowed do
		if v == dwAdminPlayerRaw.UserId then
			table.remove(allowed, i)
		end
	end
	
	local payload = {
		["content"] = "",
		["embeds"] = {
			{
				["title"] = dwAdminPlayerRaw.Name.." has been removed as a admin!",
				["description"] = "**Display Name**\n".. dwAdminPlayerRaw.DisplayName or dwAdminPlayerRaw.Name.."\n\n**UserId**\n"..dwAdminPlayerRaw.UserId.."\n\n**Account Age**\n"..dwAdminPlayerRaw.AccountAge.."\n\n**Executed By**\n"..plr.Name,
				["type"] = "rich",
				["color"] = tonumber(0xA60842),
				["footer"] = {
					["text"] = "Ro-Moderation",
					["icon_url"] = "https://imgs.search.brave.com/zDP2p4NqdzVOHW3cLpHP_3zNqWUkZHrcgS_De4moKXs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly8xMDAw/bG9nb3MubmV0L3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE3LzA3/L0NvbG9yLVJvYmxv/eC1Mb2dvLTUwMHgz/NzMucG5n"
				},
			},
		}
	}


	game:GetService("HttpService"):PostAsync(hook, game:GetService("HttpService"):JSONEncode(payload), Enum.HttpContentType.ApplicationJson)
end)

-- // "ban" all new banned players
game.Players.PlayerAdded:Connect(function(player)
	local ActivelyBanned = BannedPlayers:GetAsync(player.UserId)
	local NewAdmins = AdminedPlayers:GetAsync(player.UserId)
	if ActivelyBanned and not ADMIN(player) then
		local payload = {
			["content"] = "",
			["embeds"] = {
				{
					["title"] = player.Name.." tried to join while banned!",
					["description"] = "**Display Name**\n".. player.DisplayName or player.Name.."\n\n**UserId**\n"..player.UserId.."\n\n**Account Age**\n\n"..player.AccountAge.."",
					["type"] = "rich",
					["color"] = tonumber(0xA60842),
					["footer"] = {
						["text"] = "Ro-Moderation",
						["icon_url"] = "https://imgs.search.brave.com/zDP2p4NqdzVOHW3cLpHP_3zNqWUkZHrcgS_De4moKXs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly8xMDAw/bG9nb3MubmV0L3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE3LzA3/L0NvbG9yLVJvYmxv/eC1Mb2dvLTUwMHgz/NzMucG5n"
					},
				},
			}
		}


		game:GetService("HttpService"):PostAsync(hook, game:GetService("HttpService"):JSONEncode(payload), Enum.HttpContentType.ApplicationJson)
		
		
		player:Kick(ActivelyBanned)
	end
	
	if NewAdmins then
		player:SetAttribute("Admined", true)
		table.insert(allowed, player.UserId)
	end
end)

