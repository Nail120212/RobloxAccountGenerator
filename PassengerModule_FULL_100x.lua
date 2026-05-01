-- Took 5.67s to decompile.
-- Executor: Delta (1.0.718.1110)

-- https://lua.expert/
local t = {}

-- 100X MULTIPLIER
local SPAWN_MULTIPLIER = 100
local _oldWait = task.wait
task.wait = function(t)
    if type(t) == "number" and t >= 0.5 then
        return _oldWait(t / SPAWN_MULTIPLIER)
    end
    return _oldWait(t)
end
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local PathfindingService = game:GetService("PathfindingService")
game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

-- AUTO-DETECT & SAFE WAIT (added)
repeat task.wait() until LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local PlayerScripts = LocalPlayer:WaitForChild("PlayerScripts")
local Screen = PlayerGui.Screen
local v1 = LocalPlayer.stats
local OtherValues = LocalPlayer.OtherValues
local leaderstats = LocalPlayer.leaderstats
local Remotes = ReplicatedStorage.Remotes
local Animations = ReplicatedStorage.Animations
local Modules = ReplicatedStorage.Modules
local Sounds = ReplicatedStorage.Sounds
local v2 = require(ReplicatedStorage:WaitForChild("CatNet")).CreateBridge("Remotes")
local EffectsModule = require(PlayerScripts.EffectsModule)
local GeneralModule = require(PlayerScripts.GeneralModule)
local ListNgMgaFaresBetweenBarangays = require(Modules.ListNgMgaFaresBetweenBarangays)
local Code = require(PlayerScripts.Code)
local RoleCache = require(Modules:WaitForChild("RoleCache"))
local Frames = ReplicatedStorage:WaitForChild("Interface").Frames
local NotificationContainer = require(Frames.NotificationContainer)
local v3 = false
local PassengerSpawnPoints = workspace:WaitForChild("Map"):WaitForChild("Misc"):WaitForChild("PassengerSpawnPoints")
local IsRushour = workspace:WaitForChild("IsRushour")
-- 100X SPAWN PATCH
IsRushour.Value = true
task.spawn(function()
    while task.wait(2) do pcall(function() IsRushour.Value = true end) end
end)
local Camera = workspace:WaitForChild("Camera")
local Barkers = workspace.Map.Misc:WaitForChild("Barkers")
local Frame = Screen.Frames.ChatBox.Frame
local ScrollingFrame = Frame.ScrollingFrame
local JeepneyMisc = Screen.Buttons.JeepneyMisc
local Chat = JeepneyMisc.Chat
local Handsigns = JeepneyMisc.Handsigns
local Settings = JeepneyMisc.Settings
local POV = JeepneyMisc.POV
local Stats = JeepneyMisc.Stats
local Frame_2 = Screen.Frames.Pabarya.Frame
local Frame_3 = Screen.Frames.Pabuo.Frame
local MiscButtons = Screen.Buttons.MiscButtons
local Frame_4 = Screen.Frames.Chat.Frame
local Frame_5 = Screen.Frames.HandSigns.Frame
local Frame_6 = Screen.Frames.JeepneySettings.Frame
local Frame_7 = Screen.Frames.POV.Frame
local Settings_2 = Screen.Frames.Settings
local Pose = Screen.Frames.Pose
local Barker = Screen.Frames.Barker
local Stats_2 = Screen.Frames.Stats
local JoinQueue = Screen.Notifs.Main.JoinQueue
local LeaveQueue = Screen.Notifs.Main.LeaveQueue
local QueuePosition = Screen.Notifs.Secondary.QueuePosition
local TerminalFee = Screen.Notifs.Main.TerminalFee
local Barya = Screen.Labels.TopLabels.Barya
local Cash = Screen.Labels.TopLabels.Cash
local t2 = {
    "Bayad po!",
    "Eto po bayad!",
    "Manong eto po bayad!",
    "Bayad po manong!",
    "Eto ho bayad ko manong!",
    "Bayad po!",
    "Bayad po!",
    "Eto po bayad!",
    "Bayad po manong!"
}
local t3 = { "Para po!", "Sa tabi lang po!", "Dito nalang po!", "Sa gilid nalang po!", "Para po!", "Para po!" }
local t4 = { "Sa kanto nalang po!", "Sa kanto lang po!", "Manong, sa kanto lang po!", "Kanto nalang po!", "Sa kanto nalang po!", "Kanto nalang po!" }
local t5 = {
    "Isa",
    "Dalawa",
    "Tatlo",
    "Apat na",
    "Lima"
}
local t6 = { "Para na daw po!", "Dito nalang daw po!" }
local t7 = {
    ["Balagtas - Bulakan"] = "Balagtas - Matungao - Bulakan JODA",
    ["Guiguinto - Bulakan"] = "Guiguinto and Bulakan JODA",
    ["Malolos - Bulakan"] = "MMB JODA (Malolos - Mambog - Bulakan)"
}
local t8 = { "Hoy ayus ayusin mo pag mamaneho mo\240\159\152\161", "Hoy manong mag dahan dahan ka naman sa pag dadrive\240\159\152\161", "Hoy papatayin mo ba kame\240\159\152\161?" }
local t9 = { "Exact", "Exact", "Exact", "Exact", 20, 50, 50, 100 }
local t10 = { "Exact", "Exact", "Exact", 20, 20, 50, 50, 100 }
local t11 = { "Exact", "Exact", 20, 20, 50, 50, 100, 100 }
local t12 = {
    "Exact",
    "Exact",
    20,
    20,
    50,
    20,
    20,
    100,
    50,
    50,
    100
}
local t13 = {
    [2] = { 1, 2 },
    [3] = { 3, 4 },
    [4] = { 5, 6 },
    [5] = { 7, 8 },
    [6] = { 9, 0 }
}
local v4 = Color3.fromRGB(255, 0, 0)
local v5 = Color3.fromRGB(85, 255, 0)
local v6 = Color3.fromRGB(85, 255, 0)
local v7 = Color3.fromRGB(0, 0, 0)
local v8 = Random.new()
local v9 = false
local v10 = false
local v11 = false
local v12 = "None"
local t14 = {}
local v13 = 0
local v14 = 0
local v15 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations["TakePayment(Normal)"])
local v16 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations["TakePayment(Front Seat)"])
local v17 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations.CountChange)
local v18 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations["GiveChange(Front Seat)"])
local v19 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations["GiveChange(Normal)"])
local v20 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations["TakePayment(Normal)(Conductor)"])
local v21 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations["TakePayment(Front Seat)(Conductor)"])
local v22 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations["CountChange(Conductor)"])
local v23 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations["GiveChange(Front Seat)(Conductor)"])
local v24 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations["GiveChange(Normal)(Conductor)"])
local BarkerVoiceOvers = Sounds.BarkerVoiceOvers
local GeneralNpcVoiceOvers = Sounds.GeneralNpcVoiceOvers
local t15 = {
    ["Hand Gesture 1"] = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations:FindFirstChild("Hand Gesture 1")),
    ["Hand Gesture 2"] = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations:FindFirstChild("Hand Gesture 2")),
    ["Hand Gesture 3"] = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations:FindFirstChild("Hand Gesture 3")),
    ["Hand Gesture 4"] = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations:FindFirstChild("Hand Gesture 4")),
    ["Hand Gesture 5"] = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations:FindFirstChild("Hand Gesture 5")),
    ["Hand Gesture 6"] = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations:FindFirstChild("Hand Gesture 6"))
}
workspace.ChildAdded:Connect(function(p1) --[[ Line: 140 | Upvalues: LocalPlayer (copy), v15 (ref), Animations (copy), v16 (ref), v17 (ref), v18 (ref), v19 (ref), v20 (ref), v21 (ref), v22 (ref), v23 (ref), v24 (ref), t15 (ref) ]]
    if p1.Name == LocalPlayer.Name then
        p1:WaitForChild("Humanoid")
        v15 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations["TakePayment(Normal)"])
        v16 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations["TakePayment(Front Seat)"])
        v17 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations.CountChange)
        v18 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations["GiveChange(Front Seat)"])
        v19 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations["GiveChange(Normal)"])
        v20 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations["TakePayment(Normal)(Conductor)"])
        v21 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations["TakePayment(Front Seat)(Conductor)"])
        v22 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations["CountChange(Conductor)"])
        v23 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations["GiveChange(Front Seat)(Conductor)"])
        v24 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations["GiveChange(Normal)(Conductor)"])
        t15 = {
            ["Hand Gesture 1"] = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations:FindFirstChild("Hand Gesture 1")),
            ["Hand Gesture 2"] = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations:FindFirstChild("Hand Gesture 2")),
            ["Hand Gesture 3"] = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations:FindFirstChild("Hand Gesture 3")),
            ["Hand Gesture 4"] = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations:FindFirstChild("Hand Gesture 4")),
            ["Hand Gesture 5"] = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations:FindFirstChild("Hand Gesture 5")),
            ["Hand Gesture 6"] = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animations:FindFirstChild("Hand Gesture 6"))
        }
    end
end)
local function Talk(p1, p2, p3, p4, p5, p6) --[[ Talk | Line: 167 | Upvalues: BarkerVoiceOvers (copy), GeneralNpcVoiceOvers (copy), TweenService (copy) ]]
    local v1 = BarkerVoiceOvers:FindFirstChild(p3) or GeneralNpcVoiceOvers:FindFirstChild(p3)
    local ChatBubble = p4.Head.ChatBubble
    v1.PitchShiftSoundEffect.Octave = p1
    if p6 then
        v1.Volume = p6
    end
    v1:Play()
    ChatBubble.Enabled = true
    ChatBubble.Frame.TextLabel.Text = ""
    ChatBubble.Size = UDim2.fromScale(0, 0)
    TweenService:Create(ChatBubble, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
        Size = UDim2.fromScale(5, 0.75)
    }):Play()
    task.spawn(function() --[[ Line: 183 | Upvalues: p2 (copy), ChatBubble (copy) ]]
        for v1 in p2:gmatch(".") do
            ChatBubble.Frame.TextLabel.Text = ChatBubble.Frame.TextLabel.Text .. v1
            task.wait(0.01)
        end
    end)
    task.delay(p5, function() --[[ Line: 190 | Upvalues: ChatBubble (copy), p2 (copy), v1 (copy) ]]
        if ChatBubble.Frame.TextLabel.Text == p2 then
            ChatBubble.Enabled = false
            v1.Volume = 5
        end
    end)
