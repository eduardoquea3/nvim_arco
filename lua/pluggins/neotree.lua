require 'window-picker'.setup {
	autoselect_one = true,
	include_current = false,
	filter_rules = {
		bo = {
			filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
			buftype = { 'terminal', 'quickfix' },
		},
	},
	other_win_hl_color = '#e35e4f'
}
vim.cmd([[let g:neo_tree_remove_legacy_commands=1]])
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
require 'neo-tree'.setup {
	close_if_last_window = false,
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	sort_case_insensitive = false,
	sort_function = nil,
	default_component_configs = {
		container = {
			enable_character_fade = true
		},
		indent = {
			indent_size = 2,
			padding = 1,
			with_markers = true,
			indent_marker = "│",
			last_indent_marker = "└",
			highlight = "NeoTreeIndentMarker",
			with_expanders = nil,
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "ﰊ",
			default = "*",
			highlight = "NeoTreeFileIcon"
		},
		modified = {
			symbol = "  ",
			highlight = "NeoTreeModified",
		},
		name = {
			trailing_slash = false,
			use_git_status_colors = true,
			highlight = "NeoTreeFileName",
		},
		git_status = {
			symbols = {
				added     = "   ",
				modified  = "   ",
				deleted   = " ✖  ",
				renamed   = " 凜  ",
				untracked = "",
				ignored   = "",
				unstaged  = "",
				staged    = "",
				conflict  = "",
			}
		},
	},
	window = {
		position = "right",
		width = 45,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
		mappings = {
			["<leader>"] = {
				"toggle_node",
				nowait = false,
			},
			["l"] = "open",
			["h"] = "open",
			["<esc>"] = "revert_preview",
			["P"] = { "toggle_preview", config = { use_float = true } },
			["S"] = "open_split",
			["s"] = "open_vsplit",
			["l"] = "open_tabnew",
			["w"] = "open_with_window_picker",
			["C"] = "close_node",
			["z"] = "close_all_nodes",
			["a"] = {
				"add",
				config = {
					show_path = "none"
				}
			},
			["A"] = "add_directory",
			["d"] = "delete",
			["r"] = "rename",
			["y"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",
			["c"] = "copy",
			["m"] = "move",
			["q"] = "close_window",
			["R"] = "refresh",
			["?"] = "show_help",
			["<S-Tab>"] = "prev_source",
			["<Tab>"] = "next_source",
		}
	},
	nesting_rules = {},
	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = true,
			hide_gitignored = true,
			hide_hidden = false,
			hide_by_name = {
				"node_modules",
				"*.form",
			},
			hide_by_pattern = {
				"*.meta",
				"*/src/*/tsconfig.json",
				"*.form"
			},
			always_show = {
				".gitignored",
			},
			never_show = {
				".DS_Store",
				"thumbs.db",
				"*.form"
			},
			never_show_by_pattern = {
				".null-ls_*",
				"*.form"
			},
		},
		follow_current_file = false,
		group_empty_dirs = false,
		hijack_netrw_behavior = "open_default",
		use_libuv_file_watcher = false,
		window = {
			mappings = {
				["<bs>"] = "navigate_up",
				["."] = "set_root",
				["H"] = "toggle_hidden",
				["/"] = "fuzzy_finder",
				["D"] = "fuzzy_finder_directory",
				["f"] = "filter_on_submit",
				["<c-x>"] = "clear_filter",
				["[g"] = "prev_git_modified",
				["]g"] = "next_git_modified",
			}
		}
	},
	buffers = {
		follow_current_file = true,
		group_empty_dirs = true,
		show_unloaded = true,
		window = {
			mappings = {
				["bd"] = "buffer_delete",
				["<bs>"] = "navigate_up",
				["."] = "set_root",
			}
		},
	},
	git_status = {
		window = {
			position = "float",
			mappings = {
				["A"]  = "git_add_all",
				["gu"] = "git_unstage_file",
				["ga"] = "git_add_file",
				["gr"] = "git_revert_file",
				["gc"] = "git_commit",
				["gp"] = "git_push",
				["gg"] = "git_commit_and_push",
			}
		}
	},
}
