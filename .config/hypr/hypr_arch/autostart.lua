-- Приложения и скрипты при старте
hl.on("hyprland.start", function()
	hl.exec_cmd("microsoft-edge-stable")
	hl.exec_cmd("telegram-desktop -startintray")

	hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
	hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Orchis-dark'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Rowaita-Adw-Light'")
end)
