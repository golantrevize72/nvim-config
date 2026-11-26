return {
  {
    'nvim-telescope/telescope-bibtex.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
    ft = { 'markdown', 'quarto', 'tex', 'rmd' },
    config = function()
      local bibtex_actions = require 'telescope-bibtex.actions'

      require('telescope').setup {
        extensions = {
          bibtex = {
            global_files = {
              vim.fn.expand '~/my-zotero-library.bib',
            },
            -- Aplica un diseño flotante centrado y limpio
            theme = 'dropdown',

            mappings = {
              i = {
                ['<CR>'] = bibtex_actions.key_append [[@%s]],
                ['<C-b>'] = bibtex_actions.key_append '[@%s]',
              },
            },
            citation_max_auth = 2,
            format = 'markdown',
          },
        },
      }

      require('telescope').load_extension 'bibtex'
      vim.keymap.set('n', '<leader>sz', '<cmd>Telescope bibtex<cr>', { desc = 'Buscar citas en Zotero' })
    end,
  },
}
