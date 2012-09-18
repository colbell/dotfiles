-- -*- mode: haskell; -*-
import XMonad

import qualified XMonad.StackSet as W

import XMonad.Actions.CycleWS
import XMonad.Actions.DwmPromote
import XMonad.Actions.GridSelect
import XMonad.Actions.WindowMenu

import XMonad.Config.Desktop (desktopLayoutModifiers)
import XMonad.Config.Gnome

import XMonad.Hooks.SetWMName

--import XMonad.Layout.Gaps
import XMonad.Layout.NoBorders
import XMonad.Layout.ShowWName
--import XMonad.Layout.SimpleDecoration
import XMonad.Layout.SimpleFloat

import XMonad.Prompt
import XMonad.Prompt.Man
import XMonad.Prompt.RunOrRaise
import XMonad.Prompt.Window

import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Scratchpad

myStartupHook = setWMName "LG3D"

myModMask     = mod4Mask

myWorkspaces  = ["1","2","3","4","5","6","7","8","9"]

myManageHook = scratchpadManageHookDefault <+>composeAll (
    [ manageHook gnomeConfig
    , className =? "Tilda"             --> doFloat
    , className =? "Guake.py"          --> doFloat
    , className =? "Unity-2d-panel"    --> doIgnore
    , className =? "Unity-2d-shell"    --> doIgnore
    , className =? "Unity-2d-launcher" --> doIgnore
    , resource  =? "desktop_window"    --> doIgnore
    , resource  =? "kdesktop"          --> doIgnore
    , className =? "MPlayer"           --> doFloat
    , className =? "Gimp"              --> doFloat
    ])

myFgColor = "#DCDCCC"
myBgColor = "#3f3f3f"
myHighlightedBgColor = "#CC5500"
myCurrentWsBgColor = myHighlightedBgColor
myActiveBorderColor = myCurrentWsBgColor
myInactiveBorderColor = "#262626"

mySWNConfig = defaultSWNConfig {
                swn_color   = myActiveBorderColor
              , swn_fade    = 2.0
              , swn_bgcolor = myInactiveBorderColor}

main = do
  xmonad $ gnomeConfig {
               workspaces         = myWorkspaces
             , manageHook         = myManageHook
             , terminal           = "xterm"
             , borderWidth        = 1
             , modMask            = myModMask
--             , layoutHook         = showWName' mySWNConfig $ smartBorders (layoutHook gnomeConfig ||| (gaps [(U, 24)] $ simpleFloat))
--             , layoutHook         = simpleDeco shrinkText defaultTheme | showWName' mySWNConfig $ desktopLayoutModifiers (layoutHook gnomeConfig ||| simpleFloat)
             , layoutHook         = showWName' mySWNConfig $ desktopLayoutModifiers (layoutHook gnomeConfig ||| simpleFloat)
             , normalBorderColor  = myInactiveBorderColor
             , focusedBorderColor = myActiveBorderColor
             } `additionalKeys` keys'
      where
        keys' =  [ ((myModMask , xK_Return),               dwmpromote)
                 , ((myModMask .|. shiftMask, xK_Return),  spawn "gnome-terminal")
                 , ((myModMask .|. shiftMask, xK_z),       spawn "gnome-screensaver-command -l")
                 , ((mod1Mask, xK_F4),                     kill)

                 , ((myModMask, xK_F1),                manPrompt defaultXPConfig)

                 , ((myModMask, xK_g),                 windowPromptGoto defaultXPConfig { autoComplete = Just 500000 } )
                 , ((myModMask .|. shiftMask, xK_g),   windowPromptBring defaultXPConfig { autoComplete = Just 500000 } )
                 , ((myModMask, xK_s),                 goToSelected defaultGSConfig)
                 , ((myModMask, xK_o ),                windowMenu)

                 , ((myModMask .|. controlMask, xK_w), swapPrevScreen)
                 , ((myModMask .|. controlMask, xK_e), swapNextScreen)

                 , ((myModMask, xK_p), spawn "dmenu_run -nb '#000000' -nf '#DCDCCC' -sb '#000000' -sf '#CC5500'")
                 , ((myModMask, xK_r), runOrRaisePrompt defaultXPConfig)
                 , ((myModMask, xK_F2), spawn "~/bin/xmenud.py")

                 , ((myModMask .|. shiftMask, xK_q), spawn "gnome-session-quit")
                 ]
                 ++
                 [((m .|. myModMask, k), windows $ f i) -- Don't use Greedy view
                      | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]
                      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
