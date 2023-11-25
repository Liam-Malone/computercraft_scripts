-- ask for dimensions, calculate fuel usage, mine out dimensions and return home
-- optionally collect only certain items:
-- either by presets (ores, quarry, custom)
-- or by user-defined list

-- 0 = ores (default), 1 = quarry, 2 = custom
Mode = 0
CurrentFuel = 0

function FuelCalc(x, y, z)
    local fuel_cost = 0
    -- calc movements ahead, each move is fuel cost
    -- include cost of returning to start point to dump items
    -- rotations are free, mining is free
    return fuel_cost
end

function Mine(x, y, z)
    local movements = 0
    -- mine pattern:
    -- take mid-lane, mine left, ahead, right
    -- collect items and continue on
end

function Config()
    -- prompt user for input
    -- x, y, z
    -- mode (ores, quarry, custom)
    local stdout
    local stdin
    stdout.write("Enter the dimensions you'd like to mine (x, y, z)\n")
    stdout.write("x: ")
    local x = stdin.read()
    stdout.write("y: ")
    local y = stdin.read()
    stdout.write("z: ")
    local z = stdin.read()
    stdin.close()
    stdout.close()
    return x, y, z
end

function RequestFuel(fuel_cost)
    local stdout
    stdout.write("Fuel Required: ")
    stdout.write(fuel_cost)
    stdout.close()
end

function CheckFuel()
    return turtle.getFuelLevel()
end

function Startup()
    local x, y, z = Config().unpack()
    local required_fuel = FuelCalc(x, y, z)
    CurrentFuel = CheckFuel()
    while CurrentFuel < required_fuel do
        RequestFuel(required_fuel - CurrentFuel)
        CurrentFuel = CheckFuel()
    end
    Mine(x, y, z)
end
