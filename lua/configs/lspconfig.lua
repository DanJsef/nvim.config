require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "clangd",
  "phpactor",
  "dockerls",
  "yamlls",
  "prismals",
  "pyright",
  "vuels",
  "gopls",
  "dartls",
  "tailwindcss",
}

vim.lsp.enable(servers)

vim.lsp.config.omnisharp = {
  cmd = { "dotnet", "/Users/danieljosef/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
  enable_import_completion = true,
  organize_imports_on_format = true,
  enable_roslyn_analyzers = true,
  root_dir = function()
    return vim.loop.cwd() -- current working directory
  end,
}

vim.lsp.config.pyright = {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        typeCheckingMode = "off",
        diagnosticMode = "openFilesOnly",
        extraPaths = {
          "${workspaceFolder}/../frappe",
          "${workspaceFolder}/../../env/lib/python3.12/site-packages",
        },
      },
    },
  },
}

vim.lsp.config.dartls = {
  cmd = { "dart", "language-server", "--protocol=lsp" },
  filetypes = { "dart" },
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = true,
    outline = true,
    suggestFromUnimportedLibraries = true,
  },
  -- root_dir = root_pattern("pubspec.yaml"),
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true,
    },
  },
  on_attach = function(client, bufnr) end,
}
