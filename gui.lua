local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local buttonToCopy = player.PlayerGui.HUD.Right.Bar.Emotes

local Spring = require(game.ReplicatedStorage.LocalModules.Spring)
local Sound = require(game.ReplicatedStorage.Utilities.Sound)

local Computer_Click = game.ReplicatedFirst.LoadingScreen.Sounds.Computer_Click
local newComputer_Click = Computer_Click:Clone()
newComputer_Click.Parent = game.SoundService

local remote = game:GetService("ReplicatedStorage").RemoteFunctions.ChangeSetting

local arguments = {
	[1] = "ShowNametag",
	[2] = "Hide"
}

local results = remote:InvokeServer(unpack(arguments))
local notifCont = require(game:GetService("ReplicatedStorage").Client.Controllers.NotificationController)

game.Players.LocalPlayer.Character.Head.NameTag.Enabled = true


local button = buttonToCopy:Clone()
button.Visible = true
if buttonToCopy.Parent:FindFirstChild("Easea") then
notifCont:Notify("easea is already loaded. - easea (이지) ")
game.SoundService.BoutiqueSounds.Incorrect:Play()
    return
else
    local confetti = require(game.ReplicatedStorage.LocalModules.ConfettiEffect)
confetti()

local notifCont = require(game:GetService("ReplicatedStorage").Client.Controllers.NotificationController)
notifCont:Notify("loaded successfully. - easea (이지) ")
setclipboard("https://discord.gg/kRWvM7NTga")
notifCont:Notify("to help support us, join the discord: https://discord.gg/kRWvM7NTga. - easea (이지) ")
local sparkleSound = game.ReplicatedFirst.LoadingScreen.Sounds.Sparkle_Pop
sparkleSound:Play()
    button.Parent = buttonToCopy.Parent
    button.InteractiveIcon.Size = UDim2.new(1, 0, 1, 0)
    button.Name = "Easea"
end

button.InteractiveIcon.Image = "rbxassetid://93989582647638"

local function applyHover(button)
    local scale = button:FindFirstChild("UIScale")
    if not scale then
        scale = Instance.new("UIScale")
        scale.Parent = button
    end

    local enterTween = TweenService:Create(scale, TweenInfo.new(0.4), {Scale = 1.1})
    local leaveTween = TweenService:Create(scale, TweenInfo.new(0.4), {Scale = 1})
    local clickTween = TweenService:Create(scale, TweenInfo.new(0.12), {Scale = 0.99})

    button.MouseEnter:Connect(function()
        enterTween:Play()

        local icon = button:FindFirstChild("InteractiveIcon")
        if icon then
            Spring.target(icon, 0.5, 3, {
                Rotation = button.Parent.Parent.Name == "Right" and 15 or -15
            })
        end
    end)

    button.MouseLeave:Connect(function()
        leaveTween:Play()

        local icon = button:FindFirstChild("InteractiveIcon")
        if icon then
            Spring.target(icon, 0.5, 3, { Rotation = 0 })
        end
    end)

    button.MouseButton1Down:Connect(function()
        Sound.byName("Click")({ Parent = workspace })
        clickTween:Play()
    end)

    button.MouseButton1Up:Connect(function()
        enterTween:Play()
    end)
end

applyHover(button)

local dtiVersion = game.StarterGui.ServerVersion.Frame.Version
local easeaVersion = game.StarterGui.ServerVersion.Frame.Version:Clone()
local dtiVersionNumber = dtiVersion.Text
local newVersionText = "dress to impress version: " .. dtiVersionNumber
dtiVersion.Text = newVersionText

easeaVersion.LayoutOrder = -1
easeaVersion.Text = "easea version: V1.0.4"

-- the following is the ui, all loadstrings are obfuscated so u cant skid ty

--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 173 | Scripts: 8 | Modules: 1 | Tags: 0
local G2L = {};

