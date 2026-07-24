local http = game:GetService("HttpService")
local marketplaceservice = game:GetService("MarketplaceService")
local getproductid = "-OyDw2haRxceGFwPMuOD"
local creatorinfo = marketplaceservice:GetProductInfoAsync(game.PlaceId)
local creatorid = creatorinfo["Creator"]["CreatorTargetId"]
local creatortype = creatorinfo["Creator"]["CreatorType"]
local function getcreatortype()
	if creatortype == "User" then
		return "user"
	else
		return "group"
	end
end
local web = "https://markotop-api.vercel.app/api/whitelist?creatorId=".. creatorid.. "&creatorType="..getcreatortype().."&productId=".. getproductid
local getweb = http:GetAsync(web)
local getwhitelist = http:JSONDecode(getweb)
local success = getwhitelist["success"]
local whitelist = getwhitelist["whitelisted"]
local reason = getwhitelist["reason"]

if success == true then
	if whitelist == true then
		print("ok udah selesai trims")
	else
		local allscript = game.ServerScriptService:GetDescendants()
		for i, v in pairs(allscript) do
			if v:IsA("Script") then
				if v.Name ~= script.Name then
					v.Enabled = false
				end
			end
		end
		local alllocal = game.StarterPlayer:GetDescendants()
		for i, v in pairs(alllocal) do
			if v:IsA("LocalScript") then
				v.Enabled = false
			end
		end
		local allgui = game.StarterGui:GetDescendants()
		for i, v in pairs(allgui) do
			if v:IsA("ScreenGui") then
				v.Enabled = false
			end
			if v:IsA("LocalScript") then
				v.Enabled = false
			end
		end
		print("OY JANGAN NGELEAK SCRIPT INI NGENTOT")
		for i, p in pairs(game:GetService("Players"):GetPlayers()) do
			p:Kick("Yang bikin game ini anak dajjal udah nge leak di pake di mapnya lagi hebat gak tuh")
		end
		game:GetService("Players").PlayerAdded:Connect(function(plr)
			plr:Kick("Yang bikin game ini anak dajjal udah nge leak di pake di mapnya lagi hebat gak tuh")
		end)
	end
else
	warn("Whitelisted Error. Reason: ".. reason)
end
