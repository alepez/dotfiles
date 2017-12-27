import XMonad
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig

main = xmonad $ def
    { borderWidth        = 2
    , modMask            = mod4Mask
    , terminal           = "roxterm"
    , normalBorderColor  = "#cccccc"
    , focusedBorderColor = "#cd8b00"
    , startupHook        = myStartupHook
    }
    `additionalKeysP`
    [ ("M-b", spawn "google-chrome") ]

myStartupHook = spawn "compton --config ~/.dotfiles/xmonad/compton.conf -b"
