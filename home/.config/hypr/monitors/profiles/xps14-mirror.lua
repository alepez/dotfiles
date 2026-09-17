hl.monitor({ output = "desc:Samsung Display Corp. 0x41A2", mode = "1920x1080", position = "0x0", scale = 1 })

-- Fallback: mirror the laptop panel
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
    mirror = "desc:Samsung Display Corp. 0x41A2",
})
