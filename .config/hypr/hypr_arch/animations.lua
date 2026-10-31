-- Объявляем кривую Безье
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

-- Анимации
hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-- Жесты тачпада
hl.gesture({ fingers = 3, direction = "pinchout", action = "close" })
hl.gesture({ fingers = 3, direction = "pinchin", action = "fullscreen" })
hl.gesture({ fingers = 4, direction = "up", action = "float" })
hl.gesture({ fingers = 3, direction = "left", action = "workspace", workspace_name = "r+1" })
hl.gesture({ fingers = 3, direction = "right", action = "workspace", workspace_name = "r-1" })
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "vertical", action = "special" })
