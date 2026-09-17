hl.monitor({ output = "desc:Samsung Display Corp. 0x41A2", mode = "3200x2000", position = "0x0", scale = 2 })

-- Fallback: place unspecified monitors to the right with preferred resolution
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })
