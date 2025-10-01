SLASH_CARBONITEWAY1 = "/way"
SLASH_CARBONITEWAY2 = "/goto"
SlashCmdList["CARBONITEWAY"] = function(msg)
	if (not msg) then return end
	local args = {string.split(" ,", msg)}
	if (#args < 2) then
		return
	end
	if (string.byte(args[1], 1) == 35) then -- #
		for i=1, #args do
			args[i] = args[i+1]
		end
	end
	local x,y = tonumber(args[1]), tonumber(args[2])
    if(x and y and x > 0 and y > 0) then
    	local desc
    	if (args[3]) then
    		desc = table.concat(args, " ", 3)
    	else
    		desc = string.format("Goto %.1f, %.1f", x, y)
    	end
    	-- TomTom:AddWaypoint
    	Nx:TTAW(x, y, desc)
    end
end
