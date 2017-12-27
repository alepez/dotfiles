import           XMonad

main = xmonad $ def
    { borderWidth        = 2
    , modMask            = mod4Mask
    , terminal           = "roxterm"
    , normalBorderColor  = "#cccccc"
    , focusedBorderColor = "#cd8b00" }
