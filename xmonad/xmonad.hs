-- -*- mode: haskell; -*-

-- TODO:
-- * Take a look at https://github.com/davidbeckingsale/xmonad-config/blob/master/xmonad.hs
-- * Decide on dzen/conky/xmobar etc.
-- * Need a key to select from all windows in current workspace (like <Win>S but just for
--   workspace). Then get rid of tabbed layout.
-- * Investigate urgencyhook
-- * mySWNConfig isn't working
-- * Use zenburn like colors

import System.IO

import XMonad hiding ( (|||) )

import qualified XMonad.StackSet as W

import XMonad.Actions.CycleWS
import XMonad.Actions.DwmPromote
import XMonad.Actions.GridSelect
import XMonad.Actions.WindowMenu
import XMonad.Actions.UpdatePointer

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName

import XMonad.Layout.LayoutCombinators
import XMonad.Layout.Named
import XMonad.Layout.ShowWName
import XMonad.Layout.Tabbed

import XMonad.Prompt
import XMonad.Prompt.AppLauncher as AL
import XMonad.Prompt.Man
import XMonad.Prompt.RunOrRaise
import XMonad.Prompt.Shell
import XMonad.Prompt.Ssh
import XMonad.Prompt.Window

import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.Scratchpad
import XMonad.Util.WorkspaceCompare

scratchpads =
    [
     NS "htop" "xterm -name htop -e htop" (title =? "htop") (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3))
    , NS "nautilus" "Nautilus" (className =? "Nautilus") (nonFloating)
    ] where role = stringProperty "WM_WINDOW_ROLE"

myManageHook = namedScratchpadManageHook scratchpads <+> scratchpadManageHookDefault
               <+> (composeAll . concat $ [[
                                    resource   =? "Do"           --> doIgnore
                                   , resource  =? "gnome-do"     --> doIgnore
                                   , className =? "Gimp"         --> doFloat
                                   , className =? "MPlayer"      --> doFloat
                                   , className =? "Vncviewer"    --> doFloat
                                   , className =? "stalonetray"  --> doIgnore
                                   , className =? "trayer"       --> doIgnore
                                   ]])

myWorkSpaces = ["1-office ", "2-emacs " ,"3-shell ", "4-web ", "5-fm ", "6 ", "7 ", "8 ", "9-keep "]


-- Log Hook
myLogHook h = do
  dynamicLogWithPP $ oxyPP h

oxyPP :: Handle -> PP
oxyPP h = defaultPP {
            ppOutput = hPutStrLn h
          , ppSep = xmobarColor "" myHighlightedBgColor "|"
          , ppWsSep = ""
          , ppCurrent = xmobarColor myCurrentWsFgColor myCurrentWsBgColor
          , ppVisible = xmobarColor myVisibleWsFgColor myVisibleWsBgColor
          , ppHidden = xmobarColor myHiddenWsFgColor ""
          , ppHiddenNoWindows = xmobarColor myHiddenEmptyWsFgColor ""
          , ppUrgent = xmobarColor "" myUrgentWsBgColor
          , ppSort = getSortByXineramaRule
          --             , ppSort = getSortByXineramaPhysicalRule
          , ppTitle = xmobarColor myTitleFgColor myBgColor . shorten 120
          }

-- Workaround for Java grey screen issues.
myStartupHook = setWMName "LG3D"

-- Use Windoze key
myModMask = mod4Mask

-- Colors
myFgColor = "#DCDCCC"
myBgColor = "#3f3f3f"
myHighlightedFgColor = myFgColor
myHighlightedBgColor = "#7F9F7F"
myActiveBorderColor = myCurrentWsBgColor
myInactiveBorderColor = "#262626"
myCurrentWsFgColor = myHighlightedFgColor
myCurrentWsBgColor = myHighlightedBgColor
myVisibleWsFgColor = myBgColor
myVisibleWsBgColor = "#CCDC90"
myHiddenWsFgColor = myHighlightedFgColor
myHiddenEmptyWsFgColor = "#8F8F8F"
myUrgentWsBgColor = "#DCA3A3"
myTitleFgColor = myFgColor
myUrgencyHintFgColor = "red"
myUrgencyHintBgColor = "blue"

