local Options = NPCWeap.loaded_options
function NPCWeap:Save()
	local fileName = NPCWeap.save_path .. "NPCWeapoptions.txt"
	local file = io.open(fileName, "w+")
	file:write(json.encode(Options))
	file:close()
end

function NPCWeap:Load_options()
	local file = io.open(NPCWeap.save_path .. "NPCWeapoptions.txt", 'r')
	if file == nil then
		return
	end
	local file_contents = file:read("*all")
	local data = json.decode( file_contents )
	file:close()
	if data then
		for p, d in pairs(data) do
			Options[p] = d
		end
	end
end