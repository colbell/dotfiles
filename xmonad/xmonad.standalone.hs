
-- -*- mode: haskell; -*-
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
import XMonad.Layout.NoBorders
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

myWorkspaces = ["1-emacs","2-shell","3-web","4-fm","5","6","7","8-ssh","9-mail"]

myManageHook = scratchpadManageHookDefault <+> (composeAll . concat $ [[
         resource  =? "Do"                --> doIgnore
       , resource  =? "gnome-do"          --> doIgnore
       , className =? "Gimp"              --> doFloat
       , className =? "MPlayer"           --> doFloat
       , className =? "Vncviewer"         --> doFloat
       , className =? "stalonetray"       --> doIgnore
       , className =? "trayer"            --> doIgnore
       , className =? "Tilda"             --> doFloat
       , className =? "Guake.py"          --> doFloat
       , className =? "Guake"             --> doFloat
       , className =? "Yakuake"           --> doFloat
       , className =? "Unity-2d-panel"    --> doIgnore
       , className =? "Unity-2d-shell"    --> doIgnore
       , className =? "Unity-2d-launcher" --> doIgnore
       , resource  =? "desktop_window"    --> doIgnore
       , resource  =? "kdesktop"          --> doIgnore
       , className =? "tint2"             --> doIgnore
       , className =? "Plasma"            --> doFloat
       , className =? "Plasma-desktop"    --> doFloat
       , className =? "Knotes"            --> doFloat
       , className =? "XCalc"             --> doFloat
       , className =? "Dolphin"           --> doShift "4-fm"
       , className =? "chromium-browser"  --> doShift "3-web"
       ]])

myLogHook h = do
  dynamicLogWithPP $ oxyPP h

oxyPP :: Handle -> PP
oxyPP h = defaultPP {
            ppOutput = hPutStrLn h
          , ppWsSep = " "
          , ppCurrent = xmobarColor myCurrentWsFgColor myCurrentWsBgColor
          , ppVisible = xmobarColor myVisibleWsFgColor myVisibleWsBgColor
          , ppHidden = xmobarColor myHiddenWsFgColor ""
          , ppHiddenNoWindows = xmobarColor myHiddenEmptyWsFgColor ""
          , ppUrgent = xmobarColor "" myUrgentWsBgColor
          , ppSort = getSortByTag --getSortByXineramaRule
          --             , ppSort = getSortByXineramaPhysicalRule
          , ppTitle = xmobarColor myTitleFgColor myBgColor . shorten 120
          }


myXPConfig :: XPConfig
myXPConfig = defaultXPConfig
                { bgColor               = myBgColor
                , fgColor               = myFgColor
                , bgHLight              = myHighlightedBgColor
                , fgHLight              = myHighlightedFgColor
                , position              = Top
                , promptBorderWidth     = 0
                }

--myStartupHook = setWMName "LG3D"   -- Workaround for Java grey screen issues.

myModMask = mod4Mask               -- Use Windoze key.

myBgColor = "#000000"
myFgColor = "#CC5500"
myHighlightedBgColor = myBgColor
myHighlightedFgColor = "#FFA000"
myCurrentWsBgColor    = myHighlightedBgColor
myActiveBorderColor   = myHighlightedFgColor
myInactiveBorderColor = "#d3d3d3"

-- Are these used?
myCurrentWsFgColor = myHighlightedFgColor
--myCurrentWsBgColor = myHighlightedBgColor
myVisibleWsFgColor = myFgColor
myVisibleWsBgColor = "#506070"
myHiddenWsFgColor = myHighlightedFgColor
myHiddenEmptyWsFgColor = "#8F8F8F"
myUrgentWsBgColor = "#DCA3A3"
myTitleFgColor = myFgColor
myUrgencyHintFgColor = "red"
myUrgencyHintBgColor = "blue"

