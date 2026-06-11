local browser = "zen-beta"
local terminal = "ghostty"

hl.on("hyprland.start", function()
	hl.exec_cmd(
		"setpriv --ambient-caps '-all' dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
	)
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("poweralertd")
	hl.exec_cmd("wl-clip-persist --clipboard both")
	hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd("waybar")
	hl.exec_cmd("swaync")
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 20")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("swayosd-server")
	hl.exec_cmd("vicinae server")
	hl.exec_cmd(terminal .. " --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false")
	hl.exec_cmd("hyprctl dispatch exec '[workspace 1 silent] " .. browser .. "'")
	hl.exec_cmd("hyprctl dispatch exec '[workspace 2 silent] " .. terminal .. "'")
	hl.exec_cmd("hyprctl dispatch exec '[workspace 3 silent] vesktop'")
end)

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 8,
		border_size = 1,
		col = {
			active_border = {
				colors = { "rgb(585b70)", "rgb(585b70)" },
				angle = 45,
			},
			inactive_border = "rgb(181825)",
		},
		resize_on_border = true,
		layout = "dwindle",
	},

	input = {
		kb_layout = "us,ara",
		kb_options = "grp:alt_caps_toggle",
		numlock_by_default = true,
		repeat_delay = 300,
		follow_mouse = 1,
		float_switch_override_focus = 0,
		mouse_refocus = 0,
		sensitivity = -1,
		force_no_accel = 1,
		touchpad = {
			natural_scroll = true,
		},
	},

	misc = {
		disable_autoreload = true,
		disable_hyprland_logo = true,
		always_follow_on_dnd = true,
		layers_hog_keyboard_focus = true,
		animate_manual_resizes = false,
		enable_swallow = true,
		focus_on_activate = false,
		middle_click_paste = false,
		disable_splash_rendering = true,
	},

	dwindle = {
		force_split = 2,
		special_scale_factor = 1.0,
		split_width_multiplier = 1.0,
		use_active_for_splits = true,
		preserve_split = true,
	},

	master = {
		new_status = "master",
		special_scale_factor = 1,
	},

	decoration = {
		rounding = 0,
		dim_special = 0.3,
		blur = {
			enabled = true,
			size = 2,
			passes = 5,
			ignore_opacity = true,
			new_optimizations = true,
			xray = true,
			special = true,
		},
		shadow = {
			enabled = false,
		},
	},

	debug = {
		full_cm_proto = true,
		disable_logs = false,
	},

	binds = {
		movefocus_cycles_fullscreen = true,
	},

	xwayland = {
		force_zero_scaling = true,
	},
})

hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
	mirror = "eDP-1",
})

