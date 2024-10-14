require("neo-tree").setup({
	window = {
	  mappings = {
		["p"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
	  }
	}
  })