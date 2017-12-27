import XMonad
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig

main = xmonad $ def
    { borderWidth        = 2
    , modMask            = mod4Mask
    , terminal           = "roxterm"
    , normalBorderColor  = "#cccccc"
    , focusedBorderColor = "#cd8b00" }
    `additionalKeysP`
    [ ("M-b", spawn "google-chrome") ]

