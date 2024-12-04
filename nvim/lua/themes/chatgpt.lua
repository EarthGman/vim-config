-- Define the colors
local colors = {
	background = "#1E1E1E",   -- Dark background
	foreground = "#D4D4D4",   -- Light foreground
	red = "#F44747",          -- Red for errors
	green = "#608B4E",        -- Green for success
	blue = "#569CD6",         -- Blue for keywords
	yellow = "#DCDCAA",       -- Yellow for constants
	magenta = "#C586C0",      -- Magenta for functions
	cyan = "#4EC9B0",         -- Cyan for types
	gray = "#808080",         -- Comments
}

-- Apply the colors
local function apply_colorscheme()
	vim.cmd("highlight clear")
	vim.o.background = "dark"
	vim.o.termguicolors = true

	local highlights = {
		-- Base colors
		Normal = { fg = colors.foreground, bg = colors.background },
		Comment = { fg = colors.gray, italic = true },
		Error = { fg = colors.red },
		Identifier = { fg = colors.blue },
		Constant = { fg = colors.yellow },
		Function = { fg = colors.magenta },
		Keyword = { fg = colors.blue, bold = true },
		Statement = { fg = colors.green },
		Type = { fg = colors.cyan },
		-- Additional highlights
		LineNr = { fg = colors.gray },
		CursorLineNr = { fg = colors.yellow, bold = true },
		Visual = { bg = colors.gray },
		Pmenu = { fg = colors.foreground, bg = colors.gray },
		PmenuSel = { fg = colors.background, bg = colors.blue },
	}

	for group, opts in pairs(highlights) do
		local cmd = "highlight " .. group
		if opts.fg then
			cmd = cmd .. " guifg=" .. opts.fg
		end
		if opts.bg then
			cmd = cmd .. " guibg=" .. opts.bg
		end
		if opts.bold then
			cmd = cmd .. " gui=bold"
		elseif opts.italic then
			cmd = cmd .. " gui=italic"
		end
		vim.cmd(cmd)
	end
end

return { colors = colors, apply = apply_colorscheme }
