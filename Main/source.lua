local _1 = game:GetService("Players")
local _2 = game:GetService("CoreGui")
local _3 = game:GetService("Workspace")
local _4 = game:GetService("ReplicatedStorage")
local _5 = game:GetService("StarterPack")
local _6 = game:GetService("HttpService")
local _7 = game:GetService("RunService")

local _8 = _1.LocalPlayer
local _9 = _8.Character or _8.CharacterAdded:Wait()
local _10 = _9:WaitForChild("Humanoid")

local _11 = {
    ["run"]=true, ["walk"]=true, ["jump"]=true, ["fall"]=true, 
    ["idle"]=true, ["climb"]=true, ["sit"]=true, ["toolnone"]=true
}

local _12 = {
    StopOnMove = true,
    LoopPreview = true,
}

local _13 = nil
local _14 = nil
local _15 = nil
local _16 = {} 
local _17 = "Local" 
local _18 = {} 
local _19 = false

local function _20(_a)
    local _b = {_a:GetComponents()}
    for _c, _d in pairs(_b) do _b[_c] = math.floor(_d * 1000) / 1000 end
    return _b
end

local function _21(_a)
    local _b = {
        n = _a.Name, w = _a.Weight, c = _20(_a.CFrame),
        s = _a.EasingStyle.Value, d = _a.EasingDirection.Value, sub = {}
    }
    for _, _c in pairs(_a:GetChildren()) do
        if _c:IsA("Pose") then table.insert(_b.sub, _21(_c)) end
    end
    return _b
end

local function _22(_a, _b)
    local _c = { n = _a.Name, l = _a.Loop, p = _a.Priority.Value, o = _b or "Unk", k = {} }
    for _, _d in pairs(_a:GetChildren()) do
        if _d:IsA("Keyframe") then
            local _e = { n = _d.Name, t = _d.Time, p = {} } 
            for _, _f in pairs(_d:GetChildren()) do
                if _f:IsA("Pose") then table.insert(_e.p, _21(_f)) end
            end
            table.insert(_c.k, _e)
        end
    end
    return _c 
end

local _23 = "AnimConvser_V9_Select"
pcall(function()
    if _2:FindFirstChild(_23) then _2[_23]:Destroy() end
    if _8.PlayerGui:FindFirstChild(_23) then _8.PlayerGui[_23]:Destroy() end
end)

local _24 = Instance.new("ScreenGui")
_24.Name = _23
_24.ResetOnSpawn = false
pcall(function() _24.Parent = _2 end)
if not _24.Parent then _24.Parent = _8:WaitForChild("PlayerGui") end

local _25 = Instance.new("Frame")
_25.Name = "MainFrame"
_25.Size = UDim2.new(0, 500, 0, 450)
_25.Position = UDim2.new(0.5, -250, 0.5, -225)
_25.BackgroundColor3 = Color3.fromRGB(195, 195, 195)
_25.BorderSizePixel = 2
_25.BorderColor3 = Color3.fromRGB(50, 50, 50)
_25.Active = true
_25.Draggable = true
_25.Parent = _24

local _26 = Instance.new("Frame")
_26.Size = UDim2.new(1, 0, 0, 25)
_26.BackgroundColor3 = Color3.fromRGB(13, 27, 86)
_26.BorderSizePixel = 0
_26.Parent = _25

local _27 = Instance.new("TextLabel")
_27.Text = "AnimConvser"
_27.Size = UDim2.new(1, -10, 1, 0)
_27.Position = UDim2.new(0, 8, 0, 0)
_27.BackgroundTransparency = 1
_27.TextColor3 = Color3.new(1,1,1)
_27.Font = Enum.Font.ArialBold
_27.TextSize = 14
_27.TextXAlignment = Enum.TextXAlignment.Left
_27.Parent = _26

local _28 = Instance.new("Frame")
_28.Size = UDim2.new(1, -16, 0, 25)
_28.Position = UDim2.new(0, 8, 0, 32)
_28.BackgroundTransparency = 1
_28.Parent = _25

local function _29(_a, _b, _c)
    local _d = Instance.new("TextButton")
    _d.Text = _a
    _d.Size = UDim2.new(0.5, -2, 1, 0)
    _d.Position = UDim2.new(_b, 0, 0, 0)
    _d.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    _d.BorderColor3 = Color3.fromRGB(100, 100, 100)
    _d.Font = Enum.Font.ArialBold
    _d.TextSize = 12
    _d.Parent = _28
    _d.MouseButton1Click:Connect(function()
        for _,_e in pairs(_28:GetChildren()) do _e.BackgroundColor3 = Color3.fromRGB(220,220,220); _e.TextColor3 = Color3.new(0,0,0) end
        _d.BackgroundColor3 = Color3.fromRGB(0, 120, 200); _d.TextColor3 = Color3.new(1,1,1)
        _c()
    end)
    return _d
