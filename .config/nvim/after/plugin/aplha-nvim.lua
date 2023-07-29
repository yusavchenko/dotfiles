local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
require("alpha.term")

-- Set header
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}
local if_nil = vim.F.if_nil
local nvim_web_devicons = {
		enabled = true,
		highlight = true,
	}
local default_mru_ignore = { "gitcommit" }
	local function get_extension(fn)
		local match = fn:match("^.+(%..+)$")
		local ext = ""
		if match ~= nil then
			ext = match:sub(2)
		end
		return ext
	end

local mru_opts = {
		ignore = function(path, ext)
			return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
		end,
	}

local plenary_path = require("plenary.path")
local cdir = vim.fn.getcwd()

local function icon(fn)
		local nwd = require("nvim-web-devicons")
		local ext = get_extension(fn)
		return nwd.get_icon(fn, ext, { default = true })
	end

	local function file_button(fn, sc, short_fn)
		short_fn = short_fn or fn
		local ico_txt
		local fb_hl = {}

		if nvim_web_devicons.enabled then
			local ico, hl = icon(fn)
			local hl_option_type = type(nvim_web_devicons.highlight)
			if hl_option_type == "boolean" then
				if hl and nvim_web_devicons.highlight then
					table.insert(fb_hl, { hl, 0, 3 })
				end
			end
			if hl_option_type == "string" then
				table.insert(fb_hl, { nvim_web_devicons.highlight, 0, 3 })
			end
			ico_txt = ico .. "  "
		else
			ico_txt = ""
		end
		local file_button_el = dashboard.button(sc, ico_txt .. short_fn, "<cmd>e " .. fn .. " <CR>")
		local fn_start = short_fn:match(".*[/\\]")
		if fn_start ~= nil then
			table.insert(fb_hl, { "Comment", #ico_txt - 2, #fn_start + #ico_txt })
		end
		file_button_el.opts.hl = fb_hl
		return file_button_el
	end

local function mru(start, cwd, items_number, opts)
		opts = opts or mru_opts
		items_number = if_nil(items_number, 9)

		local oldfiles = {}
		for _, v in pairs(vim.v.oldfiles) do
			if #oldfiles == items_number then
				break
			end
			local cwd_cond
			if not cwd then
				cwd_cond = true
			else
				cwd_cond = vim.startswith(v, cwd)
			end
			local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
			if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
				oldfiles[#oldfiles + 1] = v
			end
		end
		local target_width = 39

		local tbl = {}
		for i, fn in ipairs(oldfiles) do
			local short_fn
			if cwd then
				short_fn = vim.fn.fnamemodify(fn, ":.")
			else
				short_fn = vim.fn.fnamemodify(fn, ":~")
			end

			if #short_fn > target_width then
				short_fn = plenary_path.new(short_fn):shorten(1, { -2, -1 })
				if #short_fn > target_width then
					short_fn = plenary_path.new(short_fn):shorten(1, { -1 })
				end
			end

			local shortcut = tostring(i + start - 1)

			local file_button_el = file_button(fn, shortcut, short_fn)
			tbl[i] = file_button_el
		end
		return {
			type = "group",
			val = tbl,
			opts = {},
		}
	end
local section_mru = {
		type = "group",
		val = {
			{
				type = "text",
				val = "Recent files",
				opts = {
					hl = "SpecialComment",
					shrink_margin = false,
					position = "center",
				},
			},
			{ type = "padding", val = 1 },
			{
				type = "group",
				val = function()
					return { mru(0, cdir) }
				end,
				opts = { shrink_margin = false },
			},
		},
	}
-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button("g", " " .. " Restore Session", [[:lua require("persistence").load() <cr> <cmd>Neotree left filesystem reveal toggle<cr>"]]),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

    local width = 46
    local height = 25 -- two pixels per vertical space
    dashboard.section.terminal.command = "cat | " .. os.getenv("HOME") .. "/art/thisisfine.sh"
    dashboard.section.terminal.width = width
    dashboard.section.terminal.height = height
    dashboard.section.terminal.opts.redraw = true

    dashboard.section.header.val = "  𝕟 𝕖 𝕠 𝕧 𝕚 𝕞  "
    dashboard.config.layout = {
      { type = "padding", val = 1 },
      dashboard.section.terminal,
      { type = "padding", val = 5 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      section_mru,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

-- Set footer
--   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
--   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
--   ```init.lua
--   return require('packer').startup(function()
--       use 'wbthomason/packer.nvim'
--       use {
--           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
--           requires = {'BlakeJC94/alpha-nvim-fortune'},
--           config = function() require("config.alpha") end
--       }
--   end)
--   ```
-- local fortune = require("alpha.fortune") 
-- dashboard.section.footer.val = fortune()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
