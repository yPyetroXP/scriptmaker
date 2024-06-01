-- Função para criar e abrir a interface do jogador
local function OpenInterface()
    -- Criação da interface do jogador
    local player = game.Players.LocalPlayer
    local gui = Instance.new("ScreenGui")
    gui.Name = "PlayerInterface"
    gui.Parent = player.PlayerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.2, 0, 0.2, 0)
    frame.Position = UDim2.new(0.4, 0, 0.4, 0)
    frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    frame.Parent = gui

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0.8, 0)
    label.Position = UDim2.new(0, 0, 0.1, 0)
    label.Text = "Interface do Jogador"
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextScaled = true
    label.Parent = frame

    local speedButton = Instance.new("TextButton")
    speedButton.Size = UDim2.new(0.8, 0, 0.2, 0)
    speedButton.Position = UDim2.new(0.1, 0, 0.9, 0)
    speedButton.Text = "Dobrar Velocidade"
    speedButton.Parent = frame

    -- Conectar a função para dobrar a velocidade ao clique do botão "Dobrar Velocidade"
    speedButton.MouseButton1Click:Connect(function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed * 2
    end)

    -- Adiciona funcionalidade de arrastar ao frame da interface
    local dragging
    local dragStart

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position - frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            frame.Position = UDim2.new(0, input.Position.X - dragStart.X, 0, input.Position.Y - dragStart.Y)
        end
    end)

    frame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

-- Cria um botão na interface do jogador para abrir a interface
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "PlayerButtonGui"
gui.Parent = player.PlayerGui

local button = Instance.new("TextButton")
button.Size = UDim2.new(0.2, 0, 0.1, 0)
button.Position = UDim2.new(0.4, 0, 0.4, 0)
button.Text = "Abrir Interface"
button.Parent = gui

-- Conectar a função para abrir a interface ao clique do botão
button.MouseButton1Click:Connect(function()
    OpenInterface()
end)
