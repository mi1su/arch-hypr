# Установка и настройка Hyprland на ArchLinux

Добро пожаловать! В этом руководстве мы подробно рассмотрим, как скачать, установить и настроить Hyprland на ArchLinux. Мы начнем с установки необходимых пакетов, а затем перейдем к настройке конфигураций.

---

## Скачивание и установка

### Скачивание конфигураций

Для начала вам нужно скачать конфигурации Hyprland. Откройте терминал и выполните следующие команды:

```bash
git clone https://github.com/mi1su/arch-hypr
mv arch-hypr/.config/* ~/.config/  # Переместите содержимое .config в директорию ~/.config
```

После этого вы сможете найти все необходимые файлы в директории `~/.config`.

---

## Информация о системе

| **Info**            | **Soft**                   |
|---------------------|-----------------------------|
| **Дистрибутив**     | ArchLinux                   |
| **WM**              | Hyprland                    |
| **Бар**             | Waybar                      |
| **Лаунчер**         | Wofi                        |
| **Терминал**        | Kitty                       |
| **Оболочка**        | Fish                        |
| **Уведомления**     | Mako                        |
| **Скриншоты**       | Hyprshot                    |
| **Блокировка**      | Hyprlock                    |
| **Менеджер входа**  | Ly                          |

---

## Примечание

### Конфигурации для Hyprland

Эти конфигурации Hyprland настроены для использования с ArchLinux. Если у вас другая система, вам может потребоваться внести дополнительные изменения.

Это репозиторий с конфигурациями для [Hyprland](https://hyprland.org/), чтобы упростить его использование и настройку.

## Установка пакетов

Для установки необходимых пакетов в Arch Linux используйте пакетные менеджеры `pacman` и `yay`. 

### Установленные доп пакеты

Вот список пакетов, которые я установил:

- **acpi** - утилиты для работы с ACPI.
- **acpid** - демон для обработки событий ACPI.
- **acpilight** - управление яркостью экрана.
- **blueman** - менеджер Bluetooth.
- **bluez** и **bluez-utils** - стек Bluetooth.
- **brightnessctl** - утилита для управления яркостью.
- **chromium** - веб-браузер.
- **code** - Visual Studio Code.
- **dnscrypt-proxy** - DNS-прокси для повышения конфиденциальности.
- **firefox** - веб-браузер.
- **fish** - удобная командная оболочка.
- **git** - система контроля версий.
- **htop** - интерактивный мониторинг процессов.
- **neovim** - текстовый редактор.
- **networkmanager** - управление сетевыми подключениями.
- **nvidia-dkms** - драйверы NVIDIA.
- **openvpn** - клиент для VPN.
- **pavucontrol** - графический интерфейс для управления звуком.
- **python** - необходим для работы некоторых скриптов.
- **pipewire** - мультимедийный сервер.
- **telegram-desktop** - мессенджер.
- **xdg-desktop-portal** и **xdg-desktop-portal-hyprland** - интеграция с десктопом.

### Установка пакетов

Вы можете установить все необходимые пакеты с помощью следующих команд:

```bash
sudo pacman -S acpi acpid acpilight blueman bluez bluez-utils brightnessctl chromium code dnscrypt-proxy firefox fish git htop neovim networkmanager nvidia-dkms openvpn pavucontrol python pipewire telegram-desktop xdg-desktop-portal xdg-desktop-portal-hyprland
```

---

## Шрифты

Для корректного отображения иконок в вашем окружении вам понадобятся специальные шрифты. Я рекомендую установить следующие шрифты:

1. **Nerd Fonts** - шрифт с множеством иконок.
2. **Font Awesome** - популярный шрифт с иконками.
3. **Material Icons** - шрифт с иконками от Google.
4. **adobe-source-code-pro-fonts** - шрифт для программирования.
5. **cantarell-fonts** - шрифт для интерфейса.
6. **noto-fonts** - шрифт, поддерживающий множество языков.
7. **ttf-dejavu** - шрифт с поддержкой множества символов.

### Установка шрифтов

Вы можете установить их с помощью `pacman` или `yay`. Например:

```bash
yay -S nerd-fonts-complete
yay -S ttf-font-awesome
yay -S ttf-material-design-iconic-font

```

Однако **Nerd Fonts** лучше скачать с официального сайта: [Nerd Fonts Releases](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/NerdFontsSymbolsOnly.zip).

**Symbols Only** - это шрифт, содержащий только иконки Nerd Font. Он в основном используется для Waybar.

---

Еще для самого hyprland я использую 

exec-once = gsettings set org.gnome.desktop.interface cursor-theme 'DeppinDark-cursors'
exec-once = gsettings set org.gnome.desktop.interface gtk-theme 'Orchis-dark'
exec-once = gsettings set org.gnome.desktop.interface icon-theme 'Rowaita-Adw-Light'

## Настройка

После скачивания конфигурации вам нужно внести некоторые изменения, связанные с вашими параметрами:

### Изменения в скриптах

В скрипте `weather.py` необходимо изменить идентификатор города на ваш. Обратите внимание, что без VPN он может не работать. В будущем планируется переработка этого скрипта.

Также в директории `~/.config/hypr/hypr_arch` находится файл `hyprland.conf`, в котором вы можете настроить основные параметры Hyprland, включая путь для сохранения скриншотов.

В файле `hyprlock.conf` измените путь к скриптам, если вы их переместили, и укажите путь к обоям.

В файле `hyprpaper.conf` измените путь, необходимый для установки обоев.

### Настройки для Waybar

В директории `~/.config/waybar` вы найдете скрипты, такие как `weather.sh`, где также нужно изменить название города. Я использую Python, поэтому просто замените название города в соответствующем месте. 
Не забудьте, что для управления звуком в Waybar требуется `pavucontrol`.

---

## Наслаждайтесь!

---

