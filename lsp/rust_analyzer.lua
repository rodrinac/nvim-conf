return {
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
			checkOnSave = {
				command = "clippy",
			},
		},
	},
}
