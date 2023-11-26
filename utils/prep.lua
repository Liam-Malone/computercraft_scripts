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

-- TODO: Add other branches for other turtle purposes
if args[1] == 'quarry' then
    Download("https://gist.githubusercontent.com/Liam-Malone/8432db923c725291ed021c9f207b0fbc/raw/9a45c5340fcc952b4af5a41ac71be70a265c11f7/quarry.blacklist", "quarry.blacklist" )
    Download("https://gist.githubusercontent.com/Liam-Malone/8432db923c725291ed021c9f207b0fbc/raw/9a45c5340fcc952b4af5a41ac71be70a265c11f7/quarry.conf", "quarry.conf" )
    Download("https://pastebin.com/raw/rpXRAZs4", "quarry")
else
    print("usage: setup <target>\nexample: setup quarry")
end
