return {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            keymaps = {
				insert = "<C-g>a",
				insert_line = "<C-g>A",
				normal = "ya",
				normal_cur = "yaa",
				normal_line = "yA",
				normal_cur_line = "yAA",
				visual = "A",
				visual_line = "gA",
				delete = "da",
				change = "ca",
				change_line = "cA",	
			}
		})
    end
}
