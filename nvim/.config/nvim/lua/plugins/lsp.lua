return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        })
      })
    end
  },


  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { 
          "rust_analyzer", 
          "clangd", 
          "ts_ls", 
          "zls", 
          "html", 
          "bashls",
          "emmet_ls" 
        },
        automatic_installation = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }
          
          -- "Go to Definition"
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          -- "Hover Documentation"
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          -- "Go to Declaration"
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          -- "Code Actions" (suggest fixes)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })
    end,
  }
}
