local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities
capabilities.offsetEncoding = { "utf-16" }

local lspconfig = require("lspconfig")
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  cmd = {'clangd', '--compile-commands-dir=L:/'},
  settings = {
    clangd = {
      -- Unreal Engine specific compilation arguments
      compilationDatabasePath = "Path/To/UnrealProject/Intermediate/Build/Win64",
      extraArgs = {
        "-std=c++17",
        "-ferror-limit=0",
        "-Wall",
        "-Wextra",
        "-Wpedantic",
        "-Wshadow-all",
        "-Wno-unused-parameter",
        "-isystem",
        "L:\\unreal\\SpeedBall_RN\\engine\\UE_5_1\\Engine\\Source\\Runtime\\Core\\Public",
        "-isystem",
        "L:\\unreal\\SpeedBall_RN\\engine\\UE_5_1\\Engine\\Source\\Runtime\\CoreUObject\\Public",
        -- Add any additional include paths required for your project
        -- "-I",
        -- "Path/To/Additional/Include/Directory"
      },
      -- Use the compile_commands.json file if available
      useCompilationDatabase = true,
    },
  },
}
