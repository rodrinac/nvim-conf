return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		local km = vim.keymap

		km.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		km.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
		km.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
		km.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

		-- Function to duplicate and rename file
		local function duplicate_file()
			local node = require("nvim-tree.lib").get_node_at_cursor()
			if not node then
				return
			end

			local current_file = node.absolute_path
			local new_file = vim.fn.input("Duplicate and rename to: ", current_file)

			if new_file and #new_file > 0 then
				-- Copy file
				vim.fn.system({ "cp", current_file, new_file })

				-- Open new file in a new buffer
				vim.cmd("edit " .. new_file)
			else
				print("Invalid file name")
			end
		end

		-- Map the key for duplicating and renaming
		km.set("n", "<leader>ed", duplicate_file, { noremap = true, silent = true, desc = "Duplicate file" })
	end,
}
