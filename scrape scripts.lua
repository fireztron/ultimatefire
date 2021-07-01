--// Log text function
local function logText(fileName, txt)
    if isfile(fileName) then
        appendfile(fileName, txt)
    else
        writefile(fileName, txt)
    end
end

warn("hi")
local first = false
for i,v in pairs(game:GetDescendants()) do
    if 
        v.Name ~= "Animate" and (v:IsA("LocalScript") or v:IsA("ModuleScript")) 
        and not v:IsDescendantOf(game:GetService("StarterPlayer"))
        and not v:IsDescendantOf(game:GetService("StarterGui"))
        and not v:IsDescendantOf(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule)
        and not v:IsDescendantOf(game:GetService("Players").LocalPlayer.PlayerScripts.ChatScript)
        and not v:IsDescendantOf(game:GetService("CorePackages")) 
        and not v:IsDescendantOf(game:GetService("CoreGui")) 
        and not v:IsDescendantOf(game:GetService("Chat")) 
    then
        if (v.Name == "ResetGui" and not first) or v.Name ~= "ResetGui" then
            local txt = tostring(decompile(v))
            txt = txt .. "\n--// " .. v:GetFullName() .. "\n\n"
            logText("penis.lua", txt)
            first = true
        end
    end
end

warn("AHHH")
