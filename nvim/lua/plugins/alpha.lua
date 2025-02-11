local logo = {
	[[                 _oo##'9MMHb':'-,o_                     ]],
	[[              .oH":HH$' ""'  "' -\7*R&o_                ]],
	[[           .oHMMMHMH#9:          "\bMMMMHo.             ]],
	[[          dMMMMMM*""'`'           .oHM"H9MM?.           ]],
	[[        ,MMMMMM'                   "HLbd<|?&H\          ]],
	[[       JMMH#H'                     |MMMMM#b>bHb         ]],
	[[      :MH  ."\                   `|MMMMMMMMMMMM&        ]],
	[[     .:M:d-"|:b..                 9MMMMMMMMMMMMM+       ]],
	[[    :  "*H|      -                &MMMMMMMMMMMMMH:      ]],
	[[    .    `LvdHH#d?                `?MMMMMMMMMMMMMb      ]],
	[[    :      iMMMMMMH#b               `"*"'"#HMMMMMM      ]],
	[[    .   . ,MMMMMMMMMMb\.                   {MMMMMH      ]],
	[[    -     |MMMMMMMMMMMMMMHb,               `MMMMM|      ]],
	[[    :      |MMMMMMMMMMMMMMH'                &MMMM,      ]],
	[[    -       `#MMMMMMMMMMMM                 |MMMM6-      ]],
	[[    :        `MMMMMMMMMM+                 ]MMMT/        ]],
	[[     .       `MMMMMMMP"                   HMM*`         ]],
	[[       -       |MMMMMH'                   ,M#'-         ]],
	[[        '.     :MMMH|                       .-          ]],
	[[          .     |MM                        -            ]],
	[[           ` .   `#?..    .             ..'             ]],
	[[               -.     _.             .-                 ]],
	[[                 '-|.#qo__,,ob=~~-''                    ]],
	[[                                                        ]],
	[[                                                        ]],
	[[     ________                                           ]],
	[[    /  ______|    __   __        ______      ______     ]],
	[[   / /           / _\_/_ \      /    \ |    / ____ \    ]],
	[[  | |   _____   / / \_/ \ \    /  _  | |   / /    \ \   ]],
	[[  | |   ___  | | |   |   | |  /  (_| | |  | |      \ |  ]],
	[[  | |      | | | |   |   | |  \      | |  | |      | |  ]],
	[[   \ \_____/ / | |   |   | |   \     | |  | |      | |  ]],
	[[    \_______/  | |   |   | |    \____| |  | |      | |  ]],
	[[ ______________________________________________________ ]],
}

local function color_lines(lines, popStart, popEnd)
	local out = {}
	for i, line in ipairs(lines) do
		local hi = "StartLogo" .. i
		if i > popStart and i <= popEnd then
			hi = "StartLogoPop" .. i - popStart
		elseif i > popStart then
			hi = "StartLogo" .. i - popStart
		else
			hi = "StartLogo" .. i
		end
		table.insert(out, { hi = hi, line = line })
	end
	return out
end


-- Map over the headers, setting a different color for each line.
-- This is done by setting the Highligh to StartLogoN, where N is the row index.
-- Define StartLogo1..StartLogoN to get a nice gradient.
local function header()
	local lines = {}
	local color_logo = color_lines(logo, 6, 12)
	for _, lineConfig in pairs(color_logo) do
		local hi = lineConfig.hi
		local line_chars = lineConfig.line
		local line = {
			type = "text",
			val = line_chars,
			opts = {
				hl = hi,
				shrink_margin = false,
				position = "center",
			},
		}
		table.insert(lines, line)
	end

	local output = {
		type = "group",
		val = lines,
		opts = { position = "center", },
	}

	return output
end

local function configure()
	local theme = require("alpha.themes.theta")
	local themeconfig = theme.config
	local dashboard = require("alpha.themes.dashboard")
	local buttons = {
		type = "group",
		val = {
			{ type = "text",    val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
			{ type = "padding", val = 1 },
			dashboard.button("%", "󱪝 > New File", "<cmd>ene<CR>"),
			-- dashboard.button("SPC ee", "󰙅 > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPC SPC", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC lg", " > Find Word", "<cmd>Telescope live_grep<CR>"),
			-- dashboard.button("SPC wr", "󰁯 > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
			-- dashboard.button("u", "󱐥  Update plugins", "<cmd>Lazy sync<CR>"),
			-- dashboard.button("t", "  Install language tools", "<cmd>Mason<CR>"),
			dashboard.button("q", "󰿅 > Quit NVIM", "<cmd>qa<CR>"),
		},
		position = "center",
	}

	themeconfig.layout[2] = header()
	themeconfig.layout[6] = buttons

	return themeconfig
end

-- return {
--   'goolord/alpha-nvim',
--   dependencies = { 'nvim-tree/nvim-web-devicons' },
--   config = function ()
require 'alpha'.setup(configure())
-- Disable folding on alpha buffer
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
--   end
-- };