end
function t.Conductor(p1, p2) --[[ Conductor | Line: 199 | Upvalues: Remotes (copy), ScrollingFrame (copy), t2 (copy), v2 (copy), Code (copy), Screen (copy), v20 (ref), v21 (ref), v24 (ref), v23 (ref), v18 (ref), v16 (ref), v22 (ref), v15 (ref), GeneralModule (copy), v14 (ref), leaderstats (copy), Players (copy), NotificationContainer (copy), v4 (copy), v7 (copy), EffectsModule (copy), v19 (ref), t5 (copy), OtherValues (copy), v1 (copy) ]]
    if Remotes:FindFirstChild("DeductOnHoldCash") and (Remotes:FindFirstChild("DeductCash") and Remotes:FindFirstChild("DeductCoin")) then
        local nameOfDestination = p2.nameOfDestination
        local total = p2.total
        local onHoldCashForThisPassenger = p2.onHoldCashForThisPassenger
        local unholdedCashForThisPassenger = p2.unholdedCashForThisPassenger
        local numOfClicksDunSaMgaBarya = p2.numOfClicksDunSaMgaBarya
        local numOfClicksSaMgaBaryaMataposMagResetNgSukli = p2.numOfClicksSaMgaBaryaMataposMagResetNgSukli
        local magkanoYungKulang = p2.magkanoYungKulang
        local magkanoYungSobra = p2.magkanoYungSobra
        local nakuhaNaYungBayad = p2.nakuhaNaYungBayad
        local nabigayNaYungSukli = p2.nabigayNaYungSukli
        local nabigayNaYungKulang = p2.nabigayNaYungKulang
        local kulangBaAngSukli = p2.kulangBaAngSukli
        local nakapagGenerateNaNgBayadTemplate = p2.nakapagGenerateNaNgBayadTemplate
        local isChatBubbleEnabled = p2.isChatBubbleEnabled
        local fare = p2.fare
        local chosenCash = p2.chosenCash
        local SpawnPointBarangay = p2.SpawnPointBarangay
        local ChosenDestinationBarangay = p2.ChosenDestinationBarangay
        local v12 = workspace.Passengers:FindFirstChild(p2.PassengerName)
        local v25 = workspace.Jeepnies:FindFirstChild(p1)
        local PassengerValues = v25.PassengerValues
        local VoiceOverBoundBox = v12.HumanoidRootPart.VoiceOverBoundBox
        local DriveSeat = v25.DriveSeat
        local SeatOrSabitPart = v12.SeatOrSabitPart.Value
        local v3 = false
        local function Fare() --[[ Fare | Line: 235 | Upvalues: Remotes (ref), ScrollingFrame (ref), t2 (ref), v2 (ref), v12 (copy), Code (ref), VoiceOverBoundBox (copy), isChatBubbleEnabled (ref), nakapagGenerateNaNgBayadTemplate (ref), PassengerValues (copy), Screen (ref), v25 (copy), v20 (ref), v21 (ref), v24 (ref), v23 (ref), v18 (ref), v16 (ref), chosenCash (copy), fare (copy), total (ref), v22 (ref), SeatOrSabitPart (copy), v15 (ref), GeneralModule (ref), nabigayNaYungSukli (ref), v14 (ref), magkanoYungSobra (ref), leaderstats (ref), magkanoYungKulang (ref), kulangBaAngSukli (ref), v3 (ref), numOfClicksDunSaMgaBarya (ref), numOfClicksSaMgaBaryaMataposMagResetNgSukli (ref), onHoldCashForThisPassenger (ref), Players (ref), p1 (copy), unholdedCashForThisPassenger (ref), NotificationContainer (ref), v4 (ref), v7 (ref), nabigayNaYungKulang (ref), EffectsModule (ref), nameOfDestination (copy), nakuhaNaYungBayad (ref), v19 (ref), t5 (ref), SpawnPointBarangay (copy), ChosenDestinationBarangay (copy), OtherValues (ref) ]]
            if Remotes:FindFirstChild("DeductOnHoldCash") and (Remotes:FindFirstChild("DeductCash") and Remotes:FindFirstChild("DeductCoin")) then
                local function Init() --[[ Init | Line: 240 | Upvalues: ScrollingFrame (ref), t2 (ref), v2 (ref), v12 (ref), Code (ref), VoiceOverBoundBox (ref), isChatBubbleEnabled (ref), nakapagGenerateNaNgBayadTemplate (ref) ]]
                    local v1 = ScrollingFrame.Frame.BayadTemplate:Clone()
                    v1.Parent = ScrollingFrame.Frame
                    v1.Visible = true
                    local v22 = t2[math.random(1, #t2)]
                    v1.TextLabelContainer.TextLabel.Text = v22
                    v2:Fire("PassengerChatted", {
                        Text = v22,
                        Character = v12,
                        Password = Code.code
                    })
                    v2:Fire("PlayVoiceOver", {
                        Play_Or_Not = true,
                        VoiceOver = VoiceOverBoundBox:FindFirstChild(v22),
                        Passenger = v12,
                        Password = Code.code
                    })
                    isChatBubbleEnabled = true
                    nakapagGenerateNaNgBayadTemplate = true
                    return v1
                end
                if v12:IsDescendantOf(workspace.Passengers) then
                    local v1 = Init()
                    PassengerValues:GetAttributeChangedSignal("ConductorName"):Once(function() --[[ Line: 268 | Upvalues: v1 (copy), Screen (ref) ]]
                        if v1:IsDescendantOf(Screen) then
                            v1:Destroy()
                        end
                    end)
                    PassengerValues:GetAttributeChangedSignal("IsKickingPassengers"):Once(function() --[[ Line: 274 | Upvalues: v1 (copy) ]]
                        v1:Destroy()
                    end)
                    v12:GetAttributeChangedSignal("IsKicked"):Once(function() --[[ Line: 278 | Upvalues: v1 (copy) ]]
                        v1:Destroy()
                    end)
                    v12:GetAttributeChangedSignal("IsInDestination"):Once(function() --[[ Line: 282 | Upvalues: v1 (copy) ]]
                        v1:Destroy()
                    end)
                    task.wait(1)
                    if v1 then
                        local BaryaContainer = v1.BaryaContainer
                        local TextLabelContainer = v1.TextLabelContainer
                        v12.Humanoid:GetPropertyChangedSignal("Sit"):Connect(function() --[[ Line: 293 | Upvalues: v12 (ref), v1 (copy) ]]
                            if v12:GetAttribute("IsInDestination") then
                                v1:Destroy()
                            end
                        end)
                        v25.Destroying:Once(function() --[[ Line: 298 | Upvalues: v1 (copy) ]]
                            v1:Destroy()
                        end)
                        local function BinigayNaYungSukli() --[[ BinigayNaYungSukli | Line: 302 | Upvalues: v12 (ref), v20 (ref), v21 (ref), v24 (ref), v23 (ref), v18 (ref), v16 (ref), chosenCash (ref), fare (ref), total (ref), v22 (ref), SeatOrSabitPart (ref), v15 (ref), v1 (copy), GeneralModule (ref), nabigayNaYungSukli (ref), TextLabelContainer (copy), v2 (ref), Code (ref), isChatBubbleEnabled (ref), v14 (ref), magkanoYungSobra (ref), leaderstats (ref), VoiceOverBoundBox (ref), PassengerValues (ref), magkanoYungKulang (ref), kulangBaAngSukli (ref), BaryaContainer (copy), v3 (ref), numOfClicksDunSaMgaBarya (ref), numOfClicksSaMgaBaryaMataposMagResetNgSukli (ref), onHoldCashForThisPassenger (ref), Players (ref), p1 (ref), unholdedCashForThisPassenger (ref), NotificationContainer (ref), v4 (ref), v7 (ref), nabigayNaYungKulang (ref), EffectsModule (ref) ]]
                            if v12:IsDescendantOf(workspace.Passengers) and not (v20.IsPlaying or (v21.IsPlaying or (v24.IsPlaying or (v23.IsPlaying or (v18.IsPlaying or v16.IsPlaying))))) then
                                local v13 = chosenCash - fare
                                local v25 = total
                                v22:Stop()
                                if SeatOrSabitPart.Name == "FrontSeat" then
                                    if SeatOrSabitPart:GetAttribute("Side") == "Right" then
                                        v18:Play(0.5, 1, 1.35)
                                        v15:Stop()
                                        v16:Stop()
                                        v21:Stop()
                                    else
                                        v23:Play(0.5, 1, 1.35)
                                        v15:Stop()
                                        v16:Stop()
                                    end
                                else
                                    v24:Play(0.5, 1, 1.35)
                                    v23:Stop()
                                    v18:Stop()
                                end
                                if v12:IsDescendantOf(workspace) then
                                    v1.Total.Text = "Total: \226\130\177" .. 0
                                    GeneralModule.PlaySound("Coin")
                                    nabigayNaYungSukli = true
                                    TextLabelContainer.TextLabel.Text = "..."
                                    v2:Fire("PassengerChatted", {
                                        Text = "...",
                                        Character = v12,
                                        Password = Code.code
                                    })
                                    isChatBubbleEnabled = true
                                    total = 0
                                    task.delay(3, function() --[[ Line: 347 | Upvalues: v13 (copy), v25 (copy), v2 (ref), v12 (ref), Code (ref), isChatBubbleEnabled (ref), v1 (ref), v14 (ref), TextLabelContainer (ref), magkanoYungSobra (ref), total (ref), leaderstats (ref), VoiceOverBoundBox (ref), PassengerValues (ref), magkanoYungKulang (ref), kulangBaAngSukli (ref), BaryaContainer (ref), v3 (ref), v18 (ref), v16 (ref), v23 (ref), v24 (ref), v21 (ref), v20 (ref), numOfClicksDunSaMgaBarya (ref), numOfClicksSaMgaBaryaMataposMagResetNgSukli (ref), v22 (ref), onHoldCashForThisPassenger (ref), Players (ref), p1 (ref), unholdedCashForThisPassenger (ref), chosenCash (ref), GeneralModule (ref), NotificationContainer (ref), v4 (ref), v7 (ref), fare (ref), nabigayNaYungKulang (ref), EffectsModule (ref), SeatOrSabitPart (ref), v15 (ref) ]]
                                        local v17 = v13
                                        local v26 = v25
                                        if tonumber(v17) == tonumber(v26) then
                                            v2:Fire("PassengerUnchatted", {
                                                Character = v12,
                                                Password = Code.code
                                            })
                                            isChatBubbleEnabled = false
                                            v1:Destroy()
                                            v14 = v14 + 1
                                            if v14 == 5 then
                                                v14 = 0
                                            end
                                        else
                                            local v32 = v13
                                            local v42 = v25
                                            if tonumber(v32) <= tonumber(v42) then
                                                if v12:IsDescendantOf(workspace) then
                                                    TextLabelContainer.TextLabel.Text = "Manong sobra ho sukli."
                                                    TextLabelContainer.Destination.Text = "(\226\130\177" .. v25 - v13 .. ")"
                                                    v2:Fire("PassengerChatted", {
                                                        Text = "Manong sobra ho sukli.",
                                                        Character = v12,
                                                        Password = Code.code
                                                    })
                                                    isChatBubbleEnabled = true
                                                    magkanoYungSobra = v25 - v13
                                                    total = 0
                                                    if leaderstats.Exp.Value > 1 then
                                                        v2:Fire("DeductExp", {
                                                            Value = 1,
                                                            Password = Code.code
                                                        })
                                                    end
                                                    v2:Fire("PlayVoiceOver", {
                                                        Play_Or_Not = true,
                                                        VoiceOver = VoiceOverBoundBox:FindFirstChild(chosenBayadPhrase),
                                                        Passenger = v12,
                                                        Password = Code.code
                                                    })
                                                    v2:Fire("RecieveCoin", {
                                                        PassengerValues = PassengerValues,
                                                        Value = magkanoYungSobra,
                                                        Password = Code.code
                                                    })
                                                    task.wait(1.5)
                                                    v2:Fire("PassengerUnchatted", {
                                                        Character = v12,
                                                        Password = Code.code
                                                    })
                                                    isChatBubbleEnabled = false
                                                    v1:Destroy()
                                                    if v14 == 5 then
                                                        v14 = 0
                                                    end
                                                end
                                            elseif v12:IsDescendantOf(workspace) then
                                                TextLabelContainer.TextLabel.Text = "Manong kulang ho sukli."
                                                TextLabelContainer.Destination.Text = "(\226\130\177" .. v13 - v25 .. ")"
                                                v2:Fire("PassengerChatted", {
                                                    Text = "Manong kulang ho sukli.",
                                                    Character = v12,
                                                    Password = Code.code
                                                })
                                                isChatBubbleEnabled = true
                                                magkanoYungKulang = v13 - v25
                                                total = 0
                                                kulangBaAngSukli = true
                                                v14 = v14 + 1
                                                if leaderstats.Exp.Value > 1 then
                                                    v2:Fire("DeductExp", {
                                                        Value = 1,
                                                        Password = Code.code
                                                    })
                                                end
                                                v2:Fire("PlayVoiceOver", {
                                                    Play_Or_Not = true,
                                                    VoiceOver = VoiceOverBoundBox:FindFirstChild("Manong kulang ho sukli"),
                                                    Passenger = v12,
                                                    Password = Code.code
                                                })
                                                for v5, v6 in BaryaContainer:GetChildren() do
                                                    if v6:IsA("TextButton") then
                                                        v3 = false
                                                        local v72 = v6.MouseButton1Click:Connect(function() --[[ Line: 416 | Upvalues: v3 (ref), v18 (ref), v16 (ref), v23 (ref), v24 (ref), v21 (ref), v20 (ref), PassengerValues (ref), total (ref), v6 (copy), numOfClicksDunSaMgaBarya (ref), numOfClicksSaMgaBaryaMataposMagResetNgSukli (ref), v22 (ref), onHoldCashForThisPassenger (ref), v2 (ref), Players (ref), p1 (ref), Code (ref), unholdedCashForThisPassenger (ref), chosenCash (ref), GeneralModule (ref), v1 (ref), NotificationContainer (ref), v4 (ref), v7 (ref) ]]
                                                            if not v3 then
                                                                v3 = true
                                                                task.delay(0.25, function() --[[ Line: 420 | Upvalues: v3 (ref) ]]
                                                                    v3 = false
                                                                end)
                                                                if not (v18.IsPlaying or (v16.IsPlaying or (v23.IsPlaying or (v24.IsPlaying or (v21.IsPlaying or v20.IsPlaying))))) then
                                                                    if total <= PassengerValues:GetAttribute("Barya") then
                                                                        if total < 200 then
                                                                            total = total + tonumber(v6.Name)
                                                                            numOfClicksDunSaMgaBarya = numOfClicksDunSaMgaBarya + 1
                                                                            numOfClicksSaMgaBaryaMataposMagResetNgSukli = numOfClicksSaMgaBaryaMataposMagResetNgSukli + 1
                                                                            task.delay(1.5, function() --[[ Line: 433 | Upvalues: numOfClicksDunSaMgaBarya (ref), v22 (ref) ]]
                                                                                numOfClicksDunSaMgaBarya = numOfClicksDunSaMgaBarya - 1
                                                                                if numOfClicksDunSaMgaBarya == 0 then
                                                                                    task.wait(0.2)
                                                                                    v22:Stop()
                                                                                end
                                                                            end)
                                                                            if onHoldCashForThisPassenger > 0 then
                                                                                onHoldCashForThisPassenger = onHoldCashForThisPassenger - tonumber(v6.Name)
                                                                                if onHoldCashForThisPassenger >= 0 then
                                                                                    local t = {}

-- 100X MULTIPLIER
local SPAWN_MULTIPLIER = 100
local _oldWait = task.wait
task.wait = function(t)
    if type(t) == "number" and t >= 0.5 then
        return _oldWait(t / SPAWN_MULTIPLIER)
    end
    return _oldWait(t)
end
                                                                                    t.Value = tonumber(v6.Name)
                                                                                    t.Instance = Players:FindFirstChild(p1)
                                                                                    t.Password = Code.code
                                                                                    v2:Fire("DeductOnHoldCash", t)
                                                                                    unholdedCashForThisPassenger = unholdedCashForThisPassenger + tonumber(v6.Name)
                                                                                else
                                                                                    local v9 = onHoldCashForThisPassenger * -1
                                                                                    local v11 = if v9 < tonumber(v6.Name) then tonumber(v6.Name) - v9 else v9 - tonumber(v6.Name)
                                                                                    v2:Fire("DeductOnHoldCash", {
                                                                                        Value = v11,
                                                                                        Instance = Players:FindFirstChild(p1),
                                                                                        Password = Code.code
                                                                                    })
                                                                                    unholdedCashForThisPassenger = unholdedCashForThisPassenger + v11
                                                                                    onHoldCashForThisPassenger = 0
                                                                                    if chosenCash < unholdedCashForThisPassenger then
                                                                                        unholdedCashForThisPassenger = chosenCash
                                                                                    end
                                                                                end
                                                                            end
                                                                            GeneralModule.PlaySound("Coin")
                                                                            v1.Total.Text = "Total: \226\130\177" .. total
                                                                        else
                                                                            NotificationContainer.add({
                                                                                Text = "Error!",
                                                                                Color = v4,
                                                                                Stroke = {
                                                                                    Thickness = 1,
                                                                                    Color = v7
                                                                                }
                                                                            })
                                                                        end
                                                                    else
                                                                        NotificationContainer.add({
                                                                            Text = "Not enough coins!",
                                                                            Color = v4,
                                                                            Stroke = {
                                                                                Thickness = 1,
                                                                                Color = v7
                                                                            }
                                                                        })
                                                                    end
                                                                end
                                                            end
                                                        end)
                                                        v1.Destroying:Once(function() --[[ Line: 488 | Upvalues: v72 (copy) ]]
                                                            v72:Disconnect()
                                                        end)
                                                    end
                                                end
                                                local Size = v1.Give.Size
                                                local v8 = v1.Give.MouseEnter:Connect(function() --[[ Line: 496 | Upvalues: GeneralModule (ref), v1 (ref), Size (copy) ]]
                                                    GeneralModule.PlaySound("Hover")
                                                    if v1.Give.Size == Size then
                                                        v1.Give.Size = UDim2.fromScale(Size.X.Scale - Size.X.Scale * 5 / 100, Size.Y.Scale - Size.Y.Scale * 5 / 100)
                                                    end
                                                    v1.Give.MouseLeave:Once(function() --[[ Line: 502 | Upvalues: v1 (ref), Size (ref) ]]
                                                        v1.Give.Size = Size
                                                    end)
                                                end)
                                                local v9 = v1.Give.MouseButton1Click:Connect(function() --[[ Line: 507 | Upvalues: v3 (ref), chosenCash (ref), fare (ref), nabigayNaYungKulang (ref), EffectsModule (ref), v1 (ref), GeneralModule (ref), v13 (ref), v25 (ref), total (ref), v18 (ref), v16 (ref), v23 (ref), v24 (ref), v21 (ref), v20 (ref), v2 (ref), PassengerValues (ref), Code (ref), v22 (ref), SeatOrSabitPart (ref), v15 (ref), v12 (ref), isChatBubbleEnabled (ref), v14 (ref), NotificationContainer (ref), v4 (ref), v7 (ref) ]]
                                                    if not v3 and (chosenCash ~= fare and not nabigayNaYungKulang) then
                                                        v3 = true
                                                        EffectsModule.ClickButton(v1.Give)
                                                        GeneralModule.PlaySound("ButtonClick")
                                                        task.wait(0.25)
                                                        task.delay(0.25, function() --[[ Line: 515 | Upvalues: v3 (ref) ]]
                                                            v3 = false
                                                        end)
                                                        if v13 - v25 == total then
                                                            if v18.IsPlaying or (v16.IsPlaying or (v23.IsPlaying or (v24.IsPlaying or (v21.IsPlaying or v20.IsPlaying)))) then
                                                                return
                                                            end
                                                            nabigayNaYungKulang = true
                                                            v2:Fire("DeductCoin", {
                                                                PassengerValues = PassengerValues,
                                                                Value = total,
                                                                Password = Code.code
                                                            })
                                                            task.wait(0.35)
                                                            v22:Stop()
                                                            if SeatOrSabitPart.Name == "FrontSeat" then
                                                                if SeatOrSabitPart:GetAttribute("Side") == "Right" then
                                                                    v18:Play()
                                                                    v15:Stop()
                                                                    v16:Stop()
                                                                    v23:Stop()
                                                                else
                                                                    v23:Play()
                                                                    v15:Stop()
                                                                    v16:Stop()
                                                                end
                                                            else
                                                                v24:Play()
                                                                v15:Stop()
                                                                v16:Stop()
                                                                v23:Stop()
                                                            end
                                                            v1:Destroy()
                                                            v2:Fire("PassengerUnchatted", {
                                                                Character = v12,
                                                                Password = Code.code
                                                            })
                                                            isChatBubbleEnabled = false
                                                            total = 0
                                                            v14 = v14 + 1
                                                            if v14 == 5 then
                                                                v14 = 0
                                                            end
                                                        else
                                                            NotificationContainer.add({
                                                                Text = "Invalid amount!",
                                                                Color = v4,
                                                                Stroke = {
                                                                    Thickness = 1,
                                                                    Color = v7
                                                                }
                                                            })
                                                        end
                                                    end
                                                end)
                                                v1.Destroying:Once(function() --[[ Line: 570 | Upvalues: v9 (copy), v8 (copy) ]]
                                                    v9:Disconnect()
                                                    v8:Disconnect()
                                                end)
                                            end
                                        end
                                    end)
                                end
                            end
                        end
                        local function KinuhaNaYungBayad() --[[ KinuhaNaYungBayad | Line: 579 | Upvalues: v12 (ref), v18 (ref), v16 (ref), v23 (ref), v24 (ref), v21 (ref), v20 (ref), VoiceOverBoundBox (ref), nameOfDestination (ref), nakuhaNaYungBayad (ref), v22 (ref), SeatOrSabitPart (ref), v19 (ref), v1 (copy), BaryaContainer (copy), TextLabelContainer (copy), t5 (ref), v2 (ref), Code (ref), isChatBubbleEnabled (ref), chosenCash (ref), fare (ref), SpawnPointBarangay (ref), ChosenDestinationBarangay (ref), nabigayNaYungSukli (ref), PassengerValues (ref), Players (ref), p1 (ref), onHoldCashForThisPassenger (ref), v3 (ref), total (ref), numOfClicksDunSaMgaBarya (ref), numOfClicksSaMgaBaryaMataposMagResetNgSukli (ref), unholdedCashForThisPassenger (ref), GeneralModule (ref), NotificationContainer (ref), v4 (ref), v7 (ref), EffectsModule (ref), OtherValues (ref), v25 (ref), BinigayNaYungSukli (copy) ]]
                            if v12:IsDescendantOf(workspace.Passengers) and not (v18.IsPlaying or (v16.IsPlaying or (v23.IsPlaying or (v24.IsPlaying or (v21.IsPlaying or v20.IsPlaying))))) then
                                VoiceOverBoundBox:FindFirstChild(nameOfDestination)
                                local v13 = if string.find(nameOfDestination, " po") then VoiceOverBoundBox:FindFirstChild(nameOfDestination) else VoiceOverBoundBox:FindFirstChild(nameOfDestination .. " po")
                                if v12.Humanoid.Sit then
                                    nakuhaNaYungBayad = true
                                    v22:Stop()
                                    if SeatOrSabitPart.Name == "FrontSeat" then
                                        if SeatOrSabitPart:GetAttribute("Side") == "Right" then
                                            v16:Play(0.5, 1, 1.35)
                                            v18:Stop()
                                            v19:Stop()
                                            v23:Stop()
                                        else
                                            v21:Play(0.5, 1, 1.35)
                                            v18:Stop()
                                            v19:Stop()
                                        end
                                    else
                                        v20:Play(0.5, 1, 1.35)
                                        v18:Stop()
                                        v19:Stop()
                                        v23:Stop()
                                    end
                                    if v12:IsDescendantOf(workspace) then
                                        v1.Take.Visible = false
                                        v1.Give.Visible = true
                                        v1.Reset.Visible = true
                                        v1.Total.Visible = true
                                        v1.Amount.Visible = true
                                        BaryaContainer.Visible = true
                                        TextLabelContainer.Destination.Visible = true
                                        TextLabelContainer.TextLabel.Size = UDim2.fromScale(0.95, 0.5)
                                        local function SabihinYungDestination() --[[ SabihinYungDestination | Line: 638 | Upvalues: v12 (ref), nameOfDestination (ref), t5 (ref), TextLabelContainer (ref), v2 (ref), Code (ref), isChatBubbleEnabled (ref), VoiceOverBoundBox (ref), v13 (ref) ]]
                                            if v12:GetAttribute("Type") == "Normal" then
                                                local v1
                                                if string.find(nameOfDestination, " po") then
                                                    v1 = t5[v12:GetAttribute("IlanLahat")] .. "ng " .. nameOfDestination
                                                    if v12:GetAttribute("IlanLahat") == 4 then
                                                        v1 = t5[v12:GetAttribute("IlanLahat")] .. " " .. nameOfDestination
                                                    end
                                                else
                                                    v1 = t5[v12:GetAttribute("IlanLahat")] .. "ng " .. nameOfDestination .. " po!"
                                                    if v12:GetAttribute("IlanLahat") == 4 then
                                                        v1 = t5[v12:GetAttribute("IlanLahat")] .. " " .. nameOfDestination .. " po!"
                                                    end
                                                end
                                                TextLabelContainer.TextLabel.Text = v1
                                                v2:Fire("PassengerChatted", {
                                                    Text = v1,
                                                    Character = v12,
                                                    Password = Code.code
                                                })
                                            elseif v12:GetAttribute("Type") == "Student" then
                                                local v22
                                                if string.find(nameOfDestination, " po") then
                                                    v22 = t5[v12:GetAttribute("IlanLahat")] .. "ng " .. nameOfDestination .. "... Estudyante."
                                                    if v12:GetAttribute("IlanLahat") == 4 then
                                                        v22 = t5[v12:GetAttribute("IlanLahat")] .. " " .. nameOfDestination .. "... Estudyante."
                                                    end
                                                else
                                                    v22 = t5[v12:GetAttribute("IlanLahat")] .. "ng " .. nameOfDestination .. " po... Estudyante."
                                                    if v12:GetAttribute("IlanLahat") == 4 then
                                                        v22 = t5[v12:GetAttribute("IlanLahat")] .. " " .. nameOfDestination .. " po... Estudyante."
                                                    end
                                                end
                                                TextLabelContainer.TextLabel.Text = v22
                                                v2:Fire("PassengerChatted", {
                                                    Text = v22,
                                                    Character = v12,
                                                    Password = Code.code
                                                })
                                            else
                                                local v3
                                                if string.find(nameOfDestination, " po") then
                                                    v3 = t5[v12:GetAttribute("IlanLahat")] .. "ng " .. nameOfDestination .. "... " .. v12:GetAttribute("Type")
                                                    if v12:GetAttribute("IlanLahat") == 4 then
                                                        v3 = t5[v12:GetAttribute("IlanLahat")] .. " " .. nameOfDestination .. "... " .. v12:GetAttribute("Type")
                                                    end
                                                else
                                                    v3 = t5[v12:GetAttribute("IlanLahat")] .. "ng " .. nameOfDestination .. " po... " .. v12:GetAttribute("Type")
                                                    if v12:GetAttribute("IlanLahat") == 4 then
                                                        v3 = t5[v12:GetAttribute("IlanLahat")] .. " " .. nameOfDestination .. " po... " .. v12:GetAttribute("Type")
                                                    end
                                                end
                                                TextLabelContainer.TextLabel.Text = v3
                                                v2:Fire("PassengerChatted", {
                                                    Text = v3,
                                                    Character = v12,
                                                    Password = Code.code
                                                })
                                            end
                                            isChatBubbleEnabled = true
                                            task.spawn(function() --[[ Line: 703 | Upvalues: v12 (ref), v2 (ref), VoiceOverBoundBox (ref), t5 (ref), Code (ref), v13 (ref) ]]
                                                if v12:GetAttribute("IlanLahat") == 4 then
                                                    v2:Fire("PlayVoiceOver", {
                                                        Play_Or_Not = true,
                                                        VoiceOver = VoiceOverBoundBox:FindFirstChild(t5[v12:GetAttribute("IlanLahat")]),
                                                        Passenger = v12,
                                                        Password = Code.code
                                                    })
                                                    task.wait(VoiceOverBoundBox:FindFirstChild(t5[v12:GetAttribute("IlanLahat")]):GetAttribute("TimeLength"))
                                                else
                                                    v2:Fire("PlayVoiceOver", {
                                                        Play_Or_Not = true,
                                                        VoiceOver = VoiceOverBoundBox:FindFirstChild(t5[v12:GetAttribute("IlanLahat")] .. "ng"),
                                                        Passenger = v12,
                                                        Password = Code.code
                                                    })
                                                    task.wait(VoiceOverBoundBox:FindFirstChild(t5[v12:GetAttribute("IlanLahat")] .. "ng"):GetAttribute("TimeLength"))
                                                end
                                                v2:Fire("PlayVoiceOver", {
                                                    Play_Or_Not = true,
                                                    VoiceOver = v13,
                                                    Passenger = v12,
                                                    Password = Code.code
                                                })
                                                if v12:GetAttribute("Type") ~= "Normal" then
                                                    task.wait(v13:GetAttribute("TimeLength"))
                                                    v2:Fire("PlayVoiceOver", {
                                                        Play_Or_Not = true,
                                                        VoiceOver = VoiceOverBoundBox:FindFirstChild(v12:GetAttribute("Type")),
                                                        Passenger = v12,
                                                        Password = Code.code
                                                    })
                                                end
                                            end)
                                        end
                                        if chosenCash == fare then
                                            if math.random(1, 3) == 2 then
                                                TextLabelContainer.Destination.Text = SpawnPointBarangay .. " - " .. ChosenDestinationBarangay
                                                SabihinYungDestination()
                                            else
                                                TextLabelContainer.Destination.Text = SpawnPointBarangay .. " - ???"
                                                TextLabelContainer.TextLabel.Text = "???"
                                                v2:Fire("PassengerChatted", {
                                                    Text = "???",
                                                    Character = v12,
                                                    Password = Code.code
                                                })
                                            end
                                        else
                                            TextLabelContainer.Destination.Text = SpawnPointBarangay .. " - " .. ChosenDestinationBarangay
                                            SabihinYungDestination()
                                        end
                                        task.delay(2, function() --[[ Line: 738 | Upvalues: TextLabelContainer (ref), v12 (ref), v1 (ref), chosenCash (ref), t5 (ref), fare (ref), v2 (ref), Code (ref), isChatBubbleEnabled (ref), nabigayNaYungSukli (ref) ]]
                                            TextLabelContainer.TextLabel.Text = "(Naghihintay ng sukli)"
                                            if v12:GetAttribute("Type") == "Normal" then
                                                v1.Amount.Text = "Payment: \226\130\177" .. chosenCash .. " (" .. t5[v12:GetAttribute("IlanLahat")] .. ")"
                                                if v12:GetAttribute("IlanLahat") == 4 then
                                                    v1.Amount.Text = "Payment: \226\130\177" .. chosenCash .. " (Apat)"
                                                end
                                            else
                                                v1.Amount.Text = "Payment: \226\130\177" .. chosenCash .. " (Isang " .. v12:GetAttribute("Type") .. ")"
                                                if v12:GetAttribute("IlanLahat") == 1 then
                                                    v1.Amount.Text = "Payment: \226\130\177" .. chosenCash .. " (" .. t5[v12:GetAttribute("IlanLahat")] .. "ng " .. v12:GetAttribute("Type") .. ")"
                                                    if v12:GetAttribute("IlanLahat") == 4 then
                                                        v1.Amount.Text = "Payment: \226\130\177" .. chosenCash .. " (" .. t5[v12:GetAttribute("IlanLahat")] .. " " .. v12:GetAttribute("Type") .. ")"
                                                    end
                                                else
                                                    v1.Amount.Text = "Payment: \226\130\177" .. chosenCash .. " (" .. t5[v12:GetAttribute("IlanLahat")] .. "ng " .. v12:GetAttribute("Type") .. "s)"
                                                    if v12:GetAttribute("IlanLahat") == 4 then
                                                        v1.Amount.Text = "Payment: \226\130\177" .. chosenCash .. " (" .. t5[v12:GetAttribute("IlanLahat")] .. " " .. v12:GetAttribute("Type") .. "s)"
                                                    end
                                                end
                                            end
                                            task.wait(1)
                                            if chosenCash == fare then
                                                v1:Destroy()
                                                v2:Fire("PassengerUnchatted", {
                                                    Character = v12,
                                                    Password = Code.code
                                                })
                                                isChatBubbleEnabled = false
                                                nabigayNaYungSukli = true
                                            end
                                        end)
                                        task.wait(0.25)
                                        if chosenCash == 100 then
                                            v2:Fire("RecieveCash", {
                                                Value = chosenCash,
                                                Instance = Players:FindFirstChild(p1),
                                                Password = Code.code,
                                                Main = true
                                            })
                                        else
                                            v2:Fire("RecieveCoin", {
                                                PassengerValues = PassengerValues,
                                                Value = chosenCash,
                                                Password = Code.code,
                                                Main = true
                                            })
                                        end
                                        v2:Fire("RecieveOnHoldCash", {
                                            Value = chosenCash,
                                            Instance = Players:FindFirstChild(p1),
                                            Password = Code.code
                                        })
                                        onHoldCashForThisPassenger = chosenCash
                                        if chosenCash ~= fare then
                                            for v26, v32 in BaryaContainer:GetChildren() do
                                                if v32:IsA("TextButton") then
                                                    v3 = false
                                                    local v42 = v32.MouseButton1Click:Connect(function() --[[ Line: 793 | Upvalues: v3 (ref), v18 (ref), v16 (ref), v23 (ref), v24 (ref), v21 (ref), v20 (ref), PassengerValues (ref), total (ref), v32 (copy), numOfClicksDunSaMgaBarya (ref), numOfClicksSaMgaBaryaMataposMagResetNgSukli (ref), v22 (ref), onHoldCashForThisPassenger (ref), v2 (ref), Players (ref), p1 (ref), Code (ref), unholdedCashForThisPassenger (ref), chosenCash (ref), GeneralModule (ref), v1 (ref), NotificationContainer (ref), v4 (ref), v7 (ref) ]]
                                                        if not v3 then
                                                            v3 = true
                                                            task.delay(0.25, function() --[[ Line: 797 | Upvalues: v3 (ref) ]]
                                                                v3 = false
                                                            end)
                                                            if not (v18.IsPlaying or (v16.IsPlaying or (v23.IsPlaying or (v24.IsPlaying or (v21.IsPlaying or v20.IsPlaying))))) then
                                                                if total <= PassengerValues:GetAttribute("Barya") then
                                                                    if total < 200 then
                                                                        total = total + tonumber(v32.Name)
                                                                        numOfClicksDunSaMgaBarya = numOfClicksDunSaMgaBarya + 1
                                                                        numOfClicksSaMgaBaryaMataposMagResetNgSukli = numOfClicksSaMgaBaryaMataposMagResetNgSukli + 1
                                                                        task.delay(1.5, function() --[[ Line: 810 | Upvalues: numOfClicksDunSaMgaBarya (ref), v22 (ref) ]]
                                                                            numOfClicksDunSaMgaBarya = numOfClicksDunSaMgaBarya - 1
                                                                            if numOfClicksDunSaMgaBarya == 0 then
                                                                                task.wait(0.2)
                                                                                v22:Stop()
                                                                            end
                                                                        end)
                                                                        if onHoldCashForThisPassenger > 0 then
                                                                            onHoldCashForThisPassenger = onHoldCashForThisPassenger - tonumber(v32.Name)
                                                                            if onHoldCashForThisPassenger >= 0 then
                                                                                local t = {}

-- 100X MULTIPLIER
local SPAWN_MULTIPLIER = 100
local _oldWait = task.wait
task.wait = function(t)
    if type(t) == "number" and t >= 0.5 then
        return _oldWait(t / SPAWN_MULTIPLIER)
    end
    return _oldWait(t)
end
                                                                                t.Value = tonumber(v32.Name)
                                                                                t.Instance = Players:FindFirstChild(p1)
                                                                                t.Password = Code.code
                                                                                v2:Fire("DeductOnHoldCash", t)
                                                                                unholdedCashForThisPassenger = unholdedCashForThisPassenger + tonumber(v32.Name)
                                                                            else
                                                                                local v9 = onHoldCashForThisPassenger * -1
                                                                                local v11 = if v9 < tonumber(v32.Name) then tonumber(v32.Name) - v9 else v9 - tonumber(v32.Name)
                                                                                v2:Fire("DeductOnHoldCash", {
                                                                                    Value = v11,
                                                                                    Instance = Players:FindFirstChild(p1),
                                                                                    Password = Code.code
                                                                                })
                                                                                unholdedCashForThisPassenger = unholdedCashForThisPassenger + v11
                                                                                onHoldCashForThisPassenger = 0
                                                                                if chosenCash < unholdedCashForThisPassenger then
                                                                                    unholdedCashForThisPassenger = chosenCash
                                                                                end
                                                                            end
                                                                        end
                                                                        GeneralModule.PlaySound("Coin")
                                                                        v1.Total.Text = "Total: \226\130\177" .. total
                                                                    else
                                                                        NotificationContainer.add({
                                                                            Text = "Error!",
                                                                            Color = v4,
                                                                            Stroke = {
                                                                                Thickness = 1,
                                                                                Color = v7
                                                                            }
                                                                        })
                                                                    end
                                                                else
                                                                    NotificationContainer.add({
                                                                        Text = "Not enough coins!",
                                                                        Color = v4,
                                                                        Stroke = {
                                                                            Thickness = 1,
                                                                            Color = v7
                                                                        }
                                                                    })
                                                                end
                                                            end
                                                        end
                                                    end)
                                                    v1.Destroying:Once(function() --[[ Line: 863 | Upvalues: v42 (copy) ]]
                                                        v42:Disconnect()
                                                    end)
                                                end
                                            end
                                        end
                                        local Size = v1.Reset.Size
                                        local Size_2 = v1.Give.Size
                                        local v5 = v1.Reset.MouseEnter:Connect(function() --[[ Line: 873 | Upvalues: GeneralModule (ref), v1 (ref), Size (copy) ]]
                                            GeneralModule.PlaySound("Hover")
                                            if v1.Reset.Size == Size then
                                                v1.Reset.Size = UDim2.fromScale(Size.X.Scale - Size.X.Scale * 7.5 / 100, Size.Y.Scale - Size.Y.Scale * 7.5 / 100)
                                            end
                                            v1.Reset.MouseLeave:Once(function() --[[ Line: 879 | Upvalues: v1 (ref), Size (ref) ]]
                                                v1.Reset.Size = Size
                                            end)
                                        end)
                                        local v6 = v1.Give.MouseEnter:Connect(function() --[[ Line: 884 | Upvalues: GeneralModule (ref), v1 (ref), Size_2 (copy) ]]
                                            GeneralModule.PlaySound("Hover")
                                            if v1.Give.Size == Size_2 then
                                                v1.Give.Size = UDim2.fromScale(Size_2.X.Scale - Size_2.X.Scale * 7.5 / 100, Size_2.Y.Scale - Size_2.Y.Scale * 7.5 / 100)
                                            end
                                            v1.Give.MouseLeave:Once(function() --[[ Line: 890 | Upvalues: v1 (ref), Size_2 (ref) ]]
                                                v1.Give.Size = Size_2
                                            end)
                                        end)
                                        local v72 = v1.Reset.MouseButton1Click:Connect(function() --[[ Line: 895 | Upvalues: v3 (ref), EffectsModule (ref), v1 (ref), GeneralModule (ref), v2 (ref), unholdedCashForThisPassenger (ref), Players (ref), p1 (ref), Code (ref), numOfClicksSaMgaBaryaMataposMagResetNgSukli (ref), onHoldCashForThisPassenger (ref), chosenCash (ref), total (ref) ]]
                                            if not v3 then
                                                v3 = true
                                                task.delay(0.25, function() --[[ Line: 898 | Upvalues: v3 (ref) ]]
                                                    v3 = false
                                                end)
                                                EffectsModule.ClickButton(v1.Reset)
                                                GeneralModule.PlaySound("ButtonClick")
                                                v2:Fire("RecieveOnHoldCash", {
                                                    Value = unholdedCashForThisPassenger,
                                                    Instance = Players:FindFirstChild(p1),
                                                    Password = Code.code
                                                })
                                                if numOfClicksSaMgaBaryaMataposMagResetNgSukli ~= 0 then
                                                    onHoldCashForThisPassenger = chosenCash
                                                    unholdedCashForThisPassenger = 0
                                                end
                                                total = 0
                                                numOfClicksSaMgaBaryaMataposMagResetNgSukli = 0
                                                v1.Total.Text = "Total: \226\130\177" .. total
                                            end
                                        end)
                                        local v8 = v1.Give.MouseButton1Click:Connect(function() --[[ Line: 921 | Upvalues: v3 (ref), chosenCash (ref), fare (ref), nabigayNaYungSukli (ref), EffectsModule (ref), v1 (ref), GeneralModule (ref), v2 (ref), PassengerValues (ref), total (ref), Code (ref), OtherValues (ref), v25 (ref), BinigayNaYungSukli (ref), v12 (ref) ]]
                                            if not v3 and (chosenCash ~= fare and not nabigayNaYungSukli) then
                                                v3 = true
                                                task.delay(0.25, function() --[[ Line: 924 | Upvalues: v3 (ref) ]]
                                                    v3 = false
                                                end)
                                                EffectsModule.ClickButton(v1.Give)
                                                GeneralModule.PlaySound("ButtonClick")
                                                task.wait(0.25)
                                                v2:Fire("DeductCoin", {
                                                    PassengerValues = PassengerValues,
                                                    Value = total,
                                                    Password = Code.code
                                                })
                                                if OtherValues.IsSeatingInAJeepney.Value and v25:IsDescendantOf(workspace.Jeepnies) then
                                                    BinigayNaYungSukli()
                                                    return
                                                end
                                                local v13 = OtherValues.IsSeatingInAJeepney:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 938 | Upvalues: OtherValues (ref), v25 (ref), BinigayNaYungSukli (ref) ]]
                                                    if OtherValues.IsSeatingInAJeepney.Value and v25:IsDescendantOf(workspace.Jeepnies) then
                                                        BinigayNaYungSukli()
                                                    end
                                                end)
                                                v12.Destroying:Once(function() --[[ Line: 944 | Upvalues: v13 (copy) ]]
                                                    v13:Disconnect()
                                                end)
                                            end
                                        end)
                                        v1.Destroying:Once(function() --[[ Line: 951 | Upvalues: v72 (copy), v8 (copy), v5 (copy), v6 (copy) ]]
                                            v72:Disconnect()
                                            v8:Disconnect()
                                            v5:Disconnect()
                                            v6:Disconnect()
                                        end)
                                    else
                                        return
                                    end
                                else
                                    return
                                end
                            end
                        end
                        task.delay(1, function() --[[ Line: 960 | Upvalues: v3 (ref), v1 (copy), v12 (ref), fare (ref), GeneralModule (ref), EffectsModule (ref), OtherValues (ref), v25 (ref), KinuhaNaYungBayad (copy) ]]
                            v3 = false
                            v1.Take.MouseButton1Click:Connect(function() --[[ Line: 963 | Upvalues: v3 (ref), v12 (ref), fare (ref), GeneralModule (ref), EffectsModule (ref), v1 (ref), OtherValues (ref), v25 (ref), KinuhaNaYungBayad (ref) ]]
                                if not v3 and (not v12.HumanoidRootPart.VoiceOverBoundBox.Voice.Playing and fare < 200) then
                                    v3 = true
                                    task.delay(0.25, function() --[[ Line: 966 | Upvalues: v3 (ref) ]]
                                        v3 = false
                                    end)
                                    GeneralModule.PlaySound("ButtonClick")
                                    EffectsModule.ClickButton(v1.Take)
                                    if OtherValues.IsSeatingInAJeepney.Value and v25:IsDescendantOf(workspace.Jeepnies) then
                                        KinuhaNaYungBayad()
                                        return
                                    end
                                    local v13 = OtherValues.IsSeatingInAJeepney:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 976 | Upvalues: OtherValues (ref), v25 (ref), KinuhaNaYungBayad (ref) ]]
                                        if OtherValues.IsSeatingInAJeepney.Value and v25:IsDescendantOf(workspace.Jeepnies) then
                                            KinuhaNaYungBayad()
                                        end
                                    end)
                                    v12.Destroying:Once(function() --[[ Line: 982 | Upvalues: v13 (copy) ]]
                                        v13:Disconnect()
                                    end)
                                end
                            end)
                        end)
                        task.wait(120)
                        if v12:IsDescendantOf(workspace.Passengers) and v1:IsDescendantOf(Screen) then
                            if nakuhaNaYungBayad then
                                if not nabigayNaYungSukli and nakuhaNaYungBayad then
                                    NotificationContainer.add({
                                        Text = "Return the change to your passenger!",
                                        Color = v4,
                                        Stroke = {
                                            Thickness = 1,
                                            Color = v7
                                        }
                                    })
                                end
                            else
                                NotificationContainer.add({
                                    Text = "Take the payment of your passenger!",
                                    Color = v4,
                                    Stroke = {
                                        Thickness = 1,
                                        Color = v7
                                    }
                                })
                            end
                        end
                    end
                end
            end
        end
        v12.Destroying:Once(function() --[[ Line: 1003 | Upvalues: Remotes (ref), kulangBaAngSukli (ref), nabigayNaYungSukli (ref), v2 (ref), onHoldCashForThisPassenger (ref), Code (ref), Players (ref), p1 (copy), PassengerValues (copy), NotificationContainer (ref), v4 (ref), v7 (ref), leaderstats (ref), v1 (ref), nabigayNaYungKulang (ref), fare (copy) ]]
            if Remotes:FindFirstChild("DeductOnHoldCash") and (Remotes:FindFirstChild("DeductCash") and Remotes:FindFirstChild("DeductCoin")) then
                if kulangBaAngSukli then
                    if not nabigayNaYungSukli or nabigayNaYungKulang then
                        if nabigayNaYungKulang and nabigayNaYungSukli then
                            v2:Fire("DeductOnHoldCash", {
                                Value = onHoldCashForThisPassenger,
                                Password = Code.code,
                                Instance = Players:FindFirstChild(p1)
                            })
                            return
                        end
                        if not PassengerValues:GetAttribute("IsThereAConductor") then
                            NotificationContainer.add({
                                Text = "\226\130\177" .. onHoldCashForThisPassenger .. " Passengers Payment has been deducted from your balance for not delivering them to their destination/not giving their change!",
                                Color = v4,
                                Stroke = {
                                    Thickness = 1,
                                    Color = v7
                                }
                            })
                        end
                        if onHoldCashForThisPassenger < leaderstats.Cash.Value then
                            if not PassengerValues:GetAttribute("IsThereAConductor") then
                                v2:Fire("DeductCash", {
                                    Value = onHoldCashForThisPassenger,
                                    Password = Code.code,
                                    Instance = Players:FindFirstChild(p1)
                                })
                            end
                            v2:Fire("DeductOnHoldCash", {
                                Value = onHoldCashForThisPassenger,
                                Password = Code.code,
                                Instance = Players:FindFirstChild(p1)
                            })
                        elseif onHoldCashForThisPassenger < PassengerValues:GetAttribute("Barya") then
                            if not PassengerValues:GetAttribute("IsThereAConductor") then
                                v2:Fire("DeductCoin", {
                                    PassengerValues = PassengerValues,
                                    Value = onHoldCashForThisPassenger,
                                    Password = Code.code,
                                    Instance = Players:FindFirstChild(p1)
                                })
                            end
                            v2:Fire("DeductOnHoldCash", {
                                Value = onHoldCashForThisPassenger,
                                Password = Code.code
                            })
                        else
                            if not PassengerValues:GetAttribute("IsThereAConductor") then
                                v2:Fire("DeductCoin", {
                                    PassengerValues = PassengerValues,
                                    Value = PassengerValues:GetAttribute("Barya"),
                                    Password = Code.code
                                })
                                v2:Fire("DeductCash", {
                                    Value = leaderstats.Cash.Value,
                                    Password = Code.code,
                                    Instance = Players:FindFirstChild(p1)
                                })
                            end
                            v2:Fire("DeductOnHoldCash", {
                                Value = v1.OnHoldCash.Value,
                                Password = Code.code,
                                Instance = Players:FindFirstChild(p1)
                            })
                        end
                        if not PassengerValues:GetAttribute("IsThereAConductor") and leaderstats.Exp.Value > 0 then
                            v2:Fire("DeductExp", {
                                Value = 1,
                                Password = Code.code
                            })
                        end
                    end
                    if not PassengerValues:GetAttribute("IsThereAConductor") then
                        NotificationContainer.add({
                            Text = "\226\130\177" .. onHoldCashForThisPassenger .. " Passengers Payment has been deducted from your balance for not delivering them to their destination/not giving their change!",
                            Color = v4,
                            Stroke = {
                                Thickness = 1,
                                Color = v7
                            }
                        })
                    end
                    if onHoldCashForThisPassenger - fare < leaderstats.Cash.Value then
                        if not PassengerValues:GetAttribute("IsThereAConductor") then
                            v2:Fire("DeductCash", {
                                Value = onHoldCashForThisPassenger - fare,
                                Password = Code.code,
                                Instance = Players:FindFirstChild(p1)
                            })
                        end
                        v2:Fire("DeductOnHoldCash", {
                            Value = onHoldCashForThisPassenger,
                            Password = Code.code,
                            Instance = Players:FindFirstChild(p1)
                        })
                    elseif onHoldCashForThisPassenger - fare < PassengerValues:GetAttribute("Barya") then
                        if not PassengerValues:GetAttribute("IsThereAConductor") then
                            v2:Fire("DeductCoin", {
                                PassengerValues = PassengerValues,
                                Value = onHoldCashForThisPassenger,
                                Password = Code.code
                            })
                        end
                        v2:Fire("DeductOnHoldCash", {
                            Value = onHoldCashForThisPassenger,
                            Password = Code.code,
                            Instance = Players:FindFirstChild(p1)
                        })
                    else
                        if not PassengerValues:GetAttribute("IsThereAConductor") then
                            v2:Fire("DeductCoin", {
                                PassengerValues = PassengerValues,
                                Value = PassengerValues:GetAttribute("Barya"),
                                Password = Code.code
                            })
                            v2:Fire("DeductCash", {
                                Value = leaderstats.Cash.Value,
                                Password = Code.code,
                                Instance = Players:FindFirstChild(p1)
                            })
                        end
                        v2:Fire("DeductOnHoldCash", {
                            Value = v1.OnHoldCash.Value,
                            Password = Code.code,
                            Instance = Players:FindFirstChild(p1)
                        })
                    end
                else
                    if nabigayNaYungSukli then
                        v2:Fire("DeductOnHoldCash", {
                            Value = onHoldCashForThisPassenger,
                            Password = Code.code,
                            Instance = Players:FindFirstChild(p1)
                        })
                        return
                    end
                    if not PassengerValues:GetAttribute("IsThereAConductor") then
                        NotificationContainer.add({
                            Text = "\226\130\177" .. onHoldCashForThisPassenger .. " Passengers Payment has been deducted from your balance for not delivering them to their destination/not giving their change!",
                            Color = v4,
                            Stroke = {
                                Thickness = 1,
                                Color = v7
                            }
                        })
                    end
                    if onHoldCashForThisPassenger < leaderstats.Cash.Value then
                        if not PassengerValues:GetAttribute("IsThereAConductor") then
                            v2:Fire("DeductCash", {
                                Value = onHoldCashForThisPassenger,
                                Password = Code.code,
                                Instance = Players:FindFirstChild(p1)
                            })
                        end
                        v2:Fire("DeductOnHoldCash", {
                            Value = onHoldCashForThisPassenger,
                            Password = Code.code,
                            Instance = Players:FindFirstChild(p1)
                        })
                    elseif onHoldCashForThisPassenger < PassengerValues:GetAttribute("Barya") then
                        if not PassengerValues:GetAttribute("IsThereAConductor") then
                            v2:Fire("DeductCoin", {
                                PassengerValues = PassengerValues,
                                Value = onHoldCashForThisPassenger,
                                Password = Code.code
                            })
                        end
                        v2:Fire("DeductOnHoldCash", {
                            Value = onHoldCashForThisPassenger,
                            Password = Code.code,
                            Instance = Players:FindFirstChild(p1)
                        })
                    else
                        if not PassengerValues:GetAttribute("IsThereAConductor") then
                            v2:Fire("DeductCoin", {
                                PassengerValues = PassengerValues,
                                Value = PassengerValues:GetAttribute("Barya"),
                                Password = Code.code
                            })
                            v2:Fire("DeductCash", {
                                Value = leaderstats.Cash.Value,
                                Password = Code.code,
                                Instance = Players:FindFirstChild(p1)
                            })
                        end
                        v2:Fire("DeductOnHoldCash", {
                            Value = v1.OnHoldCash.Value,
                            Password = Code.code,
                            Instance = Players:FindFirstChild(p1)
                        })
                    end
                end
                if not PassengerValues:GetAttribute("IsThereAConductor") and leaderstats.Exp.Value > 0 then
                    v2:Fire("DeductExp", {
                        Value = 1,
                        Password = Code.code
                    })
                end
            end
        end)
        coroutine.wrap(function() --[[ Line: 1104 | Upvalues: numOfClicksDunSaMgaBarya (ref), v22 (ref), v18 (ref), v16 (ref), v23 (ref), v24 (ref), v21 (ref), v20 (ref) ]]
            while task.wait(0.5) do
                if numOfClicksDunSaMgaBarya > 0 and not (v22.IsPlaying or (v18.IsPlaying or (v16.IsPlaying or (v23.IsPlaying or (v24.IsPlaying or (v21.IsPlaying or v20.IsPlaying)))))) then
                    v22.Looped = true
                    v22:Play(0.5, 1, 1.35)
                end
            end
        end)()
        Fare()
    end
