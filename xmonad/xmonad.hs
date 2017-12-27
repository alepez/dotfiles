import XMonad
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import XMonad.Util.EZConfig

myStartupHook = spawn "compton --config ~/.dotfiles/xmonad/compton.conf -b"

myTerminal = "roxterm"
myBrowser = "google-chrome"

myFocusFollowsMouse = True

myModMask = mod4Mask

myWorkspaces = [ "1:Main", "2:Browser", "3:Test", "4", "5", "6", "7", "8", "9:Music" ]

myBorderWidth = 2
myNormalBorderColor  = "#7c7c7c"
myFocusedBorderColor = "#ffb6b0"

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  -- Open the browser
  [ ((modMask, xK_b),
     spawn $ myBrowser)

  -- Open a new terminal
  , ((modMask, xK_Return),
     spawn $ myTerminal)

  -- Restart xmonad
  , ((modMask .|. shiftMask, xK_r),
     restart "xmonad" True)

  -- rofi run
  , ((modMask, xK_space),
     spawn "~/.dotfiles/i3/bin/rofi -show run")

  -- rofi password
  , ((modMask .|. shiftMask, xK_p),
     spawn $ "~/.dotfiles/i3/bin/pass-dmenu")

  -- rofi ssh
  , ((modMask .|. shiftMask, xK_Return),
     spawn $ "~/.dotfiles/i3/bin/ssh-dmenu")

  -- rofi clipboard
  , ((modMask .|. shiftMask, xK_c),
     spawn $ "~/.dotfiles/i3/bin/common-clip-dmenu")

  -- Cycle through the available layout algorithms.
  , ((modMask .|. shiftMask, xK_l),
     sendMessage NextLayout)
  ]

myConfig = defaultConfig {
  terminal           = myTerminal,
  focusFollowsMouse  = myFocusFollowsMouse,
  borderWidth        = myBorderWidth,
  modMask            = myModMask,
  workspaces         = myWorkspaces,
  normalBorderColor  = myNormalBorderColor,
  focusedBorderColor = myFocusedBorderColor,

  keys               = myKeys,

  startupHook        = myStartupHook
}

main = do
  xmonad $ myConfig
