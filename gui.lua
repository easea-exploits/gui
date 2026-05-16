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

-- the following is the ui, all loadstrings are obfuscated so u cant skid ty
local G2L = {};

-- StarterGui.Easea
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["IgnoreGuiInset"] = true;
G2L["1"]["DisplayOrder"] = 2;
G2L["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
G2L["1"]["Name"] = [[Easea]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
G2L["1"]["ResetOnSpawn"] = false;


-- StarterGui.Easea.Easea
G2L["2"] = Instance.new("ImageLabel", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2"]["Image"] = [[rbxassetid://133880096334098]];
G2L["2"]["Size"] = UDim2.new(0.23763, 0, 0.63111, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["BackgroundTransparency"] = 1;
G2L["2"]["Name"] = [[Easea]];
G2L["2"]["Position"] = UDim2.new(0.8052, 0, 0.56186, 0);


-- StarterGui.Easea.Easea.HeaderTextLabel
G2L["3"] = Instance.new("TextLabel", G2L["2"]);
G2L["3"]["TextWrapped"] = true;
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["TextSize"] = 14;
G2L["3"]["TextScaled"] = true;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3"]["TextColor3"] = Color3.fromRGB(237, 155, 223);
G2L["3"]["BackgroundTransparency"] = 1;
G2L["3"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3"]["Size"] = UDim2.new(0.8, 0, 0.07419, 0);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Text"] = [[easea (이지) scripting™]];
G2L["3"]["Name"] = [[HeaderTextLabel]];
G2L["3"]["Position"] = UDim2.new(0.5, 0, 0.0485, 0);


-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel
G2L["4"] = Instance.new("TextLabel", G2L["3"]);
G2L["4"]["TextWrapped"] = true;
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["TextSize"] = 14;
G2L["4"]["TextScaled"] = true;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4"]["BackgroundTransparency"] = 1;
G2L["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["4"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Text"] = [[easea (이지) scripting™]];
G2L["4"]["Position"] = UDim2.new(0.5, 0, 0.46, 0);


-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.Sparkle
G2L["5"] = Instance.new("ImageLabel", G2L["4"]);
G2L["5"]["BorderSizePixel"] = 0;
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["ImageTransparency"] = 0.1;
G2L["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["5"]["Image"] = [[rbxassetid://132231983747131]];
G2L["5"]["Size"] = UDim2.new(0.19545, 0, 0.74588, 0);
G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["BackgroundTransparency"] = 1;
G2L["5"]["Rotation"] = -10;
G2L["5"]["Name"] = [[Sparkle]];
G2L["5"]["Position"] = UDim2.new(0.6999, 0, 0.69263, 0);


-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.Sparkle.UIAspectRatioConstraint
G2L["6"] = Instance.new("UIAspectRatioConstraint", G2L["5"]);



-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.Sparkle
G2L["7"] = Instance.new("ImageLabel", G2L["4"]);
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7"]["ImageTransparency"] = 0.1;
G2L["7"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["7"]["Image"] = [[rbxassetid://132231983747131]];
G2L["7"]["Size"] = UDim2.new(0.19545, 0, 0.74588, 0);
G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["BackgroundTransparency"] = 1;
G2L["7"]["Rotation"] = -30;
G2L["7"]["Name"] = [[Sparkle]];
G2L["7"]["Position"] = UDim2.new(0.57093, 0, 0.36336, 0);


-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.Sparkle.UIAspectRatioConstraint
G2L["8"] = Instance.new("UIAspectRatioConstraint", G2L["7"]);



-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.Sparkle
G2L["9"] = Instance.new("ImageLabel", G2L["4"]);
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["ImageTransparency"] = 0.1;
G2L["9"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["9"]["Image"] = [[rbxassetid://132231983747131]];
G2L["9"]["Size"] = UDim2.new(0.19545, 0, 0.74588, 0);
G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["BackgroundTransparency"] = 1;
G2L["9"]["Name"] = [[Sparkle]];
G2L["9"]["Position"] = UDim2.new(0.4007, 0, 0.78017, 0);


-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.Sparkle.UIAspectRatioConstraint
G2L["a"] = Instance.new("UIAspectRatioConstraint", G2L["9"]);



-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.Sparkle
G2L["b"] = Instance.new("ImageLabel", G2L["4"]);
G2L["b"]["BorderSizePixel"] = 0;
G2L["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["b"]["ImageTransparency"] = 0.1;
G2L["b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["b"]["Image"] = [[rbxassetid://132231983747131]];
G2L["b"]["Size"] = UDim2.new(0.8, 0, 0.8, 0);
G2L["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["BackgroundTransparency"] = 1;
G2L["b"]["Rotation"] = -30;
G2L["b"]["Name"] = [[Sparkle]];
G2L["b"]["Position"] = UDim2.new(0.29395, 0, 0.34789, 0);


-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.Sparkle.UIAspectRatioConstraint
G2L["c"] = Instance.new("UIAspectRatioConstraint", G2L["b"]);



-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.UIGradient
G2L["d"] = Instance.new("UIGradient", G2L["4"]);
G2L["d"]["Rotation"] = 90;
G2L["d"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.506, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.530, Color3.fromRGB(255, 216, 236)),ColorSequenceKeypoint.new(0.762, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};


-- StarterGui.Easea.Easea.HeaderTextLabel.TextLabel.UIStroke
G2L["e"] = Instance.new("UIStroke", G2L["4"]);
G2L["e"]["Color"] = Color3.fromRGB(255, 117, 233);


-- StarterGui.Easea.Easea.HeaderTextLabel.UIStroke
G2L["f"] = Instance.new("UIStroke", G2L["3"]);
G2L["f"]["Thickness"] = 2.5;
G2L["f"]["Color"] = Color3.fromRGB(246, 93, 205);


-- StarterGui.Easea.Easea.Sort
G2L["10"] = Instance.new("Frame", G2L["2"]);
G2L["10"]["BorderSizePixel"] = 0;
G2L["10"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["10"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["10"]["Size"] = UDim2.new(0.95174, 0, 0.078, 0);
G2L["10"]["Position"] = UDim2.new(0.5, 0, 0.143, 0);
G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["10"]["Name"] = [[Sort]];
G2L["10"]["BackgroundTransparency"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame
G2L["11"] = Instance.new("ScrollingFrame", G2L["2"]);
G2L["11"]["Active"] = true;
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
G2L["11"]["CanvasPosition"] = Vector2.new(0, 221.39099);
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["11"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY;
G2L["11"]["Size"] = UDim2.new(0.89074, 0, 0.87001, 0);
G2L["11"]["Position"] = UDim2.new(0.5, 0, 0.54366, 0);
G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["ScrollBarThickness"] = 5;
G2L["11"]["BackgroundTransparency"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame.!
G2L["12"] = Instance.new("Frame", G2L["11"]);
G2L["12"]["BorderSizePixel"] = 0;
G2L["12"]["BackgroundColor3"] = Color3.fromRGB(255, 141, 240);
G2L["12"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["12"]["Size"] = UDim2.new(-0.00225, 0, 0.00952, 0);
G2L["12"]["Position"] = UDim2.new(0.49786, 0, 0.00476, 0);
G2L["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["12"]["Name"] = [[!]];
G2L["12"]["LayoutOrder"] = -1999999999;


-- StarterGui.Easea.Easea.ScrollingFrame.UIListLayout
G2L["13"] = Instance.new("UIListLayout", G2L["11"]);
G2L["13"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["13"]["Padding"] = UDim.new(0, 8);
G2L["13"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique
G2L["14"] = Instance.new("Frame", G2L["11"]);
G2L["14"]["BorderSizePixel"] = 0;
G2L["14"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["14"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["14"]["Size"] = UDim2.new(0.9, 0, 0.19209, 0);
G2L["14"]["Position"] = UDim2.new(0.5, 0, 0.11281, 0);
G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["Name"] = [[Boutique]];
G2L["14"]["LayoutOrder"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.UIGradient
G2L["15"] = Instance.new("UIGradient", G2L["14"]);
G2L["15"]["Rotation"] = 90;
G2L["15"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.AnimName
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
G2L["16"]["Text"] = [[Boutique Farm]];
G2L["16"]["Name"] = [[AnimName]];
G2L["16"]["Position"] = UDim2.new(0.14467, 0, 0.22408, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.AnimName.UIStroke
G2L["17"] = Instance.new("UIStroke", G2L["16"]);
G2L["17"]["Thickness"] = 2;
G2L["17"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.AnimName.UIStroke.UIGradient
G2L["18"] = Instance.new("UIGradient", G2L["17"]);
G2L["18"]["Rotation"] = 90;
G2L["18"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.Button
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


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.Button.LocalScript
G2L["1a"] = Instance.new("LocalScript", G2L["19"]);



-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.UICorner
G2L["1b"] = Instance.new("UICorner", G2L["14"]);
G2L["1b"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.UIStroke
G2L["1c"] = Instance.new("UIStroke", G2L["14"]);
G2L["1c"]["Thickness"] = 1.5;
G2L["1c"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["1c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.UIStroke.UIGradient
G2L["1d"] = Instance.new("UIGradient", G2L["1c"]);
G2L["1d"]["Rotation"] = 90;
G2L["1d"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.AnimName
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
G2L["1e"]["Size"] = UDim2.new(0.96995, 0, 0.62304, 0);
G2L["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1e"]["Text"] = [[Need more baddie pass points, but too lazy for farming? Use Easea's boutique farm to get 1200XP per hour!]];
G2L["1e"]["Name"] = [[AnimName]];
G2L["1e"]["Position"] = UDim2.new(0.0145, 0, 0.68848, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.AnimName.UIStroke
G2L["1f"] = Instance.new("UIStroke", G2L["1e"]);
G2L["1f"]["Thickness"] = 2;
G2L["1f"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.AnimName.UIStroke.UIGradient
G2L["20"] = Instance.new("UIGradient", G2L["1f"]);
G2L["20"]["Rotation"] = 90;
G2L["20"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair
G2L["21"] = Instance.new("Frame", G2L["11"]);
G2L["21"]["BorderSizePixel"] = 0;
G2L["21"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["21"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["21"]["Size"] = UDim2.new(0.9, 0, 0.19209, 0);
G2L["21"]["Position"] = UDim2.new(0.5, 0, 0.11281, 0);
G2L["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["21"]["Name"] = [[V26Hair]];
G2L["21"]["LayoutOrder"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.UIGradient
G2L["22"] = Instance.new("UIGradient", G2L["21"]);
G2L["22"]["Rotation"] = 90;
G2L["22"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.AnimName
G2L["23"] = Instance.new("TextLabel", G2L["21"]);
G2L["23"]["TextWrapped"] = true;
G2L["23"]["BorderSizePixel"] = 0;
G2L["23"]["TextSize"] = 14;
G2L["23"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["23"]["TextScaled"] = true;
G2L["23"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["23"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["23"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["23"]["BackgroundTransparency"] = 1;
G2L["23"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["23"]["Size"] = UDim2.new(0.73394, 0, 0.30576, 0);
G2L["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["23"]["Text"] = [[V26 Hair Long Waves]];
G2L["23"]["Name"] = [[AnimName]];
G2L["23"]["Position"] = UDim2.new(0.14467, 0, 0.22408, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.AnimName.UIStroke
G2L["24"] = Instance.new("UIStroke", G2L["23"]);
G2L["24"]["Thickness"] = 2;
G2L["24"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.AnimName.UIStroke.UIGradient
G2L["25"] = Instance.new("UIGradient", G2L["24"]);
G2L["25"]["Rotation"] = 90;
G2L["25"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.Button
G2L["26"] = Instance.new("TextButton", G2L["21"]);
G2L["26"]["BorderSizePixel"] = 0;
G2L["26"]["TextTransparency"] = 1;
G2L["26"]["TextSize"] = 14;
G2L["26"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["26"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["26"]["ZIndex"] = 1999999999;
G2L["26"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["26"]["BackgroundTransparency"] = 1;
G2L["26"]["Size"] = UDim2.new(0.79433, 0, 0.98585, 0);
G2L["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["26"]["Text"] = [[]];
G2L["26"]["Name"] = [[Button]];
G2L["26"]["Position"] = UDim2.new(0, 0, 0.5, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.Button.LocalScript
G2L["27"] = Instance.new("LocalScript", G2L["26"]);



-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.UICorner
G2L["28"] = Instance.new("UICorner", G2L["21"]);
G2L["28"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.UIStroke
G2L["29"] = Instance.new("UIStroke", G2L["21"]);
G2L["29"]["Thickness"] = 1.5;
G2L["29"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["29"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.UIStroke.UIGradient
G2L["2a"] = Instance.new("UIGradient", G2L["29"]);
G2L["2a"]["Rotation"] = 90;
G2L["2a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.AnimName
G2L["2b"] = Instance.new("TextLabel", G2L["21"]);
G2L["2b"]["TextWrapped"] = true;
G2L["2b"]["BorderSizePixel"] = 0;
G2L["2b"]["TextSize"] = 14;
G2L["2b"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["2b"]["TextScaled"] = true;
G2L["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2b"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["2b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2b"]["BackgroundTransparency"] = 1;
G2L["2b"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["2b"]["Size"] = UDim2.new(0.96995, 0, 0.60123, 0);
G2L["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2b"]["Text"] = [[Remember that Valentine's hair, that one that got shown in that teaser.. and then never got released? Yeah, with this, you can wear it early!]];
G2L["2b"]["Name"] = [[AnimName]];
G2L["2b"]["Position"] = UDim2.new(0.0145, 0, 0.67757, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.AnimName.UIStroke
G2L["2c"] = Instance.new("UIStroke", G2L["2b"]);
G2L["2c"]["Thickness"] = 2;
G2L["2c"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.AnimName.UIStroke.UIGradient
G2L["2d"] = Instance.new("UIGradient", G2L["2c"]);
G2L["2d"]["Rotation"] = 90;
G2L["2d"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess
G2L["2e"] = Instance.new("Frame", G2L["11"]);
G2L["2e"]["BorderSizePixel"] = 0;
G2L["2e"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["2e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2e"]["Size"] = UDim2.new(0.9, 0, 0.19209, 0);
G2L["2e"]["Position"] = UDim2.new(0.5, 0, 0.11281, 0);
G2L["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2e"]["Name"] = [[FashionGoddess]];
G2L["2e"]["LayoutOrder"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.UIGradient
G2L["2f"] = Instance.new("UIGradient", G2L["2e"]);
G2L["2f"]["Rotation"] = 90;
G2L["2f"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.AnimName
G2L["30"] = Instance.new("TextLabel", G2L["2e"]);
G2L["30"]["TextWrapped"] = true;
G2L["30"]["BorderSizePixel"] = 0;
G2L["30"]["TextSize"] = 14;
G2L["30"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["30"]["TextScaled"] = true;
G2L["30"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["30"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["30"]["BackgroundTransparency"] = 1;
G2L["30"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["30"]["Size"] = UDim2.new(0.73394, 0, 0.30576, 0);
G2L["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["30"]["Text"] = [[Fashion Goddess Spoof]];
G2L["30"]["Name"] = [[AnimName]];
G2L["30"]["Position"] = UDim2.new(0.14467, 0, 0.22408, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.AnimName.UIStroke
G2L["31"] = Instance.new("UIStroke", G2L["30"]);
G2L["31"]["Thickness"] = 2;
G2L["31"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.AnimName.UIStroke.UIGradient
G2L["32"] = Instance.new("UIGradient", G2L["31"]);
G2L["32"]["Rotation"] = 90;
G2L["32"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.Button
G2L["33"] = Instance.new("TextButton", G2L["2e"]);
G2L["33"]["BorderSizePixel"] = 0;
G2L["33"]["TextTransparency"] = 1;
G2L["33"]["TextSize"] = 14;
G2L["33"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["33"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["33"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["33"]["ZIndex"] = 1999999999;
G2L["33"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["33"]["BackgroundTransparency"] = 1;
G2L["33"]["Size"] = UDim2.new(0.79433, 0, 0.98585, 0);
G2L["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["33"]["Text"] = [[]];
G2L["33"]["Name"] = [[Button]];
G2L["33"]["Position"] = UDim2.new(0, 0, 0.5, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.Button.LocalScript
G2L["34"] = Instance.new("LocalScript", G2L["33"]);



-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.UICorner
G2L["35"] = Instance.new("UICorner", G2L["2e"]);
G2L["35"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.UIStroke
G2L["36"] = Instance.new("UIStroke", G2L["2e"]);
G2L["36"]["Thickness"] = 1.5;
G2L["36"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["36"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.UIStroke.UIGradient
G2L["37"] = Instance.new("UIGradient", G2L["36"]);
G2L["37"]["Rotation"] = 90;
G2L["37"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.AnimName
G2L["38"] = Instance.new("TextLabel", G2L["2e"]);
G2L["38"]["TextWrapped"] = true;
G2L["38"]["BorderSizePixel"] = 0;
G2L["38"]["TextSize"] = 14;
G2L["38"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["38"]["TextScaled"] = true;
G2L["38"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["38"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["38"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["38"]["BackgroundTransparency"] = 1;
G2L["38"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["38"]["Size"] = UDim2.new(0.96995, 0, 0.60123, 0);
G2L["38"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["38"]["Text"] = [[Have you dreamed of every looking like a Fashion Goddess? Well, seize te chance now, with this spoofer, you can visually look like a Fashion Goddess!]];
G2L["38"]["Name"] = [[AnimName]];
G2L["38"]["Position"] = UDim2.new(0.0145, 0, 0.67757, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.AnimName.UIStroke
G2L["39"] = Instance.new("UIStroke", G2L["38"]);
G2L["39"]["Thickness"] = 2;
G2L["39"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.AnimName.UIStroke.UIGradient
G2L["3a"] = Instance.new("UIGradient", G2L["39"]);
G2L["3a"]["Rotation"] = 90;
G2L["3a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.Poses
G2L["3b"] = Instance.new("Frame", G2L["11"]);
G2L["3b"]["BorderSizePixel"] = 0;
G2L["3b"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["3b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3b"]["Size"] = UDim2.new(0.9, 0, 0.19209, 0);
G2L["3b"]["Position"] = UDim2.new(0.5, 0, 0.11281, 0);
G2L["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3b"]["Name"] = [[Poses]];
G2L["3b"]["LayoutOrder"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.UIGradient
G2L["3c"] = Instance.new("UIGradient", G2L["3b"]);
G2L["3c"]["Rotation"] = 90;
G2L["3c"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.AnimName
G2L["3d"] = Instance.new("TextLabel", G2L["3b"]);
G2L["3d"]["TextWrapped"] = true;
G2L["3d"]["BorderSizePixel"] = 0;
G2L["3d"]["TextSize"] = 14;
G2L["3d"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["3d"]["TextScaled"] = true;
G2L["3d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3d"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3d"]["BackgroundTransparency"] = 1;
G2L["3d"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["3d"]["Size"] = UDim2.new(0.73394, 0, 0.30576, 0);
G2L["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3d"]["Text"] = [[Unlock Poses]];
G2L["3d"]["Name"] = [[AnimName]];
G2L["3d"]["Position"] = UDim2.new(0.14467, 0, 0.22408, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.AnimName.UIStroke
G2L["3e"] = Instance.new("UIStroke", G2L["3d"]);
G2L["3e"]["Thickness"] = 2;
G2L["3e"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.AnimName.UIStroke.UIGradient
G2L["3f"] = Instance.new("UIGradient", G2L["3e"]);
G2L["3f"]["Rotation"] = 90;
G2L["3f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.Button
G2L["40"] = Instance.new("TextButton", G2L["3b"]);
G2L["40"]["BorderSizePixel"] = 0;
G2L["40"]["TextTransparency"] = 1;
G2L["40"]["TextSize"] = 14;
G2L["40"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["40"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["40"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["40"]["ZIndex"] = 1999999999;
G2L["40"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["40"]["BackgroundTransparency"] = 1;
G2L["40"]["Size"] = UDim2.new(0.79433, 0, 0.98585, 0);
G2L["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["40"]["Text"] = [[]];
G2L["40"]["Name"] = [[Button]];
G2L["40"]["Position"] = UDim2.new(0, 0, 0.5, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.Button.LocalScript
G2L["41"] = Instance.new("LocalScript", G2L["40"]);



-- StarterGui.Easea.Easea.ScrollingFrame.Poses.UICorner
G2L["42"] = Instance.new("UICorner", G2L["3b"]);
G2L["42"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.UIStroke
G2L["43"] = Instance.new("UIStroke", G2L["3b"]);
G2L["43"]["Thickness"] = 1.5;
G2L["43"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["43"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.UIStroke.UIGradient
G2L["44"] = Instance.new("UIGradient", G2L["43"]);
G2L["44"]["Rotation"] = 90;
G2L["44"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.AnimName
G2L["45"] = Instance.new("TextLabel", G2L["3b"]);
G2L["45"]["TextWrapped"] = true;
G2L["45"]["BorderSizePixel"] = 0;
G2L["45"]["TextSize"] = 14;
G2L["45"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["45"]["TextScaled"] = true;
G2L["45"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["45"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["45"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["45"]["BackgroundTransparency"] = 1;
G2L["45"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["45"]["Size"] = UDim2.new(0.96995, 0, 0.62304, 0);
G2L["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["45"]["Text"] = [[Do you want all poses in the game, for absolutely free - yes, even the baddie pass ones? Well, this is the solution for you! (You must re-execute this everytime you need them.)]];
G2L["45"]["Name"] = [[AnimName]];
G2L["45"]["Position"] = UDim2.new(0.0145, 0, 0.68848, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.AnimName.UIStroke
G2L["46"] = Instance.new("UIStroke", G2L["45"]);
G2L["46"]["Thickness"] = 2;
G2L["46"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.Poses.AnimName.UIStroke.UIGradient
G2L["47"] = Instance.new("UIGradient", G2L["46"]);
G2L["47"]["Rotation"] = 90;
G2L["47"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof
G2L["48"] = Instance.new("Frame", G2L["11"]);
G2L["48"]["BorderSizePixel"] = 0;
G2L["48"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["48"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["48"]["Size"] = UDim2.new(0.9, 0, 0.19209, 0);
G2L["48"]["Position"] = UDim2.new(0.5, 0, 0.11281, 0);
G2L["48"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["48"]["Name"] = [[giftSpoof]];
G2L["48"]["LayoutOrder"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.UIGradient
G2L["49"] = Instance.new("UIGradient", G2L["48"]);
G2L["49"]["Rotation"] = 90;
G2L["49"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.AnimName
G2L["4a"] = Instance.new("TextLabel", G2L["48"]);
G2L["4a"]["TextWrapped"] = true;
G2L["4a"]["BorderSizePixel"] = 0;
G2L["4a"]["TextSize"] = 14;
G2L["4a"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["4a"]["TextScaled"] = true;
G2L["4a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4a"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4a"]["BackgroundTransparency"] = 1;
G2L["4a"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["4a"]["Size"] = UDim2.new(0.73394, 0, 0.30576, 0);
G2L["4a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4a"]["Text"] = [[Spoof Gifting Props]];
G2L["4a"]["Name"] = [[AnimName]];
G2L["4a"]["Position"] = UDim2.new(0.14467, 0, 0.22408, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.AnimName.UIStroke
G2L["4b"] = Instance.new("UIStroke", G2L["4a"]);
G2L["4b"]["Thickness"] = 2;
G2L["4b"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.AnimName.UIStroke.UIGradient
G2L["4c"] = Instance.new("UIGradient", G2L["4b"]);
G2L["4c"]["Rotation"] = 90;
G2L["4c"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.Button
G2L["4d"] = Instance.new("TextButton", G2L["48"]);
G2L["4d"]["BorderSizePixel"] = 0;
G2L["4d"]["TextTransparency"] = 1;
G2L["4d"]["TextSize"] = 14;
G2L["4d"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4d"]["ZIndex"] = 1999999999;
G2L["4d"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["4d"]["BackgroundTransparency"] = 1;
G2L["4d"]["Size"] = UDim2.new(0.79433, 0, 0.98585, 0);
G2L["4d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4d"]["Text"] = [[]];
G2L["4d"]["Name"] = [[Button]];
G2L["4d"]["Position"] = UDim2.new(0, 0, 0.5, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.Button.LocalScript
G2L["4e"] = Instance.new("LocalScript", G2L["4d"]);



-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.UICorner
G2L["4f"] = Instance.new("UICorner", G2L["48"]);
G2L["4f"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.UIStroke
G2L["50"] = Instance.new("UIStroke", G2L["48"]);
G2L["50"]["Thickness"] = 1.5;
G2L["50"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["50"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.UIStroke.UIGradient
G2L["51"] = Instance.new("UIGradient", G2L["50"]);
G2L["51"]["Rotation"] = 90;
G2L["51"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.AnimName
G2L["52"] = Instance.new("TextLabel", G2L["48"]);
G2L["52"]["TextWrapped"] = true;
G2L["52"]["BorderSizePixel"] = 0;
G2L["52"]["TextSize"] = 14;
G2L["52"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["52"]["TextScaled"] = true;
G2L["52"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["52"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["52"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["52"]["BackgroundTransparency"] = 1;
G2L["52"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["52"]["Size"] = UDim2.new(0.96995, 0, 0.60123, 0);
G2L["52"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["52"]["Text"] = [[This is kind of pointless, its client-sided, so no one will actually recieve the gifts, but if you want fake proofs. This is for you.]];
G2L["52"]["Name"] = [[AnimName]];
G2L["52"]["Position"] = UDim2.new(0.0145, 0, 0.67757, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.AnimName.UIStroke
G2L["53"] = Instance.new("UIStroke", G2L["52"]);
G2L["53"]["Thickness"] = 2;
G2L["53"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.AnimName.UIStroke.UIGradient
G2L["54"] = Instance.new("UIGradient", G2L["53"]);
G2L["54"]["Rotation"] = 90;
G2L["54"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique
G2L["55"] = Instance.new("Frame", G2L["11"]);
G2L["55"]["BorderSizePixel"] = 0;
G2L["55"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["55"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["55"]["Size"] = UDim2.new(0.9, 0, 0.48754, 0);
G2L["55"]["Position"] = UDim2.new(0.5, 0, 0.47375, 0);
G2L["55"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["55"]["Name"] = [[customBoutique]];
G2L["55"]["LayoutOrder"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.UIGradient
G2L["56"] = Instance.new("UIGradient", G2L["55"]);
G2L["56"]["Rotation"] = 90;
G2L["56"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.AnimName
G2L["57"] = Instance.new("TextLabel", G2L["55"]);
G2L["57"]["TextWrapped"] = true;
G2L["57"]["BorderSizePixel"] = 0;
G2L["57"]["TextSize"] = 14;
G2L["57"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["57"]["TextScaled"] = true;
G2L["57"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["57"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["57"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["57"]["BackgroundTransparency"] = 1;
G2L["57"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["57"]["Size"] = UDim2.new(0.85198, 0, 0.17599, 0);
G2L["57"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["57"]["Text"] = [[Spoof Weekly Boutique]];
G2L["57"]["Name"] = [[AnimName]];
G2L["57"]["Position"] = UDim2.new(0.07068, 0, 0.08581, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.AnimName.UIStroke
G2L["58"] = Instance.new("UIStroke", G2L["57"]);
G2L["58"]["Thickness"] = 2;
G2L["58"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.AnimName.UIStroke.UIGradient
G2L["59"] = Instance.new("UIGradient", G2L["58"]);
G2L["59"]["Rotation"] = 90;
G2L["59"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Button
G2L["5a"] = Instance.new("TextButton", G2L["55"]);
G2L["5a"]["BorderSizePixel"] = 0;
G2L["5a"]["TextTransparency"] = 1;
G2L["5a"]["TextSize"] = 14;
G2L["5a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5a"]["ZIndex"] = 1999999999;
G2L["5a"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["5a"]["BackgroundTransparency"] = 1;
G2L["5a"]["Size"] = UDim2.new(0.99896, 0, 0.16673, 0);
G2L["5a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5a"]["Text"] = [[]];
G2L["5a"]["Name"] = [[Button]];
G2L["5a"]["Position"] = UDim2.new(-0, 0, 0.09044, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Button.LocalScript
G2L["5b"] = Instance.new("LocalScript", G2L["5a"]);



-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.UICorner
G2L["5c"] = Instance.new("UICorner", G2L["55"]);
G2L["5c"]["CornerRadius"] = UDim.new(0.1, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.UIStroke
G2L["5d"] = Instance.new("UIStroke", G2L["55"]);
G2L["5d"]["Thickness"] = 1.5;
G2L["5d"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["5d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.UIStroke.UIGradient
G2L["5e"] = Instance.new("UIGradient", G2L["5d"]);
G2L["5e"]["Rotation"] = 90;
G2L["5e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.AnimName
G2L["5f"] = Instance.new("TextLabel", G2L["55"]);
G2L["5f"]["TextWrapped"] = true;
G2L["5f"]["BorderSizePixel"] = 0;
G2L["5f"]["TextSize"] = 14;
G2L["5f"]["TextStrokeColor3"] = Color3.fromRGB(144, 144, 144);
G2L["5f"]["TextScaled"] = true;
G2L["5f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5f"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5f"]["BackgroundTransparency"] = 1;
G2L["5f"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["5f"]["Size"] = UDim2.new(0.96995, 0, 0.1701, 0);
G2L["5f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5f"]["Text"] = [[Insert items into the Weekly Boutique, and you can ACTUALLY buy them! (You cannot buy items with their price as 0)]];
G2L["5f"]["Name"] = [[AnimName]];
G2L["5f"]["Position"] = UDim2.new(0.0145, 0, 0.23193, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.AnimName.UIStroke
G2L["60"] = Instance.new("UIStroke", G2L["5f"]);
G2L["60"]["Thickness"] = 2;
G2L["60"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.AnimName.UIStroke.UIGradient
G2L["61"] = Instance.new("UIGradient", G2L["60"]);
G2L["61"]["Rotation"] = 90;
G2L["61"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items
G2L["62"] = Instance.new("Frame", G2L["55"]);
G2L["62"]["BorderSizePixel"] = 0;
G2L["62"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["62"]["Size"] = UDim2.new(0.99954, 0, 0.48693, 0);
G2L["62"]["Position"] = UDim2.new(0, 0, 0.35578, 0);
G2L["62"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["62"]["Name"] = [[Items]];
G2L["62"]["BackgroundTransparency"] = 1;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.UIListLayout
G2L["63"] = Instance.new("UIListLayout", G2L["62"]);
G2L["63"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["63"]["Padding"] = UDim.new(0.05, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.2
G2L["64"] = Instance.new("TextBox", G2L["62"]);
G2L["64"]["Name"] = [[2]];
G2L["64"]["PlaceholderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["64"]["BorderSizePixel"] = 0;
G2L["64"]["TextWrapped"] = true;
G2L["64"]["TextSize"] = 14;
G2L["64"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["64"]["TextScaled"] = true;
G2L["64"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["64"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["64"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["64"]["PlaceholderText"] = [[Sparkling Necklace]];
G2L["64"]["Size"] = UDim2.new(0.92542, 0, 0.25954, 0);
G2L["64"]["Position"] = UDim2.new(0.0339, 0, 0, 0);
G2L["64"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["64"]["Text"] = [[]];


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.2.UIGradient
G2L["65"] = Instance.new("UIGradient", G2L["64"]);
G2L["65"]["Rotation"] = 90;
G2L["65"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.2.UICorner
G2L["66"] = Instance.new("UICorner", G2L["64"]);
G2L["66"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.2.UIStroke
G2L["67"] = Instance.new("UIStroke", G2L["64"]);
G2L["67"]["Thickness"] = 1.5;
G2L["67"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["67"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.2.UIStroke.UIGradient
G2L["68"] = Instance.new("UIGradient", G2L["67"]);
G2L["68"]["Rotation"] = 90;
G2L["68"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.2.UIStroke
G2L["69"] = Instance.new("UIStroke", G2L["64"]);
G2L["69"]["Thickness"] = 2;
G2L["69"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.2.UIStroke.UIGradient
G2L["6a"] = Instance.new("UIGradient", G2L["69"]);
G2L["6a"]["Rotation"] = 90;
G2L["6a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.2.UITextSizeConstraint
G2L["6b"] = Instance.new("UITextSizeConstraint", G2L["64"]);
G2L["6b"]["MaxTextSize"] = 34;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.2.UIAspectRatioConstraint
G2L["6c"] = Instance.new("UIAspectRatioConstraint", G2L["64"]);
G2L["6c"]["AspectRatio"] = 8.02941;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.3
G2L["6d"] = Instance.new("TextBox", G2L["62"]);
G2L["6d"]["Name"] = [[3]];
G2L["6d"]["PlaceholderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6d"]["BorderSizePixel"] = 0;
G2L["6d"]["TextWrapped"] = true;
G2L["6d"]["TextSize"] = 14;
G2L["6d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6d"]["TextScaled"] = true;
G2L["6d"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["6d"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["6d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["6d"]["PlaceholderText"] = [[Sparkling Sleeve]];
G2L["6d"]["Size"] = UDim2.new(0.92542, 0, 0.25954, 0);
G2L["6d"]["Position"] = UDim2.new(0.0339, 0, 0, 0);
G2L["6d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6d"]["Text"] = [[]];


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.3.UIGradient
G2L["6e"] = Instance.new("UIGradient", G2L["6d"]);
G2L["6e"]["Rotation"] = 90;
G2L["6e"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.3.UICorner
G2L["6f"] = Instance.new("UICorner", G2L["6d"]);
G2L["6f"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.3.UIStroke
G2L["70"] = Instance.new("UIStroke", G2L["6d"]);
G2L["70"]["Thickness"] = 1.5;
G2L["70"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["70"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.3.UIStroke.UIGradient
G2L["71"] = Instance.new("UIGradient", G2L["70"]);
G2L["71"]["Rotation"] = 90;
G2L["71"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.3.UIStroke
G2L["72"] = Instance.new("UIStroke", G2L["6d"]);
G2L["72"]["Thickness"] = 2;
G2L["72"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.3.UIStroke.UIGradient
G2L["73"] = Instance.new("UIGradient", G2L["72"]);
G2L["73"]["Rotation"] = 90;
G2L["73"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.3.UITextSizeConstraint
G2L["74"] = Instance.new("UITextSizeConstraint", G2L["6d"]);
G2L["74"]["MaxTextSize"] = 34;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.3.UIAspectRatioConstraint
G2L["75"] = Instance.new("UIAspectRatioConstraint", G2L["6d"]);
G2L["75"]["AspectRatio"] = 8.02941;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.4
G2L["76"] = Instance.new("TextBox", G2L["62"]);
G2L["76"]["Name"] = [[4]];
G2L["76"]["PlaceholderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["76"]["BorderSizePixel"] = 0;
G2L["76"]["TextWrapped"] = true;
G2L["76"]["TextSize"] = 14;
G2L["76"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["76"]["TextScaled"] = true;
G2L["76"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["76"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["76"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["76"]["PlaceholderText"] = [[Sparkling Heels]];
G2L["76"]["Size"] = UDim2.new(0.92542, 0, 0.25954, 0);
G2L["76"]["Position"] = UDim2.new(0.0339, 0, 0, 0);
G2L["76"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["76"]["Text"] = [[]];


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.4.UIGradient
G2L["77"] = Instance.new("UIGradient", G2L["76"]);
G2L["77"]["Rotation"] = 90;
G2L["77"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.4.UICorner
G2L["78"] = Instance.new("UICorner", G2L["76"]);
G2L["78"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.4.UIStroke
G2L["79"] = Instance.new("UIStroke", G2L["76"]);
G2L["79"]["Thickness"] = 1.5;
G2L["79"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["79"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.4.UIStroke.UIGradient
G2L["7a"] = Instance.new("UIGradient", G2L["79"]);
G2L["7a"]["Rotation"] = 90;
G2L["7a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.4.UIStroke
G2L["7b"] = Instance.new("UIStroke", G2L["76"]);
G2L["7b"]["Thickness"] = 2;
G2L["7b"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.4.UIStroke.UIGradient
G2L["7c"] = Instance.new("UIGradient", G2L["7b"]);
G2L["7c"]["Rotation"] = 90;
G2L["7c"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.4.UITextSizeConstraint
G2L["7d"] = Instance.new("UITextSizeConstraint", G2L["76"]);
G2L["7d"]["MaxTextSize"] = 34;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.4.UIAspectRatioConstraint
G2L["7e"] = Instance.new("UIAspectRatioConstraint", G2L["76"]);
G2L["7e"]["AspectRatio"] = 8.02941;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.1
G2L["7f"] = Instance.new("TextBox", G2L["62"]);
G2L["7f"]["Name"] = [[1]];
G2L["7f"]["PlaceholderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7f"]["ZIndex"] = 0;
G2L["7f"]["BorderSizePixel"] = 0;
G2L["7f"]["TextWrapped"] = true;
G2L["7f"]["TextSize"] = 14;
G2L["7f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7f"]["TextScaled"] = true;
G2L["7f"]["BackgroundColor3"] = Color3.fromRGB(255, 84, 204);
G2L["7f"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["7f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["7f"]["PlaceholderText"] = [[Sparkling Dress]];
G2L["7f"]["Size"] = UDim2.new(0.92542, 0, 0.25954, 0);
G2L["7f"]["Position"] = UDim2.new(0.0339, 0, 0, 0);
G2L["7f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7f"]["Text"] = [[]];


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.1.UICorner
G2L["80"] = Instance.new("UICorner", G2L["7f"]);
G2L["80"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.1.UIStroke
G2L["81"] = Instance.new("UIStroke", G2L["7f"]);
G2L["81"]["Thickness"] = 1.5;
G2L["81"]["Color"] = Color3.fromRGB(255, 33, 215);
G2L["81"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.1.UIStroke.UIGradient
G2L["82"] = Instance.new("UIGradient", G2L["81"]);
G2L["82"]["Rotation"] = 90;
G2L["82"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.1.UIStroke
G2L["83"] = Instance.new("UIStroke", G2L["7f"]);
G2L["83"]["Thickness"] = 2;
G2L["83"]["Color"] = Color3.fromRGB(255, 115, 242);


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.1.UIStroke.UIGradient
G2L["84"] = Instance.new("UIGradient", G2L["83"]);
G2L["84"]["Rotation"] = 90;
G2L["84"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 118, 212))};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.1.UIGradient
G2L["85"] = Instance.new("UIGradient", G2L["7f"]);
G2L["85"]["Rotation"] = 90;
G2L["85"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.1.UITextSizeConstraint
G2L["86"] = Instance.new("UITextSizeConstraint", G2L["7f"]);
G2L["86"]["MaxTextSize"] = 34;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.1.UIAspectRatioConstraint
G2L["87"] = Instance.new("UIAspectRatioConstraint", G2L["7f"]);
G2L["87"]["AspectRatio"] = 8.02941;


-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Items.UIAspectRatioConstraint
G2L["88"] = Instance.new("UIAspectRatioConstraint", G2L["62"]);
G2L["88"]["AspectRatio"] = 2.25191;


-- StarterGui.Easea.Easea.UIAspectRatioConstraint
G2L["89"] = Instance.new("UIAspectRatioConstraint", G2L["2"]);
G2L["89"]["AspectRatio"] = 0.58045;


-- StarterGui.Easea.Easea.ScrollingFrame.Boutique.Button.LocalScript
local function C_1a()
local script = G2L["1a"];
	script.Parent.MouseButton1Click:Connect(function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/easea-exploits/boutiqueFarm/refs/heads/main/boutique_Farm.lua"))()	
		notifCont:Notify("The script has loaded. Please don't click it again to prevent bugs!")
		newComputer_Click:Play()
	end)
end;
task.spawn(C_1a);
-- StarterGui.Easea.Easea.ScrollingFrame.V26Hair.Button.LocalScript
local function C_27()
local script = G2L["27"];
	script.Parent.MouseButton1Click:Connect(function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/easea-exploits/hairV26-DailyLogin/refs/heads/main/DL_Hair%20(V26%20Hair%20Long%20Waves).lua"))()
		notifCont:Notify("The script has loaded. Please don't click it again to prevent bugs!")
		newComputer_Click:Play()
	end)
end;
task.spawn(C_27);
-- StarterGui.Easea.Easea.ScrollingFrame.FashionGoddess.Button.LocalScript
local function C_34()
local script = G2L["34"];
	script.Parent.MouseButton1Click:Connect(function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/easea-exploits/rankSpoof-FashionGoddess/refs/heads/main/RS_FashionGoddess.lua"))()
		notifCont:Notify("The script has loaded. Please don't click it again to prevent bugs!")
		newComputer_Click:Play()
	end)
end;
task.spawn(C_34);
-- StarterGui.Easea.Easea.ScrollingFrame.Poses.Button.LocalScript
local function C_41()
local script = G2L["41"];
	script.Parent.MouseButton1Click:Connect(function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/easea-exploits/emotes/refs/heads/main/allemotes.lua"))()	
		notifCont:Notify("The script has loaded. Please don't click it again to prevent bugs!")
		newComputer_Click:Play()
	end)
end;
task.spawn(C_41);
-- StarterGui.Easea.Easea.ScrollingFrame.giftSpoof.Button.LocalScript
local function C_4e()
local script = G2L["4e"];
	script.Parent.MouseButton1Click:Connect(function() 
		loadstring(game:HttpGet("https://raw.githubusercontent.com/easea-exploits/localGifting/refs/heads/main/giftSpoofing.lua"))()
		notifCont:Notify("The script has loaded. Please don't click it again to prevent bugs!")
		newComputer_Click:Play()
	end)
end;
task.spawn(C_4e);
-- StarterGui.Easea.Easea.ScrollingFrame.customBoutique.Button.LocalScript
local function C_5b()
local script = G2L["5b"];
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
task.spawn(C_5b);

button.MouseButton1Click:Connect(function()
    G2L["1"].Enabled = not G2L["1"].Enabled
end)

return G2L["1"], require;