-- Layout

myLayout =  avoidStruts $ named "tile" tiled ||| named "tab" (tabbed shrinkText tConfig) |||
            named "mTile" mirrorTiled ||| Full
  where
     tiled       = Tall nmaster delta ratio
--     twoPane     = TwoPane delta ratio
     nmaster     = 1
     ratio       = 1/2
     delta       = 3/100
     mirrorTiled = Mirror tiled
     tConfig     = defaultTheme { inactiveTextColor = myVisibleWsFgColor, inactiveColor = myVisibleWsBgColor, activeTextColor = myCurrentWsFgColor, activeColor = myCurrentWsBgColor}


-- FIXME: This isn't working
mySWNConfig = defaultSWNConfig {
                swn_color   = myFgColor
              , swn_bgcolor = myBgColor}


main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobar"
  xmonad $ defaultConfig {
               manageHook         = manageDocks <+> myManageHook <+> manageHook defaultConfig
             , layoutHook         = showWName' mySWNConfig $ myLayout
             , workspaces         = myWorkSpaces
             , logHook            = myLogHook xmproc
                                    >> updatePointer (Relative 0.5 0.5)
             , startupHook        = myStartupHook
             , borderWidth        = 2
             , modMask            = myModMask
             , normalBorderColor  = myInactiveBorderColor
             , focusedBorderColor = myActiveBorderColor
             } `additionalKeys` keys'
       where
         keys' =  [ ((myModMask , xK_Return),               dwmpromote)
                  , ((myModMask .|. shiftMask, xK_Return),  spawn "gnome-terminal")

                  , ((myModMask .|. shiftMask, xK_z),       spawn "gnome-screensaver-command -l")

                  -- Print Screen - Interactively select window or rectangle
                  , ((myModMask, xK_Print),                 spawn "sleep 0.2;scrot -d2 -s 'Zshot-%Y%m%d-%H.%M.%S.png' -e 'display $f'")

                  -- Print Screen - Current screen
                  , ((myModMask .|. shiftMask, xK_Print),   spawn "sleep 0.2;scrot -d2 'Zshot-%Y%m%d-%H.%M.%S.png' -e 'display $f'")

                  -- Print Screen - All screens
                  , ((myModMask .|. controlMask, xK_Print), spawn "sleep 0.2;scrot -d2 -m 'Zshot-%Y%m%d-%H.%M.%S.png' -e 'display $f'")

                  , ((mod4Mask .|. controlMask, xK_b), sendMessage $ JumpToLayout "tab")
                  , ((mod4Mask .|. controlMask, xK_f), sendMessage $ JumpToLayout "Full")
                  , ((mod4Mask .|. controlMask, xK_m), sendMessage $ JumpToLayout "Tile")
                  , ((mod4Mask .|. controlMask, xK_t), sendMessage $ JumpToLayout "mTile")

                  , ((myModMask, xK_F1),                manPrompt defaultXPConfig)
                  , ((myModMask, xK_g),                 windowPromptGoto defaultXPConfig { autoComplete = Just 500000 } )
                  , ((myModMask .|. shiftMask, xK_g),   windowPromptBring defaultXPConfig { autoComplete = Just 500000 } )
                  , ((myModMask, xK_s),                 goToSelected defaultGSConfig)
                  , ((myModMask, xK_o ),                windowMenu)

                  , ((myModMask, xK_F8),                scratchpadSpawnAction defaultConfig)
                  , ((myModMask, xK_F9),                namedScratchpadAction scratchpads "htop")
                  , ((myModMask, xK_F10),               namedScratchpadAction scratchpads "nautilus")

                  , ((myModMask, xK_b),                 sendMessage ToggleStruts)
                  , ((mod1Mask, xK_F4),                 kill)

                  , ((myModMask, xK_Left),              prevWS)
                  , ((myModMask, xK_Right),             nextWS)

           ]
