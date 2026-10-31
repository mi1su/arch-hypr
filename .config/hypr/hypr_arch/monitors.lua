-- Настройка мониторов
-- hl.monitor({ output = "", mode = "highres@highrr", position = "0x0", scale = "auto" })

hl.monitor({
	output = "DP-2",
	mode = "highres@240",
	position = "auto-left",
	scale = 1.6,
	vrr = 1,
	bitdepth = 10,
})

hl.monitor({
	output = "DP-3",
	mode = "highres@240",
	position = "auto-left",
	scale = 1.5,
	vrr = 1,
	bitdepth = 10,
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "highres@240",
	position = "auto-left",
	scale = 1.25,
	vrr = 1,
	bitdepth = 10,
})

hl.monitor({
	output = "eDP-2",
	mode = "highres@highrr",
	position = "auto-right",
	scale = 1.6,
})

-- Настройка рабочих столов
hl.workspace_rule({ workspace = "1", monitor = "eDP-2" })
hl.workspace_rule({ workspace = "2", monitor = "DP-3" })
