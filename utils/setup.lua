Quarry_BlackList_URL = "https://gist.githubusercontent.com/Liam-Malone/8432db923c725291ed021c9f207b0fbc/raw/d61bea3952271e37da1330d9b0d1924a4bb00619/quarry.blacklist"
Quarry_Conf_URL = "https://gist.githubusercontent.com/Liam-Malone/8432db923c725291ed021c9f207b0fbc/raw/d61bea3952271e37da1330d9b0d1924a4bb00619/quarry.conf"
Quarry_URL = "https://pastebin.com/raw/rpXRAZs4"

Help_Msg = "usage: setup <arg>\noptions:\ntargets - show targets available\nhelp - show this message"

Targets = { 'quarry', 'farm' }

function Download(url, file)
  local content = http.get(url).readAll()
  if not content then
    error("Could not connect to website")
  end
  f = fs.open(file, "w")
  f.write(content)
  f.close()
end

local args = {...}
local argc = #args

-- TODO: Add other branches for other turtle purposes
if argc == 0 then
    print(Help_Msg)
    os.exit(0)
else
    if args[1] == 'quarry' then
        Download(Quarry_BlackList_URL, "quarry.blacklist" )
        Download(Quarry_Conf_URL, "quarry.conf" )
        Download(Quarry_URL, "quarry")
    elseif args[1] == 'targets' then
        print("Available targets:\n")
        for _, v in pairs(Targets) do
            print(v)
        end
    elseif args[1] == 'help' then
        print(Help_Msg)
        -- TODO: add help for specific commands
    elseif args[1] == 'farm' then
        -- choose farm type
    else
        print(string.format("error: no option <%s>\n\n%s", args[1], Help_Msg))
    end
end

