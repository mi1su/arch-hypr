-- --- НАСТРОЙКА МОНИТОРОВ ------------------------------------------------------
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

-- --- НАСТРОЙКА РАБОЧИХ СТОЛОВ -------------------------------------------------
hl.workspace_rule({ workspace = "1", monitor = "eDP-2" })
hl.workspace_rule({ workspace = "2", monitor = "DP-3" })

-- --- АВТОСТАРТ ----------------------------------------------------------------
hl.on("hyprland.start", function()
	hl.exec_cmd("microsoft-edge-stable")
	hl.exec_cmd("telegram-desktop -startintray")

	hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
	hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Orchis-dark'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Rowaita-Adw-Light'")
end)

-- --- ПЕРЕМЕННЫЕ ---------------------------------------------------------------
local mainMod = "SUPER"
local terminal = "kitty"
local fileManager = "nemo"
local menu = "rofi -show drun"
local lock = "hyprlock -c ~/.config/hypr/hyprlock.conf"

-- --- ПЕРЕМЕННЫЕ ОКРУЖЕНИЯ ----------------------------
hl.env("EDITOR", "nvim")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GTK_THEME", "Orchis-dark")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("VK_LOADER_DEVICE_SELECT_INDEX", "1")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

hl.config({
	-- Настройки курсора
	cursor = {
		no_hardware_cursors = true,
	},

	-- Главные параметры окон и сетки
	general = {
		gaps_in = 5,
		gaps_out = 5,
		border_size = 2,
		col = {
			active_border = { colors = { "rgba(f2cdcdee)", "rgba(f5e0dcee)" }, angle = 45 },
			inactive_border = "rgba(1e1e2eff)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	-- Декорации окон, размытие и тени
	decoration = {
		rounding = 10,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		fullscreen_opacity = 1.0,
		blur = {
			enabled = true,
			size = 8,
			passes = 2,
			ignore_opacity = true,
			xray = true,
			vibrancy = 0.1696,
		},
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
			scale = 1.0,
		},
	},

	-- Параметры тайлинг-движков
	dwindle = {
		preserve_split = true,
	},
	master = {
		new_status = "master",
	},

	-- Системные настройки поведения оконного менеджера
	misc = {
		disable_hyprland_logo = true,
		animate_manual_resizes = true,
		animate_mouse_windowdragging = true,
		enable_swallow = true,
		disable_splash_rendering = true,
		mouse_move_enables_dpms = true,
	},

	-- Глобальные настройки клавиатуры и мыши / тачпада
	input = {
		kb_layout = "us,ru",
		kb_options = "grp:alt_shift_toggle,grp:win_space_toggle",
		scroll_method = "on",
		natural_scroll = true,
		follow_mouse = 1,
		sensitivity = 0,
		numlock_by_default = true,
		touchpad = {
			natural_scroll = true,
		},
	},

	-- Переключатель глобального состояния анимаций
	animations = {
		enabled = true,
	},
})

-- --- СГЛАЖИВАНИЕ И АНИМАЦИИ --------------------
-- Объявляем кривую Безье через встроенную функцию
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

-- Привязываем анимации к объявленным кривым
hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-- --- НАСТРОЙКА УСТРОЙСТВ И МЫШИ .------------------------------
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

-- --- ЖЕСТЫ ТАЧПАДА И ЭКРАНА -----------------------------------
hl.gesture({ fingers = 3, direction = "pinchout", action = "close" })
hl.gesture({ fingers = 3, direction = "pinchin", action = "fullscreen" })
hl.gesture({ fingers = 4, direction = "up", action = "float" })
hl.gesture({ fingers = 3, direction = "left", action = "workspace", workspace_name = "r+1" })
hl.gesture({ fingers = 3, direction = "right", action = "workspace", workspace_name = "r-1" })
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "vertical", action = "special" })

-- --- БИНДЫ (ГОРЯЧИЕ КЛАВИШИ) --------------------------------------------------
hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd("$scrPath/sysmonlaunch.sh"))
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd("pkill -x rofi || $scrPath/rofilaunch.sh w"))
hl.bind(mainMod .. " + ALT + G", hl.dsp.exec_cmd("$scrPath/gamemode.sh"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("pkill -x rofi || $scrPath/cliphist.sh c"))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -c backlight set +10%"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -c backlight set 10%-"), { locked = true })
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(lock))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m output -o ~/Pictures/Screenshots"))
hl.bind("ALT + PRINT", hl.dsp.exec_cmd("hyprshot -m window -o ~/Pictures/Screenshots"))
hl.bind("CTRL + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots"))
hl.bind(mainMod .. " + CTRL + Q", hl.dsp.exit())
hl.bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = 0 }))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + R", hl.dsp.layout("rotatesplit"))

hl.bind("ALT + Tab", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

for i = 1, 9 do
	local key = tostring(i)
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind(mainMod .. " + CTRL + H", hl.dsp.group.prev())
hl.bind(mainMod .. " + CTRL + L", hl.dsp.group.next())

hl.bind(mainMod .. " + ALT + right", hl.dsp.window.move({ x = 50, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.move({ x = -50, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.move({ x = 0, y = -50, relative = true }))
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.move({ x = 0, y = 50, relative = true }))

hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.resize({ x = -50, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({ x = 50, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.resize({ x = 0, y = -50, relative = true }))
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.resize({ x = 0, y = 50, relative = true }))

-- --- ПРАВИЛА ОКОН -------------------------------------------------------------
-- 1. Rofi
hl.window_rule({
	name = "rofi_settings",
	match = { class = "^Rofi$" },
	border_size = 0,
})

-- 2. Telegram
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

-- 6. Nemo домашняя директория
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
