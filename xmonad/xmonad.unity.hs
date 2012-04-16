-- -*- mode: haskell; -*-
import XMonad

import qualified XMonad.StackSet as W

import XMonad.Actions.DwmPromote
import XMonad.Actions.GridSelect
import XMonad.Actions.WindowMenu

import XMonad.Config.Gnome

import XMonad.Hooks.SetWMName

import XMonad.Layout.NoBorders
import XMonad.Layout.ShowWName
import XMonad.Layout.SimpleFloat

import XMonad.Prompt
import XMonad.Prompt.Man
import XMonad.Prompt.Window

import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Scratchpad

myStartupHook = setWMName "LG3D"

myModMask     = mod4Mask           -- Use Windoze key.

myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

scratchpads = [
      NS "nautilus" "nautilus" (className =? "Nautilus") (nonFloating)
    ] where role = stringProperty "WM_WINDOW_ROLE"

myManageHook = scratchpadManageHookDefault <+>composeAll (
    [ manageHook gnomeConfig
    , className =? "Unity-2d-panel" --> doIgnore
    , className =? "Unity-2d-launcher" --> doFloat
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
             , layoutHook         = showWName' mySWNConfig $ smartBorders (layoutHook gnomeConfig ||| simpleFloat)
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

                 , ((myModMask, xK_F10),               namedScratchpadAction scratchpads "nautilus")
                 , ((myModMask, xK_F12),               scratchpadSpawnAction defaultConfig)

                 , ((myModMask, xK_r), spawn "dmenu_run -nb '#000000' -nf '#DCDCCC' -sb '#000000' -sf '#CC5500'")
                 ]
                 ++
                 [((m .|. myModMask, k), windows $ f i) -- Don't use Greedy view
                      | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]
                      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