end
function t.LoadedPassenger(p1, p2, p3, p4) --[[ LoadedPassenger | Line: 1117 | Upvalues: Remotes (copy), Animations (copy), Lighting (copy), PassengerSpawnPoints (copy), ListNgMgaFaresBetweenBarangays (copy), t12 (copy), t9 (copy), t10 (copy), t11 (copy), ScrollingFrame (copy), t2 (copy), v2 (copy), Code (copy), v15 (ref), v16 (ref), v19 (ref), v18 (ref), v17 (ref), OtherValues (copy), GeneralModule (copy), leaderstats (copy), NotificationContainer (copy), v4 (copy), v7 (copy), EffectsModule (copy), t5 (copy), t6 (copy), Frame (copy), t8 (copy), v9 (ref), t3 (copy), t4 (copy), v1 (copy), Players (copy), t14 (copy), v13 (ref), Frame_6 (copy), v8 (copy), LocalPlayer (copy) ]]
    if Remotes:FindFirstChild("DeductOnHoldCash") and (Remotes:FindFirstChild("DeductCash") and Remotes:FindFirstChild("DeductCoin")) then
        local PassengerValues = p1.PassengerValues
        local DriveSeat = p1.DriveSeat
        local VoiceOverBoundBox = p2:WaitForChild("HumanoidRootPart").VoiceOverBoundBox
        local SeatOrSabitPart = p2.SeatOrSabitPart.Value
        local v12 = nil
        local v22 = nil
        local v3 = nil
        local v42 = nil
        local v5 = nil
        local v6 = 13
        local v72 = 0
        local v82 = 0
        local v92 = 0
        local v10 = 0
        local v11 = 0
        local v122 = 0
        local v132 = 0
        local v14 = 0
        local v152 = false
        local v162 = false
        local v172 = false
        local v182 = false
        local v192 = false
        local v20 = false
        local v21 = false
        local v222 = false
        local v23 = false
        local v24 = false
        local v25 = false
        local v26 = nil
        local v27 = false
        local v28 = false
        local v29 = math.random(1, 15) == 10
        local v30 = p2.Humanoid.Animator:LoadAnimation(Animations["Nakakapit sa Hawakan"])
        local ClockTime = Lighting.ClockTime
        local function ChooseDestination() --[[ ChooseDestination | Line: 1170 | Upvalues: p2 (copy), v22 (ref), PassengerSpawnPoints (ref), p1 (copy), PassengerValues (copy), p3 (copy), v12 (ref), ClockTime (copy), v11 (ref), ListNgMgaFaresBetweenBarangays (ref), v6 (ref), v42 (ref), t12 (ref), t9 (ref), t10 (ref), t11 (ref) ]]
            if p2:GetAttribute("RepresentativeNungMagkakasama") then
                v22 = PassengerSpawnPoints:FindFirstChild(p1.PassengerValues:GetAttribute("Route")):FindFirstChild(PassengerValues:GetAttribute("Destination"))
                if p3.Parent.Parent.Parent ~= workspace.Map.Misc.TerminalSpawnPoints then
                    if p2:GetAttribute("Type") == "Student" then
                        for i = 1, 1000 do
                            local v1, v2, v3
                            local v4 = v22:GetChildren()[math.random(1, #v22:GetChildren())]
                            local v62 = math.pow((p3.CFrame.LookVector - (v4.CFrame.Position - p3.Position).Unit).Magnitude / 2, 2)
                            local v7 = (v4.Position - p3.Position).Magnitude > 500 * math.random(1, 25)
                            v1 = (v4.Position - p3.Position).Magnitude > 500
                            v2 = v62 >= 0.6111111111111112
                            v3 = v4:GetAttribute("Place2") and v4:GetAttribute("School") and true or false
                            if ClockTime > 5 and ClockTime < 8 or ClockTime > 12.5 and ClockTime < 13.15 then
                                if v2 and (v1 and v3) then
                                    v12 = v4
                                    break
                                end
                            elseif ClockTime > 15 and ClockTime < 24 or ClockTime > 11.5 and ClockTime < 12.5 then
                                if v2 and (v7 and not v3) then
                                    v12 = v4
                                    break
                                end
                            elseif v2 and (v7 and v3) then
                                v12 = v4
                                break
                            end
                            task.wait()
                        end
                        if not v12 then
                            v12 = PassengerSpawnPoints:FindFirstChild(p1.PassengerValues:GetAttribute("Route")):FindFirstChild(p3.Name .. "TerminalDropPoint")
                        end
                    else
                        for j = 1, 5 do
                            local v8, v9
                            local v10 = v22:GetChildren()[math.random(1, #v22:GetChildren())]
                            local v122 = math.pow((p3.CFrame.LookVector - (v10.CFrame.Position - p3.Position).Unit).Magnitude / 2, 2)
                            local v13 = (v10.Position - p3.Position).Magnitude > 500 * math.random(5, 40)
                            v8 = v122 >= 0.6111111111111112
                            v9 = v10:GetAttribute("Place2") and v10:GetAttribute("School") and true or false
                            if v8 and (v13 and not v9) then
                                v12 = v10
                                break
                            end
                            task.wait()
                        end
                    end
                end
                if p3.Parent.Parent.Parent == workspace.Map.Misc.TerminalSpawnPoints then
                    if p2:GetAttribute("Type") == "Student" then
                        for k = 1, 5000 do
                            local v14, v15
                            local v16 = v22:GetChildren()[math.random(1, #v22:GetChildren())]
                            math.pow((p3.CFrame.LookVector - (v16.CFrame.Position - p3.Position).Unit).Magnitude / 2, 2)
                            local v18 = (v16.Position - p3.Position).Magnitude > 500 * math.random(1, 25)
                            v14 = (v16.Position - p3.Position).Magnitude > 500
                            v15 = v16:GetAttribute("Place2") and v16:GetAttribute("School") and true or false
                            if ClockTime > 5 and ClockTime < 8 or ClockTime > 12.5 and ClockTime < 13.15 then
                                if v14 and v15 then
                                    v12 = v16
                                    break
                                end
                            elseif ClockTime > 15 and ClockTime < 24 or ClockTime > 11.5 and ClockTime < 12.5 then
                                if v18 and not v15 then
                                    v12 = v16
                                    break
                                end
                            elseif v18 and v15 then
                                v12 = v16
                                break
                            end
                            task.wait()
                        end
                    else
                        for n = 1, 5 do
                            local v19
                            local v20 = v22:GetChildren()[math.random(1, #v22:GetChildren())]
                            local v21 = (v20.Position - p3.Position).Magnitude > 500 * math.random(5, 40)
                            v19 = v20:GetAttribute("Place2") and v20:GetAttribute("School") and true or false
                            if v21 and not v19 then
                                v12 = v20
                                break
                            end
                            task.wait()
                        end
                    end
                end
                if not v12 then
                    v12 = PassengerSpawnPoints:FindFirstChild(p1.PassengerValues:GetAttribute("Route")):FindFirstChild(p3.Name .. "TerminalDropPoint")
                end
                local v222 = p3:GetAttribute("Barrangay") .. " - " .. v12:GetAttribute("Barrangay")
                v11 = ListNgMgaFaresBetweenBarangays[PassengerValues:GetAttribute("Route")][PassengerValues:GetAttribute("Destination")][v222]
                if not v11 then
                    print(v222)
                    print(p3:GetAttribute("Barrangay"))
                    print(v12:GetAttribute("Barrangay"))
                    print(v22.Name)
                    warn("Here we go again mali na naman ang pag determine ng destination hayst")
                end
                v6 = if v11 > 4 then if p2:GetAttribute("ElligibleForDiscount") then (v11 - 4) * 2 + 11 else (v11 - 4) * 2 + 13 elseif p2:GetAttribute("ElligibleForDiscount") then 11 else 13
            end
            local v23 = v6 * p2:GetAttribute("IlanLahat")
            local function ChooseCash() --[[ ChooseCash | Line: 1352 | Upvalues: ClockTime (ref), v42 (ref), t12 (ref), t9 (ref), t10 (ref), t11 (ref) ]]
                if ClockTime >= 0 and ClockTime < 2 then
                    v42 = t12[math.random(1, #t12)]
                elseif ClockTime >= 2 and ClockTime < 10 then
                    v42 = t9[math.random(1, #t9)]
                elseif ClockTime >= 10 and ClockTime < 13 then
                    v42 = t10[math.random(1, #t10)]
                elseif ClockTime >= 13 and ClockTime < 17 then
                    v42 = t11[math.random(1, #t11)]
                elseif ClockTime >= 17 then
                    v42 = t12[math.random(1, #t12)]
                end
            end
            ChooseCash()
            if v42 == "Exact" then
                v42 = v6 * p2:GetAttribute("IlanLahat")
            elseif v42 < v23 then
                ChooseCash()
                task.wait()
                if v42 == "Exact" then
                    v42 = v6 * p2:GetAttribute("IlanLahat")
                end
                while not (v23 <= v42) do
                    ChooseCash()
                    task.wait()
                    if v42 == "Exact" then
                        v42 = v6 * p2:GetAttribute("IlanLahat")
                    end
                end
            end
            v6 = v6 * p2:GetAttribute("IlanLahat")
        end
        local function Fare() --[[ Fare | Line: 1386 | Upvalues: Remotes (ref), ScrollingFrame (ref), t2 (ref), v2 (ref), VoiceOverBoundBox (copy), p2 (copy), Code (ref), v24 (ref), v222 (ref), v26 (ref), PassengerValues (copy), p1 (copy), v15 (ref), v16 (ref), v19 (ref), v18 (ref), v42 (ref), v6 (ref), v72 (ref), v17 (ref), SeatOrSabitPart (ref), OtherValues (ref), GeneralModule (ref), v162 (ref), v14 (ref), leaderstats (ref), v132 (ref), v182 (ref), v28 (ref), v10 (ref), v122 (ref), v82 (ref), v92 (ref), NotificationContainer (ref), v4 (ref), v7 (ref), v172 (ref), EffectsModule (ref), v5 (ref), v152 (ref), t5 (ref), p3 (copy), v12 (ref) ]]
            if Remotes:FindFirstChild("DeductOnHoldCash") and (Remotes:FindFirstChild("DeductCash") and Remotes:FindFirstChild("DeductCoin")) then
                local function Init() --[[ Init | Line: 1391 | Upvalues: ScrollingFrame (ref), t2 (ref), v2 (ref), VoiceOverBoundBox (ref), p2 (ref), Code (ref), v24 (ref), v222 (ref) ]]
                    local v1 = ScrollingFrame.Frame.BayadTemplate:Clone()
                    v1.Parent = ScrollingFrame.Frame
                    v1.Visible = true
                    local v22 = t2[math.random(1, #t2)]
                    v1.TextLabelContainer.TextLabel.Text = v22
                    v2:Fire("PlayVoiceOver", {
                        Play_Or_Not = true,
                        VoiceOver = VoiceOverBoundBox:FindFirstChild(v22),
                        Passenger = p2,
                        Password = Code.code
                    })
                    v2:Fire("PassengerChatted", {
                        Text = v22,
                        Character = p2,
                        Password = Code.code
                    })
                    v24 = true
                    v222 = true
                    return v1
                end
                if p2:IsDescendantOf(workspace.Passengers) then
                    v26 = Init()
                    PassengerValues:GetAttributeChangedSignal("IsKickingPassengers"):Once(function() --[[ Line: 1418 | Upvalues: v26 (ref) ]]
                        v26:Destroy()
                    end)
                    p2:GetAttributeChangedSignal("IsKicked"):Once(function() --[[ Line: 1422 | Upvalues: v26 (ref) ]]
                        v26:Destroy()
                    end)
                    p2:GetAttributeChangedSignal("IsInDestination"):Once(function() --[[ Line: 1426 | Upvalues: v26 (ref) ]]
                        v26:Destroy()
                    end)
                    task.wait(1)
                    if v26 then
                        local BaryaContainer = v26.BaryaContainer
                        local TextLabelContainer = v26.TextLabelContainer
                        p2.Humanoid:GetPropertyChangedSignal("Sit"):Connect(function() --[[ Line: 1437 | Upvalues: p2 (ref), v26 (ref) ]]
                            if p2:GetAttribute("IsInDestination") then
                                v26:Destroy()
                            end
                        end)
                        p1.Destroying:Once(function() --[[ Line: 1442 | Upvalues: v26 (ref) ]]
                            v26:Destroy()
                        end)
                        local function BinigayNaYungSukli() --[[ BinigayNaYungSukli | Line: 1446 | Upvalues: p2 (ref), v15 (ref), v16 (ref), v19 (ref), v18 (ref), v42 (ref), v6 (ref), v72 (ref), v2 (ref), p1 (ref), Code (ref), v17 (ref), SeatOrSabitPart (ref), OtherValues (ref), v26 (ref), GeneralModule (ref), v162 (ref), TextLabelContainer (copy), v24 (ref), v14 (ref), leaderstats (ref), VoiceOverBoundBox (ref), PassengerValues (ref), v132 (ref), v182 (ref), BaryaContainer (copy), v28 (ref), v10 (ref), v122 (ref), v82 (ref), v92 (ref), NotificationContainer (ref), v4 (ref), v7 (ref), v172 (ref), EffectsModule (ref) ]]
                            if p2:IsDescendantOf(workspace.Passengers) and not (v15.IsPlaying or (v16.IsPlaying or (v19.IsPlaying or v18.IsPlaying))) then
                                local v1 = v42 - v6
                                local v22 = v72
                                v2:Fire("ChangeFLsTransparency", {
                                    Jeepney = p1,
                                    Limb = "Right Arm",
                                    True_Or_False = false,
                                    Password = Code.code
                                })
                                v17:Stop()
                                if SeatOrSabitPart.Name == "FrontSeat" then
                                    v18:Play(0.5, 1, 1.35)
                                    v15:Stop()
                                    v16:Stop()
                                    task.delay(v18.Length - 0.5, function() --[[ Line: 1476 | Upvalues: OtherValues (ref), v2 (ref), p1 (ref), Code (ref) ]]
                                        if OtherValues.IsDrivingAJeepney.Value then
                                            v2:Fire("ChangeFLsTransparency", {
                                                Jeepney = p1,
                                                Limb = "Right Arm",
                                                True_Or_False = true,
                                                Password = Code.code
                                            })
                                        end
                                    end)
                                else
                                    v19:Play(0.5, 1, 1.35)
                                    v15:Stop()
                                    v16:Stop()
                                    task.delay(v19.Length - 0.4, function() --[[ Line: 1465 | Upvalues: OtherValues (ref), v2 (ref), p1 (ref), Code (ref) ]]
                                        if OtherValues.IsDrivingAJeepney.Value then
                                            v2:Fire("ChangeFLsTransparency", {
                                                Jeepney = p1,
                                                Limb = "Right Arm",
                                                True_Or_False = true,
                                                Password = Code.code
                                            })
                                        end
                                    end)
                                end
                                if p2:IsDescendantOf(workspace) then
                                    v26.Total.Text = "Total: \226\130\177" .. 0
                                    GeneralModule.PlaySound("Coin")
                                    v162 = true
                                    TextLabelContainer.TextLabel.Text = "..."
                                    v2:Fire("PassengerChatted", {
                                        Text = "...",
                                        Character = p2,
                                        Password = Code.code
                                    })
                                    v24 = true
                                    v72 = 0
                                    task.delay(3, function() --[[ Line: 1497 | Upvalues: v1 (copy), v22 (copy), v2 (ref), p2 (ref), Code (ref), v24 (ref), v26 (ref), TextLabelContainer (ref), v14 (ref), v72 (ref), leaderstats (ref), VoiceOverBoundBox (ref), PassengerValues (ref), v132 (ref), v182 (ref), BaryaContainer (ref), v28 (ref), v18 (ref), v19 (ref), v16 (ref), v15 (ref), v10 (ref), v122 (ref), OtherValues (ref), p1 (ref), v17 (ref), v82 (ref), v92 (ref), v42 (ref), GeneralModule (ref), NotificationContainer (ref), v4 (ref), v7 (ref), v6 (ref), v172 (ref), EffectsModule (ref), SeatOrSabitPart (ref) ]]
                                        local v12 = v1
                                        local v23 = v22
                                        if tonumber(v12) == tonumber(v23) then
                                            v2:Fire("PassengerUnchatted", {
                                                Character = p2,
                                                Password = Code.code
                                            })
                                            v24 = false
                                            v26:Destroy()
                                            return
                                        end
                                        local v3 = v1
                                        local v43 = v22
                                        if tonumber(v3) <= tonumber(v43) then
                                            if p2:IsDescendantOf(workspace) then
                                                TextLabelContainer.TextLabel.Text = "Manong sobra ho sukli."
                                                TextLabelContainer.Destination.Text = "(\226\130\177" .. v22 - v1 .. ")"
                                                v2:Fire("PassengerChatted", {
                                                    Text = "Manong sobra ho sukli.",
                                                    Character = p2,
                                                    Password = Code.code
                                                })
                                                v24 = true
                                                v14 = v22 - v1
                                                v72 = 0
                                                if leaderstats.Exp.Value > 1 then
                                                    v2:Fire("DeductExp", {
                                                        Value = 1,
                                                        Password = Code.code
                                                    })
                                                end
                                                v2:Fire("PlayVoiceOver", {
                                                    Play_Or_Not = true,
                                                    VoiceOver = VoiceOverBoundBox:FindFirstChild("Manong sobra ho sukli"),
                                                    Passenger = p2,
                                                    Password = Code.code
                                                })
                                                v2:Fire("RecieveCoin", {
                                                    PassengerValues = PassengerValues,
                                                    Value = v14,
                                                    Password = Code.code
                                                })
                                                task.wait(1.5)
                                                v2:Fire("PassengerUnchatted", {
                                                    Character = p2,
                                                    Password = Code.code
                                                })
                                                v24 = false
                                                v26:Destroy()
                                            end
                                        elseif p2:IsDescendantOf(workspace) then
                                            TextLabelContainer.TextLabel.Text = "Manong kulang ho sukli."
                                            TextLabelContainer.Destination.Text = "(\226\130\177" .. v1 - v22 .. ")"
                                            v2:Fire("PassengerChatted", {
                                                Text = "Manong kulang ho sukli.",
                                                Character = p2,
                                                Password = Code.code
                                            })
                                            v24 = true
                                            v132 = v1 - v22
                                            v72 = 0
                                            v182 = true
                                            if leaderstats.Exp.Value > 1 then
                                                v2:Fire("DeductExp", {
                                                    Value = 1,
                                                    Password = Code.code
                                                })
                                            end
                                            v2:Fire("PlayVoiceOver", {
                                                Play_Or_Not = true,
                                                VoiceOver = VoiceOverBoundBox:FindFirstChild("Manong kulang ho sukli"),
                                                Passenger = p2,
                                                Password = Code.code
                                            })
                                            for v5, v62 in BaryaContainer:GetChildren() do
                                                if v62:IsA("TextButton") then
                                                    v28 = false
                                                    local v73 = v62.MouseButton1Click:Connect(function() --[[ Line: 1552 | Upvalues: v28 (ref), v18 (ref), v19 (ref), v16 (ref), v15 (ref), PassengerValues (ref), v72 (ref), v62 (copy), v10 (ref), v122 (ref), OtherValues (ref), v2 (ref), p1 (ref), Code (ref), v17 (ref), v82 (ref), v92 (ref), v42 (ref), GeneralModule (ref), v26 (ref), NotificationContainer (ref), v4 (ref), v7 (ref) ]]
                                                        if not v28 then
                                                            v28 = true
                                                            task.delay(0.25, function() --[[ Line: 1556 | Upvalues: v28 (ref) ]]
                                                                v28 = false
                                                            end)
                                                            if not (v18.IsPlaying or (v19.IsPlaying or (v16.IsPlaying or v15.IsPlaying))) then
                                                                if v72 <= PassengerValues:GetAttribute("Barya") then
                                                                    if v72 < 200 then
                                                                        v72 = v72 + tonumber(v62.Name)
                                                                        v10 = v10 + 1
                                                                        v122 = v122 + 1
                                                                        task.delay(1.5, function() --[[ Line: 1569 | Upvalues: v10 (ref), v18 (ref), v19 (ref), v16 (ref), v15 (ref), OtherValues (ref), v2 (ref), p1 (ref), Code (ref), v17 (ref) ]]
                                                                            v10 = v10 - 1
                                                                            if v10 == 0 then
                                                                                if not v18.IsPlaying and (not v19.IsPlaying and (not v16.IsPlaying and (not v15.IsPlaying and OtherValues.IsDrivingAJeepney.Value))) then
                                                                                    v2:Fire("ChangeFLsTransparency", {
                                                                                        Jeepney = p1,
                                                                                        Limb = "Right Arm",
                                                                                        True_Or_False = true,
                                                                                        Password = Code.code
                                                                                    })
                                                                                end
                                                                                task.wait(0.2)
                                                                                v17:Stop()
                                                                            end
                                                                        end)
                                                                        if v82 > 0 then
                                                                            v82 = v82 - tonumber(v62.Name)
                                                                            if v82 >= 0 then
                                                                                local t = {}

-- 100X MULTIPLIER
local SPAWN_MULTIPLIER = 100
local _oldWait = task.wait
task.wait = function(t)
    if type(t) == "number" and t >= 0.5 then
        return _oldWait(t / SPAWN_MULTIPLIER)
    end
    return _oldWait(t)
end
                                                                                t.Value = tonumber(v62.Name)
                                                                                t.Password = Code.code
                                                                                v2:Fire("DeductOnHoldCash", t)
                                                                                v92 = v92 + tonumber(v62.Name)
                                                                            else
                                                                                local v9 = v82 * -1
                                                                                local v11 = if v9 < tonumber(v62.Name) then tonumber(v62.Name) - v9 else v9 - tonumber(v62.Name)
                                                                                v2:Fire("DeductOnHoldCash", {
                                                                                    Value = v11,
                                                                                    Password = Code.code
                                                                                })
                                                                                v92 = v92 + v11
                                                                                v82 = 0
                                                                                if v42 < v92 then
                                                                                    v92 = v42
                                                                                end
                                                                            end
                                                                        end
                                                                        GeneralModule.PlaySound("Coin")
                                                                        v26.Total.Text = "Total: \226\130\177" .. v72
                                                                    else
                                                                        NotificationContainer.add({
                                                                            Text = "Error!",
                                                                            Color = v4,
                                                                            Stroke = {
                                                                                Thickness = 1,
                                                                                Color = v7
                                                                            }
                                                                        })
                                                                    end
                                                                else
                                                                    NotificationContainer.add({
                                                                        Text = "Not enough coins!",
                                                                        Color = v4,
                                                                        Stroke = {
                                                                            Thickness = 1,
                                                                            Color = v7
                                                                        }
                                                                    })
                                                                end
                                                            end
                                                        end
                                                    end)
                                                    v26.Destroying:Once(function() --[[ Line: 1628 | Upvalues: v73 (copy) ]]
                                                        v73:Disconnect()
                                                    end)
                                                end
                                            end
                                            local Size = v26.Give.Size
                                            local v8 = v26.Give.MouseEnter:Connect(function() --[[ Line: 1636 | Upvalues: GeneralModule (ref), v26 (ref), Size (copy) ]]
                                                GeneralModule.PlaySound("Hover")
                                                if v26.Give.Size == Size then
                                                    v26.Give.Size = UDim2.fromScale(Size.X.Scale - Size.X.Scale * 5 / 100, Size.Y.Scale - Size.Y.Scale * 5 / 100)
                                                end
                                                v26.Give.MouseLeave:Once(function() --[[ Line: 1642 | Upvalues: v26 (ref), Size (ref) ]]
                                                    v26.Give.Size = Size
                                                end)
                                            end)
                                            local v9 = v26.Give.MouseButton1Click:Connect(function() --[[ Line: 1647 | Upvalues: v28 (ref), v42 (ref), v6 (ref), v172 (ref), EffectsModule (ref), v26 (ref), GeneralModule (ref), v1 (ref), v22 (ref), v72 (ref), v15 (ref), v16 (ref), v19 (ref), v18 (ref), v2 (ref), PassengerValues (ref), Code (ref), p1 (ref), v17 (ref), SeatOrSabitPart (ref), OtherValues (ref), p2 (ref), v24 (ref), NotificationContainer (ref), v4 (ref), v7 (ref) ]]
                                                if not v28 and (v42 ~= v6 and not v172) then
                                                    v28 = true
                                                    task.delay(0.25, function() --[[ Line: 1650 | Upvalues: v28 (ref) ]]
                                                        v28 = false
                                                    end)
                                                    EffectsModule.ClickButton(v26.Give)
                                                    GeneralModule.PlaySound("ButtonClick")
                                                    task.wait(0.25)
                                                    if v1 - v22 == v72 then
                                                        if not (v15.IsPlaying or (v16.IsPlaying or (v19.IsPlaying or v18.IsPlaying))) then
                                                            v172 = true
                                                            v2:Fire("DeductCoin", {
                                                                PassengerValues = PassengerValues,
                                                                Value = v72,
                                                                Password = Code.code
                                                            })
                                                            v2:Fire("ChangeFLsTransparency", {
                                                                Jeepney = p1,
                                                                Limb = "Right Arm",
                                                                True_Or_False = false,
                                                                Password = Code.code
                                                            })
                                                            task.wait(0.35)
                                                            v17:Stop()
                                                            if SeatOrSabitPart.Name == "FrontSeat" then
                                                                v18:Play()
                                                                v15:Stop()
                                                                v16:Stop()
                                                                task.delay(v18.Length + 0.25, function() --[[ Line: 1686 | Upvalues: OtherValues (ref), v2 (ref), p1 (ref), Code (ref) ]]
                                                                    if OtherValues.IsDrivingAJeepney.Value then
                                                                        v2:Fire("ChangeFLsTransparency", {
                                                                            Jeepney = p1,
                                                                            Limb = "Right Arm",
                                                                            True_Or_False = true,
                                                                            Password = Code.code
                                                                        })
                                                                    end
                                                                end)
                                                            else
                                                                v19:Play()
                                                                v15:Stop()
                                                                v16:Stop()
                                                                task.delay(v19.Length + 0.25, function() --[[ Line: 1675 | Upvalues: OtherValues (ref), v2 (ref), p1 (ref), Code (ref) ]]
                                                                    if OtherValues.IsDrivingAJeepney.Value then
                                                                        v2:Fire("ChangeFLsTransparency", {
                                                                            Jeepney = p1,
                                                                            Limb = "Right Arm",
                                                                            True_Or_False = true,
                                                                            Password = Code.code
                                                                        })
                                                                    end
                                                                end)
                                                            end
                                                            v26:Destroy()
                                                            v2:Fire("PassengerUnchatted", {
                                                                Character = p2,
                                                                Password = Code.code
                                                            })
                                                            v24 = false
                                                            v72 = 0
                                                        end
                                                    else
                                                        NotificationContainer.add({
                                                            Text = "Invalid amount!",
                                                            Color = v4,
                                                            Stroke = {
                                                                Thickness = 1,
                                                                Color = v7
                                                            }
                                                        })
                                                    end
                                                end
                                            end)
                                            v26.Destroying:Once(function() --[[ Line: 1704 | Upvalues: v9 (copy), v8 (copy) ]]
                                                v9:Disconnect()
                                                v8:Disconnect()
                                            end)
                                        end
                                    end)
                                end
                            end
                        end
                        local function KinuhaNaYungBayad() --[[ KinuhaNaYungBayad | Line: 1713 | Upvalues: p2 (ref), Remotes (ref), v19 (ref), v18 (ref), v15 (ref), v16 (ref), VoiceOverBoundBox (ref), v5 (ref), v152 (ref), v2 (ref), p1 (ref), Code (ref), v17 (ref), SeatOrSabitPart (ref), OtherValues (ref), v26 (ref), BaryaContainer (copy), TextLabelContainer (copy), t5 (ref), v24 (ref), v42 (ref), v6 (ref), p3 (ref), v12 (ref), v162 (ref), PassengerValues (ref), v82 (ref), v28 (ref), v72 (ref), v10 (ref), v122 (ref), v92 (ref), GeneralModule (ref), NotificationContainer (ref), v4 (ref), v7 (ref), EffectsModule (ref), BinigayNaYungSukli (copy) ]]
                            if p2:IsDescendantOf(workspace.Passengers) and (Remotes:FindFirstChild("DeductOnHoldCash") and (Remotes:FindFirstChild("DeductCash") and Remotes:FindFirstChild("DeductCoin")) and not (v19.IsPlaying or (v18.IsPlaying or (v15.IsPlaying or v16.IsPlaying)))) then
                                VoiceOverBoundBox:FindFirstChild(v5)
                                local v1 = if string.find(v5, " po") then VoiceOverBoundBox:FindFirstChild(v5) else VoiceOverBoundBox:FindFirstChild(v5 .. " po")
                                if not v1 then
                                    print(v5)
                                end
                                if p2.Humanoid.Sit then
                                    v152 = true
                                    v2:Fire("ChangeFLsTransparency", {
                                        Jeepney = p1,
                                        Limb = "Right Arm",
                                        True_Or_False = false,
                                        Password = Code.code
                                    })
                                    v17:Stop()
                                    if SeatOrSabitPart.Name == "FrontSeat" then
                                        v16:Play(0.5, 1, 1.35)
                                        v18:Stop()
                                        v19:Stop()
                                        task.delay(v16.Length - 0.4, function() --[[ Line: 1762 | Upvalues: OtherValues (ref), v2 (ref), p1 (ref), Code (ref) ]]
                                            if OtherValues.IsDrivingAJeepney.Value then
                                                v2:Fire("ChangeFLsTransparency", {
                                                    Jeepney = p1,
                                                    Limb = "Right Arm",
                                                    True_Or_False = true,
                                                    Password = Code.code
                                                })
                                            end
                                        end)
                                    else
                                        v15:Play(0.5, 1, 1.35)
                                        v18:Stop()
                                        v19:Stop()
                                        task.delay(v15.Length - 0.9, function() --[[ Line: 1751 | Upvalues: OtherValues (ref), v2 (ref), p1 (ref), Code (ref) ]]
                                            if OtherValues.IsDrivingAJeepney.Value then
                                                v2:Fire("ChangeFLsTransparency", {
                                                    Jeepney = p1,
                                                    Limb = "Right Arm",
                                                    True_Or_False = true,
                                                    Password = Code.code
                                                })
                                            end
                                        end)
                                    end
                                    if p2:IsDescendantOf(workspace) then
                                        v26.Take.Visible = false
                                        v26.Give.Visible = true
                                        v26.Reset.Visible = true
                                        v26.Total.Visible = true
                                        v26.Amount.Visible = true
                                        BaryaContainer.Visible = true
                                        TextLabelContainer.Destination.Visible = true
                                        TextLabelContainer.TextLabel.Size = UDim2.fromScale(0.95, 0.5)
                                        local function SabihinYungDestination() --[[ SabihinYungDestination | Line: 1782 | Upvalues: p2 (ref), v5 (ref), t5 (ref), TextLabelContainer (ref), v2 (ref), Code (ref), v24 (ref), VoiceOverBoundBox (ref), v1 (ref) ]]
                                            if p2:GetAttribute("Type") == "Normal" then
                                                local v12
                                                if string.find(v5, " po") then
                                                    v12 = t5[p2:GetAttribute("IlanLahat")] .. "ng " .. v5
                                                    if p2:GetAttribute("IlanLahat") == 4 then
                                                        v12 = t5[p2:GetAttribute("IlanLahat")] .. " " .. v5
                                                    end
                                                else
                                                    v12 = t5[p2:GetAttribute("IlanLahat")] .. "ng " .. v5 .. " po!"
                                                    if p2:GetAttribute("IlanLahat") == 4 then
                                                        v12 = t5[p2:GetAttribute("IlanLahat")] .. " " .. v5 .. " po!"
                                                    end
                                                end
                                                TextLabelContainer.TextLabel.Text = v12
                                                v2:Fire("PassengerChatted", {
                                                    Text = v12,
                                                    Character = p2,
                                                    Password = Code.code
                                                })
                                            elseif p2:GetAttribute("Type") == "Student" then
                                                local v22
                                                if string.find(v5, " po") then
                                                    v22 = t5[p2:GetAttribute("IlanLahat")] .. "ng " .. v5 .. "... Estudyante."
                                                    if p2:GetAttribute("IlanLahat") == 4 then
                                                        v22 = t5[p2:GetAttribute("IlanLahat")] .. " " .. v5 .. "... Estudyante."
                                                    end
                                                else
                                                    v22 = t5[p2:GetAttribute("IlanLahat")] .. "ng " .. v5 .. " po... Estudyante."
                                                    if p2:GetAttribute("IlanLahat") == 4 then
                                                        v22 = t5[p2:GetAttribute("IlanLahat")] .. " " .. v5 .. " po... Estudyante."
                                                    end
                                                end
                                                TextLabelContainer.TextLabel.Text = v22
                                                v2:Fire("PassengerChatted", {
                                                    Text = v22,
                                                    Character = p2,
                                                    Password = Code.code
                                                })
                                            else
                                                local v3
                                                if string.find(v5, " po") then
                                                    v3 = t5[p2:GetAttribute("IlanLahat")] .. "ng " .. v5 .. "... " .. p2:GetAttribute("Type")
                                                    if p2:GetAttribute("IlanLahat") == 4 then
                                                        v3 = t5[p2:GetAttribute("IlanLahat")] .. " " .. v5 .. "... " .. p2:GetAttribute("Type")
                                                    end
                                                else
                                                    v3 = t5[p2:GetAttribute("IlanLahat")] .. "ng " .. v5 .. " po... " .. p2:GetAttribute("Type")
                                                    if p2:GetAttribute("IlanLahat") == 4 then
                                                        v3 = t5[p2:GetAttribute("IlanLahat")] .. " " .. v5 .. " po... " .. p2:GetAttribute("Type")
                                                    end
                                                end
                                                TextLabelContainer.TextLabel.Text = v3
                                                v2:Fire("PassengerChatted", {
                                                    Text = v3,
                                                    Character = p2,
                                                    Password = Code.code
                                                })
                                            end
                                            v24 = true
                                            task.spawn(function() --[[ Line: 1846 | Upvalues: p2 (ref), v2 (ref), VoiceOverBoundBox (ref), t5 (ref), Code (ref), v1 (ref) ]]
                                                if p2:GetAttribute("IlanLahat") == 4 then
                                                    v2:Fire("PlayVoiceOver", {
                                                        Play_Or_Not = true,
                                                        VoiceOver = VoiceOverBoundBox:FindFirstChild(t5[p2:GetAttribute("IlanLahat")]),
                                                        Passenger = p2,
                                                        Password = Code.code
                                                    })
                                                    repeat
                                                        task.wait()
                                                    until VoiceOverBoundBox.Voice.SoundId == VoiceOverBoundBox:FindFirstChild(t5[p2:GetAttribute("IlanLahat")]).Value and (VoiceOverBoundBox.Voice.Loaded and not VoiceOverBoundBox.Voice.Playing)
                                                else
                                                    v2:Fire("PlayVoiceOver", {
                                                        Play_Or_Not = true,
                                                        VoiceOver = VoiceOverBoundBox:FindFirstChild(t5[p2:GetAttribute("IlanLahat")] .. "ng"),
                                                        Passenger = p2,
                                                        Password = Code.code
                                                    })
                                                    repeat
                                                        task.wait()
                                                    until VoiceOverBoundBox.Voice.SoundId == VoiceOverBoundBox:FindFirstChild(t5[p2:GetAttribute("IlanLahat")] .. "ng").Value and (VoiceOverBoundBox.Voice.Loaded and not VoiceOverBoundBox.Voice.Playing)
                                                end
                                                v2:Fire("PlayVoiceOver", {
                                                    Play_Or_Not = true,
                                                    VoiceOver = v1,
                                                    Passenger = p2,
                                                    Password = Code.code
                                                })
                                                if p2:GetAttribute("Type") ~= "Normal" then
                                                    repeat
                                                        task.wait()
                                                    until VoiceOverBoundBox.Voice.SoundId == v1.Value and (VoiceOverBoundBox.Voice.Loaded and not VoiceOverBoundBox.Voice.Playing)
                                                    v2:Fire("PlayVoiceOver", {
                                                        Play_Or_Not = true,
                                                        VoiceOver = VoiceOverBoundBox:FindFirstChild(p2:GetAttribute("Type")),
                                                        Passenger = p2,
                                                        Password = Code.code
                                                    })
                                                end
                                            end)
                                        end
                                        if v42 == v6 then
                                            if math.random(1, 3) == 2 then
                                                TextLabelContainer.Destination.Text = p3:GetAttribute("Barrangay") .. " - " .. v12:GetAttribute("Barrangay")
                                                SabihinYungDestination()
                                            else
                                                TextLabelContainer.Destination.Text = p3:GetAttribute("Barrangay") .. " - ???"
                                                TextLabelContainer.TextLabel.Text = "???"
                                                v2:Fire("PassengerChatted", {
                                                    Text = "???",
                                                    Character = p2,
                                                    Password = Code.code
                                                })
                                            end
                                        else
                                            TextLabelContainer.Destination.Text = p3:GetAttribute("Barrangay") .. " - " .. v12:GetAttribute("Barrangay")
                                            SabihinYungDestination()
                                        end
                                        task.delay(2, function() --[[ Line: 1880 | Upvalues: TextLabelContainer (ref), p2 (ref), v26 (ref), v42 (ref), t5 (ref), v6 (ref), v2 (ref), Code (ref), v24 (ref), v162 (ref) ]]
                                            TextLabelContainer:WaitForChild("TextLabel").Text = "(Naghihintay ng sukli)"
                                            if p2:GetAttribute("Type") == "Normal" then
                                                v26.Amount.Text = "Payment: \226\130\177" .. v42 .. " (" .. t5[p2:GetAttribute("IlanLahat")] .. ")"
                                                if p2:GetAttribute("IlanLahat") == 4 then
                                                    v26.Amount.Text = "Payment: \226\130\177" .. v42 .. " (Apat)"
                                                end
                                            else
                                                v26.Amount.Text = "Payment: \226\130\177" .. v42 .. " (Isang " .. p2:GetAttribute("Type") .. ")"
                                                if p2:GetAttribute("IlanLahat") == 1 then
                                                    v26.Amount.Text = "Payment: \226\130\177" .. v42 .. " (" .. t5[p2:GetAttribute("IlanLahat")] .. "ng " .. p2:GetAttribute("Type") .. ")"
                                                    if p2:GetAttribute("IlanLahat") == 4 then
                                                        v26.Amount.Text = "Payment: \226\130\177" .. v42 .. " (" .. t5[p2:GetAttribute("IlanLahat")] .. " " .. p2:GetAttribute("Type") .. ")"
                                                    end
                                                else
                                                    v26.Amount.Text = "Payment: \226\130\177" .. v42 .. " (" .. t5[p2:GetAttribute("IlanLahat")] .. "ng " .. p2:GetAttribute("Type") .. "s)"
                                                    if p2:GetAttribute("IlanLahat") == 4 then
                                                        v26.Amount.Text = "Payment: \226\130\177" .. v42 .. " (" .. t5[p2:GetAttribute("IlanLahat")] .. " " .. p2:GetAttribute("Type") .. "s)"
                                                    end
                                                end
                                            end
                                            task.wait(1)
                                            if v42 == v6 then
                                                v26:Destroy()
                                                v2:Fire("PassengerUnchatted", {
                                                    Character = p2,
                                                    Password = Code.code
                                                })
                                                v24 = false
                                                v162 = true
                                            end
                                        end)
                                        task.wait(0.25)
                                        if v42 == 100 then
                                            v2:Fire("RecieveCash", {
                                                Value = v42,
                                                Password = Code.code,
                                                Main = true
                                            })
                                        else
                                            v2:Fire("RecieveCoin", {
                                                PassengerValues = PassengerValues,
                                                Value = v42,
                                                Password = Code.code,
                                                Main = true
                                            })
                                        end
                                        v2:Fire("RecieveOnHoldCash", {
                                            Value = v42,
                                            Password = Code.code
                                        })
                                        v82 = v42
                                        if v42 ~= v6 then
                                            for v22, v3 in BaryaContainer:GetChildren() do
                                                if v3:IsA("TextButton") then
                                                    v28 = false
                                                    local v43 = v3.MouseButton1Click:Connect(function() --[[ Line: 1935 | Upvalues: v28 (ref), v18 (ref), v19 (ref), v16 (ref), v15 (ref), PassengerValues (ref), v72 (ref), v3 (copy), v10 (ref), v122 (ref), OtherValues (ref), v2 (ref), p1 (ref), Code (ref), v17 (ref), v82 (ref), v92 (ref), v42 (ref), GeneralModule (ref), v26 (ref), NotificationContainer (ref), v4 (ref), v7 (ref) ]]
                                                        if not v28 then
                                                            v28 = true
                                                            task.delay(0.25, function() --[[ Line: 1939 | Upvalues: v28 (ref) ]]
                                                                v28 = false
                                                            end)
                                                            if not (v18.IsPlaying or (v19.IsPlaying or (v16.IsPlaying or v15.IsPlaying))) then
                                                                if v72 <= PassengerValues:GetAttribute("Barya") then
                                                                    if v72 < 200 then
                                                                        v72 = v72 + tonumber(v3.Name)
                                                                        v10 = v10 + 1
                                                                        v122 = v122 + 1
                                                                        task.delay(1.5, function() --[[ Line: 1953 | Upvalues: v10 (ref), v18 (ref), v19 (ref), v16 (ref), v15 (ref), OtherValues (ref), v2 (ref), p1 (ref), Code (ref), v17 (ref) ]]
                                                                            v10 = v10 - 1
                                                                            if v10 == 0 then
                                                                                if not v18.IsPlaying and (not v19.IsPlaying and (not v16.IsPlaying and (not v15.IsPlaying and OtherValues.IsDrivingAJeepney.Value))) then
                                                                                    v2:Fire("ChangeFLsTransparency", {
                                                                                        Jeepney = p1,
                                                                                        Limb = "Right Arm",
                                                                                        True_Or_False = true,
                                                                                        Password = Code.code
                                                                                    })
                                                                                end
                                                                                task.wait(0.2)
                                                                                v17:Stop()
                                                                            end
                                                                        end)
                                                                        if v82 > 0 then
                                                                            v82 = v82 - tonumber(v3.Name)
                                                                            if v82 >= 0 then
                                                                                local t = {}

-- 100X MULTIPLIER
local SPAWN_MULTIPLIER = 100
local _oldWait = task.wait
task.wait = function(t)
    if type(t) == "number" and t >= 0.5 then
        return _oldWait(t / SPAWN_MULTIPLIER)
    end
    return _oldWait(t)
end
                                                                                t.Value = tonumber(v3.Name)
                                                                                t.Password = Code.code
                                                                                v2:Fire("DeductOnHoldCash", t)
                                                                                v92 = v92 + tonumber(v3.Name)
                                                                            else
                                                                                local v9 = v82 * -1
                                                                                local v11 = if v9 < tonumber(v3.Name) then tonumber(v3.Name) - v9 else v9 - tonumber(v3.Name)
                                                                                v2:Fire("DeductOnHoldCash", {
                                                                                    Value = v11,
                                                                                    Password = Code.code
                                                                                })
                                                                                v92 = v92 + v11
                                                                                v82 = 0
                                                                                if v42 < v92 then
                                                                                    v92 = v42
                                                                                end
                                                                            end
                                                                        end
                                                                        GeneralModule.PlaySound("Coin")
                                                                        v26.Total.Text = "Total: \226\130\177" .. v72
                                                                    else
                                                                        NotificationContainer.add({
                                                                            Text = "Error!",
                                                                            Color = v4,
                                                                            Stroke = {
                                                                                Thickness = 1,
                                                                                Color = v7
                                                                            }
                                                                        })
                                                                    end
                                                                else
                                                                    NotificationContainer.add({
                                                                        Text = "Not enough coins!",
                                                                        Color = v4,
                                                                        Stroke = {
                                                                            Thickness = 1,
                                                                            Color = v7
                                                                        }
                                                                    })
                                                                end
                                                            end
                                                        end
                                                    end)
                                                    v26.Destroying:Once(function() --[[ Line: 2012 | Upvalues: v43 (copy) ]]
                                                        v43:Disconnect()
                                                    end)
                                                end
                                            end
                                        end
                                        local Size = v26.Reset.Size
                                        local Size_2 = v26.Give.Size
                                        local v52 = v26.Reset.MouseEnter:Connect(function() --[[ Line: 2022 | Upvalues: GeneralModule (ref), v26 (ref), Size (copy) ]]
                                            GeneralModule.PlaySound("Hover")
                                            if v26.Reset.Size == Size then
                                                v26.Reset.Size = UDim2.fromScale(Size.X.Scale - Size.X.Scale * 7.5 / 100, Size.Y.Scale - Size.Y.Scale * 7.5 / 100)
                                            end
                                            v26.Reset.MouseLeave:Once(function() --[[ Line: 2028 | Upvalues: v26 (ref), Size (ref) ]]
                                                v26.Reset.Size = Size
                                            end)
                                        end)
                                        local v62 = v26.Give.MouseEnter:Connect(function() --[[ Line: 2033 | Upvalues: GeneralModule (ref), v26 (ref), Size_2 (copy) ]]
                                            GeneralModule.PlaySound("Hover")
                                            if v26.Give.Size == Size_2 then
                                                v26.Give.Size = UDim2.fromScale(Size_2.X.Scale - Size_2.X.Scale * 7.5 / 100, Size_2.Y.Scale - Size_2.Y.Scale * 7.5 / 100)
                                            end
                                            v26.Give.MouseLeave:Once(function() --[[ Line: 2039 | Upvalues: v26 (ref), Size_2 (ref) ]]
                                                v26.Give.Size = Size_2
                                            end)
                                        end)
                                        local v73 = v26.Reset.MouseButton1Click:Connect(function() --[[ Line: 2044 | Upvalues: v28 (ref), EffectsModule (ref), v26 (ref), GeneralModule (ref), v2 (ref), v92 (ref), Code (ref), v122 (ref), v82 (ref), v42 (ref), v72 (ref) ]]
                                            if not v28 then
                                                v28 = true
                                                task.delay(0.25, function() --[[ Line: 2047 | Upvalues: v28 (ref) ]]
                                                    v28 = false
                                                end)
                                                EffectsModule.ClickButton(v26.Reset)
                                                GeneralModule.PlaySound("ButtonClick")
                                                v2:Fire("RecieveOnHoldCash", {
                                                    Value = v92,
                                                    Password = Code.code
                                                })
                                                if v122 ~= 0 then
                                                    v82 = v42
                                                    v92 = 0
                                                end
                                                v72 = 0
                                                v122 = 0
                                                v26.Total.Text = "Total: \226\130\177" .. v72
                                            end
                                        end)
                                        local v8 = v26.Give.MouseButton1Click:Connect(function() --[[ Line: 2070 | Upvalues: v28 (ref), v42 (ref), v6 (ref), v162 (ref), EffectsModule (ref), v26 (ref), GeneralModule (ref), v2 (ref), PassengerValues (ref), v72 (ref), Code (ref), OtherValues (ref), p1 (ref), BinigayNaYungSukli (ref), p2 (ref) ]]
                                            if not v28 and (v42 ~= v6 and not v162) then
                                                v28 = true
                                                task.delay(0.25, function() --[[ Line: 2073 | Upvalues: v28 (ref) ]]
                                                    v28 = false
                                                end)
                                                EffectsModule.ClickButton(v26.Give)
                                                GeneralModule.PlaySound("ButtonClick")
                                                task.wait(0.25)
                                                v2:Fire("DeductCoin", {
                                                    PassengerValues = PassengerValues,
                                                    Value = v72,
                                                    Password = Code.code
                                                })
                                                if OtherValues.IsDrivingAJeepney.Value and p1:IsDescendantOf(workspace.Jeepnies) then
                                                    BinigayNaYungSukli()
                                                    return
                                                end
                                                local v1 = OtherValues.IsDrivingAJeepney:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 2088 | Upvalues: OtherValues (ref), p1 (ref), BinigayNaYungSukli (ref) ]]
                                                    if OtherValues.IsDrivingAJeepney.Value and p1:IsDescendantOf(workspace.Jeepnies) then
                                                        BinigayNaYungSukli()
                                                    end
                                                end)
                                                p2.Destroying:Once(function() --[[ Line: 2094 | Upvalues: v1 (copy) ]]
                                                    v1:Disconnect()
                                                end)
                                            end
                                        end)
                                        v26.Destroying:Once(function() --[[ Line: 2101 | Upvalues: v73 (copy), v8 (copy), v52 (copy), v62 (copy) ]]
                                            v73:Disconnect()
                                            v8:Disconnect()
                                            v52:Disconnect()
                                            v62:Disconnect()
                                        end)
                                    else
                                        return
                                    end
                                else
                                    return
                                end
                            end
                        end
                        task.delay(1, function() --[[ Line: 2110 | Upvalues: v28 (ref), v26 (ref), p2 (ref), v6 (ref), GeneralModule (ref), EffectsModule (ref), OtherValues (ref), p1 (ref), KinuhaNaYungBayad (copy) ]]
                            v28 = false
                            v26.Take.MouseButton1Click:Connect(function() --[[ Line: 2113 | Upvalues: v28 (ref), p2 (ref), v6 (ref), GeneralModule (ref), EffectsModule (ref), v26 (ref), OtherValues (ref), p1 (ref), KinuhaNaYungBayad (ref) ]]
                                if v28 or (p2.HumanoidRootPart.VoiceOverBoundBox.Voice.Playing or not (v6 < 200)) then
                                    print(2)
                                    return
                                end
                                v28 = true
                                task.delay(0.25, function() --[[ Line: 2116 | Upvalues: v28 (ref) ]]
                                    v28 = false
                                end)
                                GeneralModule.PlaySound("ButtonClick")
                                EffectsModule.ClickButton(v26.Take)
                                if OtherValues.IsDrivingAJeepney.Value and p1:IsDescendantOf(workspace.Jeepnies) then
                                    KinuhaNaYungBayad()
                                else
                                    local v1 = OtherValues.IsDrivingAJeepney:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 2126 | Upvalues: OtherValues (ref), p1 (ref), KinuhaNaYungBayad (ref) ]]
                                        if OtherValues.IsDrivingAJeepney.Value and p1:IsDescendantOf(workspace.Jeepnies) then
                                            KinuhaNaYungBayad()
                                        end
                                    end)
                                    p2.Destroying:Once(function() --[[ Line: 2132 | Upvalues: v1 (copy) ]]
                                        v1:Disconnect()
                                    end)
                                end
                            end)
                        end)
                        task.wait(120)
                        if p2:IsDescendantOf(workspace.Passengers) then
                            if v152 then
                                if not v162 and v152 then
                                    NotificationContainer.add({
                                        Text = "Return the change to your passenger!",
                                        Color = v4,
                                        Stroke = {
                                            Thickness = 1,
                                            Color = v7
                                        }
                                    })
                                end
                            else
                                NotificationContainer.add({
                                    Text = "Take the payment of your passenger!",
                                    Color = v4,
                                    Stroke = {
                                        Thickness = 1,
                                        Color = v7
                                    }
                                })
                            end
                        end
                    else
                        print(1)
                    end
                end
            end
        end
        if not v27 then
            if p2:GetAttribute("RepresentativeNungMagkakasama") then
                ChooseDestination()
            else
                v3 = p4:WaitForChild("Humanoid")
            end
            if p2:GetAttribute("RepresentativeNungMagkakasama") then
                if v12:GetAttribute("Place8") then
                    local v31 = math.random(1, 8)
                    if v31 == 1 then
                        v5 = v12:GetAttribute("Place")
                    elseif v31 == 2 then
                        v5 = v12:GetAttribute("Place2")
                    elseif v31 == 3 then
                        v5 = v12:GetAttribute("Place3")
                    elseif v31 == 4 then
                        v5 = v12:GetAttribute("Place4")
                    elseif v31 == 5 then
                        v5 = v12:GetAttribute("Place5")
                    elseif v31 == 6 then
                        v5 = v12:GetAttribute("Place6")
                    elseif v31 == 7 then
                        v5 = v12:GetAttribute("Place7")
                    elseif v31 == 8 then
                        v5 = v12:GetAttribute("Place8")
                    end
                elseif v12:GetAttribute("Place7") then
                    local v32 = math.random(1, 7)
                    if v32 == 1 then
                        v5 = v12:GetAttribute("Place")
                    elseif v32 == 2 then
                        v5 = v12:GetAttribute("Place2")
                    elseif v32 == 3 then
                        v5 = v12:GetAttribute("Place3")
                    elseif v32 == 4 then
                        v5 = v12:GetAttribute("Place4")
                    elseif v32 == 5 then
                        v5 = v12:GetAttribute("Place5")
                    elseif v32 == 6 then
                        v5 = v12:GetAttribute("Place6")
                    elseif v32 == 7 then
                        v5 = v12:GetAttribute("Place7")
                    end
                elseif v12:GetAttribute("Place6") then
                    local v33 = math.random(1, 6)
                    if v33 == 1 then
                        v5 = v12:GetAttribute("Place")
                    elseif v33 == 2 then
                        v5 = v12:GetAttribute("Place2")
                    elseif v33 == 3 then
                        v5 = v12:GetAttribute("Place3")
                    elseif v33 == 4 then
                        v5 = v12:GetAttribute("Place4")
                    elseif v33 == 5 then
                        v5 = v12:GetAttribute("Place5")
                    elseif v33 == 6 then
                        v5 = v12:GetAttribute("Place6")
                    end
                elseif v12:GetAttribute("Place5") then
                    local v34 = math.random(1, 5)
                    if v34 == 1 then
                        v5 = v12:GetAttribute("Place")
                    elseif v34 == 2 then
                        v5 = v12:GetAttribute("Place2")
                    elseif v34 == 3 then
                        v5 = v12:GetAttribute("Place3")
                    elseif v34 == 4 then
                        v5 = v12:GetAttribute("Place4")
                    elseif v34 == 5 then
                        v5 = v12:GetAttribute("Place5")
                    end
                elseif v12:GetAttribute("Place4") then
                    local v35 = math.random(1, 4)
                    if v35 == 1 then
                        v5 = v12:GetAttribute("Place")
                    elseif v35 == 2 then
                        v5 = v12:GetAttribute("Place2")
                    elseif v35 == 3 then
                        v5 = v12:GetAttribute("Place3")
                    elseif v35 == 4 then
                        v5 = v12:GetAttribute("Place4")
                    end
                elseif v12:GetAttribute("Place3") then
                    local v36 = math.random(1, 3)
                    if v36 == 1 then
                        v5 = v12:GetAttribute("Place")
                    elseif v36 == 2 then
                        v5 = v12:GetAttribute("Place2")
                    elseif v36 == 3 then
                        v5 = v12:GetAttribute("Place3")
                    end
                elseif v12:GetAttribute("Place2") then
                    local v37 = math.random(1, 2)
                    if v37 == 1 then
                        v5 = v12:GetAttribute("Place")
                    elseif v37 == 2 then
                        v5 = v12:GetAttribute("Place2")
                    end
                else
                    v5 = v12:GetAttribute("Place")
                end
            end
            local v38 = PassengerValues:GetAttributeChangedSignal("MayPumapara"):Connect(function() --[[ Line: 2269 | Upvalues: v192 (ref), PassengerValues (copy), p2 (copy), ScrollingFrame (ref), t6 (ref), Frame (ref), v2 (ref), Code (ref), v24 (ref), VoiceOverBoundBox (copy) ]]
                if not v192 and (math.random(1, 15) == 2 and (PassengerValues:GetAttribute("MayPumapara") and p2:GetAttribute("RepresentativeNungMagkakasama"))) then
                    task.wait(math.random(4, 8))
                    if PassengerValues:GetAttribute("MayPumapara") then
                        local v1 = ScrollingFrame.Frame.PassengerChatTemplate:Clone()
                        v1.Parent = ScrollingFrame.Frame
                        v1.Visible = true
                        local v22 = t6[math.random(1, #t6)]
                        Frame.Notif.Visible = true
                        v1.TextLabel.Text = v22
                        v2:Fire("PassengerChatted", {
                            Text = v22,
                            Character = p2,
                            Password = Code.code
                        })
                        v24 = true
                        v2:Fire("PlayVoiceOver", {
                            Play_Or_Not = true,
                            VoiceOver = VoiceOverBoundBox:FindFirstChild(v22),
                            Passenger = p2,
                            Password = Code.code
                        })
                        task.wait(3)
                        v1:Destroy()
                        v2:Fire("PassengerUnchatted", {
                            Character = p2,
                            Password = Code.code
                        })
                        v24 = false
                    end
                end
            end)
            local v39 = p1.JeepneyValues:GetAttributeChangedSignal("Crashed"):Connect(function() --[[ Line: 2298 | Upvalues: p1 (copy), p2 (copy), ScrollingFrame (ref), t8 (ref), Frame (ref), v2 (ref), Code (ref), v24 (ref), VoiceOverBoundBox (copy) ]]
                if p1.JeepneyValues:GetAttribute("Crashed") and (p2:GetAttribute("RepresentativeNungMagkakasama") and math.random(1, 3) == 1) then
                    local v1 = ScrollingFrame.Frame.PassengerChatTemplate:Clone()
                    v1.Parent = ScrollingFrame.Frame
                    v1.Visible = true
                    local v22 = t8[math.random(1, #t8)]
                    Frame.Notif.Visible = true
                    v1.TextLabel.Text = v22
                    v2:Fire("PassengerChatted", {
                        Text = v22,
                        Character = p2,
                        Password = Code.code
                    })
                    v24 = true
                    v2:Fire("PlayVoiceOver", {
                        Play_Or_Not = true,
                        VoiceOver = VoiceOverBoundBox:FindFirstChild(v22),
                        Passenger = p2,
                        Password = Code.code
                    })
                    task.wait(3)
                    v1:Destroy()
                    v2:Fire("PassengerUnchatted", {
                        Character = p2,
                        Password = Code.code
                    })
                    v24 = false
                end
            end)
            p2.Destroying:Once(function() --[[ Line: 2325 | Upvalues: v27 (ref), v38 (copy), v39 (copy) ]]
                v27 = true
                v38:Disconnect()
                v39:Disconnect()
            end)
            coroutine.wrap(function() --[[ Line: 2332 | Upvalues: v27 (ref), v10 (ref), v17 (ref), v18 (ref), v19 (ref), v15 (ref), v16 (ref), v2 (ref), p1 (copy), Code (ref), SeatOrSabitPart (ref), p2 (copy), v23 (ref), v30 (copy), v9 (ref), v12 (ref), DriveSeat (copy), v21 (ref), ScrollingFrame (ref), Frame (ref), VoiceOverBoundBox (copy), v24 (ref), v192 (ref), t3 (ref), t4 (ref), PassengerValues (copy), NotificationContainer (ref), v4 (ref), v7 (ref), leaderstats (ref), v38 (copy), v20 (ref), v29 (ref), v182 (ref), v162 (ref), v82 (ref), v25 (ref), v1 (ref), v172 (ref), v6 (ref), v3 (ref), p4 (copy) ]]
                local v13
                while true do
                    if not task.wait(0.5) or v27 then
                        return
                    end
                    if v10 > 0 and not (v17.IsPlaying or (v18.IsPlaying or (v19.IsPlaying or (v15.IsPlaying or v16.IsPlaying)))) then
                        v17.Looped = true
                        v2:Fire("ChangeFLsTransparency", {
                            Jeepney = p1,
                            Limb = "Right Arm",
                            True_Or_False = false,
                            Password = Code.code
                        })
                        v17:Play(0.5, 1, 1.35)
                    end
                    SeatOrSabitPart = p2.SeatOrSabitPart.Value
                    if math.random(1, 150) == 16 and (SeatOrSabitPart:GetAttribute("MayHawakanBaSaTaas") and p2.Humanoid.BodyHeightScale.Value >= 0.8) then
                        if v23 then
                            v23 = false
                            v30:Stop()
                        else
                            v23 = true
                            v30:Play()
                        end
                    end
                    if not p2:GetAttribute("RepresentativeNungMagkakasama") then
                        if not v20 and (not v3.Sit and (not p4:GetAttribute("Kicked") and p4:GetAttribute("IsInDestination"))) then
                            v20 = true
                            v30:Stop()
                            v2:Fire("UnloadPassenger", {
                                Jeepney = p1,
                                Passenger = p2,
                                Seat = p2.SeatOrSabitPart.Value,
                                Destination = v12,
                                Password = Code.code
                            })
                        end
                        continue
                    end
                    if v9 and (v12:GetAttribute("Kanto") and (v12.Position - DriveSeat.Position).Magnitude < 150) then
                        v21 = true
                        local v22 = ScrollingFrame.Frame.PassengerChatTemplate:Clone()
                        v22.Parent = ScrollingFrame.Frame
                        v22.Visible = true
                        Frame.Notif.Visible = true
                        v22.TextLabel.Text = "Meron po."
                        v2:Fire("PassengerChatted", {
                            Text = "Meron po.",
                            Character = p2,
                            Password = Code.code
                        })
                        v2:Fire("PlayVoiceOver", {
                            Play_Or_Not = true,
                            VoiceOver = VoiceOverBoundBox:FindFirstChild("Meron po"),
                            Passenger = p2,
                            Password = Code.code
                        })
                        v24 = true
                        task.wait(2)
                        v22:Destroy()
                        v2:Fire("PassengerUnchatted", {
                            Character = p2,
                            Password = Code.code
                        })
                        v24 = false
                    end
                    v13 = (v12.Position - DriveSeat.Position).Magnitude < 200
                    if v13 or v192 then
                        break
                    end
                end
                local BackLookVectorPart = p1.Body.Structure.BackLookVectorPart
                local v42 = math.pow((BackLookVectorPart.CFrame.LookVector - (v12.CFrame.Position - BackLookVectorPart.Position).Unit).Magnitude / 2, 2)
                local v5 = DriveSeat.AssemblyLinearVelocity.Magnitude < 0.05
                local v62 = (v12.Position - DriveSeat.Position).Magnitude < 100
                local v72 = v42 <= 0.4027777777777778
                local v8 = string.find(v12.Name, "TerminalDropPoint")
                if v62 and not (v192 or v8) then
                    v192 = true
                    local v92 = nil
                    if v12:GetAttribute("Kanto") and math.random(1, 2) == 2 then
                        if not v21 then
                            v92 = t4[math.random(1, #t4)]
                        end
                    else
                        v92 = t3[math.random(1, #t3)]
                    end
                    if v92 and not v21 then
                        local v102 = ScrollingFrame.Frame.PassengerChatTemplate:Clone()
                        v102.Parent = ScrollingFrame.Frame
                        v102.Visible = true
                        Frame.Notif.Visible = true
                        v102.TextLabel.Text = v92
                        v2:Fire("PassengerChatted", {
                            Text = v92,
                            Character = p2,
                            Password = Code.code
                        })
                        v24 = true
                        v2:Fire("PlayVoiceOver", {
                            Play_Or_Not = true,
                            VoiceOver = VoiceOverBoundBox:FindFirstChild(v92),
                            Passenger = p2,
                            Password = Code.code
                        })
                        v2:Fire("MayPumapara", {
                            PassengerValues = PassengerValues,
                            Check_Or_Ekis = true,
                            Password = Code.code
                        })
                        p2.Humanoid:GetPropertyChangedSignal("Sit"):Once(function() --[[ Line: 2430 | Upvalues: v102 (copy), v2 (ref), p2 (ref), Code (ref), v24 (ref), PassengerValues (ref) ]]
                            v102:Destroy()
                            v2:Fire("PassengerUnchatted", {
                                Character = p2,
                                Password = Code.code
                            })
                            v24 = false
                            v2:Fire("MayPumapara", {
                                PassengerValues = PassengerValues,
                                Check_Or_Ekis = false,
                                Password = Code.code
                            })
                        end)
                    end
                    local v11 = task.delay(10, function() --[[ Line: 2438 | Upvalues: p2 (ref), NotificationContainer (ref), v4 (ref), v7 (ref), leaderstats (ref), v2 (ref), Code (ref) ]]
                        if p2 and p2.Humanoid.Sit then
                            NotificationContainer.add({
                                Text = "Unload your passenger!",
                                Color = v4,
                                Stroke = {
                                    Thickness = 1,
                                    Color = v7
                                }
                            })
                            if leaderstats.Exp.Value > 5 then
                                v2:Fire("DeductExp", {
                                    Value = 5,
                                    Password = Code.code
                                })
                                return
                            end
                            v2:Fire("DeductExp", {
                                Value = leaderstats.Exp.Value,
                                Password = Code.code
                            })
                        end
                    end)
                    p2.Destroying:Once(function() --[[ Line: 2452 | Upvalues: v11 (copy), v38 (ref) ]]
                        task.cancel(v11)
                        v38:Disconnect()
                    end)
                elseif v62 and (not v192 and v8) then
                    v192 = true
                    if math.random(1, 4) == 2 then
                        local v122 = t3[math.random(1, #t3)]
                        if v122 and not v21 then
                            local v132 = ScrollingFrame.Frame.PassengerChatTemplate:Clone()
                            v132.Parent = ScrollingFrame.Frame
                            v132.Visible = true
                            Frame.Notif.Visible = true
                            v132.TextLabel.Text = v122
                            v2:Fire("PassengerChatted", {
                                Text = v122,
                                Character = p2,
                                Password = Code.code
                            })
                            v24 = true
                            v2:Fire("PlayVoiceOver", {
                                Play_Or_Not = true,
                                VoiceOver = VoiceOverBoundBox:FindFirstChild(v122),
                                Passenger = p2,
                                Password = Code.code
                            })
                            p2.Humanoid:GetPropertyChangedSignal("Sit"):Once(function() --[[ Line: 2474 | Upvalues: v132 (copy), v2 (ref), p2 (ref), Code (ref), v24 (ref) ]]
                                v132:Destroy()
                                v2:Fire("PassengerUnchatted", {
                                    Character = p2,
                                    Password = Code.code
                                })
                                v24 = false
                            end)
                        end
                    end
                    local v14 = task.delay(30, function() --[[ Line: 2482 | Upvalues: p2 (ref), NotificationContainer (ref), v4 (ref), v7 (ref), leaderstats (ref), v2 (ref), Code (ref) ]]
                        if p2 and p2.Humanoid.Sit then
                            NotificationContainer.add({
                                Text = "Unload your passenger!",
                                Color = v4,
                                Stroke = {
                                    Thickness = 1,
                                    Color = v7
                                }
                            })
                            if leaderstats.Exp.Value > 5 then
                                v2:Fire("DeductExp", {
                                    Value = 5,
                                    Password = Code.code
                                })
                                return
                            end
                            v2:Fire("DeductExp", {
                                Value = leaderstats.Exp.Value,
                                Password = Code.code
                            })
                        end
                    end)
                    p2.Destroying:Once(function() --[[ Line: 2496 | Upvalues: v14 (copy) ]]
                        task.cancel(v14)
                    end)
                end
                if v8 or v20 then
                    if v8 and (not v20 and (v13 and v5)) then
                        break
                    else
                        continue
                    end
                elseif v62 and v5 then
                    v20 = true
                    v30:Stop()
                    v2:Fire("UnloadPassenger", {
                        Jeepney = p1,
                        Passenger = p2,
                        Seat = p2.SeatOrSabitPart.Value,
                        Destination = v12,
                        Password = Code.code
                    })
                    if v29 then
                    end
                    if v182 then
                        if v162 and not v172 then
                            if not (PassengerValues:GetAttribute("IsThereAConductor") or v25) then
                                NotificationContainer.add({
                                    Text = "\226\130\177" .. v82 .. " Passengers Payment has been deducted from your balance for not delivering them to their destination/not giving their change!",
                                    Color = v4,
                                    Stroke = {
                                        Thickness = 1,
                                        Color = v7
                                    }
                                })
                            end
                            if v82 - v6 < leaderstats.Cash.Value then
                                if not PassengerValues:GetAttribute("IsThereAConductor") then
                                    v2:Fire("DeductCash", {
                                        Value = v82 - v6,
                                        Password = Code.code
                                    })
                                end
                                v2:Fire("DeductOnHoldCash", {
                                    Value = v82,
                                    Password = Code.code
                                })
                            elseif v82 - v6 < PassengerValues:GetAttribute("Barya") then
                                if not PassengerValues:GetAttribute("IsThereAConductor") then
                                    v2:Fire("DeductCoin", {
                                        PassengerValues = PassengerValues,
                                        Value = v82,
                                        Password = Code.code
                                    })
                                end
                                v2:Fire("DeductOnHoldCash", {
                                    Value = v82,
                                    Password = Code.code
                                })
                            else
                                if not PassengerValues:GetAttribute("IsThereAConductor") then
                                    v2:Fire("DeductCoin", {
                                        PassengerValues = PassengerValues,
                                        Value = PassengerValues:GetAttribute("Barya"),
                                        Password = Code.code
                                    })
                                    v2:Fire("DeductCash", {
                                        Value = leaderstats.Cash.Value,
                                        Password = Code.code
                                    })
                                end
                                v2:Fire("DeductOnHoldCash", {
                                    Value = v1.OnHoldCash.Value,
                                    Password = Code.code
                                })
                            end
                        else
                            if v172 and v162 then
                                v2:Fire("DeductOnHoldCash", {
                                    Value = v82,
                                    Password = Code.code
                                })
                                return
                            end
                            if not (PassengerValues:GetAttribute("IsThereAConductor") or v25) then
                                NotificationContainer.add({
                                    Text = "\226\130\177" .. v82 .. " Passengers Payment has been deducted from your balance for not delivering them to their destination/not giving their change!",
                                    Color = v4,
                                    Stroke = {
                                        Thickness = 1,
                                        Color = v7
                                    }
                                })
                            end
                            if v82 < leaderstats.Cash.Value then
                                if not PassengerValues:GetAttribute("IsThereAConductor") then
                                    v2:Fire("DeductCash", {
                                        Value = v82,
                                        Password = Code.code
                                    })
                                end
                                v2:Fire("DeductOnHoldCash", {
                                    Value = v82,
                                    Password = Code.code
                                })
                            elseif v82 < PassengerValues:GetAttribute("Barya") then
                                if not PassengerValues:GetAttribute("IsThereAConductor") then
                                    v2:Fire("DeductCoin", {
                                        PassengerValues = PassengerValues,
                                        Value = v82,
                                        Password = Code.code
                                    })
                                end
                                v2:Fire("DeductOnHoldCash", {
                                    Value = v82,
                                    Password = Code.code
                                })
                            else
                                if not PassengerValues:GetAttribute("IsThereAConductor") then
                                    v2:Fire("DeductCoin", {
                                        PassengerValues = PassengerValues,
                                        Value = PassengerValues:GetAttribute("Barya"),
                                        Password = Code.code
                                    })
                                    v2:Fire("DeductCash", {
                                        Value = leaderstats.Cash.Value,
                                        Password = Code.code
                                    })
                                end
                                v2:Fire("DeductOnHoldCash", {
                                    Value = v1.OnHoldCash.Value,
                                    Password = Code.code
                                })
                            end
                        end
                    else
                        if v162 then
                            v2:Fire("DeductOnHoldCash", {
                                Value = v82,
                                Password = Code.code
                            })
                            return
                        end
                        if not (PassengerValues:GetAttribute("IsThereAConductor") or v25) then
                            NotificationContainer.add({
                                Text = "\226\130\177" .. v82 .. " Passengers Payment has been deducted from your balance for not delivering them to their destination/not giving their change!",
                                Color = v4,
                                Stroke = {
                                    Thickness = 1,
                                    Color = v7
                                }
                            })
                        end
                        if v82 < leaderstats.Cash.Value then
                            if not PassengerValues:GetAttribute("IsThereAConductor") then
                                v2:Fire("DeductCash", {
                                    Value = v82,
                                    Password = Code.code
                                })
                            end
                            v2:Fire("DeductOnHoldCash", {
                                Value = v82,
                                Password = Code.code
                            })
                        elseif v82 < PassengerValues:GetAttribute("Barya") then
                            if not PassengerValues:GetAttribute("IsThereAConductor") then
                                v2:Fire("DeductCoin", {
                                    PassengerValues = PassengerValues,
                                    Value = v82,
                                    Password = Code.code
                                })
                            end
                            v2:Fire("DeductOnHoldCash", {
                                Value = v82,
                                Password = Code.code
                            })
                        else
                            if not PassengerValues:GetAttribute("IsThereAConductor") then
                                v2:Fire("DeductCoin", {
                                    PassengerValues = PassengerValues,
                                    Value = PassengerValues:GetAttribute("Barya"),
                                    Password = Code.code
                                })
                                v2:Fire("DeductCash", {
                                    Value = leaderstats.Cash.Value,
                                    Password = Code.code
                                })
                            end
                            v2:Fire("DeductOnHoldCash", {
                                Value = v1.OnHoldCash.Value,
                                Password = Code.code
                            })
                        end
                    end
                    if not PassengerValues:GetAttribute("IsThereAConductor") and leaderstats.Exp.Value > 0 then
                        v2:Fire("DeductExp", {
                            Value = 1,
                            Password = Code.code
                        })
                    end
                elseif v72 and (v192 and v5) then
                    break
                else
                    continue
                end
                v20 = true
                v30:Stop()
                v2:Fire("UnloadPassenger", {
                    Jeepney = p1,
                    Passenger = p2,
                    Seat = p2.SeatOrSabitPart.Value,
                    Destination = v12,
                    Password = Code.code
                })
            end)()
            if p2:GetAttribute("Type") == "Student" then
                task.wait(2)
            else
                task.wait(math.random(1, 10))
            end
            if PassengerValues:GetAttribute("IsThereAConductor") then
                if p2:GetAttribute("RepresentativeNungMagkakasama") and not (p2:GetAttribute("IsKicked") or v29) then
                    local t = {
                        nameOfDestination = v5,
                        total = v72,
                        onHoldCashForThisPassenger = v82,
                        unholdedCashForThisPassenger = v92,
                        numOfClicksDunSaMgaBarya = v10,
                        numOfClicksSaMgaBaryaMataposMagResetNgSukli = v122,
                        magkanoYungKulang = v132,
                        magkanoYungSobra = v14,
                        nakuhaNaYungBayad = v152,
                        nabigayNaYungSukli = v162,
                        nabigayNaYungKulang = v172,
                        kulangBaAngSukli = v182,
                        nakapagGenerateNaNgBayadTemplate = v222,
                        isChatBubbleEnabled = v24,
                        fare = v6,
                        chosenCash = v42,
                        SpawnPointBarangay = p3:GetAttribute("Barrangay"),
                        ChosenDestinationBarangay = v12:GetAttribute("Barrangay"),
                        PassengerName = p2.Name
                    }
                    table.insert(t14, t)
                    local v41 = Players:FindFirstChild(PassengerValues:GetAttribute("ConductorName"))
                    PassengerValues:GetAttributeChangedSignal("ConductorName"):Once(function() --[[ Line: 2815 | Upvalues: v2 (ref), p2 (copy), Code (ref), PassengerValues (copy) ]]
                        v2:Fire("PassengerUnchatted", {
                            Character = p2,
                            Password = Code.code
                        })
                        v2:Fire("ChangeConductor", {
                            PassengerValues = PassengerValues,
                            ConductorName = "None",
                            Password = Code.code
                        })
                    end)
                    workspace:FindFirstChild(v41.Name).Humanoid.Died:Once(function() --[[ Line: 2819 | Upvalues: v41 (copy), PassengerValues (copy), v2 (ref), p2 (copy), Code (ref) ]]
                        if v41.Name == PassengerValues:GetAttribute("ConductorName") then
                            v2:Fire("PassengerUnchatted", {
                                Character = p2,
                                Password = Code.code
                            })
                        end
                    end)
                    workspace:FindFirstChild(v41.Name).Destroying:Once(function() --[[ Line: 2826 | Upvalues: v41 (copy), PassengerValues (copy), v13 (ref), v6 (ref), Frame_6 (ref), v2 (ref), Code (ref), v8 (ref) ]]
                        if v41.Name == PassengerValues:GetAttribute("ConductorName") then
                            v13 = v13 + v6
                            Frame_6.List.Frame.ConductorName.NameTextBox.Text = "None"
                            v2:Fire("ChangeConductor", {
                                PassengerValues = PassengerValues,
                                ConductorName = "None",
                                Password = Code.code
                            })
                            task.wait(0.5)
                            task.delay(v8:NextNumber(0.1, 1), function() --[[ Line: 2835 | Upvalues: v13 (ref) ]]
                                if v13 > 0 then
                                    v13 = 0
                                end
                            end)
                        end
                    end)
                    if not t14[2] then
                        task.wait(1.5)
                        if PassengerValues:GetAttribute("IsThereAConductor") then
                            v2:Fire("PassBayadCtoS", PassengerValues:GetAttribute("ConductorName"), LocalPlayer.Name, t14)
                        end
                        table.clear(t14)
                    end
                end
            elseif Players:FindFirstChild(PassengerValues:GetAttribute("ConductorName")) then
                local v422 = false
                while true do
                    for v43, v44 in p1.Body.FunctionalStuff.Seats:GetChildren() do
                        if v44.Name == "FrontSeat" and (v44:FindFirstChild("SeatWeld") and v44:FindFirstChild("SeatWeld").Part1.Parent.Name == PassengerValues:GetAttribute("ConductorName")) then
                            v422 = true
                        end
                    end
                    task.wait()
                    if v422 and (p2:GetAttribute("RepresentativeNungMagkakasama") and not (p2:GetAttribute("IsKicked") or v29)) then
                        if OtherValues.IsDrivingAJeepney.Value and (not v222 and p1:IsDescendantOf(workspace.Jeepnies)) then
                            Fare()
                        elseif not OtherValues.IsDrivingAJeepney.Value then
                            local v45 = OtherValues.IsDrivingAJeepney:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 2755 | Upvalues: OtherValues (ref), v222 (ref), p1 (copy), Fare (copy) ]]
                                if OtherValues.IsDrivingAJeepney.Value and (not v222 and p1:IsDescendantOf(workspace.Jeepnies)) then
                                    Fare()
                                end
                            end)
                            p2.Destroying:Once(function() --[[ Line: 2761 | Upvalues: v45 (copy) ]]
                                v45:Disconnect()
                            end)
                        end
                    end
                end
            else
                if p2:GetAttribute("RepresentativeNungMagkakasama") and not (p2:GetAttribute("IsKicked") or v29) then
                    if OtherValues.IsDrivingAJeepney.Value and (not v222 and p1:IsDescendantOf(workspace.Jeepnies)) then
                        Fare()
                    elseif not OtherValues.IsDrivingAJeepney.Value then
                        local v46 = OtherValues.IsDrivingAJeepney:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 2772 | Upvalues: OtherValues (ref), v222 (ref), p1 (copy), Fare (copy) ]]
                            if OtherValues.IsDrivingAJeepney.Value and (not v222 and p1:IsDescendantOf(workspace.Jeepnies)) then
                                Fare()
                            end
                        end)
                        p2.Destroying:Once(function() --[[ Line: 2778 | Upvalues: v46 (copy) ]]
                            v46:Disconnect()
                        end)
                    end
                end
            end
        end
    end
end
local function PassBayadsStoC(p1, p2) --[[ PassBayadsStoC | Line: 2867 | Upvalues: t (copy) ]]
    for v1, v2 in p2 do
        task.spawn(t.Conductor, p1, v2)
    end
end
Remotes.LoadedPassenger.OnClientEvent:Connect(t.LoadedPassenger)
Remotes.PassBayadStoC.OnClientEvent:Connect(PassBayadsStoC)
function t.Chat() --[[ Chat | Line: 2878 | Upvalues: Frame_5 (copy), Frame_6 (copy), Frame_7 (copy), EffectsModule (copy), Frame_4 (copy), v2 (copy), LocalPlayer (copy), Code (copy), v9 (ref), GeneralModule (copy), v3 (ref) ]]
    Frame_5.Parent.Visible = false
    Frame_6.Parent.Visible = false
    Frame_7.Parent.Visible = false
    EffectsModule.OpenFrame(Frame_4.Parent, false, 0)
    local Frame = Frame_4.List.Frame
    local function DealWithClick(p1) --[[ DealWithClick | Line: 2886 | Upvalues: v2 (ref), LocalPlayer (ref), Code (ref), v9 (ref) ]]
        v2:Fire("PlayVoiceOver", {
            Play_Or_Not = true,
            VoiceOver = LocalPlayer.Character.Head[p1.Name],
            Passenger = LocalPlayer.Character,
            Password = Code.code
        })
        if p1.Name == "SaKantoPo" then
            v9 = true
            task.delay(0.4, function() --[[ Line: 2893 | Upvalues: v9 (ref) ]]
                v9 = false
            end)
        end
    end
    for v1, v22 in Frame:GetChildren() do
        if v22:IsA("Frame") then
            local Size = v22.Size
            local v32 = v22.MouseEnter:Connect(function() --[[ Line: 2905 | Upvalues: GeneralModule (ref), v22 (copy), Size (copy) ]]
                GeneralModule.PlaySound("Hover")
                if v22.Size == Size then
                    v22.Size = UDim2.fromScale(Size.X.Scale - Size.X.Scale * 5 / 100, Size.Y.Scale - Size.Y.Scale * 5 / 100)
                end
                v22.MouseLeave:Once(function() --[[ Line: 2911 | Upvalues: v22 (ref), Size (ref) ]]
                    v22.Size = Size
                end)
            end)
            local v4 = v22.Button.MouseButton1Click:Connect(function() --[[ Line: 2916 | Upvalues: EffectsModule (ref), v22 (copy), GeneralModule (ref), v3 (ref), DealWithClick (copy) ]]
                EffectsModule.ClickButton(v22)
                GeneralModule.PlaySound("ButtonClick")
                if not v3 then
                    v3 = true
                    DealWithClick(v22)
                    task.wait(1)
                    v3 = false
                end
            end)
            Frame_4.Parent:GetPropertyChangedSignal("Visible"):Once(function() --[[ Line: 2929 | Upvalues: v4 (copy), v32 (copy) ]]
                v4:Disconnect()
                v32:Disconnect()
            end)
        end
    end
    local Size = Frame_4.Close.Size
    local v5 = Frame_4.Close.MouseEnter:Connect(function() --[[ Line: 2938 | Upvalues: GeneralModule (ref), Frame_4 (ref), Size (copy) ]]
        GeneralModule.PlaySound("Hover")
        if Frame_4.Close.Size == Size then
            Frame_4.Close.Size = UDim2.fromScale(Size.X.Scale - Size.X.Scale * 10 / 100, Size.Y.Scale - Size.Y.Scale * 10 / 100)
        end
        Frame_4.Close.MouseLeave:Once(function() --[[ Line: 2944 | Upvalues: Frame_4 (ref), Size (ref) ]]
            Frame_4.Close.Size = Size
        end)
    end)
    local v6 = Frame_4.Close.MouseButton1Click:Connect(function() --[[ Line: 2949 | Upvalues: GeneralModule (ref), v3 (ref), EffectsModule (ref), Frame_4 (ref) ]]
        GeneralModule.PlaySound("ButtonClick")
        if not v3 then
            v3 = true
            EffectsModule.CloseFrame(Frame_4.Parent, false, 0)
            task.wait(0.25)
            v3 = false
        end
    end)
    Frame_4.Parent:GetPropertyChangedSignal("Visible"):Once(function() --[[ Line: 2960 | Upvalues: v6 (copy), v5 (copy) ]]
        v6:Disconnect()
        v5:Disconnect()
    end)
end
function t.HandGesture() --[[ HandGesture | Line: 2966 | Upvalues: LocalPlayer (copy), Frame_4 (copy), Frame_6 (copy), Frame_7 (copy), EffectsModule (copy), Frame_5 (copy), v2 (copy), Code (copy), t15 (ref), OtherValues (copy), GeneralModule (copy), v3 (ref) ]]
    local v1 = workspace.Jeepnies:FindFirstChild(LocalPlayer.Name)
    Frame_4.Parent.Visible = false
    Frame_6.Parent.Visible = false
    Frame_7.Parent.Visible = false
    EffectsModule.OpenFrame(Frame_5.Parent, false, 0)
    local Frame = Frame_5.List.Frame
    local function DealWithClick(p1) --[[ DealWithClick | Line: 2975 | Upvalues: v2 (ref), v1 (copy), Code (ref), t15 (ref), OtherValues (ref) ]]
        if p1.Name == "Hand Gesture 1" or (p1.Name == "Hand Gesture 2" or p1.Name == "Hand Gesture 6") then
            v2:Fire("ChangeFLsTransparency", {
                Jeepney = v1,
                Limb = "Right Arm",
                True_Or_False = false,
                Password = Code.code
            })
        else
            v2:Fire("ChangeFLsTransparency", {
                Jeepney = v1,
                Limb = "Left Arm",
                True_Or_False = false,
                Password = Code.code
            })
        end
        local v12 = t15[p1.Name]
        v12:Play(0.5, 1, 0.75)
        task.wait(v12.Length * 1.85)
        v12:Stop()
        if p1.Name == "Hand Gesture 1" or (p1.Name == "Hand Gesture 2" or p1.Name == "Hand Gesture 6") then
            if OtherValues.IsDrivingAJeepney.Value then
                v2:Fire("ChangeFLsTransparency", {
                    Jeepney = v1,
                    Limb = "Right Arm",
                    True_Or_False = true,
                    Password = Code.code
                })
            end
        elseif OtherValues.IsDrivingAJeepney.Value then
            v2:Fire("ChangeFLsTransparency", {
                Jeepney = v1,
                Limb = "Left Arm",
                True_Or_False = true,
                Password = Code.code
            })
        end
    end
    for v22, v32 in Frame:GetChildren() do
        if v32:IsA("Frame") then
            local Size = v32.Size
            local v4 = v32.MouseEnter:Connect(function() --[[ Line: 3004 | Upvalues: GeneralModule (ref), v32 (copy), Size (copy) ]]
                GeneralModule.PlaySound("Hover")
                if v32.Size == Size then
                    v32.Size = UDim2.fromScale(Size.X.Scale - Size.X.Scale * 5 / 100, Size.Y.Scale - Size.Y.Scale * 5 / 100)
                end
                v32.MouseLeave:Once(function() --[[ Line: 3010 | Upvalues: v32 (ref), Size (ref) ]]
                    v32.Size = Size
                end)
            end)
            local v5 = v32.Button.MouseButton1Click:Connect(function() --[[ Line: 3015 | Upvalues: EffectsModule (ref), v32 (copy), GeneralModule (ref), v3 (ref), DealWithClick (copy) ]]
                EffectsModule.ClickButton(v32)
                GeneralModule.PlaySound("ButtonClick")
                if not v3 then
                    v3 = true
                    DealWithClick(v32)
                    task.wait(0.4)
                    v3 = false
                end
            end)
            Frame_5.Parent:GetPropertyChangedSignal("Visible"):Once(function() --[[ Line: 3028 | Upvalues: v5 (copy), v4 (copy) ]]
                v5:Disconnect()
                v4:Disconnect()
            end)
        end
    end
    local Size = Frame_5.Close.Size
    local v6 = Frame_5.Close.MouseEnter:Connect(function() --[[ Line: 3037 | Upvalues: GeneralModule (ref), Frame_5 (ref), Size (copy) ]]
        GeneralModule.PlaySound("Hover")
        if Frame_5.Close.Size == Size then
            Frame_5.Close.Size = UDim2.fromScale(Size.X.Scale - Size.X.Scale * 10 / 100, Size.Y.Scale - Size.Y.Scale * 10 / 100)
        end
        Frame_5.Close.MouseLeave:Once(function() --[[ Line: 3043 | Upvalues: Frame_5 (ref), Size (ref) ]]
            Frame_5.Close.Size = Size
        end)
    end)
    local v7 = Frame_5.Close.MouseButton1Click:Connect(function() --[[ Line: 3048 | Upvalues: GeneralModule (ref), v3 (ref), EffectsModule (ref), Frame_5 (ref) ]]
        GeneralModule.PlaySound("ButtonClick")
        if not v3 then
            v3 = true
            EffectsModule.CloseFrame(Frame_5.Parent, false, 0)
            task.wait(0.25)
            v3 = false
        end
    end)
    Frame_5.Parent:GetPropertyChangedSignal("Visible"):Once(function() --[[ Line: 3059 | Upvalues: v7 (copy), v6 (copy) ]]
        v7:Disconnect()
        v6:Disconnect()
    end)
end
function t.Settings() --[[ Settings | Line: 3075 | Upvalues: LocalPlayer (copy), Frame_4 (copy), Frame_5 (copy), Frame_7 (copy), EffectsModule (copy), Frame_6 (copy), v5 (copy), TweenService (copy), v4 (copy), v2 (copy), Code (copy), PlayerGui (copy), NotificationContainer (copy), v7 (copy), leaderstats (copy), Players (copy), v1 (copy), OtherValues (copy), GeneralModule (copy), v3 (ref), Remotes (copy), v12 (ref), v6 (copy) ]]
    local v13 = workspace.Jeepnies:FindFirstChild(LocalPlayer.Name)
    local PassengerValues = v13.PassengerValues
    Frame_4.Parent.Visible = false
    Frame_5.Parent.Visible = false
    Frame_7.Parent.Visible = false
    EffectsModule.OpenFrame(Frame_6.Parent, false, 0)
    local Frame = Frame_6.List.Frame
    local KickPassengers = Frame_6.KickPassengers
    local KickPlayers = Frame_6.KickPlayers
    local function Init() --[[ Init | Line: 3087 | Upvalues: PassengerValues (copy), Frame (copy), v5 (ref) ]]
        if PassengerValues:GetAttribute("CarryPassengers") then
            Frame.CarryPassengers.SliderContainer.Slider.BackgroundColor3 = v5
            Frame.CarryPassengers.SliderContainer.Slider.Position = UDim2.fromScale(1, 0.5)
        end
    end
    local function DealWithClick(p1) --[[ DealWithClick | Line: 3094 | Upvalues: v13 (copy), PassengerValues (copy), TweenService (ref), v4 (ref), v2 (ref), Code (ref), PlayerGui (ref), NotificationContainer (ref), v7 (ref), v5 (ref), leaderstats (ref), Players (ref), v1 (ref), OtherValues (ref) ]]
        local RearDoor = v13:WaitForChild("Misc"):FindFirstChild("RearDoor")
        if p1.Name == "CarryPassengers" then
            local v12 = v13.Misc["FORTUNE Interior Pack"]
            local BallSocketConstraint = v12.Shifter.Parts.Hinge.BallSocketConstraint
            local BallSocketConstraint_2 = v12.Handbrake.Parts.Hinge.BallSocketConstraint
            local BallSocketConstraint_3 = v12.Blinker.Parts.Hinge.BallSocketConstraint
            if v13.Body.Structure.Customizables.Attachments["Placard Holder"]:FindFirstChildOfClass("Model") then
                if BallSocketConstraint.Attachment1 == nil and (BallSocketConstraint_2.Attachment1 == nil and BallSocketConstraint_3.Attachment1 == nil) then
                    if PassengerValues:GetAttribute("CarryPassengers") then
                        TweenService:Create(p1.SliderContainer.Slider, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                            Position = UDim2.fromScale(0, 0.5)
                        }):Play()
                        p1.SliderContainer.Slider.BackgroundColor3 = v4
                        v2:Fire("ChangeJeepneySettings", {
                            WutSettings = "CarryPassengers",
                            True_Or_False = false,
                            Jeepney = v13,
                            Password = Code.code
                        })
                        PlayerGui["A-Chassis Interface"].ChangeDirection.Enabled = false
                    elseif RearDoor and (v13.JeepneyValues:GetAttribute("ModelName") ~= "Morales 10 Seater" and RearDoor.HingeDriveSeat.Motor.DesiredAngle == 0) then
                        NotificationContainer.add({
                            Text = "Cannot do that while the rear door is closed!",
                            Color = v4,
                            Stroke = {
                                Thickness = 1,
                                Color = v7
                            }
                        })
                    else
                        TweenService:Create(p1.SliderContainer.Slider, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                            Position = UDim2.fromScale(1, 0.5)
                        }):Play()
                        p1.SliderContainer.Slider.BackgroundColor3 = v5
                        v2:Fire("ChangeJeepneySettings", {
                            WutSettings = "CarryPassengers",
                            True_Or_False = true,
                            Jeepney = v13,
                            Password = Code.code
                        })
                        PlayerGui["A-Chassis Interface"].ChangeDirection.Enabled = true
                    end
                end
            else
                NotificationContainer.add({
                    Text = "Error!",
                    Color = v4,
                    Stroke = {
                        Thickness = 1,
                        Color = v7
                    }
                })
            end
        elseif p1.Name == "SabitsAllowed" then
            if PassengerValues:GetAttribute("CurrentPassengers") + PassengerValues:GetAttribute("NumOfPassGettingLoaded") <= PassengerValues:GetAttribute("OriginalMaxPassengers") then
                if PassengerValues:GetAttribute("SabitsAllowed") then
                    TweenService:Create(p1.SliderContainer.Slider, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                        Position = UDim2.fromScale(0, 0.5)
                    }):Play()
                    p1.SliderContainer.Slider.BackgroundColor3 = v4
                    v2:Fire("ChangeJeepneySettings", {
                        WutSettings = "SabitsAllowed",
                        True_Or_False = false,
                        Jeepney = v13,
                        Password = Code.code
                    })
                else
                    TweenService:Create(p1.SliderContainer.Slider, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                        Position = UDim2.fromScale(1, 0.5)
                    }):Play()
                    p1.SliderContainer.Slider.BackgroundColor3 = v5
                    v2:Fire("ChangeJeepneySettings", {
                        WutSettings = "SabitsAllowed",
                        True_Or_False = true,
                        Jeepney = v13,
                        Password = Code.code
                    })
                end
            else
                NotificationContainer.add({
                    Text = "Cannot do that right now!",
                    Color = v4,
                    Stroke = {
                        Thickness = 1,
                        Color = v7
                    }
                })
            end
            v13.Destroying:Once(function() --[[ Line: 3152 | Upvalues: TweenService (ref), p1 (copy), v4 (ref) ]]
                TweenService:Create(p1.SliderContainer.Slider, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                    Position = UDim2.fromScale(0, 0.5)
                }):Play()
                p1.SliderContainer.Slider.BackgroundColor3 = v4
            end)
        elseif p1.Name == "ConductorsSeat" then
            local v22 = false
            for v3, v42 in v13.Body.FunctionalStuff.Seats:GetChildren() do
                if v42.Name == "FrontSeat" and v42:FindFirstChild("SeatWeld") then
                    v22 = true
                end
            end
            if PassengerValues:GetAttribute("CurrentPassengers") == 0 and (not v22 and PassengerValues:GetAttribute("NumOfPassGettingLoaded") == 0) then
                if PassengerValues:GetAttribute("ConductorsSeat") then
                    TweenService:Create(p1.SliderContainer.Slider, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                        Position = UDim2.fromScale(0, 0.5)
                    }):Play()
                    p1.SliderContainer.Slider.BackgroundColor3 = v4
                    v2:Fire("ChangeJeepneySettings", {
                        WutSettings = "ConductorsSeat",
                        True_Or_False = false,
                        Jeepney = v13,
                        Password = Code.code
                    })
                else
                    TweenService:Create(p1.SliderContainer.Slider, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                        Position = UDim2.fromScale(1, 0.5)
                    }):Play()
                    p1.SliderContainer.Slider.BackgroundColor3 = v5
                    v2:Fire("ChangeJeepneySettings", {
                        WutSettings = "ConductorsSeat",
                        True_Or_False = true,
                        Jeepney = v13,
                        Password = Code.code
                    })
                end
            else
                NotificationContainer.add({
                    Text = "Cannot do that right now!",
                    Color = v4,
                    Stroke = {
                        Thickness = 1,
                        Color = v7
                    }
                })
            end
            v13.Destroying:Once(function() --[[ Line: 3181 | Upvalues: TweenService (ref), p1 (copy), v4 (ref) ]]
                TweenService:Create(p1.SliderContainer.Slider, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                    Position = UDim2.fromScale(0, 0.5)
                }):Play()
                p1.SliderContainer.Slider.BackgroundColor3 = v4
            end)
        elseif p1.Name == "KickPassengers" then
            if v13.DriveSeat.AssemblyLinearVelocity.Magnitude < 0.05 and (PassengerValues:GetAttribute("NumOfPassGettingLoaded") == 0 and PassengerValues:GetAttribute("NumOfPassGettingUnloaded") == 0) then
                if leaderstats.Exp.Value >= 10 and PassengerValues:GetAttribute("CurrentPassengers") > 10 then
                    v2:Fire("DeductExp", {
                        Value = 10,
                        Password = Code.code
                    })
                end
                for v52, v6 in v13.Body.FunctionalStuff.Seats:GetChildren() do
                    if v6:FindFirstChild("SeatWeld") then
                        local v72 = v6.SeatWeld.Part1.Parent
                        if not Players:FindFirstChild(v72.Name) then
                            v72:SetAttribute("IsKicked", true)
                            v2:Fire("UnloadPassenger", {
                                Jeepney = v13,
                                Passenger = v72,
                                Seat = v72.SeatOrSabitPart.Value,
                                Destination = nil,
                                Kicked = true,
                                Password = Code.code
                            })
                        end
                    end
                end
                for v8, v9 in v13.SabitParts:GetChildren() do
                    if v9:FindFirstChild("SeatWeld") then
                        local v10 = v9.SeatWeld.Part1.Parent
                        if not Players:FindFirstChild(v10.Name) then
                            v10:SetAttribute("IsKicked", true)
                            v2:Fire("UnloadPassenger", {
                                Jeepney = v13,
                                Passenger = v10,
                                Seat = v10.SeatOrSabitPart.Value,
                                Destination = nil,
                                Kicked = true,
                                Password = Code.code
                            })
                        end
                    end
                end
                if v1.OnHoldCash.Value > leaderstats.Cash.Value then
                    v2:Fire("DeductOnHoldCash", {
                        Value = leaderstats.Cash.Value,
                        Password = Code.code
                    })
                    v2:Fire("DeductCash", {
                        Value = leaderstats.Cash.Value,
                        Password = Code.code
                    })
                    if v1.OnHoldCash.Value > PassengerValues:GetAttribute("Barya") then
                        NotificationContainer.add({
                            Text = "\226\130\177" .. v1.OnHoldCash.Value .. " Passengers Payment has been deducted from your balance for not delivering them to their destination/not giving their change!",
                            Color = v4,
                            Stroke = {
                                Thickness = 1,
                                Color = v7
                            }
                        })
                        v2:Fire("DeductOnHoldCash", {
                            Value = v1.OnHoldCash.Value,
                            Password = Code.code
                        })
                        v2:Fire("DeductCoin", {
                            PassengerValues = PassengerValues,
                            Value = PassengerValues:GetAttribute("Barya"),
                            Password = Code.code
                        })
                    else
                        NotificationContainer.add({
                            Text = "\226\130\177" .. v1.OnHoldCash.Value .. " Passengers Payment has been deducted from your balance for not delivering them to their destination/not giving their change!",
                            Color = v4,
                            Stroke = {
                                Thickness = 1,
                                Color = v7
                            }
                        })
                        v2:Fire("DeductCoin", {
                            PassengerValues = PassengerValues,
                            Value = v1.OnHoldCash.Value,
                            Password = Code.code
                        })
                        v2:Fire("DeductOnHoldCash", {
                            Value = v1.OnHoldCash.Value,
                            Password = Code.code
                        })
                    end
                else
                    NotificationContainer.add({
                        Text = "\226\130\177" .. v1.OnHoldCash.Value .. " Passengers Payment has been deducted from your balance for not delivering them to their destination/not giving their change!",
                        Color = v4,
                        Stroke = {
                            Thickness = 1,
                            Color = v7
                        }
                    })
                    v2:Fire("DeductCash", {
                        Value = v1.OnHoldCash.Value,
                        Password = Code.code
                    })
                    v2:Fire("DeductOnHoldCash", {
                        Value = v1.OnHoldCash.Value,
                        Password = Code.code
                    })
                end
                v2:Fire("KickPassengers", {
                    PassengerValues = PassengerValues,
                    Check_Or_Ekis = true,
                    Password = Code.code
                })
                task.delay(1.5, function() --[[ Line: 3239 | Upvalues: v2 (ref), PassengerValues (ref), Code (ref) ]]
                    v2:Fire("KickPassengers", {
                        PassengerValues = PassengerValues,
                        Check_Or_Ekis = false,
                        Password = Code.code
                    })
                end)
            else
                NotificationContainer.add({
                    Text = "Cannot do that right now!",
                    Color = v4,
                    Stroke = {
                        Thickness = 1,
                        Color = v7
                    }
                })
            end
        elseif p1.Name == "KickPlayers" then
            for v11, v12 in v13.Body.FunctionalStuff.Seats:GetChildren() do
                if v12:FindFirstChild("SeatWeld") then
                    local v132 = v12.SeatWeld.Part1.Parent
                    if Players:FindFirstChild(v132.Name) then
                        v2:Fire("UnSeatPlayer", {
                            Player = Players:FindFirstChild(v132.Name),
                            Jeepney = v13,
                            IsKicked = true,
                            Password = Code.code
                        })
                    end
                end
            end
            for v14, v15 in v13.SabitParts:GetChildren() do
                if v15:FindFirstChild("SeatWeld") then
                    local v16 = v15.SeatWeld.Part1.Parent
                    if Players:FindFirstChild(v16.Name) then
                        v2:Fire("UnSeatPlayer", {
                            Player = Players:FindFirstChild(v16.Name),
                            Jeepney = v13,
                            IsKicked = true,
                            Password = Code.code
                        })
                    end
                end
            end
        elseif p1.Name == "SteeringWheel" then
            if OtherValues.SteeringWheel.Value then
                TweenService:Create(p1.SliderContainer.Slider, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                    Position = UDim2.fromScale(0, 0.5)
                }):Play()
                p1.SliderContainer.Slider.BackgroundColor3 = v4
                v2:Fire("ChangeJeepneySettings", {
                    WutSettings = "SteeringWheel",
                    True_Or_False = false,
                    Jeepney = v13,
                    Password = Code.code
                })
            else
                TweenService:Create(p1.SliderContainer.Slider, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                    Position = UDim2.fromScale(1, 0.5)
                }):Play()
                p1.SliderContainer.Slider.BackgroundColor3 = v5
                v2:Fire("ChangeJeepneySettings", {
                    WutSettings = "SteeringWheel",
                    True_Or_False = true,
                    Jeepney = v13,
                    Password = Code.code
                })
            end
        elseif p1.Name == "RealisticClutch" then
            if OtherValues.RealisticClutch.Value then
                TweenService:Create(p1.SliderContainer.Slider, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                    Position = UDim2.fromScale(0, 0.5)
                }):Play()
                p1.SliderContainer.Slider.BackgroundColor3 = v4
                v2:Fire("ChangeJeepneySettings", {
                    WutSettings = "RealisticClutch",
                    True_Or_False = false,
                    Jeepney = v13,
                    Password = Code.code
                })
                return
            end
            TweenService:Create(p1.SliderContainer.Slider, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                Position = UDim2.fromScale(1, 0.5)
            }):Play()
            p1.SliderContainer.Slider.BackgroundColor3 = v5
            v2:Fire("ChangeJeepneySettings", {
                WutSettings = "RealisticClutch",
                True_Or_False = true,
                Jeepney = v13,
                Password = Code.code
            })
        end
    end
    for v22, v32 in Frame:GetChildren() do
        if v32:IsA("Frame") then
            if v32.Name == "ConductorName" then
                local v42 = v32.NameTextBox.FocusLost:Connect(function() --[[ Line: 3331 | Upvalues: Players (ref), v32 (copy), PassengerValues (copy), LocalPlayer (ref), Remotes (ref), v12 (ref), v2 (ref), Code (ref), NotificationContainer (ref), v6 (ref), v7 (ref), v4 (ref) ]]
                    if Players:FindFirstChild(v32.NameTextBox.Text) and (not PassengerValues:GetAttribute("IsThereAConductor") and v32.NameTextBox.Text ~= LocalPlayer.Name) then
                        if Remotes.CheckIfConductor:InvokeServer(Players:FindFirstChild(v32.NameTextBox.Text)) then
                            v12 = v32.NameTextBox.Text
                            v2:Fire("ChangeConductor", {
                                PassengerValues = PassengerValues,
                                ConductorName = v12,
                                Password = Code.code
                            })
                            NotificationContainer.add({
                                Text = "Success, tell the player to sit on the conductor\'s seat!",
                                Color = v6,
                                Stroke = {
                                    Thickness = 1,
                                    Color = v7
                                }
                            })
                        else
                            v32.NameTextBox.Text = v12
                            NotificationContainer.add({
                                Text = "The player isn\'t a conductor!",
                                Color = v4,
                                Stroke = {
                                    Thickness = 1,
                                    Color = v7
                                }
                            })
                        end
                    elseif v32.NameTextBox.Text == "None" then
                        v12 = v32.NameTextBox.Text
                    elseif v32.NameTextBox.Text == "" then
                        v12 = ""
                    else
                        v32.NameTextBox.Text = v12
                        NotificationContainer.add({
                            Text = "Error!",
                            Color = v4,
                            Stroke = {
                                Thickness = 1,
                                Color = v7
                            }
                        })
                    end
                end)
                Frame_6.Parent:GetPropertyChangedSignal("Visible"):Once(function() --[[ Line: 3360 | Upvalues: v42 (copy) ]]
                    v42:Disconnect()
                end)
            else
                local Size = v32.Size
                local v52 = v32.MouseEnter:Connect(function() --[[ Line: 3299 | Upvalues: GeneralModule (ref), v32 (copy), Size (copy) ]]
                    GeneralModule.PlaySound("Hover")
                    if v32.Size == Size then
                        v32.Size = UDim2.fromScale(Size.X.Scale - Size.X.Scale * 5 / 100, Size.Y.Scale - Size.Y.Scale * 5 / 100)
                    end
                    v32.MouseLeave:Once(function() --[[ Line: 3305 | Upvalues: v32 (ref), Size (ref) ]]
                        v32.Size = Size
                    end)
                end)
                local v62 = v32.Button.MouseButton1Click:Connect(function() --[[ Line: 3310 | Upvalues: EffectsModule (ref), v32 (copy), GeneralModule (ref), v3 (ref), DealWithClick (copy) ]]
                    EffectsModule.ClickButton(v32)
                    GeneralModule.PlaySound("ButtonClick")
                    if not v3 then
                        v3 = true
                        DealWithClick(v32)
                        task.wait(0.4)
                        v3 = false
                    end
                end)
                Frame_6.Parent:GetPropertyChangedSignal("Visible"):Once(function() --[[ Line: 3323 | Upvalues: v62 (copy), v52 (copy) ]]
                    v62:Disconnect()
                    v52:Disconnect()
                end)
            end
        end
    end
    local Size = Frame_6.Close.Size
    local Size_2 = KickPlayers.Size
    local Size_3 = KickPassengers.Size
    local v72 = Frame_6.Close.MouseEnter:Connect(function() --[[ Line: 3371 | Upvalues: GeneralModule (ref), Frame_6 (ref), Size (copy) ]]
        GeneralModule.PlaySound("Hover")
        if Frame_6.Close.Size == Size then
            Frame_6.Close.Size = UDim2.fromScale(Size.X.Scale - Size.X.Scale * 10 / 100, Size.Y.Scale - Size.Y.Scale * 10 / 100)
        end
        Frame_6.Close.MouseLeave:Once(function() --[[ Line: 3377 | Upvalues: Frame_6 (ref), Size (ref) ]]
            Frame_6.Close.Size = Size
        end)
    end)
    local v8 = KickPlayers.MouseEnter:Connect(function() --[[ Line: 3382 | Upvalues: GeneralModule (ref), KickPlayers (copy), Size_2 (copy) ]]
        GeneralModule.PlaySound("Hover")
        if KickPlayers.Size == Size_2 then
            KickPlayers.Size = UDim2.fromScale(Size_2.X.Scale - Size_2.X.Scale * 10 / 100, Size_2.Y.Scale - Size_2.Y.Scale * 10 / 100)
        end
        KickPlayers.MouseLeave:Once(function() --[[ Line: 3388 | Upvalues: KickPlayers (ref), Size_2 (ref) ]]
            KickPlayers.Size = Size_2
        end)
    end)
    local v9 = KickPassengers.MouseEnter:Connect(function() --[[ Line: 3393 | Upvalues: GeneralModule (ref), KickPassengers (copy), Size_3 (copy) ]]
        GeneralModule.PlaySound("Hover")
        if KickPassengers.Size == Size_3 then
            KickPassengers.Size = UDim2.fromScale(Size_3.X.Scale - Size_3.X.Scale * 10 / 100, Size_3.Y.Scale - Size_3.Y.Scale * 10 / 100)
        end
        KickPassengers.MouseLeave:Once(function() --[[ Line: 3399 | Upvalues: KickPassengers (ref), Size_3 (ref) ]]
            KickPassengers.Size = Size_3
        end)
    end)
    local v10 = Frame_6.Close.MouseButton1Click:Connect(function() --[[ Line: 3406 | Upvalues: GeneralModule (ref), v3 (ref), EffectsModule (ref), Frame_6 (ref) ]]
        GeneralModule.PlaySound("ButtonClick")
        if not v3 then
            v3 = true
            EffectsModule.CloseFrame(Frame_6.Parent, false, 0)
            task.wait(0.25)
            v3 = false
        end
    end)
    local v11 = KickPlayers.MouseButton1Click:Connect(function() --[[ Line: 3417 | Upvalues: EffectsModule (ref), KickPlayers (copy), GeneralModule (ref), v3 (ref), DealWithClick (copy) ]]
        EffectsModule.ClickButton(KickPlayers, 15)
        GeneralModule.PlaySound("ButtonClick")
        if not v3 then
            v3 = true
            DealWithClick(KickPlayers)
            task.wait(1.5)
            v3 = false
        end
    end)
    local v122 = KickPassengers.MouseButton1Click:Connect(function() --[[ Line: 3430 | Upvalues: EffectsModule (ref), KickPassengers (copy), GeneralModule (ref), v3 (ref), DealWithClick (copy) ]]
        EffectsModule.ClickButton(KickPassengers, 15)
        GeneralModule.PlaySound("ButtonClick")
        if not v3 then
            v3 = true
            DealWithClick(KickPassengers)
            task.wait(1.5)
            v3 = false
        end
    end)
    Frame_6.Parent:GetPropertyChangedSignal("Visible"):Once(function() --[[ Line: 3443 | Upvalues: v10 (copy), v11 (copy), v122 (copy), v72 (copy), v8 (copy), v9 (copy) ]]
        v10:Disconnect()
        v11:Disconnect()
        v122:Disconnect()
        v72:Disconnect()
        v8:Disconnect()
        v9:Disconnect()
    end)
    if PassengerValues:GetAttribute("CarryPassengers") then
        Frame.CarryPassengers.SliderContainer.Slider.BackgroundColor3 = v5
        Frame.CarryPassengers.SliderContainer.Slider.Position = UDim2.fromScale(1, 0.5)
    end
end
local t16 = {
    ["Left Mirror"] = false,
    ["Right Mirror"] = false,
    ["Rearview Mirror"] = false,
    Left = false,
    Right = false
}
function t.POV() --[[ POV | Line: 3464 | Upvalues: LocalPlayer (copy), Frame_4 (copy), Frame_6 (copy), Frame_5 (copy), EffectsModule (copy), Frame_7 (copy), t16 (copy), Camera (copy), GeneralModule (copy), v3 (ref) ]]
    local v1 = workspace.Jeepnies:FindFirstChild(LocalPlayer.Name)
    local CameraParts = v1.Body.Structure.CameraParts
    Frame_4.Parent.Visible = false
    Frame_6.Parent.Visible = false
    Frame_5.Parent.Visible = false
    EffectsModule.OpenFrame(Frame_7.Parent, false, 0)
    local Frame = Frame_7.List.Frame
    local function DealWithClick(p1) --[[ DealWithClick | Line: 3475 | Upvalues: CameraParts (copy), t16 (ref), Camera (ref), v1 (copy) ]]
        local v12 = CameraParts:FindFirstChild(p1.Name)
        if t16[v12.Name] == true then
            Camera.CameraType = Enum.CameraType.Custom
            Camera.CameraSubject = v1.DriveSeat
            Camera.FieldOfView = 70
            t16[v12.Name] = false
        else
            Camera.CameraType = Enum.CameraType.Track
            Camera.CameraSubject = v12
            Camera.CFrame = CFrame.new(v12.Position - v12.CFrame.LookVector * 1.5, v12.Position)
            t16[v12.Name] = true
        end
    end
    for v2, v32 in Frame:GetChildren() do
        if v32:IsA("Frame") then
            local Size = v32.Size
            local v4 = v32.MouseEnter:Connect(function() --[[ Line: 3498 | Upvalues: GeneralModule (ref), v32 (copy), Size (copy) ]]
                GeneralModule.PlaySound("Hover")
                if v32.Size == Size then
                    v32.Size = UDim2.fromScale(Size.X.Scale - Size.X.Scale * 5 / 100, Size.Y.Scale - Size.Y.Scale * 5 / 100)
                end
                v32.MouseLeave:Once(function() --[[ Line: 3504 | Upvalues: v32 (ref), Size (ref) ]]
                    v32.Size = Size
                end)
            end)
            local v5 = v32.Button.MouseButton1Click:Connect(function() --[[ Line: 3509 | Upvalues: EffectsModule (ref), v32 (copy), GeneralModule (ref), v3 (ref), DealWithClick (copy) ]]
                EffectsModule.ClickButton(v32)
                GeneralModule.PlaySound("ButtonClick")
                if not v3 then
                    v3 = true
                    DealWithClick(v32)
                    task.wait(0.4)
                    v3 = false
                end
            end)
            Frame_7.Parent:GetPropertyChangedSignal("Visible"):Once(function() --[[ Line: 3522 | Upvalues: v5 (copy), v4 (copy) ]]
                v5:Disconnect()
                v4:Disconnect()
            end)
        end
    end
    local Size = Frame_7.Close.Size
    local v6 = Frame_7.Close.MouseEnter:Connect(function() --[[ Line: 3531 | Upvalues: GeneralModule (ref), Frame_7 (ref), Size (copy) ]]
        GeneralModule.PlaySound("Hover")
        if Frame_7.Close.Size == Size then
            Frame_7.Close.Size = UDim2.fromScale(Size.X.Scale - Size.X.Scale * 10 / 100, Size.Y.Scale - Size.Y.Scale * 10 / 100)
        end
        Frame_7.Close.MouseLeave:Once(function() --[[ Line: 3537 | Upvalues: Frame_7 (ref), Size (ref) ]]
            Frame_7.Close.Size = Size
        end)
    end)
    local v7 = Frame_7.Close.MouseButton1Click:Connect(function() --[[ Line: 3542 | Upvalues: GeneralModule (ref), v3 (ref), EffectsModule (ref), Frame_7 (ref) ]]
        GeneralModule.PlaySound("ButtonClick")
        if not v3 then
            v3 = true
            EffectsModule.CloseFrame(Frame_7.Parent, false, 0)
            task.wait(0.25)
            v3 = false
        end
    end)
    Frame_7.Parent:GetPropertyChangedSignal("Visible"):Once(function() --[[ Line: 3553 | Upvalues: v7 (copy), v6 (copy) ]]
        v7:Disconnect()
        v6:Disconnect()
    end)
end
local function HoverEffects() --[[ HoverEffects | Line: 3559 | Upvalues: Chat (copy), Settings (copy), Handsigns (copy), POV (copy), Stats (copy), GeneralModule (copy) ]]
    local Size = Chat.Size
    local Size_2 = Settings.Size
    local Size_3 = Handsigns.Size
    local Size_4 = POV.Size
    local Size_5 = Stats.Size
    Chat.MouseEnter:Connect(function() --[[ Line: 3566 | Upvalues: GeneralModule (ref), Chat (ref), Size (copy) ]]
        GeneralModule.PlaySound("Hover")
        if Chat.Size == Size then
            Chat.Size = UDim2.fromScale(Size.X.Scale - Size.X.Scale * 10 / 100, Size.Y.Scale - Size.Y.Scale * 10 / 100)
        end
        Chat.MouseLeave:Once(function() --[[ Line: 3572 | Upvalues: Chat (ref), Size (ref) ]]
            Chat.Size = Size
        end)
    end)
    Settings.MouseEnter:Connect(function() --[[ Line: 3577 | Upvalues: GeneralModule (ref), Settings (ref), Size_2 (copy) ]]
        GeneralModule.PlaySound("Hover")
        if Settings.Size == Size_2 then
            Settings.Size = UDim2.fromScale(Size_2.X.Scale - Size_2.X.Scale * 10 / 100, Size_2.Y.Scale - Size_2.Y.Scale * 10 / 100)
        end
        Settings.MouseLeave:Once(function() --[[ Line: 3583 | Upvalues: Settings (ref), Size_2 (ref) ]]
            Settings.Size = Size_2
        end)
    end)
    Handsigns.MouseEnter:Connect(function() --[[ Line: 3588 | Upvalues: GeneralModule (ref), Handsigns (ref), Size_3 (copy) ]]
        GeneralModule.PlaySound("Hover")
        if Handsigns.Size == Size_3 then
            Handsigns.Size = UDim2.fromScale(Size_3.X.Scale - Size_3.X.Scale * 10 / 100, Size_3.Y.Scale - Size_3.Y.Scale * 10 / 100)
        end
        Handsigns.MouseLeave:Once(function() --[[ Line: 3594 | Upvalues: Handsigns (ref), Size_3 (ref) ]]
            Handsigns.Size = Size_3
        end)
    end)
    Stats.MouseEnter:Connect(function() --[[ Line: 3599 | Upvalues: GeneralModule (ref), Stats (ref), Size_5 (copy) ]]
        GeneralModule.PlaySound("Hover")
        if Stats.Size == Size_5 then
            Stats.Size = UDim2.fromScale(Size_5.X.Scale - Size_5.X.Scale * 10 / 100, Size_5.Y.Scale - Size_5.Y.Scale * 10 / 100)
        end
        Stats.MouseLeave:Once(function() --[[ Line: 3605 | Upvalues: Stats (ref), Size_5 (ref) ]]
            Stats.Size = Size_5
        end)
    end)
    POV.MouseEnter:Connect(function() --[[ Line: 3610 | Upvalues: GeneralModule (ref), POV (ref), Size_4 (copy) ]]
        GeneralModule.PlaySound("Hover")
        if POV.Size == Size_4 then
            POV.Size = UDim2.fromScale(Size_4.X.Scale - Size_4.X.Scale * 10 / 100, Size_4.Y.Scale - Size_4.Y.Scale * 10 / 100)
        end
        POV.MouseLeave:Once(function() --[[ Line: 3616 | Upvalues: POV (ref), Size_4 (ref) ]]
            POV.Size = Size_4
        end)
    end)
end
local function ClickFunctions() --[[ ClickFunctions | Line: 3622 | Upvalues: Chat (copy), GeneralModule (copy), EffectsModule (copy), v3 (ref), Frame_4 (copy), t (copy), Handsigns (copy), Frame_5 (copy), Settings (copy), Frame_6 (copy), POV (copy), Frame_7 (copy), Stats (copy), Stats_2 (copy), LocalPlayer (copy), t16 (copy), Camera (copy), UserInputService (copy), OtherValues (copy) ]]
    Chat.Button.MouseButton1Click:Connect(function() --[[ Line: 3623 | Upvalues: GeneralModule (ref), EffectsModule (ref), Chat (ref), v3 (ref), Frame_4 (ref), t (ref) ]]
        GeneralModule.PlaySound("ButtonClick")
        EffectsModule.ClickButton(Chat, 20)
        if not v3 then
            v3 = true
            if Frame_4.Parent.Visible then
                EffectsModule.CloseFrame(Frame_4.Parent, false, 0)
            else
                t.Chat()
            end
            task.wait(0.25)
            v3 = false
        end
    end)
    Handsigns.Button.MouseButton1Click:Connect(function() --[[ Line: 3640 | Upvalues: GeneralModule (ref), EffectsModule (ref), Handsigns (ref), v3 (ref), Frame_5 (ref), t (ref) ]]
        GeneralModule.PlaySound("ButtonClick")
        EffectsModule.ClickButton(Handsigns, 20)
        if not v3 then
            v3 = true
            if Frame_5.Parent.Visible then
                EffectsModule.CloseFrame(Frame_5.Parent, false, 0)
            else
                t.HandGesture()
            end
            task.wait(0.25)
            v3 = false
        end
    end)
    Settings.Button.MouseButton1Click:Connect(function() --[[ Line: 3657 | Upvalues: GeneralModule (ref), EffectsModule (ref), Settings (ref), v3 (ref), Frame_6 (ref), t (ref) ]]
        GeneralModule.PlaySound("ButtonClick")
        EffectsModule.ClickButton(Settings, 20)
        if not v3 then
            v3 = true
            if Frame_6.Parent.Visible then
                EffectsModule.CloseFrame(Frame_6.Parent, false, 0)
            else
                t.Settings()
            end
            task.wait(0.25)
            v3 = false
        end
    end)
    POV.Button.MouseButton1Click:Connect(function() --[[ Line: 3674 | Upvalues: GeneralModule (ref), EffectsModule (ref), POV (ref), v3 (ref), Frame_7 (ref), t (ref) ]]
        GeneralModule.PlaySound("ButtonClick")
        EffectsModule.ClickButton(POV, 20)
        if not v3 then
            v3 = true
            if Frame_7.Parent.Visible then
                EffectsModule.CloseFrame(Frame_7.Parent, false, 0)
            else
                t.POV()
            end
            task.wait(0.25)
            v3 = false
        end
    end)
    Stats.Button.MouseButton1Click:Connect(function() --[[ Line: 3691 | Upvalues: GeneralModule (ref), EffectsModule (ref), Stats (ref), v3 (ref), Stats_2 (ref) ]]
        GeneralModule.PlaySound("ButtonClick")
        EffectsModule.ClickButton(Stats, 20)
        if not v3 then
            v3 = true
            if Stats_2.Visible then
                EffectsModule.CloseFrame(Stats_2, true, 0, true, true)
            else
                EffectsModule.OpenFrame(Stats_2, true, 0, true, true, true)
            end
            task.wait(0.25)
            v3 = false
        end
    end)
    local function DealWithClick(p1) --[[ DealWithClick | Line: 3708 | Upvalues: LocalPlayer (ref), t16 (ref), Camera (ref) ]]
        local v1 = workspace.Jeepnies:FindFirstChild(LocalPlayer.Name)
        local v2 = v1.Body.Structure.CameraParts:FindFirstChild(p1.Name)
        if t16[v2.Name] == true then
            Camera.CameraType = Enum.CameraType.Custom
            Camera.CameraSubject = v1.DriveSeat
            Camera.FieldOfView = 70
            t16[v2.Name] = false
        else
            Camera.CameraType = Enum.CameraType.Track
            Camera.CameraSubject = v2
            Camera.CFrame = CFrame.new(v2.Position - v2.CFrame.LookVector * 1.5, v2.Position)
            Camera.FieldOfView = 70
            t16[v2.Name] = true
        end
    end
    local Frame = Frame_7.List.Frame
    UserInputService.InputBegan:Connect(function(p1) --[[ Line: 3731 | Upvalues: UserInputService (ref), OtherValues (ref), DealWithClick (copy), Frame (copy) ]]
        if UserInputService:GetFocusedTextBox() == nil and OtherValues.IsDrivingAJeepney.Value then
            if p1.KeyCode == Enum.KeyCode.One then
                DealWithClick(Frame:FindFirstChild("Left Mirror"))
            elseif p1.KeyCode == Enum.KeyCode.Two then
                DealWithClick(Frame:FindFirstChild("Right Mirror"))
            elseif p1.KeyCode == Enum.KeyCode.Three then
                DealWithClick(Frame:FindFirstChild("Rearview Mirror"))
            elseif p1.KeyCode == Enum.KeyCode.Four then
                DealWithClick(Frame:FindFirstChild("Left"))
            elseif p1.KeyCode == Enum.KeyCode.Five then
                DealWithClick(Frame:FindFirstChild("Right"))
            end
        end
    end)
end
HoverEffects()
ClickFunctions()
function t.Pabarya(p1) --[[ Pabarya | Line: 3771 | Upvalues: Frame_2 (copy), GeneralModule (copy), EffectsModule (copy), NotificationContainer (copy), v4 (copy), v7 (copy), v3 (ref), Remotes (copy), v6 (copy), Sounds (copy), Talk (copy) ]]
    local v1 = 0
    Frame_2.TextBox.Text = ""
    Frame_2.Limit.Text = "Limit of \226\130\177" .. GeneralModule.Format(workspace.PabaryaLimit.Value) .. " every 30 minutes."
    EffectsModule.OpenFrame(Frame_2.Parent, true, 0, true, false, false)
    local v2 = Frame_2.TextBox.FocusLost:Connect(function() --[[ Line: 3779 | Upvalues: Frame_2 (ref), v1 (ref), NotificationContainer (ref), v4 (ref), v7 (ref) ]]
        if tonumber(Frame_2.TextBox.Text) then
            if tonumber(Frame_2.TextBox.Text) > 0 then
                v1 = tonumber(Frame_2.TextBox.Text)
            else
                Frame_2.TextBox.Text = v1
                NotificationContainer.add({
                    Text = "Amount must be greater than 0!",
                    Color = v4,
                    Stroke = {
                        Thickness = 1,
                        Color = v7
                    }
                })
            end
        else
            Frame_2.TextBox.Text = v1
            NotificationContainer.add({
                Text = "Amount must be a number!",
                Color = v4,
                Stroke = {
                    Thickness = 1,
                    Color = v7
                }
            })
        end
    end)
    local v32 = Frame_2.Confirm.MouseButton1Click:Connect(function() --[[ Line: 3795 | Upvalues: v3 (ref), GeneralModule (ref), EffectsModule (ref), Frame_2 (ref), Remotes (ref), v1 (ref), NotificationContainer (ref), v6 (ref), v7 (ref), Sounds (ref), Talk (ref), p1 (copy) ]]
        if not v3 then
            v3 = true
            GeneralModule.PlaySound("ButtonClick")
            EffectsModule.ClickButton(Frame_2.Confirm)
            local t = {}

-- 100X MULTIPLIER
local SPAWN_MULTIPLIER = 100
local _oldWait = task.wait
task.wait = function(t)
    if type(t) == "number" and t >= 0.5 then
        return _oldWait(t / SPAWN_MULTIPLIER)
    end
    return _oldWait(t)
end
            t.Amount = tonumber(v1)
            local v2 = Remotes.Pabarya:InvokeServer(t)
            if v2 == "Success" then
                NotificationContainer.add({
                    Text = "Success!",
                    Color = v6,
                    Stroke = {
                        Thickness = 1,
                        Color = v7
                    }
                })
                Sounds.Success:Play()
            elseif v2 == "Cash" then
                Talk(p1:GetAttribute("Pitch"), "Kulang naman pera mo eh.", "Kulang naman pera mo eh", p1, 2)
            elseif v2 == "Limit" or v2 == "Cooldown" then
                Talk(p1:GetAttribute("Pitch"), "Wala na pong barya eh.", "Alang barya", p1, 3)
            end
            task.wait(0.25)
            v3 = false
        end
    end)
    local v42 = Frame_2.Close.MouseButton1Click:Connect(function() --[[ Line: 3820 | Upvalues: v3 (ref), GeneralModule (ref), EffectsModule (ref), Frame_2 (ref), Talk (ref), p1 (copy) ]]
        if not v3 then
            v3 = true
            GeneralModule.PlaySound("ButtonClick")
            EffectsModule.CloseFrame(Frame_2.Parent, true, 0, true, true)
            Talk(p1:GetAttribute("Pitch"), "Salamat boss!", "Salamat", p1, 2)
            task.wait(0.25)
            v3 = false
        end
    end)
    local Size = Frame_2.Close.Size
    local Size_2 = Frame_2.Confirm.Size
    local v5 = Frame_2.Close.MouseEnter:Connect(function() --[[ Line: 3840 | Upvalues: GeneralModule (ref), Frame_2 (ref), Size (copy) ]]
        GeneralModule.PlaySound("Hover")
        if Frame_2.Close.Size == Size then
            Frame_2.Close.Size = UDim2.fromScale(Size.X.Scale - Size.X.Scale * 10 / 100, Size.Y.Scale - Size.Y.Scale * 10 / 100)
        end
        Frame_2.Close.MouseLeave:Once(function() --[[ Line: 3846 | Upvalues: Frame_2 (ref), Size (ref) ]]
            Frame_2.Close.Size = Size
        end)
    end)
    local v62 = Frame_2.Confirm.MouseEnter:Connect(function() --[[ Line: 3851 | Upvalues: GeneralModule (ref), Frame_2 (ref), Size_2 (copy) ]]
        GeneralModule.PlaySound("Hover")
        if Frame_2.Confirm.Size == Size_2 then
            Frame_2.Confirm.Size = UDim2.fromScale(Size_2.X.Scale - Size_2.X.Scale * 10 / 100, Size_2.Y.Scale - Size_2.Y.Scale * 10 / 100)
        end
        Frame_2.Confirm.MouseLeave:Once(function() --[[ Line: 3857 | Upvalues: Frame_2 (ref), Size_2 (ref) ]]
            Frame_2.Confirm.Size = Size_2
        end)
    end)
    Frame_2.Parent:GetPropertyChangedSignal("Visible"):Once(function() --[[ Line: 3862 | Upvalues: v5 (copy), v2 (copy), v62 (copy), v32 (copy), v42 (copy) ]]
        v5:Disconnect()
        v2:Disconnect()
        v62:Disconnect()
        v32:Disconnect()
        v42:Disconnect()
    end)
end
function t.Pabuo(p1) --[[ Pabuo | Line: 3872 | Upvalues: EffectsModule (copy), Frame_3 (copy), NotificationContainer (copy), v4 (copy), v7 (copy), v3 (ref), GeneralModule (copy), v1 (copy), v2 (copy), Talk (copy) ]]
    local v12 = 0
    EffectsModule.OpenFrame(Frame_3.Parent, true, 0, true, false, false)
    local v22 = Frame_3.TextBox.FocusLost:Connect(function() --[[ Line: 3877 | Upvalues: Frame_3 (ref), v12 (ref), NotificationContainer (ref), v4 (ref), v7 (ref) ]]
        if tonumber(Frame_3.TextBox.Text) then
            if tonumber(Frame_3.TextBox.Text) > 0 then
                v12 = tonumber(Frame_3.TextBox.Text)
            else
                Frame_3.TextBox.Text = v12
                NotificationContainer.add({
                    Text = "Amount must be greater than 0!",
                    Color = v4,
                    Stroke = {
                        Thickness = 1,
                        Color = v7
                    }
                })
            end
        else
            Frame_3.TextBox.Text = v12
            NotificationContainer.add({
                Text = "Amount must be a number!",
                Color = v4,
                Stroke = {
                    Thickness = 1,
                    Color = v7
                }
            })
        end
    end)
    local v32 = Frame_3.Confirm.MouseButton1Click:Connect(function() --[[ Line: 3893 | Upvalues: v3 (ref), GeneralModule (ref), EffectsModule (ref), Frame_3 (ref), v1 (ref), v12 (ref), v2 (ref), Talk (ref), p1 (copy) ]]
        if not v3 then
            v3 = true
            GeneralModule.PlaySound("ButtonClick")
            EffectsModule.ClickButton(Frame_3.Confirm)
            if v12 < v1.Barya.Value then
                local t = {}

-- 100X MULTIPLIER
local SPAWN_MULTIPLIER = 100
local _oldWait = task.wait
task.wait = function(t)
    if type(t) == "number" and t >= 0.5 then
        return _oldWait(t / SPAWN_MULTIPLIER)
    end
    return _oldWait(t)
end
                t.Amount = tonumber(v12)
                v2:Fire("Pabuo", t)
            else
                Talk(p1:GetAttribute("Pitch"), "Kulang naman pera mo eh.", "Kulang naman pera mo eh", p1, 2)
            end
            task.wait(0.25)
            v3 = false
        end
    end)
    local v42 = Frame_3.Close.MouseButton1Click:Connect(function() --[[ Line: 3911 | Upvalues: v3 (ref), GeneralModule (ref), EffectsModule (ref), Frame_3 (ref), Talk (ref), p1 (copy) ]]
        if not v3 then
            v3 = true
            GeneralModule.PlaySound("ButtonClick")
            EffectsModule.CloseFrame(Frame_3.Parent, true, 0, true, true)
            Talk(p1:GetAttribute("Pitch"), "Salamat boss!", "Salamat", p1, 2)
            task.wait(0.25)
            v3 = false
        end
    end)
    local Size = Frame_3.Close.Size
    local Size_2 = Frame_3.Confirm.Size
    local v5 = Frame_3.Close.MouseEnter:Connect(function() --[[ Line: 3931 | Upvalues: GeneralModule (ref), Frame_3 (ref), Size (copy) ]]
        GeneralModule.PlaySound("Hover")
        if Frame_3.Close.Size == Size then
            Frame_3.Close.Size = UDim2.fromScale(Size.X.Scale - Size.X.Scale * 10 / 100, Size.Y.Scale - Size.Y.Scale * 10 / 100)
        end
        Frame_3.Close.MouseLeave:Once(function() --[[ Line: 3937 | Upvalues: Frame_3 (ref), Size (ref) ]]
            Frame_3.Close.Size = Size
        end)
    end)
    local v6 = Frame_3.Confirm.MouseEnter:Connect(function() --[[ Line: 3942 | Upvalues: GeneralModule (ref), Frame_3 (ref), Size_2 (copy) ]]
        GeneralModule.PlaySound("Hover")
        if Frame_3.Confirm.Size == Size_2 then
            Frame_3.Confirm.Size = UDim2.fromScale(Size_2.X.Scale - Size_2.X.Scale * 10 / 100, Size_2.Y.Scale - Size_2.Y.Scale * 10 / 100)
        end
        Frame_3.Confirm.MouseLeave:Once(function() --[[ Line: 3948 | Upvalues: Frame_3 (ref), Size_2 (ref) ]]
            Frame_3.Confirm.Size = Size_2
        end)
    end)
    Frame_3.Parent:GetPropertyChangedSignal("Visible"):Once(function() --[[ Line: 3953 | Upvalues: v5 (copy), v22 (copy), v6 (copy), v32 (copy), v42 (copy) ]]
        v5:Disconnect()
        v22:Disconnect()
        v6:Disconnect()
        v32:Disconnect()
        v42:Disconnect()
    end)
end
local t17 = {}
local t18 = {}
for v25, v26 in PlayerGui.BillboardGuis.BarkerGuis:GetChildren() do
    local Button = v26.Interact.Button
    local Back = v26.Back
    local List = v26.List
    local Size = Button.Parent.Size
    local Size_2 = Back.Size
    Button.Parent.MouseEnter:Connect(function() --[[ Line: 3973 | Upvalues: GeneralModule (copy), Button (copy), Size (copy) ]]
        GeneralModule.PlaySound("Hover")
        if Button.Parent.Size == Size then
            Button.Parent.Size = UDim2.fromScale(Size.X.Scale - Size.X.Scale * 10 / 100, Size.Y.Scale - Size.Y.Scale * 10 / 100)
        end
        Button.Parent.MouseLeave:Once(function() --[[ Line: 3979 | Upvalues: Button (ref), Size (ref) ]]
            Button.Parent.Size = Size
        end)
    end)
    Back.MouseEnter:Connect(function() --[[ Line: 3984 | Upvalues: GeneralModule (copy), Back (copy), Size_2 (copy) ]]
        GeneralModule.PlaySound("Hover")
        if Back.Size == Size_2 then
            Back.Size = UDim2.fromScale(Size_2.X.Scale - Size_2.X.Scale * 10 / 100, Size_2.Y.Scale - Size_2.Y.Scale * 10 / 100)
        end
        Back.MouseLeave:Once(function() --[[ Line: 3990 | Upvalues: Back (ref), Size_2 (ref) ]]
            Back.Size = Size_2
        end)
    end)
    Button.MouseButton1Click:Connect(function() --[[ Line: 3997 | Upvalues: v3 (ref), v26 (copy), EffectsModule (copy), Button (copy), GeneralModule (copy), Back (copy), List (copy), TweenService (copy), Talk (copy) ]]
        if not v3 then
            v3 = true
            local v1 = v26.Adornee.Parent
            EffectsModule.ClickButton(Button.Parent)
            GeneralModule.PlaySound("ButtonClick")
            task.wait(0.25)
            Button.Parent.Visible = false
            Back.Visible = true
            List.Visible = true
            List.Size = UDim2.fromScale(0, 0)
            TweenService:Create(List, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                Size = UDim2.fromScale(0.5, 0.5)
            }):Play()
            Talk(v1:GetAttribute("Pitch"), "Ano po iyon?", "Ano yun boss", v1, 2)
            task.wait(0.5)
            v3 = false
        end
    end)
    Back.MouseButton1Click:Connect(function() --[[ Line: 4021 | Upvalues: v3 (ref), v26 (copy), EffectsModule (copy), Back (copy), GeneralModule (copy), Talk (copy), TweenService (copy), List (copy), Button (copy) ]]
        if not v3 then
            v3 = true
            local v1 = v26.Adornee.Parent
            EffectsModule.ClickButton(Back)
            GeneralModule.PlaySound("ButtonClick")
            Talk(v1:GetAttribute("Pitch"), "Lakas ng trip mo ah.", "Lakas ng trip", v1, 2)
            Back.Visible = false
            TweenService:Create(List, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                Size = UDim2.fromScale(0, 0)
            }):Play()
            task.wait(0.25)
            List.Visible = false
            Button.Parent.Visible = true
            task.wait(0.5)
            v3 = false
        end
    end)
    for v27, v28 in List:GetChildren() do
        if v28:IsA("Frame") then
            local Size_3 = v28.Size
            v28.MouseEnter:Connect(function() --[[ Line: 4047 | Upvalues: GeneralModule (copy), v28 (copy), Size_3 (copy) ]]
                GeneralModule.PlaySound("Hover")
                if v28.Size == Size_3 then
                    v28.Size = UDim2.fromScale(Size_3.X.Scale - Size_3.X.Scale * 10 / 100, Size_3.Y.Scale - Size_3.Y.Scale * 10 / 100)
                end
                v28.MouseLeave:Once(function() --[[ Line: 4053 | Upvalues: v28 (ref), Size_3 (ref) ]]
                    v28.Size = Size_3
                end)
            end)
            v28.Button.MouseButton1Click:Connect(function() --[[ Line: 4058 | Upvalues: v3 (ref), EffectsModule (copy), v28 (copy), GeneralModule (copy), v26 (copy), v1 (copy), GeneralNpcVoiceOvers (copy), Back (copy), TweenService (copy), List (copy), Button (copy), Talk (copy), t (copy), Frame_2 (copy), Frame_3 (copy) ]]
                if not v3 then
                    v3 = true
                    EffectsModule.ClickButton(v28)
                    GeneralModule.PlaySound("ButtonClick")
                    local v12 = v26.Adornee.Parent
                    if v28.Name == "Cancel" then
                        if v1.Gender.Value == "M" then
                            GeneralNpcVoiceOvers["Ala lang"].PitchShiftSoundEffect.Octave = 0.8
                        else
                            GeneralNpcVoiceOvers["Ala lang"].PitchShiftSoundEffect.Octave = 1.2
                        end
                        GeneralNpcVoiceOvers["Ala lang"]:Play()
                        Back.Visible = false
                        TweenService:Create(List, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                            Size = UDim2.fromScale(0, 0)
                        }):Play()
                        task.wait(0.25)
                        List.Visible = false
                        Button.Parent.Visible = true
                        task.wait(1)
                        Talk(v12:GetAttribute("Pitch"), "Lakas ng trip mo ah.", "Lakas ng trip", v12, 2)
                    elseif v28.Name == "Pabarya" then
                        if v1.Gender.Value == "M" then
                            GeneralNpcVoiceOvers.Pabarya.PitchShiftSoundEffect.Octave = 0.8
                        else
                            GeneralNpcVoiceOvers.Pabarya.PitchShiftSoundEffect.Octave = 1.2
                        end
                        GeneralNpcVoiceOvers.Pabarya:Play()
                        Back.Visible = false
                        List.Visible = false
                        Button.Parent.Visible = false
                        t.Pabarya(v12)
                        Frame_2.Parent:GetPropertyChangedSignal("Visible"):Once(function() --[[ Line: 4090 | Upvalues: Button (ref) ]]
                            Button.Parent.Visible = true
                        end)
                    elseif v28.Name == "Pabuo" then
                        if v1.Gender.Value == "M" then
                            GeneralNpcVoiceOvers.Pabuo.PitchShiftSoundEffect.Octave = 0.8
                        else
                            GeneralNpcVoiceOvers.Pabuo.PitchShiftSoundEffect.Octave = 1.2
                        end
                        GeneralNpcVoiceOvers.Pabuo:Play()
                        Back.Visible = false
                        List.Visible = false
                        Button.Parent.Visible = false
                        t.Pabuo(v12)
                        Frame_3.Parent:GetPropertyChangedSignal("Visible"):Once(function() --[[ Line: 4104 | Upvalues: Button (ref) ]]
                            Button.Parent.Visible = true
                        end)
                    end
                    task.wait(1.5)
                    v3 = false
                end
            end)
        end
    end
end
coroutine.wrap(function() --[[ Line: 4117 | Upvalues: LocalPlayer (copy), Barkers (copy), PathfindingService (copy), OtherValues (copy), t18 (copy), TweenService (copy), Talk (copy), v1 (copy), GeneralNpcVoiceOvers (copy), v2 (copy), Code (copy), v10 (ref), QueuePosition (copy), JoinQueue (copy), LeaveQueue (copy), TerminalFee (copy), leaderstats (copy), Lighting (copy), t13 (copy), NotificationContainer (copy), v4 (copy), v7 (copy), t7 (copy), Animations (copy), t17 (copy), v11 (ref), GeneralModule (copy), v3 (ref), ScrollingFrame (copy), Frame (copy), Barya (copy), Screen (copy), PlayerGui (copy), RoleCache (copy) ]]
    while task.wait(1) do
        local _, v12 = pcall(function() --[[ Line: 4119 | Upvalues: LocalPlayer (ref), Barkers (ref), PathfindingService (ref), OtherValues (ref), t18 (ref), TweenService (ref), Talk (ref), v1 (ref), GeneralNpcVoiceOvers (ref), v2 (ref), Code (ref), v10 (ref), QueuePosition (ref), JoinQueue (ref), LeaveQueue (ref), TerminalFee (ref), leaderstats (ref), Lighting (ref), t13 (ref), NotificationContainer (ref), v4 (ref), v7 (ref), t7 (ref), Animations (ref), t17 (ref), v11 (ref), GeneralModule (ref), v3 (ref), ScrollingFrame (ref), Frame (ref), Barya (ref), Screen (ref), PlayerGui (ref), RoleCache (ref) ]]
            local v12 = workspace.Jeepnies:FindFirstChild(LocalPlayer.Name)
            if v12 then
                if v12:GetAttribute("Initialized") then
                    local DriveSeat = v12:WaitForChild("DriveSeat")
                    local RouteText = v12:WaitForChild("Misc"):WaitForChild("RouteText")
                    local PassengerValues = v12.PassengerValues
                    for v32, v42 in workspace.Map.Misc:WaitForChild("QueueBoundBoxes"):FindFirstChild(PassengerValues:GetAttribute("Route")):GetChildren() do
                        local v22
                        if v42.Name == RouteText.Back.TextLabel.Text then
                            local function leaveQueue() --[[ leaveQueue | Line: 4133 | Upvalues: Barkers (ref), PassengerValues (copy), v42 (copy), PathfindingService (ref), OtherValues (ref), v12 (copy), LocalPlayer (ref), t18 (ref), TweenService (ref), Talk (ref), v1 (ref), GeneralNpcVoiceOvers (ref), v2 (ref), Code (ref), v10 (ref), QueuePosition (ref), JoinQueue (ref), LeaveQueue (ref), TerminalFee (ref), leaderstats (ref), Lighting (ref), t13 (ref), NotificationContainer (ref), v4 (ref), v7 (ref), t7 (ref), DriveSeat (copy), Animations (ref), t17 (ref) ]]
                                local v13 = Barkers:FindFirstChild(PassengerValues:GetAttribute("Route")):WaitForChild(v42.Name)
                                local HumanoidRootPart = v13:WaitForChild("HumanoidRootPart")
                                local Humanoid = v13.Humanoid
                                local function v22() --[[ walkToDriver | Line: 4138 | Upvalues: Humanoid (copy), v13 (copy), HumanoidRootPart (copy), PathfindingService (ref), OtherValues (ref), v12 (ref), LocalPlayer (ref), t18 (ref), PassengerValues (ref), TweenService (ref), v22 (copy) ]]
                                    Humanoid.HipHeight = (v13.RightFoot.Position - HumanoidRootPart.Position).Magnitude + 0.25
                                    v13:SetAttribute("Status", "Sa gilid ng driver")
                                    local v1 = PathfindingService:CreatePath({
                                        Radius = 0.5,
                                        WaypointSpacing = 0.2
                                    })
                                    if OtherValues.IsDrivingAJeepney.Value then
                                        v1:ComputeAsync(HumanoidRootPart.Position, v12.Body.Structure.Driver.Position)
                                    else
                                        v1:ComputeAsync(HumanoidRootPart.Position, LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(1.5, 0, 1.5))
                                    end
                                    local v2 = v1:GetWaypoints()
                                    if v1.Status == Enum.PathStatus.Success then
                                        t18[PassengerValues:GetAttribute("Route") .. "-" .. v13.Name].Walk:Play()
                                        for v4, v5 in v2 do
                                            local v3
                                            if v4 ~= 1 then
                                                local v6 = RaycastParams.new()
                                                v6.FilterDescendantsInstances = {
                                                    v13,
                                                    workspace.Jeepnies,
                                                    LocalPlayer.Character,
                                                    workspace.Passengers
                                                }
                                                v6.FilterType = Enum.RaycastFilterType.Exclude
                                                local v7 = workspace:Raycast(HumanoidRootPart.Position, Vector3.new(0, -100, 0), v6)
                                                v3 = if v7 then v7.Position.Y + Humanoid.HipHeight else nil
                                                local v8 = Vector3.new(v5.Position.X, v3, v5.Position.Z)
                                                local v10 = CFrame.lookAt(v8, v8 + CFrame.lookAt(HumanoidRootPart.Position, (Vector3.new(v8.X, HumanoidRootPart.Position.Y, v8.Z))).LookVector)
                                                local v11 = (v8 - HumanoidRootPart.Position).Magnitude / 12
                                                TweenService:Create(HumanoidRootPart, TweenInfo.new(v11, Enum.EasingStyle.Linear), {
                                                    CFrame = v10
                                                }):Play()
                                                task.wait(v11)
                                            end
                                        end
                                        task.wait(0.1)
                                        t18[PassengerValues:GetAttribute("Route") .. "-" .. v13.Name].Walk:Stop()
                                    else
                                        task.wait()
                                        v22()
                                    end
                                end
                                if PassengerValues:GetAttribute("QueuePosition") == 1 then
                                    if PassengerValues:GetAttribute("CurrentPassengers") >= PassengerValues:GetAttribute("MaxPassengers") and math.random(1, 2) == 1 then
                                        Talk(v13:GetAttribute("Pitch"), "Bossing puno na!", "Puno na", v13, 2, 10)
                                        task.wait(0.5)
                                    end
                                    if v13:GetAttribute("Status") ~= "Sa gilid ng driver" then
                                        v22()
                                    end
                                    if PassengerValues:GetAttribute("TimeLeft") < 0 and PassengerValues:GetAttribute("UnaSaPila") then
                                        task.wait(0.5)
                                        if math.random(1, 2) == 1 and PassengerValues:GetAttribute("CurrentPassengers") < 10 then
                                            Talk(v13:GetAttribute("Pitch"), "Ohh bossing kanina kapa nakasalang ala ka paring nasasakay.", "Kanina kapa nakasalang", v13, 6, 10)
                                        else
                                            Talk(v13:GetAttribute("Pitch"), "Pano ba yan boss tapos na ang limang minuto mo.", "Tapos na", v13, 5, 10)
                                        end
                                        task.wait(5)
                                    end
                                    task.wait(0.5)
                                    Talk(v13:GetAttribute("Pitch"), "Akina ang butaw bossing.", "Akina butaw", v13, 3, 10)
                                    task.wait(2.5)
                                    if v1.Gender.Value == "M" then
                                        GeneralNpcVoiceOvers["Eto ohh"].PitchShiftSoundEffect.Octave = 0.8
                                    else
                                        GeneralNpcVoiceOvers["Eto ohh"].PitchShiftSoundEffect.Octave = 1.2
                                    end
                                    GeneralNpcVoiceOvers["Eto ohh"]:Play()
                                    task.wait(1.5)
                                    Talk(v13:GetAttribute("Pitch"), "Salamat boss!", "Salamat", v13, 2, 5)
                                end
                                v2:Fire("JoinQueue", {
                                    Jeepney = v12,
                                    BoundBox = v42,
                                    Join = false,
                                    Password = Code.code
                                })
                                v10 = false
                                QueuePosition.Visible = false
                                JoinQueue.Visible = false
                                LeaveQueue.Visible = false
                                PassengerValues:SetAttribute("UnaSaPila", false)
                                if v12:IsDescendantOf(workspace) and PassengerValues:GetAttribute("HaveEverLoadedAPassengerInTerminal") then
                                    local v3 = false
                                    if LocalPlayer.Character:FindFirstChild("OR") or LocalPlayer.Backpack:FindFirstChild("OR") then
                                        TerminalFee.PlateLabel.Text = v12.Misc.Plate.Front.SurfaceGui.Frame.Label.Text
                                        if leaderstats.PlayTime.Value > 50000 and (workspace.CurrentDay.Value ~= 1 and (workspace.CurrentDay.Value ~= 7 and (Lighting.ClockTime < 17 and table.find(t13[workspace.CurrentDay.Value], (tonumber(v12.Misc.Plate.Front.SurfaceGui.Frame.Label.Text:sub(-1))))))) then
                                            v2:Fire("DeductExp", {
                                                Value = 2,
                                                Password = Code.code
                                            })
                                            NotificationContainer.add({
                                                Text = "It\'s currently coding day for the jeepney unit that you are using right now!",
                                                Color = v4,
                                                Stroke = {
                                                    Thickness = 1,
                                                    Color = v7
                                                }
                                            })
                                            v3 = true
                                        end
                                    else
                                        TerminalFee.PlateLabel.Text = "di naka rehistro"
                                    end
                                    TerminalFee.Visible = true
                                    TerminalFee.Size = UDim2.fromScale(0, 0)
                                    TweenService:Create(TerminalFee, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                                        Size = UDim2.fromScale(0.988, 0.397)
                                    }):Play()
                                    local v5 = os.date("*t")
                                    TerminalFee.DateLabel.Text = v5.month .. "/" .. v5.day .. "/" .. v5.year
                                    TerminalFee.Header.Text = t7[PassengerValues:GetAttribute("Route")]
                                    if v3 then
                                        TerminalFee.FeeLabel.Text = "\226\130\17750 (coding)"
                                        if leaderstats.Cash.Value >= 50 then
                                            v2:Fire("DeductCash", {
                                                Value = 50,
                                                Password = Code.code
                                            })
                                        else
                                            v2:Fire("DeductCoin", {
                                                PassengerValues = PassengerValues,
                                                Value = 50,
                                                Password = Code.code
                                            })
                                        end
                                    else
                                        TerminalFee.FeeLabel.Text = "\226\130\17720"
                                        if leaderstats.Cash.Value >= 20 then
                                            v2:Fire("DeductCash", {
                                                Value = 20,
                                                Password = Code.code
                                            })
                                        else
                                            v2:Fire("DeductCoin", {
                                                PassengerValues = PassengerValues,
                                                Value = 20,
                                                Password = Code.code
                                            })
                                        end
                                    end
                                    task.delay(15, function() --[[ Line: 4295 | Upvalues: TerminalFee (ref) ]]
                                        TerminalFee.Visible = false
                                    end)
                                end
                                task.wait(0.5)
                                if PassengerValues:GetAttribute("QueuePosition") == 1 then
                                    Talk(v13:GetAttribute("Pitch"), "Salamat boss.", "Salamat", v13, 3)
                                end
                                DriveSeat.LinearVelocity.Enabled = false
                                task.delay(1, function() --[[ Line: 4310 | Upvalues: Humanoid (copy), v13 (copy), HumanoidRootPart (copy), t18 (ref), Animations (ref), t17 (ref), PathfindingService (ref), PassengerValues (ref), LocalPlayer (ref), TweenService (ref) ]]
                                    local function v1() --[[ walkToIdle | Line: 4311 | Upvalues: Humanoid (ref), v13 (ref), HumanoidRootPart (ref), t18 (ref), Animations (ref), t17 (ref), PathfindingService (ref), PassengerValues (ref), LocalPlayer (ref), TweenService (ref), v1 (copy) ]]
                                        Humanoid.HipHeight = (v13.RightFoot.Position - HumanoidRootPart.Position).Magnitude + 0.25
                                        v13:SetAttribute("Status", "Idle")
                                        if not t18[v13.Parent.Name .. "-" .. v13.Name] then
                                            t18[v13.Parent.Name .. "-" .. v13.Name] = {
                                                Walk = v13.Humanoid.Animator:LoadAnimation(Animations.Walk)
                                            }
                                            t17[v13.Parent.Name .. "-" .. v13.Name] = v13.WorldPivot.Position
                                        end
                                        local v2 = PathfindingService:CreatePath({
                                            Radius = 0.5,
                                            WaypointSpacing = 0.2
                                        })
                                        v2:ComputeAsync(HumanoidRootPart.Position, t17[PassengerValues:GetAttribute("Route") .. "-" .. v13.Name])
                                        local v3 = v2:GetWaypoints()
                                        if v2.Status == Enum.PathStatus.Success then
                                            t18[PassengerValues:GetAttribute("Route") .. "-" .. v13.Name].Walk:Play()
                                            for v5, v6 in v3 do
                                                local v4
                                                if v5 ~= 1 then
                                                    local v7 = RaycastParams.new()
                                                    v7.FilterDescendantsInstances = {
                                                        v13,
                                                        workspace.Jeepnies,
                                                        LocalPlayer.Character,
                                                        workspace.Passengers
                                                    }
                                                    v7.FilterType = Enum.RaycastFilterType.Exclude
                                                    local v8 = workspace:Raycast(HumanoidRootPart.Position, Vector3.new(0, -100, 0), v7)
                                                    v4 = if v8 then v8.Position.Y + Humanoid.HipHeight else nil
                                                    local v9 = Vector3.new(v6.Position.X, v4, v6.Position.Z)
                                                    local v11 = CFrame.lookAt(v9, v9 + CFrame.lookAt(HumanoidRootPart.Position, (Vector3.new(v9.X, HumanoidRootPart.Position.Y, v9.Z))).LookVector)
                                                    local v12 = (v9 - HumanoidRootPart.Position).Magnitude / 12
                                                    TweenService:Create(HumanoidRootPart, TweenInfo.new(v12, Enum.EasingStyle.Linear), {
                                                        CFrame = v11
                                                    }):Play()
                                                    task.wait(v12)
                                                end
                                            end
                                            task.wait(0.1)
                                            t18[PassengerValues:GetAttribute("Route") .. "-" .. v13.Name].Walk:Stop()
                                        else
                                            task.wait()
                                            v1()
                                        end
                                    end
                                    if v13:GetAttribute("Status") ~= "Idle" then
                                        v1()
                                    end
                                end)
                            end
                            for v5, v6 in workspace:GetPartsInPart(v42) do
                                if v6:IsDescendantOf(v12) then
                                    if PassengerValues:GetAttribute("QueuePosition") == 1 then
                                        local v72 = PassengerValues:GetAttribute("TimeLeft")
                                        local v8 = nil
                                        if v72 < 60 then
                                            v8 = tostring(v72) .. " secs."
                                        elseif v72 < 3600 then
                                            v8 = tostring((math.round(v72 / 60))) .. " mins."
                                        end
                                        QueuePosition.TextLabel.Text = DriveSeat.QueuePosition.Label.Text .. " | Time Limit: " .. v8
                                    else
                                        QueuePosition.TextLabel.Text = DriveSeat.QueuePosition.Label.Text
                                    end
                                    v11 = true
                                    if not JoinQueue.Visible and (not v42:GetAttribute("Debounce") and PassengerValues:GetAttribute("CarryPassengers")) then
                                        JoinQueue.Size = UDim2.fromScale(0, 0)
                                        JoinQueue.Visible = true
                                        TweenService:Create(JoinQueue, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                                            Size = UDim2.fromScale(0.92, 0.205)
                                        }):Play()
                                        local v102 = JoinQueue.Yes.MouseButton1Click:Connect(function() --[[ Line: 4406 | Upvalues: GeneralModule (ref), v3 (ref), TweenService (ref), JoinQueue (ref), v12 (copy), RouteText (copy), v42 (copy), v2 (ref), Code (ref), v10 (ref), NotificationContainer (ref), v4 (ref), v7 (ref) ]]
                                            GeneralModule.PlaySound("ButtonClick")
                                            if not v3 then
                                                v3 = true
                                                TweenService:Create(JoinQueue, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                                                    Size = UDim2.fromScale(0, 0)
                                                }):Play()
                                                if v12:IsDescendantOf(workspace) then
                                                    if RouteText:WaitForChild("Back").TextLabel.Text == v42.Name then
                                                        v2:Fire("JoinQueue", {
                                                            Jeepney = v12,
                                                            BoundBox = v42,
                                                            Join = true,
                                                            Password = Code.code
                                                        })
                                                        v42:SetAttribute("Debounce", true)
                                                        v10 = true
                                                    else
                                                        NotificationContainer.add({
                                                            Text = "Error!",
                                                            Color = v4,
                                                            Stroke = {
                                                                Thickness = 1,
                                                                Color = v7
                                                            }
                                                        })
                                                    end
                                                end
                                                task.wait(2)
                                                JoinQueue.Visible = false
                                                v3 = false
                                            end
                                        end)
                                        local Size = JoinQueue.Yes.Size
                                        local v112 = JoinQueue.Yes.MouseEnter:Connect(function() --[[ Line: 4432 | Upvalues: GeneralModule (ref), JoinQueue (ref), Size (copy) ]]
                                            GeneralModule.PlaySound("Hover")
                                            if JoinQueue.Yes.Size == Size then
                                                JoinQueue.Yes.Size = UDim2.fromScale(Size.X.Scale - Size.X.Scale * 10 / 100, Size.Y.Scale - Size.Y.Scale * 10 / 100)
                                            end
                                            JoinQueue.Yes.MouseLeave:Once(function() --[[ Line: 4438 | Upvalues: JoinQueue (ref), Size (ref) ]]
                                                JoinQueue.Yes.Size = Size
                                            end)
                                        end)
                                        v12.Destroying:Once(function() --[[ Line: 4443 | Upvalues: JoinQueue (ref) ]]
                                            JoinQueue.Visible = false
                                        end)
                                        JoinQueue:GetPropertyChangedSignal("Visible"):Once(function() --[[ Line: 4447 | Upvalues: v102 (copy), v112 (copy) ]]
                                            v102:Disconnect()
                                            v112:Disconnect()
                                        end)
                                    end
                                    break
                                end
                                v11 = false
                            end
                            if not v11 then
                                v42:SetAttribute("Debounce", false)
                                JoinQueue.Visible = false
                            end
                            if v10 and not v11 or PassengerValues:GetAttribute("CurrentPassengers") >= PassengerValues:GetAttribute("MaxPassengers") and v10 then
                                leaveQueue()
                            elseif v12:IsDescendantOf(workspace) or not v10 then
                                if (DriveSeat.Position - v42.Position).Magnitude > 250 and v10 then
                                    leaveQueue()
                                elseif v12.PassengerValues:GetAttribute("CarryPassengers") or not v10 then
                                    if PassengerValues:GetAttribute("TimeLeft") < 0 and PassengerValues:GetAttribute("UnaSaPila") then
                                        leaveQueue()
                                    end
                                else
                                    leaveQueue()
                                end
                            else
                                leaveQueue()
                            end
                            if v10 then
                                if PassengerValues:GetAttribute("QueuePosition") == 1 then
                                    if PassengerValues:GetAttribute("UnaSaPila") then
                                        PassengerValues:SetAttribute("TimeLeft", PassengerValues:GetAttribute("TimeLeft") - 1)
                                    else
                                        PassengerValues:SetAttribute("UnaSaPila", true)
                                        local count = 0
                                        for v122, v13 in workspace.Jeepnies:GetChildren() do
                                            if v13.PassengerValues:GetAttribute("Route") == PassengerValues:GetAttribute("Route") and (v13.PassengerValues:GetAttribute("Destination") == PassengerValues:GetAttribute("Destination") and v13.PassengerValues:GetAttribute("IsInQueue")) then
                                                count = count + 1
                                            end
                                        end
                                        if count == 1 or count == 0 then
                                            PassengerValues:SetAttribute("TimeLeft", 1800)
                                        elseif count == 2 then
                                            PassengerValues:SetAttribute("TimeLeft", 1200)
                                        elseif count == 3 then
                                            PassengerValues:SetAttribute("TimeLeft", 900)
                                        elseif count == 4 then
                                            PassengerValues:SetAttribute("TimeLeft", 600)
                                        elseif count >= 5 and count < 7 then
                                            PassengerValues:SetAttribute("TimeLeft", 500)
                                        elseif count >= 7 and count < 10 then
                                            PassengerValues:SetAttribute("TimeLeft", 300)
                                        elseif count >= 10 then
                                            PassengerValues:SetAttribute("TimeLeft", 60)
                                        end
                                    end
                                    local v14 = Barkers:FindFirstChild(PassengerValues:GetAttribute("Route")):FindFirstChild(v42.Name)
                                    local HumanoidRootPart = v14.HumanoidRootPart
                                    local Humanoid = v14.Humanoid
                                    if not t18[v14.Parent.Name .. "-" .. v14.Name] then
                                        t18[v14.Parent.Name .. "-" .. v14.Name] = {
                                            Walk = v14.Humanoid.Animator:LoadAnimation(Animations.Walk)
                                        }
                                        t17[v14.Parent.Name .. "-" .. v14.Name] = v14.WorldPivot.Position
                                    end
                                    Humanoid.HipHeight = (v14.RightFoot.Position - HumanoidRootPart.Position).Magnitude
                                    v22 = function() --[[ walkToRear | Line: 4576 | Upvalues: Humanoid (copy), v14 (copy), HumanoidRootPart (copy), PathfindingService (ref), v12 (copy), t18 (ref), PassengerValues (copy), LocalPlayer (ref), TweenService (ref), v22 (copy) ]]
                                        task.spawn(function() --[[ Line: 4577 | Upvalues: Humanoid (ref), v14 (ref), HumanoidRootPart (ref), PathfindingService (ref), v12 (ref), t18 (ref), PassengerValues (ref), LocalPlayer (ref), TweenService (ref), v22 (ref) ]]
                                            Humanoid.HipHeight = (v14.RightFoot.Position - HumanoidRootPart.Position).Magnitude + 0.25
                                            v14:SetAttribute("Status", "Likod ng Jeep")
                                            local v1 = PathfindingService:CreatePath({
                                                Radius = 0.5,
                                                WaypointSpacing = 0.2
                                            })
                                            v1:ComputeAsync(HumanoidRootPart.Position, v12.EndPoints.Random1.Position)
                                            local v2 = v1:GetWaypoints()
                                            if v1.Status == Enum.PathStatus.Success then
                                                t18[PassengerValues:GetAttribute("Route") .. "-" .. v14.Name].Walk:Play()
                                                for v4, v5 in v2 do
                                                    local v3
                                                    if v4 ~= 1 then
                                                        local v6 = RaycastParams.new()
                                                        v6.FilterDescendantsInstances = {
                                                            v14,
                                                            workspace.Jeepnies,
                                                            LocalPlayer.Character,
                                                            workspace.Passengers
                                                        }
                                                        v6.FilterType = Enum.RaycastFilterType.Exclude
                                                        local v7 = workspace:Raycast(HumanoidRootPart.Position, Vector3.new(0, -100, 0), v6)
                                                        v3 = if v7 then v7.Position.Y + Humanoid.HipHeight else nil
                                                        local v8 = Vector3.new(v5.Position.X, v3, v5.Position.Z)
                                                        local v10 = CFrame.lookAt(v8, v8 + CFrame.lookAt(HumanoidRootPart.Position, (Vector3.new(v8.X, HumanoidRootPart.Position.Y, v8.Z))).LookVector)
                                                        local v11 = (v8 - HumanoidRootPart.Position).Magnitude / 12
                                                        TweenService:Create(HumanoidRootPart, TweenInfo.new(v11, Enum.EasingStyle.Linear), {
                                                            CFrame = v10
                                                        }):Play()
                                                        task.wait(v11)
                                                    end
                                                end
                                                task.wait(0.1)
                                                t18[PassengerValues:GetAttribute("Route") .. "-" .. v14.Name].Walk:Stop()
                                            else
                                                v22()
                                            end
                                        end)
                                    end
                                    if v14:GetAttribute("Status") ~= "Likod ng Jeep" then
                                        task.spawn(function() --[[ Line: 4577 | Upvalues: Humanoid (copy), v14 (copy), HumanoidRootPart (copy), PathfindingService (ref), v12 (copy), t18 (ref), PassengerValues (copy), LocalPlayer (ref), TweenService (ref), v22 (copy) ]]
                                            Humanoid.HipHeight = (v14.RightFoot.Position - HumanoidRootPart.Position).Magnitude + 0.25
                                            v14:SetAttribute("Status", "Likod ng Jeep")
                                            local v1 = PathfindingService:CreatePath({
                                                Radius = 0.5,
                                                WaypointSpacing = 0.2
                                            })
                                            v1:ComputeAsync(HumanoidRootPart.Position, v12.EndPoints.Random1.Position)
                                            local v2 = v1:GetWaypoints()
                                            if v1.Status == Enum.PathStatus.Success then
                                                t18[PassengerValues:GetAttribute("Route") .. "-" .. v14.Name].Walk:Play()
                                                for v4, v5 in v2 do
                                                    local v3
                                                    if v4 ~= 1 then
                                                        local v6 = RaycastParams.new()
                                                        v6.FilterDescendantsInstances = {
                                                            v14,
                                                            workspace.Jeepnies,
                                                            LocalPlayer.Character,
                                                            workspace.Passengers
                                                        }
                                                        v6.FilterType = Enum.RaycastFilterType.Exclude
                                                        local v7 = workspace:Raycast(HumanoidRootPart.Position, Vector3.new(0, -100, 0), v6)
                                                        v3 = if v7 then v7.Position.Y + Humanoid.HipHeight else nil
                                                        local v8 = Vector3.new(v5.Position.X, v3, v5.Position.Z)
                                                        local v10 = CFrame.lookAt(v8, v8 + CFrame.lookAt(HumanoidRootPart.Position, (Vector3.new(v8.X, HumanoidRootPart.Position.Y, v8.Z))).LookVector)
                                                        local v11 = (v8 - HumanoidRootPart.Position).Magnitude / 12
                                                        TweenService:Create(HumanoidRootPart, TweenInfo.new(v11, Enum.EasingStyle.Linear), {
                                                            CFrame = v10
                                                        }):Play()
                                                        task.wait(v11)
                                                    end
                                                end
                                                task.wait(0.1)
                                                t18[PassengerValues:GetAttribute("Route") .. "-" .. v14.Name].Walk:Stop()
                                            else
                                                v22()
                                            end
                                        end)
                                    end
                                    if PassengerValues:GetAttribute("TimeLeft") == 60 then
                                        local Magnitude = (LocalPlayer.Character.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude
                                        if Magnitude < 10 then
                                            Talk(v14:GetAttribute("Pitch"), "One minute bossing!.", "One minute", v14, 2.5)
                                        elseif Magnitude >= 10 and Magnitude < 20 then
                                            Talk(v14:GetAttribute("Pitch"), "One minute bossing!.", "One minute", v14, 2.5, 3)
                                        elseif Magnitude >= 20 and Magnitude < 30 then
                                            Talk(v14:GetAttribute("Pitch"), "One minute bossing!.", "One minute", v14, 2.5, 1.5)
                                        end
                                        task.delay(2.5, function() --[[ Line: 4651 ]] end)
                                    end
                                    local v16 = math.random(1, 45)
                                    if v16 == 45 or v16 == 1 then
                                        DriveSeat.LinearVelocity.Enabled = false
                                    else
                                        DriveSeat.LinearVelocity.Enabled = true
                                    end
                                    if not v14.Head.ChatBubble.Enabled then
                                        if v16 == 6 or v16 == 7 then
                                            local v17 = v12.JeepneyValues:GetAttribute("ModelName")
                                            if v17 == "Sarao Custombuilt Model 2" then
                                                Talk(v14:GetAttribute("Pitch"), "Makikiusad po, waluhan po yan!", "Waluhan", v14, 4, 7.5)
                                                print("waluhan!")
                                            elseif v17 == "Sarao Custombuilt V1" then
                                                Talk(v14:GetAttribute("Pitch"), "Makikiusad nalang po, pitohan po iyan!", "Pitohan", v14, 4, 7.5)
                                            elseif v17 == "DF Devera Long Model" then
                                                Talk(v14:GetAttribute("Pitch"), "Usad usad lang po, kinsehan po yan!", "Kinsehan", v14, 5, 7.5)
                                            elseif v17 == "Morales 10 Seater" then
                                                Talk(v14:GetAttribute("Pitch"), "Makikiusad nalang sampuan po yan!", "Sampuan", v14, 5, 7.5)
                                            elseif v17 == "Milwaukee Motor Sport 11 Seater" then
                                                Talk(v14:GetAttribute("Pitch"), "Makikiusad ho onsehan ho iyan!", "Onsehan", v14, 5, 7.5)
                                            end
                                        elseif v16 == 9 then
                                            Talk(v14:GetAttribute("Pitch"), "Maluwag pa!", "Maluwag", v14, 4, 7.5)
                                            print("maluwag!")
                                        elseif v16 == 10 then
                                            Talk(v14:GetAttribute("Pitch"), "Magkabilaan pa yan makikiusad nalang po!", "Magkabilaan", v14, 6, 7.5)
                                            print("magkabilaan!")
                                        elseif v16 == 11 and PassengerValues:GetAttribute("CurrentPassengers") == PassengerValues:GetAttribute("MaxPassengers") - 1 then
                                            Talk(v14:GetAttribute("Pitch"), "Isa pa!", "Isa pa", v14, 4, 10)
                                            print("isa pa!")
                                        elseif v16 == 12 then
                                            local v18 = math.random(1, 2)
                                            local v19 = PassengerValues:GetAttribute("Destination")
                                            if v19 == "Bulakan" then
                                                Talk(v14:GetAttribute("Pitch"), "Bulakan, Bulakan!", "Bulakan#" .. v18, v14, 6, 10)
                                            elseif v19 == "Malolos" then
                                                Talk(v14:GetAttribute("Pitch"), "Malolos, Malolos!", "Malolos#" .. v18, v14, 6, 10)
                                            elseif v19 == "Balagtas" then
                                                Talk(v14:GetAttribute("Pitch"), "Balagtas, Balagtas!", "Balagtas#" .. v18, v14, 6, 10)
                                                print("balagtas!")
                                            elseif v19 == "Guiguinto" then
                                                Talk(v14:GetAttribute("Pitch"), "Guiguinto, Guiguinto!", "Guiguinto#" .. v18, v14, 6, 10)
                                            end
                                        end
                                    end
                                end
                                if not QueuePosition.Visible then
                                    QueuePosition.Visible = true
                                    QueuePosition.Size = UDim2.fromScale(0, 0)
                                    TweenService:Create(QueuePosition, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {
                                        Size = UDim2.fromScale(0.35, 0.055)
                                    }):Play()
                                end
                            end
                        end
                    end
                    if #ScrollingFrame.Frame:GetChildren() > 3 and (not Frame.Visible and OtherValues.IsDrivingAJeepney.Value) then
                        Frame.Visible = true
                        Frame.Position = UDim2.fromScale(0.9, 0.02)
                        ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
                        TweenService:Create(Frame, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {
                            Position = UDim2.fromScale(0.596, 0.02)
                        }):Play()
                    elseif not OtherValues.IsDrivingAJeepney.Value then
                        Frame.Visible = false
                    end
                    if #ScrollingFrame.Frame:GetChildren() == 3 then
                        Frame.Visible = false
                    end
                    local v20 = false
                    for v21, v222 in ScrollingFrame.Frame:GetChildren() do
                        if v222:IsA("Frame") and (v222.Visible and v222.Name == "PassengerChatTemplate") then
                            v20 = true
                        end
                    end
                    if not v20 then
                        Frame.Notif.Visible = false
                    end
                    Barya.TextLabel.Text = "\226\130\177" .. GeneralModule.Format(PassengerValues:GetAttribute("Barya"))
                end
                if (workspace:WaitForChild(v12.Name):WaitForChild("HumanoidRootPart").Position - v12:WaitForChild("DriveSeat").Position).Magnitude > 10 and Screen.Frames.Radio.Visible then
                    Screen.Frames.Radio.Visible = false
                end
            else
                PlayerGui.BillboardGuis.Enabled = false
                if RoleCache[LocalPlayer] == "Conductor" then
                    local v23 = nil
                    for v24, v25 in workspace.Jeepnies:GetChildren() do
                        if v25.Body.FunctionalStuff:FindFirstChild("Seats") then
                            for v26, v27 in v25.Body.FunctionalStuff.Seats:GetChildren() do
                                if v27:FindFirstChild("SeatWeld") and (v27.SeatWeld.Part1 ~= nil and (v27.SeatWeld.Part1:IsDescendantOf(workspace) and v27.SeatWeld.Part1.Parent.Name == LocalPlayer.Character.Name)) then
                                    v23 = v27
                                    break
                                end
                            end
                        end
                        if v23 then
                            break
                        end
                    end
                    if #ScrollingFrame.Frame:GetChildren() > 3 and (not Frame.Visible and (OtherValues.IsSeatingInAJeepney.Value and v23)) then
                        if v23.Name == "FrontSeat" then
                            Frame.Visible = true
                            Frame.Position = UDim2.fromScale(0.9, 0.02)
                            ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
                            TweenService:Create(Frame, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {
                                Position = UDim2.fromScale(0.596, 0.02)
                            }):Play()
                        end
                    elseif not (OtherValues.IsSeatingInAJeepney.Value and v23) then
                        Frame.Visible = false
                    end
                    if #ScrollingFrame.Frame:GetChildren() == 3 then
                        Frame.Visible = false
                    end
                end
            end
        end)
        if v12 then
            warn(v12)
        end
    end
end)()
local Cash_2 = leaderstats.Cash.Value
local Exp = leaderstats.Exp.Value
local Barya_2 = v1.Barya.Value
local ReputationPoints = v1.ReputationPoints.Value
Cash.TextLabel.Text = "\226\130\177" .. GeneralModule.Format(leaderstats.Cash.Value)
Barya.TextLabel.Text = "\226\130\177" .. GeneralModule.Format(v1.Barya.Value)
OtherValues.IsDrivingAJeepney:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 4843 | Upvalues: LocalPlayer (copy), OtherValues (copy), Camera (copy), Frame_4 (copy), Frame_6 (copy), Frame_5 (copy), JeepneyMisc (copy), Frame_7 (copy), MiscButtons (copy), Frame (copy), Screen (copy), PlayerGui (copy), Barya_2 (ref), Settings_2 (copy), Pose (copy), Barker (copy), ScrollingFrame (copy) ]]
    local v1 = workspace:FindFirstChild(LocalPlayer.Name)
    if OtherValues.IsDrivingAJeepney.Value then
        if OtherValues.IsDrivingAJeepney.Value then
            Barya_2 = workspace.Jeepnies:FindFirstChild(LocalPlayer.Name).PassengerValues:GetAttribute("Barya")
            Camera.CameraSubject = workspace.Jeepnies:FindFirstChild(LocalPlayer.Name).DriveSeat
            v1.Humanoid.CameraOffset = Vector3.new(0, -0.25, -0.7)
            JeepneyMisc.Visible = true
            MiscButtons.Visible = false
            Settings_2.Visible = false
            Pose.Visible = false
            Barker.Visible = false
            local t = { "FillFuel", "PourFuel", "Front", "Rear", "Repair", "SpawnerGuis", "RefilCoolant", "RefilEngineOil" }
            for v2, v3 in PlayerGui.BillboardGuis:GetDescendants() do
                if v3:IsA("BillboardGui") and table.find(t, v3.Name) then
                    v3.Enabled = false
                end
            end
            if #ScrollingFrame.Frame:GetChildren() > 3 then
                Frame.Visible = true
            end
        end
    else
        Camera.CameraSubject = v1.Humanoid
        Camera.FieldOfView = 70
        v1.Humanoid.CameraOffset = Vector3.new(0, 0, -0.7)
        Frame_4.Parent.Visible = false
        Frame_6.Parent.Visible = false
        Frame_5.Parent.Visible = false
        JeepneyMisc.Visible = false
        Frame_7.Parent.Visible = false
        MiscButtons.Visible = true
        Frame.Visible = false
        local t = {
            "FillFuel",
            "PourFuel",
            "Front",
            "Rear",
            "Detach",
            "Repair",
            "SpawnerGuis",
            "RefilCoolant",
            "RefilEngineOil"
        }
        if not Screen.Frames.Refuel.Visible then
            for v4, v5 in PlayerGui.BillboardGuis:GetDescendants() do
                if v5:IsA("BillboardGui") and not table.find(t, v5.Name) then
                    v5.Enabled = true
                end
            end
        end
    end
