if game.PlaceId == 9809240583 then
	local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/sol"))()
	local win = SolarisLib:New({
		Name = "Recife RP",
		FolderToSave = "Recife RP"
	})

	local EPU = win:Tab("Recife RP")
	local sec = EPU:Section("Recife RP")
	local sec2 = EPU:Section("Gun Customize")
	local EPU2 = win:Tab("Teleports")
	local secTP = EPU2:Section("Teleports")
	local EPU3 = win:Tab("Pix")
	local secPix = EPU3:Section("Enviar Pix")
	
	local plrs = {}

	for i,v in pairs(game.Players:GetPlayers())do
		if v ~= game.Players.LocalPlayer then
			table.insert(plrs,v.Name)
		end
	end

	sec:Toggle("Auto Farm Lixeiro (Mais Ou Menos)", false,"Toggle", function(state)
		if state == true then
			local players = game:GetService('Players')
			local player = players.LocalPlayer
			local character = player.Character
			local originpos = character.HumanoidRootPart.CFrame

			_G.farmando = true

			game:GetService("ReplicatedStorage").Times.GariTeam:FireServer()

			while _G.farmando do task.wait()
				for i, v in next, workspace.Construcoes:WaitForChild('SistemaGari').Lixos:GetDescendants() do
					if v:IsA('MeshPart') and v.ProximityPrompt.Enabled == true then
						character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 0, 0)
						task.wait(0.2)
						fireproximityprompt(v.ProximityPrompt)
						character.HumanoidRootPart.CFrame = game:GetService("Workspace").Construcoes.SistemaGari.Latao.LataoLixo.CFrame
						task.wait(0.2)
						fireproximityprompt(game:GetService("Workspace").Construcoes.SistemaGari.Latao.Proximitikk.ProximityPrompt)
					end
				end
			end
			character.HumanoidRootPart.CFrame = originpos
		else
			_G.farmando = false
		end
	end)
	sec:Toggle("Auto Farm Caminhoneiro (Bom) (Needs Auto Clicker)", false,"Toggle", function(state)
		if state == true then
			local players = game:GetService('Players')
			local player = players.LocalPlayer
			local character = player.Character

			_G.farmando = true

			game:GetService("ReplicatedStorage").Times.CaminhoneiroTeam:FireServer()

			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(414.1980285644531, 7.111598968505859, 1947.787109375)
			wait(0.05)
			local N=game:GetService("VirtualInputManager")
			N:SendKeyEvent(true,"E",false,game)
			wait(10)

			if game:GetService("Players").LocalPlayer.PlayerGui["A-Chassis Interface"].Car.Value ~= "Caminhao" then
				while _G.farmando do wait()
					for _,v in pairs(game:GetService("Workspace").Construcoes.Caminhoneiro:GetDescendants()) do
						if v:IsA("TouchTransmitter") then
							firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
							firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
						end
					end
				end
			end
		else
			_G.farmando = false
		end
	end)
	sec:Toggle("Auto Farm IFood (Ruim)", false,"Toggle", function(state)
		if state == true then
			local players = game:GetService('Players')
			local player = players.LocalPlayer
			local character = player.Character
			local originpos = character.HumanoidRootPart.CFrame

			_G.farmando = true

			game:GetService("ReplicatedStorage").Times.iFoodTeam:FireServer()

			while _G.farmando do task.wait()
				for i, v in next, game:GetService("Workspace").Pizza1:GetDescendants() or game:GetService("Workspace").Pizza2:GetDescendants() do
					if v:IsA('Part') then
						character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 2, 0)
						fireproximityprompt(v.Parent.ProximityPrompt, 0)
						wait(0.05)
						for _,v in pairs(workspace:GetDescendants()) do
							if v:IsA("MeshPart") and v.Name == "OrderChar" then
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
								fireproximityprompt(v.ProximityPrompt, 0)
							end
						end
					end
				end
			end
			character.HumanoidRootPart.CFrame = originpos
		else
			_G.farmando = false
		end
	end)
	sec:Toggle("Auto Farm Partes AK (Free Gun)", false,"Toggle", function(state)
		if state == true then
			local players = game:GetService('Players')
			local player = players.LocalPlayer
			local character = player.Character
			local originpos = character.HumanoidRootPart.CFrame

			_G.farmando = true

			while _G.farmando do task.wait()
				for i, v in next, workspace:WaitForChild('Vendedor'):GetDescendants() do
					if v:IsA('Part') and v.Name == "IniciarRotaAK" and v.ProximityPrompt.Enabled == true then
						character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 0, 0)
						fireproximityprompt(v.ProximityPrompt)
						task.wait(0.05)
						for _,v in pairs(workspace:GetDescendants()) do
							if v:IsA("Part") and v.Name == "RotaAK" then
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
								fireproximityprompt(v.ProximityPrompt, 0)
							end
						end
						task.wait(0.2)
					end
				end
			end
			character.HumanoidRootPart.CFrame = originpos
		else
			_G.farmando = false
		end
	end)
	sec:Button("Lugar Para Fabricar a AK", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6477.2978515625, 78.34121704101562, 5670.77197265625)
		wait(0.05)
		for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
			if v:FindFirstChild("ProximityPrompt") then
				fireproximityprompt(v.ProximityPrompt, 0)
			end
		end
		wait(0.05)
		for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
			if v:FindFirstChild("ProximityPrompt") then
				fireproximityprompt(v.ProximityPrompt, 0)
			end
		end
	end)
	
	sec2:Button('Dano Infinito', function()
		for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetDescendants()) do
			if v.Name == "NoCol" then
				MOD = v;
				SCRIPTMOD = require(MOD);
				HUGE = math.huge
				SCRIPTMOD.damage.bodyshot = HUGE
				SCRIPTMOD.damage.headshot = HUGE
			end
		end                    
	end)
	sec2:Textbox("Som De Disparo", true, function(t)
		for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetDescendants()) do
			if v.Name == "NoCol" then
				MOD = v;
				SCRIPTMOD = require(MOD);
				SCRIPTMOD.audio.fire = "rbxassetid://"..t
				SCRIPTMOD.audio.bodyshot = "rbxassetid://"..t
				SCRIPTMOD.audio.headshot = "rbxassetid://"..t
			end
		end  
	end)
	
	secTP:Button("Loja De Carros", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1419.519775390625, 4.506799697875977, 3701.975830078125)
	end)
	secTP:Button("Loja De Armas", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-571.2353515625, 8.121224403381348, 4483.13525390625)		
	end)
	secTP:Button("Loja De Apartamentos", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-372.069580078125, 4.552813529968262, 3604.556396484375)
	end)
	secTP:Button("Loja De Acessórios", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1006.8764038085938, 4.751076698303223, 3965.451904296875)
	end)
	secTP:Button("Apartamentos", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1077.5906982421875, 4.772475242614746, 3227.690185546875)
	end)
	secTP:Button("Hospital", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-902.6317138671875, 6.3726301193237305, 4547.4501953125)
	end)
	
	-- PIX --
	
	local DP = secPix:Dropdown("Selecionar Player", plrs,"","DropPath", function(t)
		getgenv().player = t
	end)
	secPix:Textbox("Quantidade", true, function(q)
		getgenv().Dinheiro = q
		SolarisLib:Notification("Selecionado", "Voce Selecionou R$"..q)
	end)
	secPix:Button("Enviar Pix", function()
		local args = {
			[1] = "PIXENVIADO",
			[2] = getgenv().Dinheiro,
			[3] = getgenv().player
		}

		game:GetService("ReplicatedStorage").Outros.Banco2:FireServer(unpack(args))
		SolarisLib:Notification("Pix", "Pix Enviado")
	end)
	
	game.Players.PlayerAdded:Connect(function(player)
		local name = player.Name
		table.insert(plrs,name)
		DP:Refresh(plrs, true)
	end)
	game.Players.PlayerRemoving:Connect(function(player)
		local name = player.Name
		for i,v in pairs(plrs)do
			if v == name then  
				table.remove(plrs,i)
			end
		end
		DP:Refresh(plrs, true)
	end)
end
