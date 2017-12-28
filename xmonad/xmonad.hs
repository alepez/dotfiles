import XMonad
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import XMonad.Util.EZConfig
import System.Exit
import DBus.Client
import System.Taffybar.XMonadLog ( dbusLogWithPP, taffybarDefaultPP, taffybarColor, taffybarEscape )
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import System.Taffybar.Hooks.PagerHints (pagerHints)
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Layout
import XMonad.Layout.Fullscreen
import XMonad.Layout.Named
import XMonad.Layout.NoBorders
import XMonad.Layout.ToggleLayouts

myStartupHook = spawn "~/.dotfiles/wm/bin/startup" <+> spawn "taffybar"
myManageHook = manageDocks

myTaffyBarPP = taffybarDefaultPP {
    ppCurrent = taffybarColor "#f8f8f8" "DodgerBlue4"   . wrap " " " "
  , ppVisible = taffybarColor "#f8f8f8" "LightSkyBlue4" . wrap " " " "
  , ppUrgent  = taffybarColor "#f8f8f8" "red4"          . wrap " " " "
  , ppLayout  = taffybarColor "DarkOrange" "" . wrap " [" "] "
  , ppTitle   = taffybarColor "#61ce3c" "" . shorten 50
  }

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

  -- Quit xmonad.
  , ((controlMask .|. mod1Mask, xK_Delete),
     io (exitWith ExitSuccess))

  -- rofi run
  , ((modMask, xK_space),
     spawn "~/.dotfiles/wm/bin/rofi -show run")

  -- rofi password
  , ((modMask .|. shiftMask, xK_p),
     spawn $ "~/.dotfiles/wm/bin/pass-dmenu")

  -- rofi ssh
  , ((modMask .|. shiftMask, xK_Return),
     spawn $ "~/.dotfiles/wm/bin/ssh-dmenu")

  -- rofi clipboard
  , ((modMask .|. shiftMask, xK_c),
     spawn $ "~/.dotfiles/wm/bin/common-clip-dmenu")

  -- Cycle through the available layout algorithms.
  , ((modMask .|. shiftMask, xK_l),
     sendMessage NextLayout)
  ]

myLayout = toggle $ tallLayout ||| wideLayout ||| fullLayout
  where
    basicLayout = smartBorders $ fullscreenFocus $ Tall 1 (3/100) (1/2)
    tallLayout  = named "Tall" $ avoidStruts $ basicLayout
    wideLayout  = named "Wide" $ avoidStruts $ Mirror $ basicLayout
    fullLayout  = named "Full" $ noBorders Full
    toggle = toggleLayouts fullLayout

myConfig = defaultConfig {
  terminal           = myTerminal,
  focusFollowsMouse  = myFocusFollowsMouse,
  borderWidth        = myBorderWidth,
  modMask            = myModMask,
  workspaces         = myWorkspaces,
  normalBorderColor  = myNormalBorderColor,
  focusedBorderColor = myFocusedBorderColor,

  keys               = myKeys,

  startupHook        = myStartupHook,
  manageHook         = myManageHook,
  layoutHook         = myLayout
}

main = do
  client <- connectSession
  xmonad $ ewmh $ pagerHints $ docks $ myConfig {
    logHook = dbusLogWithPP client myTaffyBarPP
  }
