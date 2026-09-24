-- Monitors: laptop on the left, external HDMI on the right
hl.monitor({
    output   = "eDP-1",
    mode     = "preferred",
    position = "0x0",
    scale    = 1,
})

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@100",
    position = "1920x0",
    scale    = 1,
})

hl.config({
    input = {
        kb_options = "caps:backspace",
    },
    misc = {
        vrr = 1,
    },
})

-- Disable workspace switch animation
hl.animation({ leaf = "workspaces", enabled = false, speed = 5, bezier = "standard" })

hl.on("hyprland.start", function()
    hl.exec_cmd("sleep 3 && systemctl restart NetworkManager")
    hl.exec_cmd("udiskie &")
end)
