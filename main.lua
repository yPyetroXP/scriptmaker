-- Função para criar e abrir a interface do jogador
local function OpenInterface()
    -- Criação da interface do jogador
    local player = game.Players.LocalPlayer
    local gui = Instance.new("ScreenGui")
    gui.Name = "PlayerInterface"
    gui.Parent = player.PlayerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.5, 0, 0.5, 0)
    frame.Position = UDim2.new(0.25, 0, 0.25, 0)
    frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    frame.Parent = gui

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Text = "Interface do Jogador"
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextScaled = true
    label.Parent = frame

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
    closeButton.Position = UDim2.new(0.9, 0, 0, 0)
    closeButton.Text = "Fechar"
    closeButton.TextColor3 = Color3.new(1, 0, 0)
    closeButton.Parent = frame

    -- Conectar a função para fechar a interface ao clique do botão "Fechar"
    closeButton.MouseButton1Click:Connect(function()
        gui:Destroy()
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
