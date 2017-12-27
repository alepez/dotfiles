import XMonad
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import XMonad.Util.EZConfig

myStartupHook = spawn "compton --config ~/.dotfiles/xmonad/compton.conf -b"

myTerminal = "roxterm"

myFocusFollowsMouse = True

myModMask = mod4Mask

myWorkspaces = [ "1:Main", "2:Browser", "3:Test", "4", "5", "6", "7", "8", "9:Music" ]

myBorderWidth = 2
myNormalBorderColor  = "#7c7c7c"
myFocusedBorderColor = "#ffb6b0"

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $ [
  -- Open the browser
  ((modMask, xK_b),
     spawn $ "google-chrome"),

  -- Open a new terminal
  ((modMask, xK_Return),
     spawn $ XMonad.terminal conf),

  -- Restart xmonad
  ((modMask .|. shiftMask, xK_r),
     restart "xmonad" True),

  -- Show rofi
  ((modMask, xK_space),
     spawn "~/.dotfiles/i3/bin/rofi -show run")

  -- Cycle through the available layout algorithms.
  ((modMask .|. shiftMask, xK_l),
     sendMessage NextLayout),
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