end

local _30
local _31 = _29("LOCAL", 0, function() _17 = "Local"; _30() end)
local _32
local _33 = _29("GLOBAL SCAN", 0.5, function() _17 = "Global"; if #_16 == 0 then _32() else _30() end end)
_31.BackgroundColor3 = Color3.fromRGB(0, 120, 200); _31.TextColor3 = Color3.new(1,1,1)

local _34 = Instance.new("Frame")
_34.Size = UDim2.new(1, -16, 0, 25)
_34.Position = UDim2.new(0, 8, 0, 62)
_34.BackgroundTransparency = 1
_34.Parent = _25

local function _35(_a, _b, _c, _d)
    local _e = Instance.new("TextButton")
    _e.Text = _a
    _e.Size = UDim2.new(_c, -4, 1, 0)
    _e.Position = UDim2.new(_b, 0, 0, 0)
    _e.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
    _e.BorderColor3 = Color3.fromRGB(100, 100, 100)
    _e.Font = Enum.Font.Arial
    _e.TextSize = 11
    _e.Parent = _34
    _e.MouseButton1Click:Connect(_d)
end

local _36
_35("All", 0, 0.15, function() 
    local _a = _36()
    for _, _b in pairs(_a) do _18[_b.Id] = true end
    _30()
end)
_35("None", 0.15, 0.15, function() _18 = {}; _30() end)
_35("Invert", 0.30, 0.15, function() 
    local _a = _36()
    for _, _b in pairs(_a) do _18[_b.Id] = not _18[_b.Id] end
    _30()
end)

local _37 = Instance.new("TextBox")
_37.Size = UDim2.new(0.55, -4, 1, 0)
_37.Position = UDim2.new(0.45, 4, 0, 0)
_37.PlaceholderText = "  Filter Name / ID..."
_37.Text = ""
_37.TextXAlignment = Enum.TextXAlignment.Left
_37.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_37.BorderColor3 = Color3.fromRGB(100, 100, 100)
_37.Font = Enum.Font.Arial
_37.TextSize = 12
_37.Parent = _34

local _38 = Instance.new("ScrollingFrame")
_38.Size = UDim2.new(1, -16, 1, -130)
_38.Position = UDim2.new(0, 8, 0, 95)
_38.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_38.BorderColor3 = Color3.fromRGB(100, 100, 100)
_38.ScrollBarThickness = 12
_38.Parent = _25

local _39 = Instance.new("UIListLayout")
_39.Parent = _38; _39.SortOrder = Enum.SortOrder.LayoutOrder

local _40 = Instance.new("Frame")
_40.Size = UDim2.new(1, -16, 0, 30)
_40.Position = UDim2.new(0, 8, 1, -35)
_40.BackgroundTransparency = 1
_40.Parent = _25

local _41 = Instance.new("TextButton")
_41.Text = "EXPORT SELECTION (0)"
_41.Size = UDim2.new(1, 0, 1, 0)
_41.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
_41.TextColor3 = Color3.new(1,1,1)
_41.Font = Enum.Font.ArialBold
_41.TextSize = 12
_41.BorderColor3 = Color3.fromRGB(50,50,50)
_41.Parent = _40

function _36()
    if _17 == "Local" then
        local _a = _10:GetPlayingAnimationTracks()
        local _b = {}
        for _, _c in pairs(_a) do table.insert(_b, {Name = _c.Animation.Name, Id = _c.Animation.AnimationId, Origin = "Local"}) end
        return _b
    else
        return _16
    end
end

local function _42()
    if _13 then _13:Stop(); _13 = nil end
    if _15 then _15:Disconnect(); _15 = nil end
    if _14 and _14.Parent == _8.Backpack then _10:EquipTool(_14); _14 = nil end
end

local function _43(_a, _b)
    _42()
    local _c = string.match(_a, "%d+")
    if not _c then return end
    local _d = _9:FindFirstChildOfClass("Tool")
    if _d then _14 = _d; _10:UnequipTools() end
    local _e = Instance.new("Animation"); _e.AnimationId = "rbxassetid://".._c
    _13 = _10:LoadAnimation(_e)
    _13.Looped = _12.LoopPreview; _13:Play()
    if _12.StopOnMove then _15 = _10.Running:Connect(function(_f) if _f > 0.5 then _42() end end) end
end

local function _44(_a)
    if _19 then return end
    _19 = true
    _41.Text = "Processing... (Please Wait)"
    local _b = {}
    local _c = 0
    for _d, _e in pairs(_a) do
        local _f = string.match(_e.Id, "%d+")
        if _f then
            local _g, _h = pcall(function() return game:GetObjects("rbxassetid://".._f)[1] end)
            if _g and _h and _h:IsA("KeyframeSequence") then
                _h.Name = _e.Name
                table.insert(_b, _22(_h, _e.Origin))
                _c = _c + 1
            end
        end
        if _d % 10 == 0 then _7.RenderStepped:Wait() end
    end
    if _c > 0 then
        local _i = _6:JSONEncode(_b)
        if setclipboard then setclipboard(_i) end
        _41.Text = "EXPORTED " .. _c .. " ANIMS!"
        wait(2)
    else
        _41.Text = "Failed / Empty"
        wait(1)
    end
    local _j = 0; for _ in pairs(_18) do _j = _j + 1 end
    _41.Text = "EXPORT SELECTION (" .. _j .. ")"
    _19 = false
end

function _32()
    _16 = {}
    local _a = {}
    local function _b(_c, _d)
        for _, _e in pairs(_c:GetDescendants()) do
            if _e:IsA("Animation") then
                local _f = _e.AnimationId; local _g = _e.Name:lower()
                if not _11[_g] and _f and _f ~= "" and not _a[_f] then
                    _a[_f] = true
                    table.insert(_16, {Name = _e.Name, Id = _f, Origin = _d})
                end
            end
        end
    end
    _b(_4, "RepStorage"); _7.RenderStepped:Wait()
    _b(_5, "StarterPack"); _7.RenderStepped:Wait()
    _b(_3, "Workspace")
    _30()
end

function _30()
    for _,_a in pairs(_38:GetChildren()) do if _a:IsA("Frame") then _a:Destroy() end end
    _38.CanvasPosition = Vector2.new(0,0)
    local _b = _36()
    local _c = _37.Text:lower()
    local _d = 0
    for _ in pairs(_18) do _d = _d + 1 end
    _41.Text = "EXPORT SELECTION (" .. _d .. ")"
    _41.BackgroundColor3 = (_d > 0) and Color3.fromRGB(0, 120, 0) or Color3.fromRGB(100, 100, 100)
    for _, _e in pairs(_b) do
        if _c == "" or _e.Name:lower():find(_c) or _e.Id:find(_c) then
            local _f = Instance.new("Frame")
            _f.Size = UDim2.new(1, 0, 0, 24)
            _f.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
            _f.BorderColor3 = Color3.fromRGB(200, 200, 200)
            _f.Parent = _38
            local _g = _18[_e.Id]
            local _h = Instance.new("TextButton")
            _h.Text = _g and "X" or ""
            _h.Size = UDim2.new(0, 20, 0, 20)
            _h.Position = UDim2.new(0, 2, 0, 2)
            _h.BackgroundColor3 = _g and Color3.fromRGB(255, 100, 100) or Color3.fromRGB(255, 255, 255)
            _h.BorderColor3 = Color3.fromRGB(100, 100, 100)
            _h.Parent = _f
            _h.MouseButton1Click:Connect(function()
                if _18[_e.Id] then _18[_e.Id] = nil else _18[_e.Id] = true end
                _30()
            end)
            local _i = Instance.new("TextLabel")
            _i.Text = _e.Name
            _i.Size = UDim2.new(0.6, -30, 1, 0)
            _i.Position = UDim2.new(0, 25, 0, 0)
            _i.BackgroundTransparency = 1
            _i.TextXAlignment = Enum.TextXAlignment.Left
            _i.Font = Enum.Font.Arial
            _i.TextSize = 12
            _i.TextTruncate = Enum.TextTruncate.AtEnd
            _i.Parent = _f
            local function _j(_k, _l, _m, _n, _o)
                local _p = Instance.new("TextButton")
                _p.Text = _k; _p.Size = UDim2.new(0, _m, 0, 18)
                _p.Position = UDim2.new(1, _l, 0, 3)
                _p.BackgroundColor3 = _n; _p.TextColor3 = Color3.new(1,1,1)
                _p.Font = Enum.Font.ArialBold; _p.TextSize = 10
                _p.Parent = _f; _p.MouseButton1Click:Connect(_o)
            end
            _j("PLAY", -105, 45, Color3.fromRGB(80, 180, 80), function() _43(_e.Id, _e.Name) end)
            _j("EXP", -55, 30, Color3.fromRGB(0, 120, 200), function() _44({_e}) end)
            if _g then _f.BackgroundColor3 = Color3.fromRGB(230, 230, 255) end
        end
    end
    _38.CanvasSize = UDim2.new(0, 0, 0, (#_38:GetChildren()-1) * 24)
end

_41.MouseButton1Click:Connect(function()
    local _a = {}
    local _b = _36()
    for _, _c in pairs(_b) do
        if _18[_c.Id] then table.insert(_a, _c) end
    end
    if #_a == 0 then
        _41.Text = "SELECT SOMETHING FIRST!"
        wait(1)
        _30()
    else
        _44(_a)
    end
end)

_37:GetPropertyChangedSignal("Text"):Connect(_30)
_30()
