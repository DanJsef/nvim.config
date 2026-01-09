require("nvchad.configs.lspconfig").defaults()

local vue_language_server_path = vim.fn.stdpath "data"
  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
}

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
  "vue_ls",
  "gopls",
  "dartls",
  "tailwindcss",
}

vim.lsp.enable(servers)

vim.lsp.config.ts_ls = {
  init_options = {
    plugins = {
      vue_plugin,
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}

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
