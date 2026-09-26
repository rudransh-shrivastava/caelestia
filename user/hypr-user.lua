local function read(path)
    local f = io.open(path)
    if not f then return nil end
    local v = f:read("*l")
    f:close()
    return v
end

local function card_for(vendor)
    for i = 0, 9 do
        if read("/sys/class/drm/card" .. i .. "/device/vendor") == vendor then
            return "/dev/dri/card" .. i
        end
    end
end

local function on_ac()
    for _, name in ipairs({ "ACAD", "ADP1", "AC" }) do
        local v = read("/sys/class/power_supply/" .. name .. "/online")
        if v then return v == "1" end
    end
    return true
end

local nvidia = card_for("0x10de")
local intel = card_for("0x8086")
if nvidia and intel then
    hl.env("AQ_DRM_DEVICES", on_ac() and (nvidia .. ":" .. intel) or (intel .. ":" .. nvidia))
end

-- Monitors: laptop on the left, external HDMI on the right
hl.monitor({
    output   = "eDP-1",
    mode     = "preferred",
    position = "0x0",
    scale    = 1,
})

hl.monitor({
    output   = "HDMI-A-5",
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
