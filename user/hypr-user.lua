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
