{colors}:
with colors; {
  config = ''
    local wezterm = require("wezterm")
    local act = wezterm.action

    return {
    	check_for_updates = false,
    	exit_behavior = "CloseOnCleanExit",

      enable_wayland = false, -- see https://github.com/wez/wezterm/issues/4483
      enable_scroll_bar = false,

    	font_size = 12.0,
    	font = wezterm.font_with_fallback {
        "JetBrainsMono Nerd Font",
      },

    	audible_bell = "Disabled",
      enable_tab_bar = true,
    	hide_tab_bar_if_only_one_tab = true,
    	default_cursor_style = "SteadyUnderline",
    	window_background_opacity = 0.65,
      cell_width = 0.85,
    	window_padding = {
    		left = 20,
    		right = 20,
    		top = 20,
    		bottom = 20,
    	},

    	colors = {
        background = "#${base00}",
        cursor_bg = "#${base05}",
        cursor_fg = "#${base00}",
        cursor_border = "#${base05}",
        foreground = "#${base05}",
        selection_bg = "#${base05}",
        selection_fg = "#${base00}",

        tab_bar = {
      	  background = "#${base02}",
      	  active_tab = {
      		  bg_color = "#${base0D}",
      		  fg_color = "#${base00}",
      	               },

          inactive_tab = {
      		  bg_color = "#${base00}",
      		  fg_color = "#${base08}",
      	  },

          inactive_tab_hover = {
      		  bg_color = "#${base00}",
      		  fg_color = "#${base0D}",
      	  },

          new_tab = {
      		  bg_color = "#${base02}",
      		  fg_color = "#${base08}",
      	  },

          new_tab_hover = {
      		  bg_color = "#${base00}",
      		  fg_color = "#${base0D}",
      	  },
        },


        ansi = {
          "#${base00}",
          "#${base08}",
          "#${base0B}",
          "#${base0A}",
          "#${base0D}",
          "#${base0F}",
          "#${base0C}",
          "#${base05}"
        },

        brights = {
          "#${base03}",
          "#${base08}",
          "#${base0B}",
          "#${base0A}",
          "#${base0D}",
          "#${base0F}",
          "#${base0C}",
          "#${base07}"
        },
      },
    }
  '';
}