myLayout = smartBorders $ avoidStruts $ showWName' mySWNConfig $ named "tile" tiled ||| named "mTile" mirrorTiled ||| tabbed shrinkText myTabConfig ||| noBorders Full
  where
     tiled       = Tall nmaster delta ratio
     nmaster     = 1
     ratio       = 1/2
     delta       = 3/100
     mirrorTiled = Mirror tiled

myTabConfig = defaultTheme {
    activeBorderColor        = myBgColor, --myHighlightedFgColor,
    activeTextColor          = myFgColor, --myHighlightedFgColor,
    activeColor              = myBgColor,
    inactiveBorderColor      = myBgColor,
    inactiveTextColor        = "#000000",
    inactiveColor            = myInactiveBorderColor,
    decoHeight               = 14
}

-- Configure showWName
mySWNConfig = defaultSWNConfig {
                swn_color   = myActiveBorderColor
              , swn_fade    = 2.0
              , swn_bgcolor = myInactiveBorderColor}


main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobar"
  xmonad $ defaultConfig {
               manageHook         = manageDocks <+> myManageHook <+> manageHook defaultConfig
             , layoutHook         = showWName' mySWNConfig $ myLayout
             , workspaces         = myWorkspaces
             , terminal           = "xterm"
             , logHook            = myLogHook xmproc
             --                       >> updatePointer (Relative 0.5 0.5)
             -- , startupHook        = myStartupHook
             , borderWidth        = 2
             , modMask            = myModMask
             , normalBorderColor  = myInactiveBorderColor
             , focusedBorderColor = "#ff4500"
             } `additionalKeys` keys'
       where
         keys' =  [ ((myModMask , xK_Return),               dwmpromote)
                  , ((myModMask .|. shiftMask, xK_Return),  spawn "x-terminal-emulator")
                  , ((myModMask .|. shiftMask, xK_z),       spawn "xscreensaver-command --lock")

                  -- Print Screen - Interactively select window or rectangle
                  , ((myModMask, xK_Print),                 spawn "sleep 0.2;scrot -d2 -s 'Zshot-%Y%m%d-%H.%M.%S.png' -e 'display $f'")

                  -- Print Screen - Current screen
                  , ((myModMask .|. shiftMask, xK_Print),   spawn "sleep 0.2;scrot -d2 'Zshot-%Y%m%d-%H.%M.%S.png' -e 'display $f'")

                  -- Print Screen - All screens
                  , ((myModMask .|. controlMask, xK_Print), spawn "sleep 0.2;scrot -d2 -m 'Zshot-%Y%m%d-%H.%M.%S.png' -e 'display $f'")

                  , ((myModMask, xK_F1),                manPrompt defaultXPConfig)
                  , ((myModMask, xK_g),                 windowPromptGoto defaultXPConfig { autoComplete = Just 500000 } )
                  , ((myModMask .|. shiftMask, xK_g),   windowPromptBring defaultXPConfig { autoComplete = Just 500000 } )
                  , ((myModMask, xK_s),                 goToSelected defaultGSConfig)
                  , ((myModMask, xK_o ),                windowMenu)

                  , ((myModMask .|. controlMask, xK_w), swapPrevScreen)
                  , ((myModMask .|. controlMask, xK_e), swapNextScreen)

                  -- , ((myModMask, xK_p),                 spawn "dmenu_run -nb '#000000' -nf '#DCDCCC' -sb '#000000' -sf '#CC5500'")
                  -- , ((myModMask, xK_r), runOrRaisePrompt myXPConfig)
                  , ((myModMask .|. shiftMask, xK_p), spawn "dmenu_run -nb '#000000' -nf '#DCDCCC' -sb '#000000' -sf '#CC5500'")
                  , ((myModMask, xK_p), runOrRaisePrompt myXPConfig)

                  , ((mod1Mask,  xK_F2), spawn "~/bin/xmenud.py")

                  , ((myModMask, xK_b),                 sendMessage ToggleStruts)
                  -- , ((mod1Mask, xK_F4),                 kill)

                  , ((myModMask, xK_Left),              prevWS)
                  , ((myModMask, xK_Right),             nextWS)

           ]
