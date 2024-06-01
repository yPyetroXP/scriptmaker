-- Função para criar uma pasta e um arquivo de texto
local function CreateTextFile(action)
    -- Cria uma pasta no diretório Workspace com o nome do jogador
    local playerFolder = game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name)
    if not playerFolder then
        playerFolder = Instance.new("Folder")
        playerFolder.Name = game.Players.LocalPlayer.Name
        playerFolder.Parent = game.Workspace
    end
    
    -- Cria um arquivo de texto dentro da pasta com o código da ação
    local fileName = "Action_" .. tostring(os.time()) -- Nome do arquivo baseado no timestamp atual
    local filePath = playerFolder.Name .. "/" .. fileName .. ".txt"
    local file = Instance.new("StringValue")
    file.Name = fileName
    file.Value = action
    file.Parent = playerFolder
    
    print("Arquivo criado com sucesso: " .. filePath)
end

-- Conecta a função de criação de arquivo ao evento de ação do jogador
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        -- Conecta a função de criação de arquivo ao evento de ação do jogador
        character.Humanoid:GetPropertyChangedSignal("Action"):Connect(function()
            local action = character.Humanoid.Action
            CreateTextFile(action)
        end)
    end)
end)