-- ==========================================
-- GLOBAL ANIMATIONS & CURVES CONFIG
-- ==========================================
hl.curve("wind", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("winIn", { type = "bezier", points = { { 0.1, 1.1 }, { 0.1, 1.1 } } })
hl.curve("winOut", { type = "bezier", points = { { 0.3, -0.3 }, { 0, 1 } } })
hl.curve("liner", { type = "bezier", points = { { 1, 1 }, { 1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "windows", enabled = true, speed = 6, bezier = "wind", style = "slide" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 6, bezier = "winIn", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, bezier = "winOut", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, bezier = "wind", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "liner" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 30, bezier = "liner", style = "loop" })
hl.animation({ leaf = "fade", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "wind" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "wind", style = "fade" })

-- Standard Mapped Keybindings
hl.bind("SUPER + F1", hl.dsp.exec_cmd("vicinae 'vicinae://extensions/sovereign/hypr-keybinds/hyprland-keybinds'"))
hl.bind("SUPER + Return", hl.dsp.exec_cmd(terminal .. " --gtk-single-instance=true"))
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("ALT + Return", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("SUPER + W", hl.dsp.window.float({ action = "toggle" }))
hl.bind("ALT + Space", hl.dsp.exec_cmd("vicinae toggle"))
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd("vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland"))
hl.bind("SUPER + Escape", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + SHIFT + Escape", hl.dsp.exec_cmd("vicinae 'vicinae://toggle?fallbackText=power%20management'"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("hyprctl dispatch layoutmsg togglesplit"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("nemo"))
hl.bind("ALT + E", hl.dsp.exec_cmd("hyprctl dispatch exec '[float; size 1111 700] nemo'"))
hl.bind("ALT + Escape", hl.dsp.exec_cmd("toggle-waybar"))
hl.bind("SUPER + C", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("vicinae vicinae://extensions/sovereign/awww-switcher/wpgrid"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind("SUPER + equal", hl.dsp.exec_cmd("woomer"))

-- System Event Keybinds (No Modifier)
hl.bind("Print", hl.dsp.exec_cmd("screenshot --fullscreen"))
hl.bind("SUPER + Print", hl.dsp.exec_cmd("screenshot --nonfreeze-copy"))
hl.bind("SUPER + CTRL + ALT + SHIFT + S", hl.dsp.exec_cmd("screenshot --freeze-copy"))

-- Window Focus Navigation
local directions = { left = "l", right = "r", up = "u", down = "d", h = "l", j = "d", k = "u", l = "r" }

for key, dir in pairs(directions) do
	hl.bind("SUPER + " .. key, function()
		hl.dispatch(hl.dsp.focus({ direction = dir }))
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dispatch alterzorder top"))
	end)
end

hl.bind("CTRL + ALT + up", hl.dsp.exec_cmd("hyprctl dispatch focuswindow floating"))
hl.bind("CTRL + ALT + down", hl.dsp.exec_cmd("hyprctl dispatch focuswindow tiled"))

-- Workspace Layout Selection (FIXED: Passed as integer and using follow = false)
for i = 0, 9 do
	local ws = i == 0 and 10 or i
	hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = ws }))
	hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = ws }))
	hl.bind("SUPER + ALT + " .. i, hl.dsp.window.move({ workspace = ws, follow = false }))
end
hl.bind("SUPER + CTRL + c", hl.dsp.window.move({ workspace = "empty" }))

