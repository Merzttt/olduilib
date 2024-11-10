  if game.CoreGui:FindFirstChild("Neverlose") then
    game.CoreGui:FindFirstChild("Neverlose"):Destroy();
 end
 
 if game.CoreGui:FindFirstChild("Notification") then
    game.CoreGui:FindFirstChild("Notification"):Destroy()
 end
 
 local NVL = {}
 local UserInputService = game:GetService("UserInputService")
 local TweenService = game:GetService("TweenService")
 local RunService = game:GetService("RunService")
 local LocalPlayer = game:GetService("Players").LocalPlayer
 local Mouse = LocalPlayer:GetMouse()
 local PlaceId = game.PlaceId
 
 local function MakeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil
   
    local function Update(input)
       local Delta = input.Position - DragStart
       local pos =
          UDim2.new(
             StartPosition.X.Scale,
             StartPosition.X.Offset + Delta.X,
             StartPosition.Y.Scale,
             StartPosition.Y.Offset + Delta.Y
          )
       local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
       Tween:Play()
    end
   
    topbarobject.InputBegan:Connect(
       function(input)
          if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
             Dragging = true
             DragStart = input.Position
             StartPosition = object.Position
   
             input.Changed:Connect(
                function()
                   if input.UserInputState == Enum.UserInputState.End then
                      Dragging = false
                   end
                end
             )
          end
       end
    )
   
    topbarobject.InputChanged:Connect(
       function(input)
          if
             input.UserInputType == Enum.UserInputType.MouseMovement or
                input.UserInputType == Enum.UserInputType.Touch
          then
             DragInput = input
          end
       end
    )
   
    UserInputService.InputChanged:Connect(
       function(input)
          if input == DragInput and Dragging then
             Update(input)
          end
       end
    )
   end
 
 local Neverlose = Instance.new("ScreenGui")
 Neverlose.Name = "Neverlose"
 Neverlose.Parent = game.CoreGui
 Neverlose.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 
 function NVL:Window(text)
    local FirstTab = false
 
    local TabHolder = Instance.new("Frame")
    local TabHolderLayout = Instance.new("UIListLayout")
    local MainFrame = Instance.new("Frame")
    local MainFrameCorner = Instance.new("UICorner")
    local LeftFrame = Instance.new("Frame")
    local LeftFrameCorner = Instance.new("UICorner")
    local HubName = Instance.new("TextLabel")
    local LeftFrameLineY = Instance.new("Frame")
    local LeftFrameLineX = Instance.new("Frame")
    
    local DragFrame = Instance.new("Frame")
    local ContainerHold = Instance.new("Folder")
    local Glow = Instance.new("ImageLabel")
 
 
 MainFrame.Name = "MainFrame"
 MainFrame.Parent = Neverlose
 MainFrame.BackgroundColor3 = Color3.fromRGB(2, 9, 25)
 MainFrame.Position = UDim2.new(0.183809265, 0, 0.107707649, 0)
 MainFrame.Size = UDim2.new(0, 762, 0, 453)

 MainFrameCorner.CornerRadius = UDim.new(0, 5)
 MainFrameCorner.Name = "MainFrameCorner"
 MainFrameCorner.Parent = MainFrame
 
 LeftFrame.Name = "LeftFrame"
 LeftFrame.Parent = MainFrame
 LeftFrame.BackgroundColor3 = Color3.fromRGB(12, 15, 65)
 LeftFrame.BorderSizePixel = 0
 LeftFrame.Size = UDim2.new(0, 168, 0, 454)

 LeftFrameCorner.CornerRadius = UDim.new(0, 5)
 LeftFrameCorner.Name = "LeftFrameCorner"
 LeftFrameCorner.Parent = LeftFrame
 
 HubName.Name = "HubName"
 HubName.Parent = LeftFrame
 HubName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 HubName.BackgroundTransparency = 1.000
 HubName.Size = UDim2.new(0, 168, 0, 43)
 HubName.Font = Enum.Font.GothamBold
 HubName.Text = "VANTA" or text
 HubName.TextColor3 = Color3.fromRGB(255, 255, 255)
 HubName.TextSize = 20.000
 
 Glow.Name = "Glow"
 Glow.Parent = MainFrame
 Glow.BackgroundColor3 = Color3.fromRGB(58, 68, 255)
 Glow.BackgroundTransparency = 1.000
 Glow.Position = UDim2.new(-0.0551181138, 0, -0.0569948182, 0)
 Glow.Size = UDim2.new(0, 847, 0, 504)
 Glow.Visible = true
 Glow.Image = "rbxassetid://4996891970"
 Glow.ImageColor3 = Color3.fromRGB(25, 17, 255)
 
 DragFrame.Name = "DragFrame"
 DragFrame.Parent = MainFrame
 DragFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 DragFrame.BackgroundTransparency = 1.000
 DragFrame.Size = UDim2.new(0, 762, 0, 30)
 
 ContainerHold.Name = "ContainerHold"
 ContainerHold.Parent = MainFrame
 
 LeftFrameLineY.Name = "LeftFrameLineY"
 LeftFrameLineY.Parent = LeftFrame
 LeftFrameLineY.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 LeftFrameLineY.Position = UDim2.new(0.99, 0, 0, 1.1)
 LeftFrameLineY.Size = UDim2.new(0, 0, 0, 452)
 
 LeftFrameLineX.Name = "LeftFrameLineX"
 LeftFrameLineX.Parent = LeftFrame
 LeftFrameLineX.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 LeftFrameLineX.Position = UDim2.new(1, 0, 0.0742659792, 0)
 LeftFrameLineX.Size = UDim2.new(0, 592, 0, 0)
 
 TabHolder.Name = "TabHolder"
 TabHolder.Parent = LeftFrame
 TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 TabHolder.BackgroundTransparency = 1.000
 TabHolder.Position = UDim2.new(0, 0, 0.0880829021, 0)
 TabHolder.Size = UDim2.new(0, 168, 0, 413)
 
 TabHolderLayout.Name = "TabHolderLayout"
 TabHolderLayout.Parent = TabHolder
 TabHolderLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
 TabHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
 TabHolderLayout.Padding = UDim.new(0, 9)
 
 
 local DropThemeToggled = false
 local SettingsFrameToggled = false
 
 local SettingsButton = Instance.new("ImageButton")
 local SettingsCorner = Instance.new("UICorner")
 local SettingsFrame = Instance.new("Frame")
 local SettingsFrameGlow = Instance.new("ImageLabel")
 local SettingsFrameHolder = Instance.new("ScrollingFrame")
 local Themes = Instance.new("TextButton")
 local ThemesArrow = Instance.new("ImageLabel")
 local ThemesTitle = Instance.new("TextLabel")
 local ThemesCorner = Instance.new("UICorner")
 local ThemesDropdownFrame = Instance.new("Frame")
 local Default = Instance.new("TextButton")
 local DefaultCorner = Instance.new("UICorner")
 local ThemesDropdownFrameLayout = Instance.new("UIListLayout")
 local Black = Instance.new("TextButton")
 local BlackCorner = Instance.new("UICorner")
 local ThemesDropdownFrameCorner = Instance.new("UICorner")
 local SettingsFrameHolderLayout = Instance.new("UIListLayout")
 local SettingsFrameHolderPadding = Instance.new("UIPadding")
 
 
 SettingsButton.Name = "SettingsButton"
 SettingsButton.Parent = MainFrame
 SettingsButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
 SettingsButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
 SettingsButton.Position = UDim2.new(0.95, 0, -0, 0)
 SettingsButton.Size = UDim2.new(0, 37, 0, 30)
 SettingsButton.Image = "rbxassetid://8823908166"
 
 SettingsCorner.Name = "SettingsCorner"
 SettingsCorner.Parent = SettingsButton
 
 SettingsFrame.Name = "SettingsFrame"
 SettingsFrame.Parent = MainFrame
 SettingsFrame.BackgroundColor3 = Color3.fromRGB(2, 9, 25)
 SettingsFrame.Position = UDim2.new(1.04068244, 0, 0.119170979, 0)
 SettingsFrame.Size = UDim2.new(0, 285, 0, 408)
 SettingsFrame.Visible = false
 SettingsFrame.BackgroundTransparency = 1
 
 SettingsFrameGlow.Name = "SettingsFrameGlow"
 SettingsFrameGlow.Parent = SettingsFrame
 SettingsFrameGlow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 SettingsFrameGlow.BackgroundTransparency = 1.000
 SettingsFrameGlow.Position = UDim2.new(-0.0563474223, 0, -0.0491720065, 0)
 SettingsFrameGlow.Size = UDim2.new(0, 317, 0, 447)
 SettingsFrameGlow.Image = "rbxassetid://4996891970"
 SettingsFrameGlow.ImageColor3 = Color3.fromRGB(25, 17, 255)
 
 SettingsFrameHolder.Name = "SettingsFrameHolder"
 SettingsFrameHolder.Parent = SettingsFrame
 SettingsFrameHolder.Active = true
 SettingsFrameHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 SettingsFrameHolder.BackgroundTransparency = 1.000
 SettingsFrameHolder.BorderSizePixel = 0
 SettingsFrameHolder.Size = UDim2.new(0, 285, 0, 408)
 SettingsFrameHolder.ScrollBarThickness = 6
 
 Themes.Name = "Themes"
 Themes.Parent = SettingsFrameHolder
 Themes.BackgroundColor3 = Color3.fromRGB(7, 33, 90)
 Themes.Position = UDim2.new(0.231034487, 0, 0, 0)
 Themes.Size = UDim2.new(0, 184, 0, 28)
 Themes.Font = Enum.Font.Gotham
 Themes.Text = ""
 Themes.TextColor3 = Color3.fromRGB(255, 255, 255)
 Themes.TextSize = 14.000
 Themes.TextXAlignment = Enum.TextXAlignment.Left
 
 ThemesArrow.Name = "ThemesArrow"
 ThemesArrow.Parent = Themes
 ThemesArrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 ThemesArrow.BackgroundTransparency = 1.000
 ThemesArrow.Position = UDim2.new(0.794871807, 0, 0.0714285746, 0)
 ThemesArrow.Size = UDim2.new(0, 32, 0, 24)
 ThemesArrow.Image = "rbxassetid://6034818372"
 
 ThemesTitle.Name = "ThemesTitle"
 ThemesTitle.Parent = Themes
 ThemesTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 ThemesTitle.BackgroundTransparency = 1.000
 ThemesTitle.Position = UDim2.new(0.051282052, 0, 0, 0)
 ThemesTitle.Size = UDim2.new(0, 148, 0, 28)
 ThemesTitle.Font = Enum.Font.Gotham
 ThemesTitle.Text = "Themes"
 ThemesTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
 ThemesTitle.TextSize = 14.000
 ThemesTitle.TextXAlignment = Enum.TextXAlignment.Left
 
 ThemesCorner.CornerRadius = UDim.new(0, 5)
 ThemesCorner.Name = "ThemesCorner"
 ThemesCorner.Parent = Themes
 
 ThemesDropdownFrame.Name = "ThemesDropdownFrame"
 ThemesDropdownFrame.Parent = SettingsFrameHolder
 ThemesDropdownFrame.BackgroundColor3 = Color3.fromRGB(6, 28, 77)
 ThemesDropdownFrame.Position = UDim2.new(0.224644274, 0, 0.0987757817, 0)
 ThemesDropdownFrame.Size = UDim2.new(0, 184, 0, 0)
 ThemesDropdownFrame.Visible = false
 
 Default.Name = "Default"
 Default.Parent = ThemesDropdownFrame
 Default.BackgroundColor3 = Color3.fromRGB(27, 30, 80)
 Default.Position = UDim2.new(0.0448717959, 0, 0.0851063803, 0)
 Default.Size = UDim2.new(0, 141, 0, 23)
 Default.Font = Enum.Font.Gotham
 Default.Text = "Default"
 Default.TextColor3 = Color3.fromRGB(255, 255, 255)
 Default.TextSize = 14.000
 
 DefaultCorner.Name = "DefaultCorner"
 DefaultCorner.Parent = Default
 
 ThemesDropdownFrameLayout.Name = "ThemesDropdownFrameLayout"
 ThemesDropdownFrameLayout.Parent = ThemesDropdownFrame
 ThemesDropdownFrameLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
 ThemesDropdownFrameLayout.SortOrder = Enum.SortOrder.LayoutOrder
 ThemesDropdownFrameLayout.Padding = UDim.new(0, 7)
 
 Black.Name = "Black"
 Black.Parent = ThemesDropdownFrame
 Black.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
 Black.Position = UDim2.new(0.0448717959, 0, -0.212765962, 0)
 Black.Size = UDim2.new(0, 141, 0, 23)
 Black.Font = Enum.Font.Gotham
 Black.Text = "Black"
 Black.TextColor3 = Color3.fromRGB(255, 255, 255)
 Black.TextSize = 14.000
 
 BlackCorner.Name = "BlackCorner"
 BlackCorner.Parent = Black
 
 ThemesDropdownFrameCorner.Name = "ThemesDropdownFrameCorner"
 ThemesDropdownFrameCorner.Parent = ThemesDropdownFrame
 
 SettingsFrameHolderLayout.Name = "SettingsFrameHolderLayout"
 SettingsFrameHolderLayout.Parent = SettingsFrameHolder
 SettingsFrameHolderLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
 SettingsFrameHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
 SettingsFrameHolderLayout.Padding = UDim.new(0, 6)
 
 SettingsFrameHolderPadding.Name = "SettingsFrameHolderPadding"
 SettingsFrameHolderPadding.Parent = SettingsFrameHolder
 SettingsFrameHolderPadding.PaddingBottom = UDim.new(0, 5)
 SettingsFrameHolderPadding.PaddingTop = UDim.new(0, 5)
 
 SettingsButton.MouseButton1Click:Connect(function()
    if SettingsFrameToggled == false then
       SettingsFrameGlow.Visible = true
       SettingsFrame.Visible = true
       TweenService:Create(
          SettingsFrame,
          TweenInfo.new(.7, Enum.EasingStyle.Quad),
          {BackgroundTransparency = 0}
       ):Play()
       SettingsFrameHolder.Visible = true
       SettingsFrameToggled = not SettingsFrameToggled
    else
       SettingsFrameToggled = false
       SettingsFrameGlow.Visible = false
       SettingsFrameHolder.Visible = false
       TweenService:Create(
          SettingsFrame,
          TweenInfo.new(.7, Enum.EasingStyle.Quad),
          {BackgroundTransparency = 1}
       ):Play()
       repeat task.spawn()
       until SettingsFrame.BackgroundTransparency == 1 or SettingsFrameHolder.BackgroundTransparency == 1
       SettingsFrame.Visible = false
       SettingsFrameToggled = false
    end
 end)
 
 Themes.MouseButton1Click:Connect(function()
    if DropThemeToggled == false then
       ThemesDropdownFrame.Visible = true
       Black.Visible = true
       Default.Visible = true
       ThemesDropdownFrame:TweenSize(
          UDim2.new(0, 184, 0, 94),
          Enum.EasingDirection.Out,
          Enum.EasingStyle.Quart,
          0.1,
          true
       )
 
       
 
      TweenService:Create(
       ThemesArrow,
       TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
          {Rotation = 180}
       ):Play()
 
       DropThemeToggled = not DropThemeToggled
    else
 
       Black.Visible = false
       Default.Visible = false
 
      TweenService:Create(
       ThemesArrow,
       TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
          {Rotation = 0}
       ):Play()
 
       ThemesDropdownFrame:TweenSize(
          UDim2.new(0, 184, 0, 0),
          Enum.EasingDirection.Out,
          Enum.EasingStyle.Quart,
          0.1,
          true
       )
 
       repeat wait()
       until ThemesDropdownFrame.Size == UDim2.new(0, 184, 0, 0)
       
       ThemesDropdownFrame.Visible = false
       DropThemeToggled = false
    end
    end)
 
    Black.MouseButton1Click:Connect(function()
       Black.Visible = false
       Default.Visible = false
       TweenService:Create(
       ThemesArrow,
       TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
          {Rotation = 0}
       ):Play()
 
       ThemesDropdownFrame:TweenSize(
          UDim2.new(0, 184, 0, 0),
          Enum.EasingDirection.Out,
          Enum.EasingStyle.Quart,
          0.1,
          true
       )
 
       ThemesTitle.Text = "Themes ".. "-".. " Black"
       MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
       LeftFrame.BackgroundColor3 = Color3.fromRGB(49, 48, 50)
       Glow.ImageColor3 = Color3.fromRGB(25,25,25)
       Themes.BackgroundColor3 = Color3.fromRGB(35,35,35)
       ThemesDropdownFrame.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
       SettingsFrameGlow.BackgroundColor3 = Color3.fromRGB(25,25,25)
       SettingsFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
       DropThemeToggled = false
    end)
 
    Default.MouseButton1Click:Connect(function()
       Black.Visible = false
       Default.Visible = false
       TweenService:Create(
       ThemesArrow,
       TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
          {Rotation = 0}
       ):Play()
 
       ThemesDropdownFrame:TweenSize(
          UDim2.new(0, 184, 0, 0),
          Enum.EasingDirection.Out,
          Enum.EasingStyle.Quart,
          0.1,
          true
       )
 
       ThemesTitle.Text = "Themes ".. "-".. " Default"
 
 SettingsFrameGlow.BackgroundColor3 = Color3.fromRGB(58, 68, 255)
 MainFrame.BackgroundColor3 = Color3.fromRGB(2, 9, 25)
 LeftFrame.BackgroundColor3 = Color3.fromRGB(12, 15, 65)
 HubName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 Glow.ImageColor3 = Color3.fromRGB(58, 68, 255)
 Themes.BackgroundColor3 = Color3.fromRGB(7, 33, 90)
 ThemesArrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 ThemesDropdownFrame.BackgroundColor3 = Color3.fromRGB(6, 28, 77)
 Default.BackgroundColor3 = Color3.fromRGB(27, 30, 80)
 Black.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
 DragFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 LeftFrameLineY.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 LeftFrameLineX.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 SettingsFrame.BackgroundColor3 = Color3.fromRGB(2, 9, 25)
 
       DropThemeToggled = false
    end)
 
    SettingsFrameHolder.CanvasSize = UDim2.new(0, 0, 0, SettingsFrameHolderLayout.AbsoluteContentSize.Y)
 
    MakeDraggable(DragFrame, MainFrame)
 
 function NVL:SButton(text, callback)
    local SettingsFrameHolderButton = Instance.new("TextButton")
    local SettingsButtonCorner = Instance.new("UICorner")
 
 SettingsFrameHolderButton.Name = "SettingsFrameHolderButton"
 SettingsFrameHolderButton.Parent = SettingsFrameHolder
 SettingsFrameHolderButton.BackgroundColor3 = Color3.fromRGB(7, 33, 90)
 SettingsFrameHolderButton.Size = UDim2.new(0, 184, 0, 28)
 SettingsFrameHolderButton.Font = Enum.Font.Gotham
 SettingsFrameHolderButton.Text = text
 SettingsFrameHolderButton.TextColor3 = Color3.fromRGB(255, 255, 255)
 SettingsFrameHolderButton.TextSize = 14.000
 SettingsFrameHolderButton.AutoButtonColor = false
 
 SettingsButtonCorner.CornerRadius = UDim.new(0, 5)
 SettingsButtonCorner.Name = "SettingsButtonCorner"
 SettingsButtonCorner.Parent = SettingsFrameHolderButton
 
 SettingsFrameHolderButton.MouseEnter:Connect(function()
    TweenService:Create(
       SettingsFrameHolderButton,
       TweenInfo.new(.0, Enum.EasingStyle.Quad),
       {BackgroundTransparency = .56}
    ):Play();
    end)
 
    SettingsFrameHolderButton.MouseLeave:Connect(function()
       TweenService:Create(
          SettingsFrameHolderButton,
          TweenInfo.new(.0, Enum.EasingStyle.Quad),
          {BackgroundTransparency = 0}
       ):Play();
       end)
 
       SettingsFrameHolderButton.MouseButton1Click:Connect(function()
          SettingsFrameHolderButton.Size = UDim2.new(0, 100, 0, 28)
          TweenService:Create(
             SettingsFrameHolderButton,
             TweenInfo.new(.3, Enum.EasingStyle.Quad),
             {Size = UDim2.new(0, 184, 0, 28)}
          ):Play()
          pcall(callback)
       end)
 
 end
 
 function NVL:SName(text)
 local LeftFrameSectionName = Instance.new("TextLabel")
 
 
 LeftFrameSectionName.Name = "LeftFrameSectionName"
 LeftFrameSectionName.Parent = TabHolder
 LeftFrameSectionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 LeftFrameSectionName.BackgroundTransparency = 1.000
 LeftFrameSectionName.Position = UDim2.new(0.0297619049, 0, -0.0228181332, 0)
 LeftFrameSectionName.Size = UDim2.new(0, 160, 0, 18)
 LeftFrameSectionName.Font = Enum.Font.Gotham
 LeftFrameSectionName.Text = text
 LeftFrameSectionName.TextColor3 = Color3.fromRGB(147, 147, 147)
 LeftFrameSectionName.TextSize = 14.000
 LeftFrameSectionName.TextXAlignment = Enum.TextXAlignment.Left
 end
 
 
 function NVL:Notification(Title, Discription)
    local Notification = Instance.new("Frame")
    local NotificationCorner = Instance.new("UICorner")
    local NotificationTitle = Instance.new("TextLabel")
    local NotificationDescripton = Instance.new("TextLabel")
    local OKButtonNotification = Instance.new("ImageButton")
 
    spawn(function()
       while wait() do
          Notification.Name = math.random(1, 5000)
       end
    end)
 Notification.Parent = Neverlose
 Notification.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
 Notification.Position = UDim2.new(0.850057244, 0, 0.85478096, 2)
 Notification.Size = UDim2.new(0, 0, 0, 54)
 
 NotificationCorner.CornerRadius = UDim.new(0, 5)
 NotificationCorner.Name = "NotificationCorner"
 NotificationCorner.Parent = Notification
 
 spawn(function()
    while wait() do
       NotificationTitle.Name = math.random(1, 5000)
    end
 end)
 NotificationTitle.Parent = Notification
 NotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 NotificationTitle.BackgroundTransparency = 1.000
 NotificationTitle.Size = UDim2.new(0, 269, 0, 17)
 NotificationTitle.Font = Enum.Font.Gotham
 NotificationTitle.Text = Title
 NotificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
 NotificationTitle.TextSize = 15.000
 
 spawn(function()
    while wait() do
       NotificationDescripton.Name = math.random(1, 5000)
    end
 end)
 NotificationDescripton.Parent = Notification
 NotificationDescripton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 NotificationDescripton.BackgroundTransparency = 1.000
 NotificationDescripton.Position = UDim2.new(0, 0, 0.203703701, 0)
 NotificationDescripton.Size = UDim2.new(0, 269, 0, 37)
 NotificationDescripton.Font = Enum.Font.Gotham
 NotificationDescripton.Text = Discription
 NotificationDescripton.TextColor3 = Color3.fromRGB(255, 255, 255)
 NotificationDescripton.TextSize = 13.000
 
 spawn(function()
    while wait() do
       OKButtonNotification.Name = math.random(1, 5000)
    end
 end)
 OKButtonNotification.Parent = Notification
 OKButtonNotification.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
 OKButtonNotification.BackgroundTransparency = 1.000
 OKButtonNotification.Position = UDim2.new(0, 0, 0.314814806, 0)
 OKButtonNotification.Size = UDim2.new(0, 28, 0, 25)
 OKButtonNotification.Image = "rbxassetid://5012538259"
 OKButtonNotification.AutoButtonColor = true
 
       NotificationTitle.Visible = false
       NotificationDescripton.Visible = false
       OKButtonNotification.Visible = false
 
    Notification:TweenSize(UDim2.new(0, 259, 0, 54), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .5, true)
    wait(.256876354534)
       NotificationTitle.Visible = true
       NotificationDescripton.Visible = true
       OKButtonNotification.Visible = true
    OKButtonNotification.MouseButton1Click:Connect(function()
       Notification:TweenSize(UDim2.new(0, 0,0, 54), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
 
       NotificationTitle:Destroy()
       NotificationDescripton:Destroy()
       OKButtonNotification:Destroy()
       wait(0.2)
 
       TweenService:Create(
          Notification,
          TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
          {BackgroundTransparency = 1}
       ):Play()
 
       Notification:Destroy()
    end)
 
 spawn(function()
    wait(5)
    Notification:TweenSize(UDim2.new(0, 0,0, 54), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
 
    NotificationTitle:Destroy()
    NotificationDescripton:Destroy()
    OKButtonNotification:Destroy()
    wait(0.2)
 
    TweenService:Create(
       Notification,
       TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
       {BackgroundTransparency = 1}
    ):Play()
 
    Notification:Destroy()
 end)
 
 end
 
 local Tabs = {}
 function Tabs:Tab(text)
 local Tab = Instance.new("TextButton")
 local TabCorner = Instance.new("UICorner")
 local TabTitle = Instance.new("TextLabel")
 local TabGradient = Instance.new("UIGradient")
 local ContainerListLayout = Instance.new("UIListLayout")
 local Container = Instance.new("ScrollingFrame")
 
 Tab.Name = "Tab"
 Tab.Parent = TabHolder
 Tab.BackgroundColor3 = Color3.fromRGB(7, 33, 110)
 Tab.Position = UDim2.new(0.0386904776, 0, 0.0463709682, 0)
 Tab.Size = UDim2.new(0, 155, 0, 33)
 Tab.Font = Enum.Font.SourceSans
 Tab.Text = ""
 Tab.TextColor3 = Color3.fromRGB(0, 0, 0)
 Tab.TextSize = 14.000
 Tab.BackgroundTransparency = 1
 
 TabCorner.CornerRadius = UDim.new(0, 5)
 TabCorner.Name = "TabCorner"
 TabCorner.Parent = Tab
 
 TabTitle.Name = "TabTitle"
 TabTitle.Parent = Tab
 TabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 TabTitle.BackgroundTransparency = 1.000
 TabTitle.Size = UDim2.new(0, 155, 0, 33)
 TabTitle.Font = Enum.Font.Gotham
 TabTitle.Text = text
 TabTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
 TabTitle.TextSize = 14.000
 
 --[[
 TabGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(160, 207, 236)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(102, 152, 255))}
 TabGradient.Name = "TabGradient"
 TabGradient.Parent = Tab
 ]]
 Container.Name = "Container"
 Container.Parent = ContainerHold
 Container.Active = true
 Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 Container.BackgroundTransparency = 1.000
 Container.BorderSizePixel = 0
 Container.Position = UDim2.new(0.22047244, 0, 0.0880829021, 0)
 Container.Size = UDim2.new(0, 594, 0, 414)
 Container.ScrollBarThickness = 6
 Container.Visible = false
 
 ContainerListLayout.Name = "ContainerListLayout"
 ContainerListLayout.Parent = Container
 ContainerListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
 ContainerListLayout.SortOrder = Enum.SortOrder.LayoutOrder
 ContainerListLayout.Padding = UDim.new(0, 12)
 
 if FirstTab == false then
    FirstTab = true
    Container.Visible = true
    Tab.BackgroundTransparency = 0
 end
 
 Tab.MouseButton1Click:Connect(
    function()
       for i, v in next, ContainerHold:GetChildren() do
          if v.Name == "Container" then
             v.Visible = false
          end
       end
 
       for i, v in next, TabHolder:GetChildren() do
          if v.ClassName == "TextButton" then
             TweenService:Create(
                v,
                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency = 1}
             ):Play()
             TweenService:Create(
                Tab,
                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency = 0}
             ):Play()
          end
       end
       Container.Visible = true
    end
 )
 
 local ContainerItems = {}
 function ContainerItems:Button(text, callback)
    local Button = Instance.new("TextButton")
    local ButtonCorner = Instance.new("UICorner")
 
 
 Button.Name = "Button"
 Button.Parent = Container
 Button.BackgroundColor3 = Color3.fromRGB(7, 33, 90)
 Button.BackgroundTransparency = 0.560
 Button.Position = UDim2.new(0.116161615, 0, 0, 0)
 Button.Size = UDim2.new(0, 464, 0, 32)
 Button.AutoButtonColor = false
 Button.Font = Enum.Font.Gotham
 Button.TextColor3 = Color3.fromRGB(255, 255, 255)
 Button.TextSize = 17.000
 Button.Text = text
 
 ButtonCorner.CornerRadius = UDim.new(0, 5)
 ButtonCorner.Name = "ButtonCorner"
 ButtonCorner.Parent = Button
 
       Button.MouseEnter:Connect(function()
          TweenService:Create(
             Button,
              TweenInfo.new(.2, Enum.EasingStyle.Quad),
              {BackgroundTransparency = 0}
          ):Play()
          end)
          
          Button.MouseLeave:Connect(function()
             TweenService:Create(
                Button,
                 TweenInfo.new(.2, Enum.EasingStyle.Quad),
                 {BackgroundTransparency = 0.56}
             ):Play()
             end)
 
             Container.CanvasSize = UDim2.new(0, 0, 0, ContainerListLayout.AbsoluteContentSize.Y)
 
             Button.MouseButton1Click:Connect(function()
                Button.Size = UDim2.new(0, 400, 0, 32)
             TweenService:Create(
                Button,
                TweenInfo.new(.3, Enum.EasingStyle.Quad),
                {Size = UDim2.new(0, 464, 0, 32)}
             ):Play()
             pcall(callback)
             end)
 end
 
 function ContainerItems:Toggle(text, Default, callback)
    local ToggleToggled = Default or false
    local Default = ToggleToggled
    local Default
 
    local Toggle = Instance.new("TextButton")
    local ToggleCorner = Instance.new("UICorner")
    local ToggleTitle = Instance.new("TextLabel")
    local ToggleFrame = Instance.new("Frame")
    local ToggleFrameCorner = Instance.new("UICorner")
    local ToggleDot = Instance.new("Frame")
    local ToggleDotCorner = Instance.new("UICorner")
 
 Toggle.Name = "Toggle"
 Toggle.Parent = Container
 Toggle.BackgroundColor3 = Color3.fromRGB(7, 33, 90)
 Toggle.BackgroundTransparency = 0.560
 Toggle.Position = UDim2.new(0.116161615, 0, 0, 0)
 Toggle.Size = UDim2.new(0, 464, 0, 32)
 Toggle.AutoButtonColor = false
 Toggle.Font = Enum.Font.Gotham
 Toggle.Text = ""
 Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
 Toggle.TextSize = 17.000
 
 ToggleCorner.CornerRadius = UDim.new(0, 5)
 ToggleCorner.Name = "ToggleCorner"
 ToggleCorner.Parent = Toggle
 
 ToggleTitle.Name = "ToggleTitle"
 ToggleTitle.Parent = Toggle
 ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 ToggleTitle.BackgroundTransparency = 1.000
 ToggleTitle.Position = UDim2.new(0.0387931019, 0, 0, 0)
 ToggleTitle.Size = UDim2.new(0, 446, 0, 32)
 ToggleTitle.Font = Enum.Font.Gotham
 ToggleTitle.Text = text
 ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
 ToggleTitle.TextSize = 17.000
 ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
 
 ToggleFrame.Name = "ToggleFrame"
 ToggleFrame.Parent = Toggle
 ToggleFrame.BackgroundColor3 = Color3.fromRGB(5, 26, 72)
 ToggleFrame.Position = UDim2.new(0.868534505, 0, 0.1875, 0)
 ToggleFrame.Size = UDim2.new(0, 41, 0, 20)
 
 ToggleFrameCorner.CornerRadius = UDim.new(45, 0)
 ToggleFrameCorner.Name = "ToggleFrameCorner"
 ToggleFrameCorner.Parent = ToggleFrame
 
 ToggleDot.Name = "ToggleDot"
 ToggleDot.Parent = ToggleFrame
 ToggleDot.BackgroundColor3 = Color3.fromRGB(14, 122, 255)
 ToggleDot.Size = UDim2.new(0, 21, 0, 19)
 ToggleDot.Position = UDim2.new(0, 0, 0, 0)
 
 ToggleDotCorner.CornerRadius = UDim.new(68, 0)
 ToggleDotCorner.Name = "ToggleDotCorner"
 ToggleDotCorner.Parent = ToggleDot
 
 
 Toggle.MouseEnter:Connect(function()
    TweenService:Create(
       Toggle,
        TweenInfo.new(.2, Enum.EasingStyle.Quad),
        {BackgroundTransparency = 0}
    ):Play()
    end)
          
 Toggle.MouseLeave:Connect(function()
    TweenService:Create(
       Toggle,
        TweenInfo.new(.2, Enum.EasingStyle.Quad),
        {BackgroundTransparency = 0.56}
    ):Play()
    end)
 
    if Default == true then
       TweenService:Create(
       ToggleDot,
       TweenInfo.new(.4, Enum.EasingStyle.Quad),
       {Position = UDim2.new(0.439, 0,0, 0)}
    ):Play()
    TweenService:Create(
       ToggleDot,
       TweenInfo.new(.4, Enum.EasingStyle.Quad),
       {BackgroundColor3 = Color3.fromRGB(14, 122, 255)}
    ):Play()
    pcall(callback, ToggleToggled)
 else
 
    TweenService:Create(
       ToggleDot,
       TweenInfo.new(.4, Enum.EasingStyle.Quad),
       {Position = UDim2.new(0, 0,0, 0)}
    ):Play()
    TweenService:Create(
       ToggleDot,
       TweenInfo.new(.4, Enum.EasingStyle.Quad),
       {BackgroundColor3 = Color3.fromRGB(46,46,46)}
    ):Play()
    end
 
 
 if ToggleToggled == true or Default == true then
   
    TweenService:Create(
       ToggleDot,
       TweenInfo.new(.4, Enum.EasingStyle.Quad),
       {Position = UDim2.new(0.439, 0,0, 0)}
    ):Play()
    TweenService:Create(
       ToggleDot,
       TweenInfo.new(.4, Enum.EasingStyle.Quad),
       {BackgroundColor3 = Color3.fromRGB(14, 122, 255)}
    ):Play()
    pcall(callback, ToggleToggled)
 else
 
    TweenService:Create(
       ToggleDot,
       TweenInfo.new(.4, Enum.EasingStyle.Quad),
       {Position = UDim2.new(0, 0,0, 0)}
    ):Play()
    TweenService:Create(
       ToggleDot,
       TweenInfo.new(.4, Enum.EasingStyle.Quad),
       {BackgroundColor3 = Color3.fromRGB(46,46,46)}
    ):Play()
 end
 
 Toggle.MouseButton1Click:Connect(
             function()
                if ToggleToggled == false or Default == false then
   
                   TweenService:Create(
                      ToggleFrame,
                      TweenInfo.new(.2, Enum.EasingStyle.Quad),
                      {BackgroundTransparency = 0}
                   ):Play()
                   TweenService:Create(
                      ToggleDot,
                      TweenInfo.new(.2, Enum.EasingStyle.Quad),
                      {Position = UDim2.new(0.439, 0,0, 0)}
                   ):Play()
                   TweenService:Create(
                      ToggleDot,
                      TweenInfo.new(.4, Enum.EasingStyle.Quad),
                      {BackgroundColor3 = Color3.fromRGB(14, 122, 255)}
                   ):Play()
                else
   
                   TweenService:Create(
                      ToggleFrame,
                      TweenInfo.new(.2, Enum.EasingStyle.Quad),
                      {BackgroundTransparency = 0}
                   ):Play()
                   TweenService:Create(
                      ToggleDot,
                      TweenInfo.new(.2, Enum.EasingStyle.Quad),
                      {Position = UDim2.new(0, 0, 0, 0)}
                   ):Play()
                   TweenService:Create(
                      ToggleDot,
                      TweenInfo.new(.4, Enum.EasingStyle.Quad),
                      {BackgroundColor3 = Color3.fromRGB(46,46,46)}
                   ):Play()
                end
                ToggleToggled = not ToggleToggled
                pcall(callback, ToggleToggled)
             end
          )
          Container.CanvasSize = UDim2.new(0, 0, 0, ContainerListLayout.AbsoluteContentSize.Y)
 end
 
 function ContainerItems:Slider(text, min, max, start, callback)
    local dragging = false
 
    local Slider = Instance.new("TextButton")
    local SliderCorner = Instance.new("UICorner")
    local SliderTitle = Instance.new("TextLabel")
    local SliderFrame = Instance.new("Frame")
    local SliderIndicator = Instance.new("Frame")
    local SliderIndicatorDot = Instance.new("Frame")
    local SliderIndicatorDotCorner = Instance.new("UICorner")
    local Value = Instance.new("TextLabel")
 
    Slider.Name = "Slider"
    Slider.Parent = Container
    Slider.BackgroundColor3 = Color3.fromRGB(7, 33, 90)
    Slider.BackgroundTransparency = 0.560
    Slider.Position = UDim2.new(0.116161615, 0, 0, 0)
    Slider.Size = UDim2.new(0, 464, 0, 32)
    Slider.AutoButtonColor = false
    Slider.Font = Enum.Font.Gotham
    Slider.Text = ""
    Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
    Slider.TextSize = 17.000
    
    SliderCorner.CornerRadius = UDim.new(0, 5)
    SliderCorner.Name = "SliderCorner"
    SliderCorner.Parent = Slider
    
    SliderTitle.Name = "SliderTitle"
    SliderTitle.Parent = Slider
    SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderTitle.BackgroundTransparency = 1.000
    SliderTitle.Position = UDim2.new(0.0387931019, 0, 0, 0)
    SliderTitle.Size = UDim2.new(0, 446, 0, 32)
    SliderTitle.Font = Enum.Font.Gotham
    SliderTitle.Text = text
    SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    SliderTitle.TextSize = 17.000
    SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    SliderFrame.Name = "SliderFrame"
    SliderFrame.Parent = Slider
    SliderFrame.BackgroundColor3 = Color3.fromRGB(8, 73, 152)
    SliderFrame.Position = UDim2.new(0.383620679, 0, 0.5, 0)
    SliderFrame.Size = UDim2.new(0, 210, 0, 2)
    
    SliderIndicator.Name = "SliderIndicator"
    SliderIndicator.Parent = SliderFrame
    SliderIndicator.BackgroundColor3 = Color3.fromRGB(14, 122, 255)
    SliderIndicator.Size = UDim2.new((start or 0) / max, 0, 0, 2)
    
    SliderIndicatorDot.Name = "SliderIndicatorDot"
    SliderIndicatorDot.Parent = SliderIndicator
    SliderIndicatorDot.BackgroundColor3 = Color3.fromRGB(21, 126, 255)
    SliderIndicatorDot.Position = UDim2.new(0.918918908, 0, -3.5, 0)
    SliderIndicatorDot.Size = UDim2.new(0, 17, 0, 17)
    
    SliderIndicatorDotCorner.CornerRadius = UDim.new(100, 0)
    SliderIndicatorDotCorner.Name = "SliderIndicatorDotCorner"
    SliderIndicatorDotCorner.Parent = SliderIndicatorDot
    
    Value.Name = "Value"
    Value.Parent = Slider
    Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Value.BackgroundTransparency = 1.000
    Value.Position = UDim2.new(0.883620679, 0, 0.21875, 0)
    Value.Size = UDim2.new(0, 50, 0, 19)
    Value.Font = Enum.Font.Gotham
    Value.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
    Value.TextColor3 = Color3.fromRGB(255, 255, 255)
    Value.TextSize = 14.000
 
 
    local function slide(input)
       local pos =UDim2.new(math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),0,0,2)
             SliderIndicator:TweenSize(pos, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
       local val = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
       Value.Text = tostring(val)
       pcall(callback, val)
    end
    
    SliderFrame.InputBegan:Connect(
       function(input)
          if input.UserInputType == Enum.UserInputType.MouseButton1 then
             slide(input)
             dragging = true
          end
       end
    )
 
    SliderIndicatorDot.InputBegan:Connect(
       function(input)
          if input.UserInputType == Enum.UserInputType.MouseButton1 then
             slide(input)
             dragging = true
          end
       end
    )
    
    SliderFrame.InputEnded:Connect(
       function(input)
          if input.UserInputType == Enum.UserInputType.MouseButton1 then
             dragging = false
          end
       end
    )
 
    SliderIndicatorDot.InputEnded:Connect(
       function(input)
          if input.UserInputType == Enum.UserInputType.MouseButton1 then
             dragging = false
          end
       end
    )
    
    UserInputService.InputChanged:Connect(
       function(input)
          if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
             slide(input)
          end
       end
    )
    Container.CanvasSize = UDim2.new(0, 0, 0, ContainerListLayout.AbsoluteContentSize.Y)
 
 end
 
 function ContainerItems:Dropdown(text, list, callback)
    local dropfunc = {}
    local DropToggled = false
    local FrameSize = 0
    local ItemCount = 0
 
    local Dropdown = Instance.new("TextButton")
    local DropdownCorner = Instance.new("UICorner")
    local DropdownTitle = Instance.new("TextLabel")
    local Arrow = Instance.new("ImageLabel")
    local DropdownFrame = Instance.new("Frame")
    local DropdownFrameCorner = Instance.new("UICorner")
    local DropdownHolder = Instance.new("ScrollingFrame")
    local DropdownHolderPadding = Instance.new("UIPadding")
    local DropdownItemLayout = Instance.new("UIListLayout")
    local Item = Instance.new("TextButton")
    local ItemCorner = Instance.new("UICorner")
 
 
    Dropdown.Name = "Dropdown"
    Dropdown.Parent = Container
    Dropdown.BackgroundColor3 = Color3.fromRGB(7, 33, 90)
    Dropdown.BackgroundTransparency = 0.560
    Dropdown.Position = UDim2.new(0.116161615, 0, 0, 0)
    Dropdown.Size = UDim2.new(0, 464, 0, 32)
    Dropdown.AutoButtonColor = false
    Dropdown.Font = Enum.Font.Gotham
    Dropdown.Text = ""
    Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
    Dropdown.TextSize = 17.000
    
    DropdownCorner.CornerRadius = UDim.new(0, 5)
    DropdownCorner.Name = "DropdownCorner"
    DropdownCorner.Parent = Dropdown
    
    DropdownTitle.Name = "DropdownTitle"
    DropdownTitle.Parent = Dropdown
    DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DropdownTitle.BackgroundTransparency = 1.000
    DropdownTitle.Position = UDim2.new(0.0387931019, 0, 0, 0)
    DropdownTitle.Size = UDim2.new(0, 446, 0, 32)
    DropdownTitle.Font = Enum.Font.Gotham
    DropdownTitle.Text = text
    DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    DropdownTitle.TextSize = 17.000
    DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    Arrow.Name = "Arrow"
    Arrow.Parent = Dropdown
    Arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Arrow.BackgroundTransparency = 1.000
    Arrow.Position = UDim2.new(0.913406372, 0, 0.133928299, 0)
    Arrow.Size = UDim2.new(0, 29, 0, 25)
    Arrow.Image = "rbxassetid://6034818372"
    
    DropdownFrame.Name = "DropdownFrame"
    DropdownFrame.Parent = Container
    DropdownFrame.BackgroundColor3 = Color3.fromRGB(7, 33, 90)
    DropdownFrame.BackgroundTransparency = 0.360
    DropdownFrame.Position = UDim2.new(0.109427609, 0, 0.339113683, 0)
    DropdownFrame.Size = UDim2.new(0, 464, 0, 90)
    DropdownFrame.Visible = false
    
    DropdownFrameCorner.Name = "DropdownFrameCorner"
    DropdownFrameCorner.Parent = DropdownFrame
    
    DropdownHolder.Name = "DropdownHolder"
    DropdownHolder.Parent = DropdownFrame
    DropdownHolder.Active = true
    DropdownHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DropdownHolder.BackgroundTransparency = 1.000
    DropdownHolder.BorderSizePixel = 0
    DropdownHolder.Size = UDim2.new(0, 464, 0, 90)
    DropdownHolder.ScrollBarThickness = 5
    
    DropdownHolderPadding.Name = "DropdownHolderPadding"
    DropdownHolderPadding.Parent = DropdownHolder
    DropdownHolderPadding.PaddingBottom = UDim.new(0, 5)
    DropdownHolderPadding.PaddingTop = UDim.new(0, 5)
    
    DropdownItemLayout.Name = "DropdownItemLayout"
    DropdownItemLayout.Parent = DropdownHolder
    DropdownItemLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    DropdownItemLayout.SortOrder = Enum.SortOrder.LayoutOrder
    DropdownItemLayout.Padding = UDim.new(0, 7)
 
    Container.CanvasSize = UDim2.new(0, 0, 0, ContainerListLayout.AbsoluteContentSize.Y)
 
    Dropdown.MouseEnter:Connect(function()
       TweenService:Create(
          Dropdown,
           TweenInfo.new(.2, Enum.EasingStyle.Quad),
           {BackgroundTransparency = 0}
       ):Play()
       end)
             
       Dropdown.MouseLeave:Connect(function()
       TweenService:Create(
          Dropdown,
           TweenInfo.new(.2, Enum.EasingStyle.Quad),
           {BackgroundTransparency = 0.56}
       ):Play()
       end)
 
    Dropdown.MouseButton1Click:Connect(
       function()
          if DropToggled == false then
             DropdownFrame.Visible = true
             DropdownFrame:TweenSize(
                UDim2.new(0, 464, 0, FrameSize),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quart,
                0.1,
                true
             )
             DropdownHolder:TweenSize(
                UDim2.new(0, 464, 0, FrameSize),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quart,
                0.1,
                true
             )
             TweenService:Create(
                Arrow,
                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Rotation = 180}
             ):Play()
             repeat
                wait()
             until DropdownFrame.Size == UDim2.new(0, 464, 0, FrameSize)
             Container.CanvasSize = UDim2.new(0, 0, 0, ContainerListLayout.AbsoluteContentSize.Y)
          else
             DropdownFrame:TweenSize(
                UDim2.new(0, 464, 0, 0),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quart,
                0.1,
                true
             )
             DropdownHolder:TweenSize(
                UDim2.new(0, 464, 0, FrameSize),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quart,
                0.1,
                true
             )
             TweenService:Create(
                Arrow,
                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Rotation = 0}
             ):Play()
             repeat
                wait()
             until DropdownFrame.Size == UDim2.new(0, 464, 0, 0)
             DropdownFrame.Visible = false
             Container.CanvasSize = UDim2.new(0, 0, 0, ContainerListLayout.AbsoluteContentSize.Y)
          end
          DropToggled = not DropToggled
       end
    )
 
    for i, v in next, list do
       ItemCount = ItemCount + 1
 
       if ItemCount == 1 then
          FrameSize = 56
       elseif ItemCount == 2 then
          FrameSize = 100
       elseif ItemCount >= 3 then
          FrameSize = 150
       end
 
       local Item = Instance.new("TextButton")
       local ItemCorner = Instance.new("UICorner")
 
       Item.Name = "Item"
       Item.Parent = DropdownHolder
       Item.BackgroundColor3 = Color3.fromRGB(7, 33, 90)
       Item.Size = UDim2.new(0, 446, 0, 18)
       Item.Font = Enum.Font.Gotham
       Item.TextColor3 = Color3.fromRGB(255, 255, 255)
       Item.TextSize = 15.000
       Item.Text = v
 
       ItemCorner.CornerRadius = UDim.new(0, 4)
       ItemCorner.Name = "ItemCorner"
       ItemCorner.Parent = Item
 
       Item.MouseEnter:Connect(
          function()
             TweenService:Create(
                Item,
                TweenInfo.new(.2, Enum.EasingStyle.Quad),
                {BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
             ):Play()
          end
       )
       Item.MouseLeave:Connect(
          function()
             TweenService:Create(
                Item,
                TweenInfo.new(.2, Enum.EasingStyle.Quad),
                {BackgroundColor3 = Color3.fromRGB(7, 33, 90)}
             ):Play()
          end
       )
 
       Item.MouseButton1Click:Connect(
          function()
             DropdownTitle.Text = text .. " - " .. v
             pcall(callback, v)
             DropToggled = false
             DropdownFrame:TweenSize(
                UDim2.new(0, 464, 0, 0),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quart,
                0.1,
                true
             )
             DropdownHolder:TweenSize(
                UDim2.new(0, 456, 0, 00),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quart,
                0.1,
                true
             )
             TweenService:Create(
                Arrow,
                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Rotation = 0}
             ):Play()
             repeat
                wait()
             until DropdownFrame.Size == UDim2.new(0, 464, 0, 0)
             DropdownFrame.Visible = false
             Container.CanvasSize = UDim2.new(0, 0, 0, ContainerListLayout.AbsoluteContentSize.Y)
          end
       )
       DropdownHolder.CanvasSize = UDim2.new(0, 0, 0, DropdownItemLayout.AbsoluteContentSize.Y + 15)
    end
 
    function dropfunc:Clear()
       DropdownTitle.Text = text
       FrameSize = 0
       ItemCount = 0
 
       for i,v in next, DropdownHolder:GetChildren() do
          if v.Name == "Item" then
             v:Destroy()
          end
       end
 
       DropdownFrame:TweenSize(
          UDim2.new(0, 464, 0, 0),
          Enum.EasingDirection.Out,
          Enum.EasingStyle.Quart,
          0.1,
          true
       )
       DropdownHolder:TweenSize(
          UDim2.new(0, 456, 0, 0),
          Enum.EasingDirection.Out,
          Enum.EasingStyle.Quart,
          0.1,
          true
       )
       TweenService:Create(
          Arrow,
          TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
          {Rotation = 0}
       ):Play()
       repeat
          wait()
       until DropdownFrame.Size == UDim2.new(0, 464, 0, 0)
       DropdownFrame.Visible = false
       Container.CanvasSize = UDim2.new(0, 0, 0, ContainerListLayout.AbsoluteContentSize.Y)
    end
 
    function dropfunc:Add(toadd)
       ItemCount = ItemCount + 1
 
       if ItemCount == 1 then
          FrameSize = 56
       elseif ItemCount == 2 then
          FrameSize = 100
       elseif ItemCount >= 3 then
          FrameSize = 150
       end
 
       local Item = Instance.new("TextButton")
       local ItemCorner = Instance.new("UICorner")
 
       Item.Name = "Item"
       Item.Parent = DropdownHolder
       Item.BackgroundColor3 = Color3.fromRGB(7, 33, 90)
       Item.Size = UDim2.new(0, 446, 0, 18)
       Item.Font = Enum.Font.Gotham
       Item.Text = "Item"
       Item.TextColor3 = Color3.fromRGB(255, 255, 255)
       Item.TextSize = 15.000
       Item.Text = toadd
 
       ItemCorner.CornerRadius = UDim.new(0, 4)
       ItemCorner.Name = "ItemCorner"
       ItemCorner.Parent = Item
 
       Item.MouseEnter:Connect(
          function()
             TweenService:Create(
                Item,
                TweenInfo.new(.2, Enum.EasingStyle.Quad),
                {BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
             ):Play()
          end
       )
       Item.MouseLeave:Connect(
          function()
             TweenService:Create(
                Item,
                TweenInfo.new(.2, Enum.EasingStyle.Quad),
                {BackgroundColor3 = Color3.fromRGB(7, 33, 90)}
             ):Play()
          end
       )
 
       Item.MouseButton1Click:Connect(
          function()
             DropdownTitle.Text = text .. " - " .. toadd
             pcall(callback, toadd)
             DropToggled = false
             DropdownFrame:TweenSize(
                UDim2.new(0, 464, 0, 0),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quart,
                0.1,
                true
             )
             DropdownHolder:TweenSize(
                UDim2.new(0, 456, 0, 0),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quart,
                0.1,
                true
             )
             TweenService:Create(
                Arrow,
                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Rotation = 0}
             ):Play()
             repeat
                wait()
             until DropdownFrame.Size == UDim2.new(0, 464, 0, 0)
             DropdownFrame.Visible = false
             Container.CanvasSize = UDim2.new(0, 0, 0, ContainerListLayout.AbsoluteContentSize.Y)
          end
       )
 
       DropdownHolder.CanvasSize = UDim2.new(0, 0, 0, DropdownItemLayout.AbsoluteContentSize.Y + 15)
    end
 
    return dropfunc
 
 end
 
