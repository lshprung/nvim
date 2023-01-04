local status_ok, jabs = pcall(require, "jabs")
if not status_ok then
	return
end

require 'jabs'.setup {
	-- Options for the main window
	position = {'left', 'bottom'},

	-- Default symbols
	symbols = {
		current = "C",
		split = "S",
		alternate = "A",
		hidden = "H",
		locked = "L",
		ro = "R",
		edited = "E",
		terminal = "T",
		default_file = "D",
		terminal_symbol = ">_"
	},

	-- Keymaps
	keymap = {
		close = "X",
		h_split = "h",
		v_split = "v"
	},

	use_devicons = false
}