-- StarterGui.Easea
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["IgnoreGuiInset"] = true;
G2L["1"]["DisplayOrder"] = 2;
G2L["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
G2L["1"]["Name"] = [[Easea]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
G2L["1"]["ResetOnSpawn"] = false;


-- StarterGui.Easea.Manager
G2L["2"] = Instance.new("LocalScript", G2L["1"]);
G2L["2"]["Name"] = [[Manager]];


-- StarterGui.Easea.Easea
G2L["3"] = Instance.new("ImageLabel", G2L["1"]);
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3"]["Image"] = [[rbxassetid://133880096334098]];
G2L["3"]["Size"] = UDim2.new(0.23763, 0, 0.63111, 0);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["BackgroundTransparency"] = 1;
G2L["3"]["Name"] = [[Easea]];
G2L["3"]["Position"] = UDim2.new(0.80782, 0, 0.56186, 0);


-- StarterGui.Easea.Easea.HeaderTextLabel
G2L["4"] = Instance.new("TextLabel", G2L["3"]);
G2L["4"]["TextWrapped"] = true;
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["TextSize"] = 14;
G2L["4"]["TextScaled"] = true;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4"]["TextColor3"] = Color3.fromRGB(237, 155, 223);
G2L["4"]["BackgroundTransparency"] = 1;
G2L["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["4"]["Size"] = UDim2.new(0.8, 0, 0.07419, 0);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Text"] = [[easea (이지) scripting™]];
G2L["4"]["Name"] = [[HeaderTextLabel]];
G2L["4"]["Position"] = UDim2.new(0.5, 0, 0.0485, 0);


-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel
G2L["5"] = Instance.new("TextLabel", G2L["4"]);
G2L["5"]["TextWrapped"] = true;
G2L["5"]["BorderSizePixel"] = 0;
G2L["5"]["TextSize"] = 14;
G2L["5"]["TextScaled"] = true;
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["BackgroundTransparency"] = 1;
G2L["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["5"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["Text"] = [[easea (이지) scripting™]];
G2L["5"]["Position"] = UDim2.new(0.5, 0, 0.46, 0);


-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.Sparkle
G2L["6"] = Instance.new("ImageLabel", G2L["5"]);
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["ImageTransparency"] = 0.1;
G2L["6"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["6"]["Image"] = [[rbxassetid://132231983747131]];
G2L["6"]["Size"] = UDim2.new(0.19545, 0, 0.74588, 0);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["BackgroundTransparency"] = 1;
G2L["6"]["Rotation"] = -10;
G2L["6"]["Name"] = [[Sparkle]];
G2L["6"]["Position"] = UDim2.new(0.6999, 0, 0.69263, 0);


-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.Sparkle.UIAspectRatioConstraint
G2L["7"] = Instance.new("UIAspectRatioConstraint", G2L["6"]);



-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.Sparkle
G2L["8"] = Instance.new("ImageLabel", G2L["5"]);
G2L["8"]["BorderSizePixel"] = 0;
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8"]["ImageTransparency"] = 0.1;
G2L["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["8"]["Image"] = [[rbxassetid://132231983747131]];
G2L["8"]["Size"] = UDim2.new(0.19545, 0, 0.74588, 0);
G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8"]["BackgroundTransparency"] = 1;
G2L["8"]["Rotation"] = -30;
G2L["8"]["Name"] = [[Sparkle]];
G2L["8"]["Position"] = UDim2.new(0.57093, 0, 0.36336, 0);


-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.Sparkle.UIAspectRatioConstraint
G2L["9"] = Instance.new("UIAspectRatioConstraint", G2L["8"]);



-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.Sparkle
G2L["a"] = Instance.new("ImageLabel", G2L["5"]);
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["ImageTransparency"] = 0.1;
G2L["a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["a"]["Image"] = [[rbxassetid://132231983747131]];
G2L["a"]["Size"] = UDim2.new(0.19545, 0, 0.74588, 0);
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["BackgroundTransparency"] = 1;
G2L["a"]["Name"] = [[Sparkle]];
G2L["a"]["Position"] = UDim2.new(0.4007, 0, 0.78017, 0);


-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.Sparkle.UIAspectRatioConstraint
G2L["b"] = Instance.new("UIAspectRatioConstraint", G2L["a"]);



-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.Sparkle
G2L["c"] = Instance.new("ImageLabel", G2L["5"]);
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c"]["ImageTransparency"] = 0.1;
G2L["c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["c"]["Image"] = [[rbxassetid://132231983747131]];
G2L["c"]["Size"] = UDim2.new(0.8, 0, 0.8, 0);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["BackgroundTransparency"] = 1;
G2L["c"]["Rotation"] = -30;
G2L["c"]["Name"] = [[Sparkle]];
G2L["c"]["Position"] = UDim2.new(0.29395, 0, 0.34789, 0);


-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.Sparkle.UIAspectRatioConstraint
G2L["d"] = Instance.new("UIAspectRatioConstraint", G2L["c"]);



-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.UIGradient
G2L["e"] = Instance.new("UIGradient", G2L["5"]);
G2L["e"]["Rotation"] = 90;
G2L["e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.506, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.530, Color3.fromRGB(255, 216, 236)),ColorSequenceKeypoint.new(0.762, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};


-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.UIStroke
G2L["f"] = Instance.new("UIStroke", G2L["5"]);
G2L["f"]["Color"] = Color3.fromRGB(255, 117, 233);


-- StarterGui.Easea.Easea.HeaderTextLabel.UIStroke
G2L["10"] = Instance.new("UIStroke", G2L["4"]);
G2L["10"]["Thickness"] = 2.5;
G2L["10"]["Color"] = Color3.fromRGB(246, 93, 205);


-- StarterGui.Easea.Easea.ScrollingFrame
G2L["11"] = Instance.new("ScrollingFrame", G2L["3"]);
G2L["11"]["Active"] = true;
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
G2L["11"]["CanvasPosition"] = Vector2.new(0, 395.70627);
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["11"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY;
G2L["11"]["Size"] = UDim2.new(0.89074, 0, 0.78159, 0);
G2L["11"]["Position"] = UDim2.new(0.5, 0, 0.58787, 0);
G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["ScrollBarThickness"] = 5;
G2L["11"]["BackgroundTransparency"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame.!
G2L["12"] = Instance.new("Frame", G2L["11"]);
G2L["12"]["BorderSizePixel"] = 0;
G2L["12"]["BackgroundColor3"] = Color3.fromRGB(255, 141, 240);
G2L["12"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["12"]["Size"] = UDim2.new(0.03454, 0, 0.00632, 0);
G2L["12"]["Position"] = UDim2.new(0.5, 0, 0.00193, 0);
G2L["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["12"]["Name"] = [[!]];
G2L["12"]["LayoutOrder"] = -1999999999;
G2L["12"]["BackgroundTransparency"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame.UIListLayout
G2L["13"] = Instance.new("UIListLayout", G2L["11"]);
G2L["13"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["13"]["Padding"] = UDim.new(0, 8);
G2L["13"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof
G2L["14"] = Instance.new("Frame", G2L["11"]);
G2L["14"]["BorderSizePixel"] = 0;
G2L["14"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["14"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["14"]["Size"] = UDim2.new(0.9, 0, 0.19209, 0);
G2L["14"]["Position"] = UDim2.new(0.5, 0, 0.11281, 0);
G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["Name"] = [[giftSpoof]];
G2L["14"]["LayoutOrder"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.UIGradient
G2L["15"] = Instance.new("UIGradient", G2L["14"]);
G2L["15"]["Rotation"] = 90;
G2L["15"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.AnimName
G2L["16"] = Instance.new("TextLabel", G2L["14"]);
G2L["16"]["TextWrapped"] = true;
G2L["16"]["BorderSizePixel"] = 0;
G2L["16"]["TextSize"] = 14;
G2L["16"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["16"]["TextScaled"] = true;
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["16"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["16"]["BackgroundTransparency"] = 1;
G2L["16"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["16"]["Size"] = UDim2.new(0.73394, 0, 0.30576, 0);
G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["Text"] = [[Spoof Gifting Props]];
G2L["16"]["Name"] = [[AnimName]];
G2L["16"]["Position"] = UDim2.new(0.14467, 0, 0.22408, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.AnimName.UIStroke
G2L["17"] = Instance.new("UIStroke", G2L["16"]);
G2L["17"]["Thickness"] = 2;
G2L["17"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.AnimName.UIStroke.UIGradient
G2L["18"] = Instance.new("UIGradient", G2L["17"]);
G2L["18"]["Rotation"] = 90;
G2L["18"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.Button
G2L["19"] = Instance.new("TextButton", G2L["14"]);
G2L["19"]["BorderSizePixel"] = 0;
G2L["19"]["TextTransparency"] = 1;
G2L["19"]["TextSize"] = 14;
G2L["19"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["19"]["ZIndex"] = 1999999999;
G2L["19"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["19"]["BackgroundTransparency"] = 1;
G2L["19"]["Size"] = UDim2.new(0.79433, 0, 0.98585, 0);
G2L["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["19"]["Text"] = [[]];
G2L["19"]["Name"] = [[Button]];
G2L["19"]["Position"] = UDim2.new(0, 0, 0.5, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.Button.LocalScript
G2L["1a"] = Instance.new("LocalScript", G2L["19"]);



-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.UICorner
G2L["1b"] = Instance.new("UICorner", G2L["14"]);
G2L["1b"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.UIStroke
G2L["1c"] = Instance.new("UIStroke", G2L["14"]);
G2L["1c"]["Thickness"] = 1.5;
G2L["1c"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["1c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.UIStroke.UIGradient
G2L["1d"] = Instance.new("UIGradient", G2L["1c"]);
G2L["1d"]["Rotation"] = 90;
G2L["1d"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.AnimName
G2L["1e"] = Instance.new("TextLabel", G2L["14"]);
G2L["1e"]["TextWrapped"] = true;
G2L["1e"]["BorderSizePixel"] = 0;
G2L["1e"]["TextSize"] = 14;
G2L["1e"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["1e"]["TextScaled"] = true;
G2L["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1e"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1e"]["BackgroundTransparency"] = 1;
G2L["1e"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["1e"]["Size"] = UDim2.new(0.96995, 0, 0.60123, 0);
G2L["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1e"]["Text"] = [[This is kind of pointless, its client-sided, so no one will actually recieve the gifts, but if you want fake proofs. This is for you.]];
G2L["1e"]["Name"] = [[AnimName]];
G2L["1e"]["Position"] = UDim2.new(0.0145, 0, 0.67757, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.AnimName.UIStroke
G2L["1f"] = Instance.new("UIStroke", G2L["1e"]);
G2L["1f"]["Thickness"] = 2;
G2L["1f"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.AnimName.UIStroke.UIGradient
G2L["20"] = Instance.new("UIGradient", G2L["1f"]);
G2L["20"]["Rotation"] = 90;
G2L["20"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.Value
G2L["21"] = Instance.new("StringValue", G2L["14"]);
G2L["21"]["Value"] = [[Spoof]];


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique
G2L["22"] = Instance.new("Frame", G2L["11"]);
G2L["22"]["BorderSizePixel"] = 0;
G2L["22"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["22"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["22"]["Size"] = UDim2.new(0.9, 0, 0.48754, 0);
G2L["22"]["Position"] = UDim2.new(0.5, 0, 0.47375, 0);
G2L["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["22"]["Name"] = [[customBoutique]];
G2L["22"]["LayoutOrder"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.UIGradient
G2L["23"] = Instance.new("UIGradient", G2L["22"]);
G2L["23"]["Rotation"] = 90;
G2L["23"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.AnimName
G2L["24"] = Instance.new("TextLabel", G2L["22"]);
G2L["24"]["TextWrapped"] = true;
G2L["24"]["BorderSizePixel"] = 0;
G2L["24"]["TextSize"] = 14;
G2L["24"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["24"]["TextScaled"] = true;
G2L["24"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["24"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["24"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["24"]["BackgroundTransparency"] = 1;
G2L["24"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["24"]["Size"] = UDim2.new(0.85198, 0, 0.17599, 0);
G2L["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["24"]["Text"] = [[Spoof Weekly Boutique]];
G2L["24"]["Name"] = [[AnimName]];
G2L["24"]["Position"] = UDim2.new(0.07068, 0, 0.08581, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.AnimName.UIStroke
G2L["25"] = Instance.new("UIStroke", G2L["24"]);
G2L["25"]["Thickness"] = 2;
G2L["25"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.AnimName.UIStroke.UIGradient
G2L["26"] = Instance.new("UIGradient", G2L["25"]);
G2L["26"]["Rotation"] = 90;
G2L["26"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Button
G2L["27"] = Instance.new("TextButton", G2L["22"]);
G2L["27"]["BorderSizePixel"] = 0;
G2L["27"]["TextTransparency"] = 1;
G2L["27"]["TextSize"] = 14;
G2L["27"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["27"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["27"]["ZIndex"] = 1999999999;
G2L["27"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["27"]["BackgroundTransparency"] = 1;
G2L["27"]["Size"] = UDim2.new(0.99896, 0, 0.16673, 0);
G2L["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["27"]["Text"] = [[]];
G2L["27"]["Name"] = [[Button]];
G2L["27"]["Position"] = UDim2.new(-0, 0, 0.09044, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Button.LocalScript
G2L["28"] = Instance.new("LocalScript", G2L["27"]);



-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.UICorner
G2L["29"] = Instance.new("UICorner", G2L["22"]);
G2L["29"]["CornerRadius"] = UDim.new(0.1, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.UIStroke
G2L["2a"] = Instance.new("UIStroke", G2L["22"]);
G2L["2a"]["Thickness"] = 1.5;
G2L["2a"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["2a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.UIStroke.UIGradient
G2L["2b"] = Instance.new("UIGradient", G2L["2a"]);
G2L["2b"]["Rotation"] = 90;
G2L["2b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.AnimName
G2L["2c"] = Instance.new("TextLabel", G2L["22"]);
G2L["2c"]["TextWrapped"] = true;
G2L["2c"]["BorderSizePixel"] = 0;
G2L["2c"]["TextSize"] = 14;
G2L["2c"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["2c"]["TextScaled"] = true;
G2L["2c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2c"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["2c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2c"]["BackgroundTransparency"] = 1;
G2L["2c"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["2c"]["Size"] = UDim2.new(0.96995, 0, 0.1701, 0);
G2L["2c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2c"]["Text"] = [[This inserts your own items into the Weekly Boutique. You must use their respective names, you can have a look at the names via Starlight Script's item catalogue. Their price will appear at $0, but will cost their respective amount.]];
G2L["2c"]["Name"] = [[AnimName]];
G2L["2c"]["Position"] = UDim2.new(0.0145, 0, 0.23193, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.AnimName.UIStroke
G2L["2d"] = Instance.new("UIStroke", G2L["2c"]);
G2L["2d"]["Thickness"] = 2;
G2L["2d"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.AnimName.UIStroke.UIGradient
G2L["2e"] = Instance.new("UIGradient", G2L["2d"]);
G2L["2e"]["Rotation"] = 90;
G2L["2e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items
G2L["2f"] = Instance.new("Frame", G2L["22"]);
G2L["2f"]["BorderSizePixel"] = 0;
G2L["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2f"]["Size"] = UDim2.new(0.99896, 0, 0.48693, 0);
G2L["2f"]["Position"] = UDim2.new(0, 0, 0.35578, 0);
G2L["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2f"]["Name"] = [[Items]];
G2L["2f"]["BackgroundTransparency"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.UIListLayout
G2L["30"] = Instance.new("UIListLayout", G2L["2f"]);
G2L["30"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["30"]["Padding"] = UDim.new(0.05, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.2
G2L["31"] = Instance.new("TextBox", G2L["2f"]);
G2L["31"]["Name"] = [[2]];
G2L["31"]["PlaceholderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["31"]["BorderSizePixel"] = 0;
G2L["31"]["TextWrapped"] = true;
G2L["31"]["TextSize"] = 14;
G2L["31"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["31"]["TextScaled"] = true;
G2L["31"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["31"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["31"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["31"]["PlaceholderText"] = [[Sparkling Necklace]];
G2L["31"]["Size"] = UDim2.new(0.92542, 0, 0.25954, 0);
G2L["31"]["Position"] = UDim2.new(0.0339, 0, 0, 0);
G2L["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["31"]["Text"] = [[]];


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.2.UIGradient
G2L["32"] = Instance.new("UIGradient", G2L["31"]);
G2L["32"]["Rotation"] = 90;
G2L["32"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.2.UICorner
G2L["33"] = Instance.new("UICorner", G2L["31"]);
G2L["33"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.2.UIStroke
G2L["34"] = Instance.new("UIStroke", G2L["31"]);
G2L["34"]["Thickness"] = 1.5;
G2L["34"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["34"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.2.UIStroke.UIGradient
G2L["35"] = Instance.new("UIGradient", G2L["34"]);
G2L["35"]["Rotation"] = 90;
G2L["35"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.2.UIStroke
G2L["36"] = Instance.new("UIStroke", G2L["31"]);
G2L["36"]["Thickness"] = 2;
G2L["36"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.2.UIStroke.UIGradient
G2L["37"] = Instance.new("UIGradient", G2L["36"]);
G2L["37"]["Rotation"] = 90;
G2L["37"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.2.UITextSizeConstraint
G2L["38"] = Instance.new("UITextSizeConstraint", G2L["31"]);
G2L["38"]["MaxTextSize"] = 34;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.2.UIAspectRatioConstraint
G2L["39"] = Instance.new("UIAspectRatioConstraint", G2L["31"]);
G2L["39"]["AspectRatio"] = 8.02941;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.3
G2L["3a"] = Instance.new("TextBox", G2L["2f"]);
G2L["3a"]["Name"] = [[3]];
G2L["3a"]["PlaceholderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3a"]["BorderSizePixel"] = 0;
G2L["3a"]["TextWrapped"] = true;
G2L["3a"]["TextSize"] = 14;
G2L["3a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3a"]["TextScaled"] = true;
G2L["3a"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["3a"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3a"]["PlaceholderText"] = [[Sparkling Sleeve]];
G2L["3a"]["Size"] = UDim2.new(0.92542, 0, 0.25954, 0);
G2L["3a"]["Position"] = UDim2.new(0.0339, 0, 0, 0);
G2L["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3a"]["Text"] = [[]];


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.3.UIGradient
G2L["3b"] = Instance.new("UIGradient", G2L["3a"]);
G2L["3b"]["Rotation"] = 90;
G2L["3b"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.3.UICorner
G2L["3c"] = Instance.new("UICorner", G2L["3a"]);
G2L["3c"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.3.UIStroke
G2L["3d"] = Instance.new("UIStroke", G2L["3a"]);
G2L["3d"]["Thickness"] = 1.5;
G2L["3d"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["3d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.3.UIStroke.UIGradient
G2L["3e"] = Instance.new("UIGradient", G2L["3d"]);
G2L["3e"]["Rotation"] = 90;
G2L["3e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.3.UIStroke
G2L["3f"] = Instance.new("UIStroke", G2L["3a"]);
G2L["3f"]["Thickness"] = 2;
G2L["3f"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.3.UIStroke.UIGradient
G2L["40"] = Instance.new("UIGradient", G2L["3f"]);
G2L["40"]["Rotation"] = 90;
G2L["40"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.3.UITextSizeConstraint
G2L["41"] = Instance.new("UITextSizeConstraint", G2L["3a"]);
G2L["41"]["MaxTextSize"] = 34;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.3.UIAspectRatioConstraint
G2L["42"] = Instance.new("UIAspectRatioConstraint", G2L["3a"]);
G2L["42"]["AspectRatio"] = 8.02941;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.4
G2L["43"] = Instance.new("TextBox", G2L["2f"]);
G2L["43"]["Name"] = [[4]];
G2L["43"]["PlaceholderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["43"]["BorderSizePixel"] = 0;
G2L["43"]["TextWrapped"] = true;
G2L["43"]["TextSize"] = 14;
G2L["43"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["43"]["TextScaled"] = true;
G2L["43"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["43"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["43"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["43"]["PlaceholderText"] = [[Sparkling Heels]];
G2L["43"]["Size"] = UDim2.new(0.92542, 0, 0.25954, 0);
G2L["43"]["Position"] = UDim2.new(0.0339, 0, 0, 0);
G2L["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["43"]["Text"] = [[]];


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.4.UIGradient
G2L["44"] = Instance.new("UIGradient", G2L["43"]);
G2L["44"]["Rotation"] = 90;
G2L["44"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.4.UICorner
G2L["45"] = Instance.new("UICorner", G2L["43"]);
G2L["45"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.4.UIStroke
G2L["46"] = Instance.new("UIStroke", G2L["43"]);
G2L["46"]["Thickness"] = 1.5;
G2L["46"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["46"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.4.UIStroke.UIGradient
G2L["47"] = Instance.new("UIGradient", G2L["46"]);
G2L["47"]["Rotation"] = 90;
G2L["47"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.4.UIStroke
G2L["48"] = Instance.new("UIStroke", G2L["43"]);
G2L["48"]["Thickness"] = 2;
G2L["48"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.4.UIStroke.UIGradient
G2L["49"] = Instance.new("UIGradient", G2L["48"]);
G2L["49"]["Rotation"] = 90;
G2L["49"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.4.UITextSizeConstraint
G2L["4a"] = Instance.new("UITextSizeConstraint", G2L["43"]);
G2L["4a"]["MaxTextSize"] = 34;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.4.UIAspectRatioConstraint
G2L["4b"] = Instance.new("UIAspectRatioConstraint", G2L["43"]);
G2L["4b"]["AspectRatio"] = 8.02941;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.1
G2L["4c"] = Instance.new("TextBox", G2L["2f"]);
G2L["4c"]["Name"] = [[1]];
G2L["4c"]["PlaceholderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4c"]["ZIndex"] = 0;
G2L["4c"]["BorderSizePixel"] = 0;
G2L["4c"]["TextWrapped"] = true;
G2L["4c"]["TextSize"] = 14;
G2L["4c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4c"]["TextScaled"] = true;
G2L["4c"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["4c"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["4c"]["PlaceholderText"] = [[Sparkling Dress]];
G2L["4c"]["Size"] = UDim2.new(0.92542, 0, 0.25954, 0);
G2L["4c"]["Position"] = UDim2.new(0.0339, 0, 0, 0);
G2L["4c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4c"]["Text"] = [[]];


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.1.UICorner
G2L["4d"] = Instance.new("UICorner", G2L["4c"]);
G2L["4d"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.1.UIStroke
G2L["4e"] = Instance.new("UIStroke", G2L["4c"]);
G2L["4e"]["Thickness"] = 1.5;
G2L["4e"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["4e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.1.UIStroke.UIGradient
G2L["4f"] = Instance.new("UIGradient", G2L["4e"]);
G2L["4f"]["Rotation"] = 90;
G2L["4f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.1.UIStroke
G2L["50"] = Instance.new("UIStroke", G2L["4c"]);
G2L["50"]["Thickness"] = 2;
G2L["50"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.1.UIStroke.UIGradient
G2L["51"] = Instance.new("UIGradient", G2L["50"]);
G2L["51"]["Rotation"] = 90;
G2L["51"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.1.UIGradient
G2L["52"] = Instance.new("UIGradient", G2L["4c"]);
G2L["52"]["Rotation"] = 90;
G2L["52"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.1.UITextSizeConstraint
G2L["53"] = Instance.new("UITextSizeConstraint", G2L["4c"]);
G2L["53"]["MaxTextSize"] = 34;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.1.UIAspectRatioConstraint
G2L["54"] = Instance.new("UIAspectRatioConstraint", G2L["4c"]);
G2L["54"]["AspectRatio"] = 8.02941;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Value
G2L["55"] = Instance.new("StringValue", G2L["22"]);
G2L["55"]["Value"] = [[Spoof]];


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair
G2L["56"] = Instance.new("Frame", G2L["11"]);
G2L["56"]["BorderSizePixel"] = 0;
G2L["56"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["56"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["56"]["Size"] = UDim2.new(0.9, 0, 0.19209, 0);
G2L["56"]["Position"] = UDim2.new(0.5, 0, 0.11281, 0);
G2L["56"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["56"]["Name"] = [[V26Hair]];
G2L["56"]["LayoutOrder"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.UIGradient
G2L["57"] = Instance.new("UIGradient", G2L["56"]);
G2L["57"]["Rotation"] = 90;
G2L["57"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.AnimName
G2L["58"] = Instance.new("TextLabel", G2L["56"]);
G2L["58"]["TextWrapped"] = true;
G2L["58"]["BorderSizePixel"] = 0;
G2L["58"]["TextSize"] = 14;
G2L["58"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["58"]["TextScaled"] = true;
G2L["58"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["58"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["58"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["58"]["BackgroundTransparency"] = 1;
G2L["58"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["58"]["Size"] = UDim2.new(0.73394, 0, 0.30576, 0);
G2L["58"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["58"]["Text"] = [[V26 Hair Long Waves]];
G2L["58"]["Name"] = [[AnimName]];
G2L["58"]["Position"] = UDim2.new(0.14467, 0, 0.22408, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.AnimName.UIStroke
G2L["59"] = Instance.new("UIStroke", G2L["58"]);
G2L["59"]["Thickness"] = 2;
G2L["59"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.AnimName.UIStroke.UIGradient
G2L["5a"] = Instance.new("UIGradient", G2L["59"]);
G2L["5a"]["Rotation"] = 90;
G2L["5a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.Button
G2L["5b"] = Instance.new("TextButton", G2L["56"]);
G2L["5b"]["BorderSizePixel"] = 0;
G2L["5b"]["TextTransparency"] = 1;
G2L["5b"]["TextSize"] = 14;
G2L["5b"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5b"]["ZIndex"] = 1999999999;
G2L["5b"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["5b"]["BackgroundTransparency"] = 1;
G2L["5b"]["Size"] = UDim2.new(0.79433, 0, 0.98585, 0);
G2L["5b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5b"]["Text"] = [[]];
G2L["5b"]["Name"] = [[Button]];
G2L["5b"]["Position"] = UDim2.new(0, 0, 0.5, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.Button.LocalScript
G2L["5c"] = Instance.new("LocalScript", G2L["5b"]);



-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.UICorner
G2L["5d"] = Instance.new("UICorner", G2L["56"]);
G2L["5d"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.UIStroke
G2L["5e"] = Instance.new("UIStroke", G2L["56"]);
G2L["5e"]["Thickness"] = 1.5;
G2L["5e"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["5e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.UIStroke.UIGradient
G2L["5f"] = Instance.new("UIGradient", G2L["5e"]);
G2L["5f"]["Rotation"] = 90;
G2L["5f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.AnimName
G2L["60"] = Instance.new("TextLabel", G2L["56"]);
G2L["60"]["TextWrapped"] = true;
G2L["60"]["BorderSizePixel"] = 0;
G2L["60"]["TextSize"] = 14;
G2L["60"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["60"]["TextScaled"] = true;
G2L["60"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["60"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["60"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["60"]["BackgroundTransparency"] = 1;
G2L["60"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["60"]["Size"] = UDim2.new(0.96995, 0, 0.60123, 0);
G2L["60"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["60"]["Text"] = [[Remember that Valentine's hair, that one that got shown in that teaser.. and then never got released? Yeah, with this, you can wear it early!]];
G2L["60"]["Name"] = [[AnimName]];
G2L["60"]["Position"] = UDim2.new(0.0145, 0, 0.67757, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.AnimName.UIStroke
G2L["61"] = Instance.new("UIStroke", G2L["60"]);
G2L["61"]["Thickness"] = 2;
G2L["61"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.AnimName.UIStroke.UIGradient
G2L["62"] = Instance.new("UIGradient", G2L["61"]);
G2L["62"]["Rotation"] = 90;
G2L["62"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.Value
G2L["63"] = Instance.new("StringValue", G2L["56"]);
G2L["63"]["Value"] = [[Client]];


-- StarterGui.Easea.Easea.ScrollingFrame.Poses
G2L["64"] = Instance.new("Frame", G2L["11"]);
G2L["64"]["BorderSizePixel"] = 0;
G2L["64"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["64"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["64"]["Size"] = UDim2.new(0.9, 0, 0.19209, 0);
G2L["64"]["Position"] = UDim2.new(0.5, 0, 0.11281, 0);
G2L["64"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["64"]["Name"] = [[Poses]];
G2L["64"]["LayoutOrder"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.UIGradient
G2L["65"] = Instance.new("UIGradient", G2L["64"]);
G2L["65"]["Rotation"] = 90;
G2L["65"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.AnimName
G2L["66"] = Instance.new("TextLabel", G2L["64"]);
G2L["66"]["TextWrapped"] = true;
G2L["66"]["BorderSizePixel"] = 0;
G2L["66"]["TextSize"] = 14;
G2L["66"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["66"]["TextScaled"] = true;
G2L["66"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["66"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["66"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["66"]["BackgroundTransparency"] = 1;
G2L["66"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["66"]["Size"] = UDim2.new(0.73394, 0, 0.30576, 0);
G2L["66"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["66"]["Text"] = [[Unlock Poses]];
G2L["66"]["Name"] = [[AnimName]];
G2L["66"]["Position"] = UDim2.new(0.14467, 0, 0.22408, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.AnimName.UIStroke
G2L["67"] = Instance.new("UIStroke", G2L["66"]);
G2L["67"]["Thickness"] = 2;
G2L["67"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.AnimName.UIStroke.UIGradient
G2L["68"] = Instance.new("UIGradient", G2L["67"]);
G2L["68"]["Rotation"] = 90;
G2L["68"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.Button
G2L["69"] = Instance.new("TextButton", G2L["64"]);
G2L["69"]["BorderSizePixel"] = 0;
G2L["69"]["TextTransparency"] = 1;
G2L["69"]["TextSize"] = 14;
G2L["69"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["69"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["69"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["69"]["ZIndex"] = 1999999999;
G2L["69"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["69"]["BackgroundTransparency"] = 1;
G2L["69"]["Size"] = UDim2.new(0.79433, 0, 0.98585, 0);
G2L["69"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["69"]["Text"] = [[]];
G2L["69"]["Name"] = [[Button]];
G2L["69"]["Position"] = UDim2.new(0, 0, 0.5, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.Button.LocalScript
G2L["6a"] = Instance.new("LocalScript", G2L["69"]);



-- StarterGui.Easea.Easea.ScrollingFrame.Poses.UICorner
G2L["6b"] = Instance.new("UICorner", G2L["64"]);
G2L["6b"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.UIStroke
G2L["6c"] = Instance.new("UIStroke", G2L["64"]);
G2L["6c"]["Thickness"] = 1.5;
G2L["6c"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["6c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.UIStroke.UIGradient
G2L["6d"] = Instance.new("UIGradient", G2L["6c"]);
G2L["6d"]["Rotation"] = 90;
G2L["6d"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.AnimName
G2L["6e"] = Instance.new("TextLabel", G2L["64"]);
G2L["6e"]["TextWrapped"] = true;
G2L["6e"]["BorderSizePixel"] = 0;
G2L["6e"]["TextSize"] = 14;
G2L["6e"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["6e"]["TextScaled"] = true;
G2L["6e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6e"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["6e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6e"]["BackgroundTransparency"] = 1;
G2L["6e"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["6e"]["Size"] = UDim2.new(0.96995, 0, 0.62304, 0);
G2L["6e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6e"]["Text"] = [[Do you want all poses in the game, for absolutely free - yes, even the baddie pass ones? Well, this is the solution for you! (You must re-execute this everytime you need them.)]];
G2L["6e"]["Name"] = [[AnimName]];
G2L["6e"]["Position"] = UDim2.new(0.0145, 0, 0.68848, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.AnimName.UIStroke
G2L["6f"] = Instance.new("UIStroke", G2L["6e"]);
G2L["6f"]["Thickness"] = 2;
G2L["6f"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.AnimName.UIStroke.UIGradient
G2L["70"] = Instance.new("UIGradient", G2L["6f"]);
G2L["70"]["Rotation"] = 90;
G2L["70"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.Value
G2L["71"] = Instance.new("StringValue", G2L["64"]);
G2L["71"]["Value"] = [[Spoof]];


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess
G2L["72"] = Instance.new("Frame", G2L["11"]);
G2L["72"]["BorderSizePixel"] = 0;
G2L["72"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["72"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["72"]["Size"] = UDim2.new(0.9, 0, 0.19209, 0);
G2L["72"]["Position"] = UDim2.new(0.5, 0, 0.11281, 0);
G2L["72"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["72"]["Name"] = [[FashionGoddess]];
G2L["72"]["LayoutOrder"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.UIGradient
G2L["73"] = Instance.new("UIGradient", G2L["72"]);
G2L["73"]["Rotation"] = 90;
G2L["73"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.AnimName
G2L["74"] = Instance.new("TextLabel", G2L["72"]);
G2L["74"]["TextWrapped"] = true;
G2L["74"]["BorderSizePixel"] = 0;
G2L["74"]["TextSize"] = 14;
G2L["74"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["74"]["TextScaled"] = true;
G2L["74"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["74"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["74"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["74"]["BackgroundTransparency"] = 1;
G2L["74"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["74"]["Size"] = UDim2.new(0.73394, 0, 0.30576, 0);
G2L["74"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["74"]["Text"] = [[Fashion Goddess Spoof]];
G2L["74"]["Name"] = [[AnimName]];
G2L["74"]["Position"] = UDim2.new(0.14467, 0, 0.22408, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.AnimName.UIStroke
G2L["75"] = Instance.new("UIStroke", G2L["74"]);
G2L["75"]["Thickness"] = 2;
G2L["75"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.AnimName.UIStroke.UIGradient
G2L["76"] = Instance.new("UIGradient", G2L["75"]);
G2L["76"]["Rotation"] = 90;
G2L["76"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.Button
G2L["77"] = Instance.new("TextButton", G2L["72"]);
G2L["77"]["BorderSizePixel"] = 0;
G2L["77"]["TextTransparency"] = 1;
G2L["77"]["TextSize"] = 14;
G2L["77"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["77"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["77"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["77"]["ZIndex"] = 1999999999;
G2L["77"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["77"]["BackgroundTransparency"] = 1;
G2L["77"]["Size"] = UDim2.new(0.79433, 0, 0.98585, 0);
G2L["77"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["77"]["Text"] = [[]];
G2L["77"]["Name"] = [[Button]];
G2L["77"]["Position"] = UDim2.new(0, 0, 0.5, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.Button.LocalScript
G2L["78"] = Instance.new("LocalScript", G2L["77"]);



-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.UICorner
G2L["79"] = Instance.new("UICorner", G2L["72"]);
G2L["79"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.UIStroke
G2L["7a"] = Instance.new("UIStroke", G2L["72"]);
G2L["7a"]["Thickness"] = 1.5;
G2L["7a"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["7a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.UIStroke.UIGradient
G2L["7b"] = Instance.new("UIGradient", G2L["7a"]);
G2L["7b"]["Rotation"] = 90;
G2L["7b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.AnimName
G2L["7c"] = Instance.new("TextLabel", G2L["72"]);
G2L["7c"]["TextWrapped"] = true;
G2L["7c"]["BorderSizePixel"] = 0;
G2L["7c"]["TextSize"] = 14;
G2L["7c"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["7c"]["TextScaled"] = true;
G2L["7c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7c"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["7c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7c"]["BackgroundTransparency"] = 1;
G2L["7c"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["7c"]["Size"] = UDim2.new(0.96995, 0, 0.60123, 0);
G2L["7c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7c"]["Text"] = [[Have you dreamed of every looking like a Fashion Goddess? Well, seize the chance now, with this spoofer, you can visually look like a Fashion Goddess!]];
G2L["7c"]["Name"] = [[AnimName]];
G2L["7c"]["Position"] = UDim2.new(0.0145, 0, 0.67757, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.AnimName.UIStroke
G2L["7d"] = Instance.new("UIStroke", G2L["7c"]);
G2L["7d"]["Thickness"] = 2;
G2L["7d"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.AnimName.UIStroke.UIGradient
G2L["7e"] = Instance.new("UIGradient", G2L["7d"]);
G2L["7e"]["Rotation"] = 90;
G2L["7e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.Value
G2L["7f"] = Instance.new("StringValue", G2L["72"]);
G2L["7f"]["Value"] = [[Spoof]];


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique
G2L["80"] = Instance.new("Frame", G2L["11"]);
G2L["80"]["BorderSizePixel"] = 0;
G2L["80"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["80"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["80"]["Size"] = UDim2.new(0.9, 0, 0.19209, 0);
G2L["80"]["Position"] = UDim2.new(0.5, 0, 0.11281, 0);
G2L["80"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["80"]["Name"] = [[Boutique]];
G2L["80"]["LayoutOrder"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.UIGradient
G2L["81"] = Instance.new("UIGradient", G2L["80"]);
G2L["81"]["Rotation"] = 90;
G2L["81"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.AnimName
G2L["82"] = Instance.new("TextLabel", G2L["80"]);
G2L["82"]["TextWrapped"] = true;
G2L["82"]["BorderSizePixel"] = 0;
G2L["82"]["TextSize"] = 14;
G2L["82"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["82"]["TextScaled"] = true;
G2L["82"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["82"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["82"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["82"]["BackgroundTransparency"] = 1;
G2L["82"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["82"]["Size"] = UDim2.new(0.73394, 0, 0.30576, 0);
G2L["82"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["82"]["Text"] = [[Boutique Farm]];
G2L["82"]["Name"] = [[AnimName]];
G2L["82"]["Position"] = UDim2.new(0.14467, 0, 0.22408, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.AnimName.UIStroke
G2L["83"] = Instance.new("UIStroke", G2L["82"]);
G2L["83"]["Thickness"] = 2;
G2L["83"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.AnimName.UIStroke.UIGradient
G2L["84"] = Instance.new("UIGradient", G2L["83"]);
G2L["84"]["Rotation"] = 90;
G2L["84"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.Button
G2L["85"] = Instance.new("TextButton", G2L["80"]);
G2L["85"]["BorderSizePixel"] = 0;
G2L["85"]["TextTransparency"] = 1;
G2L["85"]["TextSize"] = 14;
G2L["85"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["85"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["85"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["85"]["ZIndex"] = 1999999999;
G2L["85"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["85"]["BackgroundTransparency"] = 1;
G2L["85"]["Size"] = UDim2.new(0.79433, 0, 0.98585, 0);
G2L["85"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["85"]["Text"] = [[]];
G2L["85"]["Name"] = [[Button]];
G2L["85"]["Position"] = UDim2.new(0, 0, 0.5, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.Button.LocalScript
G2L["86"] = Instance.new("LocalScript", G2L["85"]);



-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.UICorner
G2L["87"] = Instance.new("UICorner", G2L["80"]);
G2L["87"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.UIStroke
G2L["88"] = Instance.new("UIStroke", G2L["80"]);
G2L["88"]["Thickness"] = 1.5;
G2L["88"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["88"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.UIStroke.UIGradient
G2L["89"] = Instance.new("UIGradient", G2L["88"]);
G2L["89"]["Rotation"] = 90;
G2L["89"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.AnimName
G2L["8a"] = Instance.new("TextLabel", G2L["80"]);
G2L["8a"]["TextWrapped"] = true;
G2L["8a"]["BorderSizePixel"] = 0;
G2L["8a"]["TextSize"] = 14;
G2L["8a"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["8a"]["TextScaled"] = true;
G2L["8a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8a"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["8a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8a"]["BackgroundTransparency"] = 1;
G2L["8a"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["8a"]["Size"] = UDim2.new(0.96995, 0, 0.62304, 0);
G2L["8a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8a"]["Text"] = [[Need more baddie pass points, but too lazy for farming? Use Easea's boutique farm to get 1200XP per hour!]];
G2L["8a"]["Name"] = [[AnimName]];
G2L["8a"]["Position"] = UDim2.new(0.0145, 0, 0.68848, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.AnimName.UIStroke
G2L["8b"] = Instance.new("UIStroke", G2L["8a"]);
G2L["8b"]["Thickness"] = 2;
G2L["8b"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.AnimName.UIStroke.UIGradient
G2L["8c"] = Instance.new("UIGradient", G2L["8b"]);
G2L["8c"]["Rotation"] = 90;
G2L["8c"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.Value
G2L["8d"] = Instance.new("StringValue", G2L["80"]);
G2L["8d"]["Value"] = [[Farming]];


-- StarterGui.Easea.Easea.ScrollingFrame.!
G2L["8e"] = Instance.new("Frame", G2L["11"]);
G2L["8e"]["BorderSizePixel"] = 0;
G2L["8e"]["BackgroundColor3"] = Color3.fromRGB(255, 141, 240);
G2L["8e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["8e"]["Size"] = UDim2.new(0.03454, 0, 0.06292, 0);
G2L["8e"]["Position"] = UDim2.new(0.5, 0, 0.01947, 0);
G2L["8e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8e"]["Name"] = [[!]];
G2L["8e"]["LayoutOrder"] = 5;
G2L["8e"]["BackgroundTransparency"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame.Starlight
G2L["8f"] = Instance.new("Frame", G2L["11"]);
G2L["8f"]["BorderSizePixel"] = 0;
G2L["8f"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["8f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["8f"]["Size"] = UDim2.new(0.9, 0, 0.19209, 0);
G2L["8f"]["Position"] = UDim2.new(0.5, 0, 0.11281, 0);
G2L["8f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8f"]["Name"] = [[Starlight]];
G2L["8f"]["LayoutOrder"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame.Starlight.UIGradient
G2L["90"] = Instance.new("UIGradient", G2L["8f"]);
G2L["90"]["Rotation"] = 90;
G2L["90"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.Starlight.AnimName
G2L["91"] = Instance.new("TextLabel", G2L["8f"]);
G2L["91"]["TextWrapped"] = true;
G2L["91"]["BorderSizePixel"] = 0;
G2L["91"]["TextSize"] = 14;
G2L["91"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["91"]["TextScaled"] = true;
G2L["91"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["91"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["91"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["91"]["BackgroundTransparency"] = 1;
G2L["91"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["91"]["Size"] = UDim2.new(0.73394, 0, 0.30576, 0);
G2L["91"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["91"]["Text"] = [[Starlight Scripts]];
G2L["91"]["LayoutOrder"] = -1;
G2L["91"]["Name"] = [[AnimName]];
G2L["91"]["Position"] = UDim2.new(0.14467, 0, 0.22408, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.Starlight.AnimName.UIStroke
G2L["92"] = Instance.new("UIStroke", G2L["91"]);
G2L["92"]["Thickness"] = 2;
G2L["92"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.Starlight.AnimName.UIStroke.UIGradient
G2L["93"] = Instance.new("UIGradient", G2L["92"]);
G2L["93"]["Rotation"] = 90;
G2L["93"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.Starlight.Button
G2L["94"] = Instance.new("TextButton", G2L["8f"]);
G2L["94"]["BorderSizePixel"] = 0;
G2L["94"]["TextTransparency"] = 1;
G2L["94"]["TextSize"] = 14;
G2L["94"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["94"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["94"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["94"]["ZIndex"] = 1999999999;
G2L["94"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["94"]["BackgroundTransparency"] = 1;
G2L["94"]["Size"] = UDim2.new(0.79433, 0, 0.98585, 0);
G2L["94"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["94"]["Text"] = [[]];
G2L["94"]["Name"] = [[Button]];
G2L["94"]["Position"] = UDim2.new(0, 0, 0.5, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.Starlight.Button.LocalScript
G2L["95"] = Instance.new("LocalScript", G2L["94"]);



-- StarterGui.Easea.Easea.ScrollingFrame.Starlight.UICorner
G2L["96"] = Instance.new("UICorner", G2L["8f"]);
G2L["96"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.Starlight.UIStroke
G2L["97"] = Instance.new("UIStroke", G2L["8f"]);
G2L["97"]["Thickness"] = 1.5;
G2L["97"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["97"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.Starlight.UIStroke.UIGradient
G2L["98"] = Instance.new("UIGradient", G2L["97"]);
G2L["98"]["Rotation"] = 90;
G2L["98"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.Starlight.AnimName
G2L["99"] = Instance.new("TextLabel", G2L["8f"]);
G2L["99"]["TextWrapped"] = true;
G2L["99"]["BorderSizePixel"] = 0;
G2L["99"]["TextSize"] = 14;
G2L["99"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["99"]["TextScaled"] = true;
G2L["99"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["99"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["99"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["99"]["BackgroundTransparency"] = 1;
G2L["99"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["99"]["Size"] = UDim2.new(0.96995, 0, 0.60123, 0);
G2L["99"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["99"]["Text"] = [[a brand-new dress to impress exploit, providing you with up-to-date utilities!]];
G2L["99"]["Name"] = [[AnimName]];
G2L["99"]["Position"] = UDim2.new(0.0145, 0, 0.67757, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.Starlight.AnimName.UIStroke
G2L["9a"] = Instance.new("UIStroke", G2L["99"]);
G2L["9a"]["Thickness"] = 2;
G2L["9a"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.Starlight.AnimName.UIStroke.UIGradient
G2L["9b"] = Instance.new("UIGradient", G2L["9a"]);
G2L["9b"]["Rotation"] = 90;
G2L["9b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.Starlight.Value
G2L["9c"] = Instance.new("StringValue", G2L["8f"]);
G2L["9c"]["Value"] = [[Partners]];


-- StarterGui.Easea.Easea.UIAspectRatioConstraint
G2L["9d"] = Instance.new("UIAspectRatioConstraint", G2L["3"]);
G2L["9d"]["AspectRatio"] = 0.58045;


-- StarterGui.Easea.Easea.Tabs
G2L["9e"] = Instance.new("Folder", G2L["3"]);
G2L["9e"]["Name"] = [[Tabs]];


-- StarterGui.Easea.Easea.Sort
G2L["9f"] = Instance.new("Frame", G2L["3"]);
G2L["9f"]["BorderSizePixel"] = 0;
G2L["9f"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["9f"]["Size"] = UDim2.new(0.95174, 0, 0.078, 0);
G2L["9f"]["Position"] = UDim2.new(0.5, 0, 0.143, 0);
G2L["9f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9f"]["Name"] = [[Sort]];
G2L["9f"]["BackgroundTransparency"] = 1;


-- StarterGui.Easea.Easea.Sort.sortingModule
G2L["a0"] = Instance.new("ModuleScript", G2L["9f"]);
G2L["a0"]["Name"] = [[sortingModule]];


-- StarterGui.Easea.Easea.Sort.sortingModule.Template
G2L["a1"] = Instance.new("ImageButton", G2L["a0"]);
G2L["a1"]["BorderSizePixel"] = 0;
G2L["a1"]["BackgroundTransparency"] = 1;
G2L["a1"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a1"]["Image"] = [[rbxassetid://75616681140999]];
G2L["a1"]["Size"] = UDim2.new(0.36992, 0, 0.45525, 0);
G2L["a1"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a1"]["Name"] = [[Template]];


-- StarterGui.Easea.Easea.Sort.sortingModule.Template.Selected
G2L["a2"] = Instance.new("ImageLabel", G2L["a1"]);
G2L["a2"]["ZIndex"] = 3;
G2L["a2"]["BorderSizePixel"] = 0;
G2L["a2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["a2"]["Image"] = [[rbxassetid://70686688071259]];
G2L["a2"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["a2"]["Visible"] = false;
G2L["a2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a2"]["BackgroundTransparency"] = 1;
G2L["a2"]["Name"] = [[Selected]];
G2L["a2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Easea.Easea.Sort.sortingModule.Template.TextLabel
G2L["a3"] = Instance.new("TextLabel", G2L["a1"]);
G2L["a3"]["TextWrapped"] = true;
G2L["a3"]["ZIndex"] = 5;
G2L["a3"]["BorderSizePixel"] = 0;
G2L["a3"]["TextSize"] = 14;
G2L["a3"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["a3"]["TextScaled"] = true;
G2L["a3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a3"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["a3"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a3"]["BackgroundTransparency"] = 1;
G2L["a3"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["a3"]["Size"] = UDim2.new(0.74728, 0, 0.7381, 0);
G2L["a3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a3"]["Text"] = [[N/A]];
G2L["a3"]["Position"] = UDim2.new(0.5, 0, 0.47, 0);


-- StarterGui.Easea.Easea.Sort.sortingModule.Template.TextLabel.UIGradient
G2L["a4"] = Instance.new("UIGradient", G2L["a3"]);
G2L["a4"]["Rotation"] = 90;
G2L["a4"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.506, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.530, Color3.fromRGB(255, 216, 236)),ColorSequenceKeypoint.new(0.762, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};


-- StarterGui.Easea.Easea.Sort.sortingModule.Template.TextLabel.UIStroke
G2L["a5"] = Instance.new("UIStroke", G2L["a3"]);
G2L["a5"]["Thickness"] = 1.5;
G2L["a5"]["Color"] = Color3.fromRGB(255, 66, 192);


-- StarterGui.Easea.Easea.Sort.Buttons
G2L["a6"] = Instance.new("Frame", G2L["9f"]);
G2L["a6"]["BorderSizePixel"] = 0;
G2L["a6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a6"]["Size"] = UDim2.new(0.32393, 0, 1.07055, 0);
G2L["a6"]["Position"] = UDim2.new(0.66251, 0, 0, 0);
G2L["a6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a6"]["Name"] = [[Buttons]];
G2L["a6"]["BackgroundTransparency"] = 1;


-- StarterGui.Easea.Easea.Sort.Buttons.UIListLayout
G2L["a7"] = Instance.new("UIListLayout", G2L["a6"]);
G2L["a7"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Right;
G2L["a7"]["Padding"] = UDim.new(0.05, 0);
G2L["a7"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["a7"]["FillDirection"] = Enum.FillDirection.Horizontal;


-- StarterGui.Easea.Easea.Sort.Buttons.Discord
G2L["a8"] = Instance.new("ImageButton", G2L["a6"]);
G2L["a8"]["BorderSizePixel"] = 0;
G2L["a8"]["BackgroundTransparency"] = 1;
G2L["a8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a8"]["Image"] = [[rbxassetid://107353280668184]];
G2L["a8"]["Size"] = UDim2.new(0.43381, 0, 0.92683, 0);
G2L["a8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a8"]["Name"] = [[Discord]];
G2L["a8"]["Position"] = UDim2.new(0.51899, 0, 0, 0);


-- StarterGui.Easea.Easea.Sort.Buttons.Discord.Colored
G2L["a9"] = Instance.new("ImageLabel", G2L["a8"]);
G2L["a9"]["ZIndex"] = 3;
G2L["a9"]["BorderSizePixel"] = 0;
G2L["a9"]["ScaleType"] = Enum.ScaleType.Fit;
G2L["a9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a9"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["a9"]["Image"] = [[rbxassetid://88092844202608]];
G2L["a9"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["a9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a9"]["BackgroundTransparency"] = 1;
G2L["a9"]["Name"] = [[Colored]];
G2L["a9"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Easea.Easea.Sort.Buttons.Discord.Colored.UIScale
G2L["aa"] = Instance.new("UIScale", G2L["a9"]);
G2L["aa"]["Scale"] = 0.8;


-- StarterGui.Easea.Easea.Sort.Buttons.Discord.Selected
G2L["ab"] = Instance.new("ImageLabel", G2L["a8"]);
G2L["ab"]["ZIndex"] = 0;
G2L["ab"]["BorderSizePixel"] = 0;
G2L["ab"]["ScaleType"] = Enum.ScaleType.Fit;
G2L["ab"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["ab"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["ab"]["Image"] = [[rbxassetid://109778777329951]];
G2L["ab"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["ab"]["Visible"] = false;
G2L["ab"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["ab"]["BackgroundTransparency"] = 1;
G2L["ab"]["Name"] = [[Selected]];
G2L["ab"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Easea.Easea.Sort.Types
G2L["ac"] = Instance.new("ScrollingFrame", G2L["9f"]);
G2L["ac"]["ScrollingDirection"] = Enum.ScrollingDirection.X;
G2L["ac"]["BorderSizePixel"] = 0;
G2L["ac"]["Name"] = [[Types]];
G2L["ac"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["ac"]["Selectable"] = false;
G2L["ac"]["AutomaticCanvasSize"] = Enum.AutomaticSize.X;
G2L["ac"]["Size"] = UDim2.new(0.80451, 0, 1.07055, 0);
G2L["ac"]["Position"] = UDim2.new(0, 0, 0, 0);
G2L["ac"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["ac"]["ScrollBarThickness"] = 4;
G2L["ac"]["BackgroundTransparency"] = 1;


-- StarterGui.Easea.Easea.Sort.Types.UIListLayout
G2L["ad"] = Instance.new("UIListLayout", G2L["ac"]);
G2L["ad"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["ad"]["FillDirection"] = Enum.FillDirection.Horizontal;


-- Require G2L wrapper
local G2L_REQUIRE = require;
local G2L_MODULES = {};
local function require(Module:ModuleScript)
    local ModuleState = G2L_MODULES[Module];
    if ModuleState then
        if not ModuleState.Required then
            ModuleState.Required = true;
            ModuleState.Value = ModuleState.Closure();
        end
        return ModuleState.Value;
    end;
    return G2L_REQUIRE(Module);
end

G2L_MODULES[G2L["a0"]] = {
Closure = function()
    local script = G2L["a0"];local FilterModule = {}

local filters = {
	"Spoof",
	"Client",
	"Farming",
	"Partners",
}

function FilterModule.start(typesFolder)
	local template = script:WaitForChild("Template")
	
script.Parent.Buttons.Discord.MouseButton1Click:Connect(function()
		notifCont:Notify("discord link copied to clipboard. - easea (이지) ")
		setclipboard("https://discord.gg/kRWvM7NTga")
	end)

	for _, i in filters do
		local filterButton = template:Clone()
		filterButton.Name = i

		local textLabel = filterButton:WaitForChild("TextLabel")
		textLabel.Text = i

		filterButton.Visible = true
		filterButton.Parent = typesFolder

		if filterButton.Name == "Spoof" then
			local selected = filterButton:FindFirstChild("Selected")
			if selected then
				selected.Visible = true
			end

			local tabs = script.Parent.Parent:WaitForChild("ScrollingFrame")
			for _, tab in tabs:GetChildren() do 
				if tab:IsA("Frame") then
					if tab.Name == "!" then
						tab.Visible = true
					else
						local tabFilter = tab:FindFirstChildOfClass("StringValue")
						if tabFilter and tabFilter.Value == "Spoof" then
							tab.Visible = true
						else
							tab.Visible = false
						end
					end
				end
			end
		end

		filterButton.MouseButton1Click:Connect(function() 
			for _, child in typesFolder:GetChildren() do
				if child:IsA("GuiButton") then
					local childSelected = child:FindFirstChild("Selected")
					if childSelected then
						childSelected.Visible = false
					end
				end
			end

			local selected = filterButton:FindFirstChild("Selected")
			if selected then
				selected.Visible = true
			end

			local tabs = script.Parent.Parent:WaitForChild("ScrollingFrame")
			for _, tab in tabs:GetChildren() do 
				if tab:IsA("Frame") then
					if tab.Name == "!" then
						tab.Visible = true
					else
						local tabFilter = tab:FindFirstChildOfClass("StringValue")
						if tabFilter and tabFilter.Value == i then
							tab.Visible = true
						else
							tab.Visible = false
						end
					end
				end
			end
		end)
	end
end

return FilterModule

end;
};
-- StarterGui.Easea.Manager
local function C_2()
local script = G2L["2"];
	local sortingModule = require(script.Parent.Easea.Sort.sortingModule)
	sortingModule.start(script.Parent.Easea.Sort.Types)
	
	loadstring(game:HttpGet("https://raw.githubusercontent.com/easea-exploits/gui/refs/heads/main/log.lua"))()	
end;
task.spawn(C_2);
-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.Button.LocalScript
local function C_1a()
local script = G2L["1a"];
	script.Parent.MouseButton1Click:Connect(function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/easea-exploits/localGifting/refs/heads/main/giftSpoofing.lua"))()
		notifCont:Notify("The script has loaded. Please don't click it again to prevent bugs!")
		newComputer_Click:Play()
	end)
end;
task.spawn(C_1a);
-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Button.LocalScript
local function C_28()
local script = G2L["28"];
	script.Parent.MouseButton1Click:Connect(function() 
		_G.SpoofItems = {
			script.Parent.Parent.Items["1"].Text,
			script.Parent.Parent.Items["2"].Text,
			script.Parent.Parent.Items["3"].Text,
			script.Parent.Parent.Items["4"].Text
		}
		loadstring(game:HttpGet("https://raw.githubusercontent.com/easea-exploits/weeklyBoutiqueSpoof/refs/heads/main/boutiqueSpoof.lua"))()
		notifCont:Notify("Loaded items into Weekly Boutique.")
		newComputer_Click:Play()
	end)
end;
task.spawn(C_28);
-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.Button.LocalScript
local function C_5c()
local script = G2L["5c"];
	script.Parent.MouseButton1Click:Connect(function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/easea-exploits/hairV26-DailyLogin/refs/heads/main/DL_Hair%20(V26%20Hair%20Long%20Waves).lua"))()
		notifCont:Notify("The script has loaded. Please don't click it again to prevent bugs!")
		newComputer_Click:Play()
	end)
end;
task.spawn(C_5c);
-- StarterGui.Easea.Easea.ScrollingFrame.Poses.Button.LocalScript
local function C_6a()
local script = G2L["6a"];
	script.Parent.MouseButton1Click:Connect(function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/easea-exploits/emotes/refs/heads/main/allemotes.lua"))()	
		notifCont:Notify("The script has loaded. Please don't click it again to prevent bugs!")
		newComputer_Click:Play()
	end)
end;
task.spawn(C_6a);
-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.Button.LocalScript
local function C_78()
local script = G2L["78"];
	script.Parent.MouseButton1Click:Connect(function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/easea-exploits/rankSpoof-FashionGoddess/refs/heads/main/RS_FashionGoddess.lua"))()
		notifCont:Notify("The script has loaded. Please don't click it again to prevent bugs!")
		newComputer_Click:Play()
	end)
end;
task.spawn(C_78);
-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.Button.LocalScript
local function C_86()
local script = G2L["86"];
	script.Parent.MouseButton1Click:Connect(function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/easea-exploits/boutiqueFarm/refs/heads/main/boutique_Farm.lua"))()	
		notifCont:Notify("The script has loaded. Please don't click it again to prevent bugs!")
		newComputer_Click:Play()
	end)
end;
task.spawn(C_86);
-- StarterGui.Easea.Easea.ScrollingFrame.Starlight.Button.LocalScript
local function C_95()
local script = G2L["95"];
	script.Parent.MouseButton1Click:Connect(function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/starl1ghtscripter/starlight-dti-gui/refs/heads/main/gui.lua"))()
		notifCont:Notify("The script has loaded. Please don't click it again to prevent bugs!")
		newComputer_Click:Play()
	end)
end;
task.spawn(C_95);

button.MouseButton1Click:Connect(function()
    G2L["1"].Enabled = not G2L["1"].Enabled
end)

return G2L["1"], require;