-- Move Tiled Directionals
hl.bind("SUPER + SHIFT + left", hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.swap({ direction = "r" }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.swap({ direction = "u" }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.swap({ direction = "d" }))
hl.bind("SUPER + SHIFT + h", hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + SHIFT + j", hl.dsp.window.swap({ direction = "d" }))
hl.bind("SUPER + SHIFT + k", hl.dsp.window.swap({ direction = "u" }))
hl.bind("SUPER + SHIFT + l", hl.dsp.window.swap({ direction = "r" }))

-- Window Resize Mechanics
hl.bind("SUPER + CTRL + left", hl.dsp.exec_cmd("hyprctl dispatch resizeactive -40 0"))
hl.bind("SUPER + CTRL + right", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 40 0"))
hl.bind("SUPER + CTRL + up", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -40"))
hl.bind("SUPER + CTRL + down", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 40"))
hl.bind("SUPER + CTRL + h", hl.dsp.exec_cmd("hyprctl dispatch resizeactive -40 0"))
hl.bind("SUPER + CTRL + j", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 40"))
hl.bind("SUPER + CTRL + k", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -40"))
hl.bind("SUPER + CTRL + l", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 40 0"))

-- Move Active Float Windows
hl.bind("SUPER + ALT + left", hl.dsp.exec_cmd("hyprctl dispatch moveactive -40 0"))
hl.bind("SUPER + ALT + right", hl.dsp.exec_cmd("hyprctl dispatch moveactive 40 0"))
hl.bind("SUPER + ALT + up", hl.dsp.exec_cmd("hyprctl dispatch moveactive 0 -40"))
hl.bind("SUPER + ALT + down", hl.dsp.exec_cmd("hyprctl dispatch moveactive 0 40"))
hl.bind("SUPER + ALT + h", hl.dsp.exec_cmd("hyprctl dispatch moveactive -40 0"))
hl.bind("SUPER + ALT + j", hl.dsp.exec_cmd("hyprctl dispatch moveactive 0 40"))
hl.bind("SUPER + ALT + k", hl.dsp.exec_cmd("hyprctl dispatch moveactive 0 -40"))
hl.bind("SUPER + ALT + l", hl.dsp.exec_cmd("hyprctl dispatch moveactive 40 0"))

-- Scratchpads / Special Workspaces (FIXED: follow = false)
hl.bind("SUPER + ALT + S", hl.dsp.window.move({ workspace = "special", follow = false }))
hl.bind("SUPER + S", hl.dsp.exec_cmd("hyprctl dispatch togglespecialworkspace"))

-- Multimedia Keys
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"))
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + V", hl.dsp.exec_cmd("vicinae vicinae://extensions/vicinae/clipboard/history"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"))

-- Long Press / Locked Keybinds
hl.bind("ALT + F5", hl.dsp.exec_cmd("swayosd-client --brightness lower 5%-"), { locked = true })
hl.bind("ALT + F6", hl.dsp.exec_cmd("swayosd-client --brightness raise 5%+"), { locked = true })
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("swayosd-client --output-volume +2 --max-volume=100"),
	{ repeating = true, locked = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("swayosd-client --output-volume -2"),
	{ repeating = true, locked = true }
)
hl.bind("ALT + F1", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { repeating = true, locked = true })
hl.bind(
	"ALT + F3",
	hl.dsp.exec_cmd("swayosd-client --output-volume +2 --max-volume=100"),
	{ repeating = true, locked = true }
)
hl.bind("ALT + F2", hl.dsp.exec_cmd("swayosd-client --output-volume -2"), { repeating = true, locked = true })
hl.bind("ALT + F4", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"), { repeating = true, locked = true })

-- Mouse Interactivity
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Key Release Operations
hl.bind("Caps_Lock", hl.dsp.exec_cmd("swayosd-client --caps-lock"), { release = true })
hl.bind("Scroll_Lock", hl.dsp.exec_cmd("swayosd-client --scroll-lock"), { release = true })
hl.bind("Num_Lock", hl.dsp.exec_cmd("swayosd-client --num-lock"), { release = true })

-- Window & Layer Restrictions Layout
hl.layer_rule({ match = { namespace = "vicinae" }, blur = true, ignore_alpha = 0, no_anim = true })

hl.window_rule({ match = { float = true }, center = true })

hl.window_rule({
	match = {
		class = "imv|mpv|org.gnome.Calculator|org.gnome.FileRoller|org.pulseaudio.pavucontrol|waypaper|zenity|SoundWireServer|.sameboy-wrapped|file_progress|confirm|dialog|download|notification|error|confirmreset",
	},
	float = true,
})

hl.window_rule({
	match = {
		title = "Volume Control|Picture-in-Picture|Open File|Open Files|File Upload|All Files|branchdialog|Confirm to replace files|File Operation Progress",
	},
	float = true,
})

hl.window_rule({ match = { title = "Volume Control" }, size = { 700, 450 } })
hl.window_rule({ match = { class = "zenity" }, size = { 850, 500 } })
hl.window_rule({ match = { class = "SoundWireServer" }, size = { 725, 330 } })
hl.window_rule({ match = { class = "waypaper" }, pin = true })
hl.window_rule({ match = { class = "anki", title = "Add" }, float = true, size = { 929, 558 }, center = true })
hl.window_rule({ match = { class = "xwaylandvideobridge" }, opacity = "0.0 override" })
hl.window_rule({ match = { class = "dev.zed.Zed" }, opacity = "0.90" })

hl.window_rule({
	match = { class = "vesktop|Steam|steam|steamwebhelper|Spotify|Code|code-url-handler|nemo|qt5ct|qt6ct|obsidian" },
	opacity = "0.95",
})

hl.window_rule({ match = { title = ".*imv.*|.*mpv.*|Picture-in-Picture" }, opacity = "1.0 override 1.0 override" })
hl.window_rule({ match = { class = "Aseprite|zen|evince" }, opacity = "1.0 override 1.0 override" })
hl.window_rule({ match = { class = "mpv" }, idle_inhibit = "focus" })
hl.window_rule({
	match = { class = "xwaylandvideobridge" },
	no_anim = true,
	no_initial_focus = true,
	max_size = { 1, 1 },
	no_blur = true,
})
hl.window_rule({ match = { title = "Vicinae Launcher" }, no_anim = true, pin = true, border_size = 0 })
