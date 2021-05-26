
local DataStoreService = game:GetService("DataStoreService")

local myDataStore = DataStoreService:GetDataStore("myDataStore")

game.Players.PlayerAdded:connect(function(player)
	local stats = Instance.new("Folder")
	stats.Name = "leaderstats"
	stats.Parent = player

	local money = Instance.new("IntValue")
	money.Name = "Soop Stolen" 
	money.Value = 0 
	money.Parent = stats

	local cash = Instance.new("IntValue")
	cash.Name = "Cash" 
	cash.Value = 0 
	cash.Parent = stats 
	
	local data
	local success, errormessage = pcall(function()
		data = myDataStore:GetAsync(player.UserId.."-cash")
	end)
	
	if success then
		cash.Value = data
	else
		print("There was an error while getting your data")
		warn(errormessage)
	end
end)

game.Players.PlayerRemoving:Connect(function(player)
	
	local success, errormessage = pcall(function()
		myDataStore:SetAsync(player.UserId.."-cash", player.leaderstats.Cash.Value)
	end)
	
	if success then
		print("Player Data successfully saved")
	else
		print("There was an error when saving data")
		warn(errormessage)
	end
end) 