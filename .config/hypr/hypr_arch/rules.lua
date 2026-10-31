-- --- ПРАВИЛА ОКОН -------------------------------------------------------------

-- 1. Rofi
hl.window_rule({
	name = "rofi_settings",
	match = { class = "^Rofi$" },
	border_size = 0,
})

-- 2. Telegram (сразу отправляется в специальный воркспейс)
hl.window_rule({
	name = "telegram_magic",
	match = { class = "^org.telegram.desktop$" },
	workspace = "special:magic",
	float = true,
})

-- 3. Pavucontrol
hl.window_rule({
	name = "pavucontrol_settings",
	match = { class = "^org.pulseaudio.pavucontrol$" },
	float = true,
	size = { 530, 350 },
	move = { 850, 50 },
})

-- 4. Blueman
hl.window_rule({
	name = "blueman_settings",
	match = { class = "^blueman-manager$" },
	float = true,
	size = { 530, 290 },
	move = { 100, 50 },
})

-- 5. Nmtui
hl.window_rule({
	name = "nmtui_settings",
	match = { class = "^nmtui$" },
	float = true,
	size = { 730, 400 },
	move = { 100, 70 },
})

-- 6. Nemo домашняя директория (всплывающее окно)
hl.window_rule({
	name = "nemo_home_float",
	match = {
		class = "^nemo$",
		title = "^.home$",
	},
	float = true,
})

-- 7. Подавление максимизации для всех приложений
hl.window_rule({
	name = "suppress-maximize",
	match = { class = ".*" },
	suppress_event = "maximize",
})