function ContainerItems:Label(text)
    local labelfunc = {}
 
    local Label = Instance.new("TextLabel")
    local LabelCorner = Instance.new("UICorner")
 
    Label.Name = "Label"
    Label.Parent = Container
    Label.BackgroundColor3 = Color3.fromRGB(7, 33, 90)
    Label.BackgroundTransparency = 0.560
    Label.Position = UDim2.new(0.33164984, 0, 0.535645485, 0)
    Label.Size = UDim2.new(0, 464, 0, 32)
    Label.Font = Enum.Font.Gotham
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = 17.000
    
    LabelCorner.CornerRadius = UDim.new(0, 5)
    LabelCorner.Name = "LabelCorner"
    LabelCorner.Parent = Label
 
    Container.CanvasSize = UDim2.new(0, 0, 0, ContainerListLayout.AbsoluteContentSize.Y)
 
    function labelfunc:UpdateLabel(newText)
       Label.Text = newText
    end
    
    return labelfunc
end
 
 function ContainerItems:line()
    local line = Instance.new("Frame")
 
    line.Name = "line"
    line.Parent = Container
    line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    line.Position = UDim2.new(0.109427609, 0, 0.620423913, 0)
    line.Size = UDim2.new(0, 464, 0, 0)
 end
 
 
 local uitoggled = false
 UserInputService.InputBegan:Connect(
  function(io, p)
     if io.KeyCode == Enum.KeyCode.RightControl then
        if uitoggled == false then
          Container.Visible = false
          SettingsButton.Visible = false
          Glow.Visible = false
          for i,v in pairs(MainFrame:GetChildren()) do
             if v.ClassName == "Frame" or v.ClassName == "ScrollingFrame" then
                v.Visible = false
             end
          end
          TweenService:Create(
             MainFrame,
       TweenInfo.new(.7, Enum.EasingStyle.Quad),
       {BackgroundTransparency = 1}
       ):Play()
       repeat wait()
       until MainFrame.BackgroundTransparency == 1
           MainFrame.Visible = false
           SettingsFrame.Visible = false
           uitoggled = true
        else
          Glow.Visible = true
          MainFrame.Visible = true
          TweenService:Create(
             MainFrame,
       TweenInfo.new(.7, Enum.EasingStyle.Quad),
       {BackgroundTransparency = 0}
       ):Play()
       repeat wait()
       until MainFrame.BackgroundTransparency == 0
          for i,v in pairs(MainFrame:GetChildren()) do
             if v.ClassName == "Frame" or v.ClassName == "ScrollingFrame" then
                v.Visible = true
             end
          end
          SettingsButton.Visible = true
          SettingsFrame.Visible = false
           uitoggled = false
        end
     end
  end
 )
 
 
 return ContainerItems
 end -- Tabs
 return Tabs
 end -- Window
 return NVL
