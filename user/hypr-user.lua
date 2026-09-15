hl.config({
    input = {
        kb_options = "caps:backspace",
    },
    misc = {
        vrr = 1,
    },
})

hl.on("hyprland.start", function()
    hl.exec_cmd("sleep 3 && systemctl restart NetworkManager")
    hl.exec_cmd("udiskie &")
end)

hl.bind("CTRL + H", hl.dsp.focus({ direction = "left" }))
hl.bind("CTRL + J", hl.dsp.focus({ direction = "down" }))
hl.bind("CTRL + K", hl.dsp.focus({ direction = "up" }))
hl.bind("CTRL + L", hl.dsp.focus({ direction = "right" }))
hl.bind("CTRL + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("CTRL + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind("CTRL + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind("CTRL + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
