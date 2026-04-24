return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },

  version = "1.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "default" },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      documentation = { auto_show = false },
      menu = {
        draw = {
          columns = {
            { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 }
          },
          -- Fix label_description not showing up in the completion menu
          components = {
            label_description = {
              text = function(ctx)
                return ctx.label_description ~= '' and ctx.label_detail or ctx.item.detail
              end
            }
          }
        }
      }
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
