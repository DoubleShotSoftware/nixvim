# homepage: https://github.com/folke/which-key.nvim
# nixvim doc: https://nix-community.github.io/nixvim/plugins/which-key/index.html
{ icons, ... }:

{
  opts = {
    enable = true;
    settings = {
      win.border = "single";
      # Disable which-key when in neo-tree or telescope
      icons.group = "";
      disable.ft = [ "TelescopePrompt" "neo-tree" "neo-tree-popup" ];
      spec = [
        {
          __unkeyed-1 = "<leader>b";
          icon = "󰓩 ";
          group = "Buffers";
        }
        {
          __unkeyed-1 = "<leader>bs";
          icon = "󰒺";
          group = "Sort Buffers";
        }
        {
          __unkeyed-1 = "<leader>d";
          icon = "";
          group = "Debugger";
        }
        {
          __unkeyed-1 = "<leader>f";
          icon = "";
          group = "Find";
        }
        {
          __unkeyed-1 = "<leader>g";
          icon = "󰊢";
          group = "Git";
        }
        {
          __unkeyed-1 = "<leader>l";
          icon = "";
          group = "Language Tools";
        }
        {
          __unkeyed-1 = "<leader>m";
          icon = "";
          group = "Markdown";
        }
        {
          __unkeyed-1 = "<leader>s";
          icon = "󱂬";
          group = "Session";
        }
        {
          __unkeyed-1 = "<leader>t";
          icon = "";
          group = "Terminal";
        }
        {
          __unkeyed-1 = "<leader>u";
          icon = "";
          group = "UI/UX";
        }
        {
          __unkeyed-1 = "<leader>T";
          icon = "󰓩";
          group = "Tabs";
        }
        {
          __unkeyed-1 = "<leader>lb";
          icon = "󰏖";
          group = "Project";
        }
      ];
    };

    # Customize section names (prefixed mappings)
    # registrations = {
    #   "<leader>b".name = "${icons.Tab} Buffers";
    #   "<leader>bs".name = "${icons.Sort} Sort Buffers";
    #   "<leader>d".name = "${icons.Debugger} Debugger";
    #   "<leader>f".name = "${icons.Search} Find";
    #   "<leader>g".name = "${icons.Git} Git";
    #   "<leader>l".name = "${icons.ActiveLSP} Language Tools";
    #   "<leader>m".name = " Markdown";
    #   "<leader>s".name = "${icons.Session} Session";
    #   "<leader>t".name = "${icons.Terminal} Terminal";
    #   "<leader>u".name = "${icons.Window} UI/UX";
    # };
  };

  # Enable catppuccin colors
  # https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/groups/integrations/which_key.lua
  rootOpts.colorschemes.catppuccin.settings.integrations.which_key = true;
}
