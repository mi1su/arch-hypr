-- --- ПЕРЕМЕННЫЕ ДЛЯ БИНДОВ ----------------------------------------------------
local mainMod = "SUPER"
local terminal = "kitty"
local fileManager = "nemo"
local menu = "rofi -show drun"
local lock = "hyprlock -c ~/.config/hypr/hyprlock.conf"
local scrPath = "$scrPath"

-- --- БИНДЫ (ГОРЯЧИЕ КЛАВИШИ) --------------------------------------------------
hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd(scrPath .. "/sysmonlaunch.sh"))
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/rofilaunch.sh w"))
hl.bind(mainMod .. " + ALT + G", hl.dsp.exec_cmd(scrPath .. "/gamemode.sh"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("pkill -x rofi || " .. scrPath .. "/cliphist.sh c"))

-- Управление мультимедиа и яркостью
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

-- Запуск основных программ и управление WM
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

-- Навигация и фокус окон
hl.bind("ALT + Tab", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Автоматическая генерация биндов для рабочих столов 1-9
for i = 1, 9 do
	local key = tostring(i)
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
-- Бинд для 10-го рабочего стола через клавишу "0"
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Группы окон
hl.bind(mainMod .. " + CTRL + H", hl.dsp.group.prev())
hl.bind(mainMod .. " + CTRL + L", hl.dsp.group.next())

-- Перемещение окон стрелками (с зажатым SHIFT или ALT)
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

hl.bind(mainMod .. " + ALT + right", hl.dsp.window.move({ x = 50, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.move({ x = -50, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.move({ x = 0, y = -50, relative = true }))
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.move({ x = 0, y = 50, relative = true }))

-- Специальные рабочие столы (Magic)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Прокрутка рабочих столов мыслью/колесиком
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Интерактивное перемещение и ресайз мышь + SUPER
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Точный ресайз окон клавиатурой
hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.resize({ x = -50, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({ x = 50, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.resize({ x = 0, y = -50, relative = true }))
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.resize({ x = 0, y = 50, relative = true }))
