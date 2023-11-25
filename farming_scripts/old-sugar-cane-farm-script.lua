--pastebin code is: 3aTLpB9y
--collect sugar cane and deposit in chest below when back at obsidian
function refuel()
	local chest = peripheral.wrap("top")
	for slot = 1, 27, 1 do
		local item = chest.getItemDetail(slot) 
		if (item ~= nil and item['name'] == "minecraft:lava_bucket" and needs_refuel())then
			turtle.suckUp()
			turtle.refuel()
			turtle.turnLeft()
			turtle.drop()
			turtle.turnRight()
			return
		end
	end
end

function needs_refuel()
	if (turtle.getFuelLevel() < 300) then
		return true
	end
	return false
end

function deposit()
	for slot = 1, 16, 1 do
		turtle.select(slot)
		turtle.dropDown()
	end
end

function collect()
	isBlock, data = turtle.inspect()
	if (not isBlock) then
		turtle.suckDown()
		turtle.forward()
		turtle.suckDown()
	else -- if there is a block
		if (data['name'] == "minecraft:sugar_cane") then
			turtle.dig()
			turtle.forward()
			turtle.suckDown()
		elseif (data['name'] == "minecraft:obsidian") then
			turtle.turnLeft()
			turtle.turnLeft()
			deposit()
			if (needs_refuel()) then
				refuel()
			end
			sleep(120)
		else 
			turtle.turnLeft()
		end
	end
end

function main()
	collect()
end

while (1) do
	main()
end