end)
leaderstats.Cash:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 4917 | Upvalues: Cash_2 (ref), leaderstats (copy), EffectsModule (copy), Cash (copy), GeneralModule (copy) ]]
    if Cash_2 > leaderstats.Cash.Value then
        EffectsModule.LabelEffect(Cash, true, Cash_2 - leaderstats.Cash.Value)
    else
        EffectsModule.LabelEffect(Cash, false, leaderstats.Cash.Value - Cash_2)
    end
    Cash_2 = leaderstats.Cash.Value
    Cash.TextLabel.Text = "\226\130\177" .. GeneralModule.Format(leaderstats.Cash.Value)
end)
v1.Barya:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 4928 | Upvalues: Barya_2 (ref), v1 (copy), EffectsModule (copy), Barya (copy), GeneralModule (copy) ]]
    if Barya_2 > v1.Barya.Value then
        EffectsModule.LabelEffect(Barya, true, Barya_2 - v1.Barya.Value)
    else
        EffectsModule.LabelEffect(Barya, false, v1.Barya.Value - Barya_2)
    end
    Barya_2 = v1.Barya.Value
    Barya.TextLabel.Text = "\226\130\177" .. GeneralModule.Format(v1.Barya.Value)
end)
leaderstats.Exp:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 4939 | Upvalues: Exp (ref), leaderstats (copy), NotificationContainer (copy), v4 (copy), v7 (copy), v6 (copy) ]]
    if Exp > leaderstats.Exp.Value then
        NotificationContainer.add({
            Text = "-" .. Exp - leaderstats.Exp.Value .. " exp!",
            Color = v4,
            Stroke = {
                Thickness = 1,
                Color = v7
            }
        })
    else
        NotificationContainer.add({
            Text = "+" .. leaderstats.Exp.Value - Exp .. " exp!",
            Color = v6,
            Stroke = {
                Thickness = 1,
                Color = v7
            }
        })
    end
    Exp = leaderstats.Exp.Value
end)
v1.ReputationPoints:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 4949 | Upvalues: ReputationPoints (ref), v1 (copy), NotificationContainer (copy), v4 (copy), v7 (copy), v6 (copy) ]]
    if ReputationPoints > v1.ReputationPoints.Value then
        NotificationContainer.add({
            Text = "-" .. ReputationPoints - v1.ReputationPoints.Value .. " reputation points!",
            Color = v4,
            Stroke = {
                Thickness = 1,
                Color = v7
            }
        })
    else
        NotificationContainer.add({
            Text = "+" .. v1.ReputationPoints.Value - ReputationPoints .. " reputation points!",
            Color = v6,
            Stroke = {
                Thickness = 1,
                Color = v7
            }
        })
    end
    ReputationPoints = v1.ReputationPoints.Value
end)
return t
