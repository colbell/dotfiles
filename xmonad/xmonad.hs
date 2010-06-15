-- -*- mode: haskell; -*-
import System.IO

import XMonad hiding ( (|||) )

import qualified XMonad.StackSet as W

import XMonad.Actions.CycleWS
import XMonad.Actions.DwmPromote

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName

import XMonad.Layout.LayoutCombinators
import XMonad.Layout.Named
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

scratchpads =
        [
         NS "htop" "xterm -name htop -e htop" (title =? "htop") (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3))
         , NS "emacs-org" "emacs --name emacs-org ~/Documents/org/work.org" (title =? "emacs-org") (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3))
         , NS "thunar" "thunar" (className =? "Thunar") (nonFloating)
        ] where role = stringProperty "WM_WINDOW_ROLE"

myManageHook = namedScratchpadManageHook scratchpads <+> scratchpadManageHookDefault
               <+> (composeAll . concat $ [[
    resource  =? "Do"        --> doIgnore,
    resource  =? "gnome-do"  --> doIgnore,
    className =? "Gimp"      --> doFloat,
    className =? "MPlayer"   --> doFloat,
    className =? "Vncviewer" --> doFloat
               ]])

myWorkSpaces    = ["1-office", "2-emacs" ,"3-shell", "4-web", "5-fm", "6", "7", "8", "9-keep"]

myStartupHook = setWMName "LG3D"

-- myLayout =  avoidStruts $ named "myTiled" tiled ||| named "myTabbed" (tabbed shrinkText tConfig) ||| named "myMirrorTiled" mirrorTiled ||| Full ||| Grid ||| named "my2Pane" twoPane

myLayout =  avoidStruts $ named "myTiled" tiled ||| named "myTabbed" (tabbed shrinkText tConfig) |||
            named "myMirrorTiled" mirrorTiled ||| Full
  where
     tiled       = Tall nmaster delta ratio
--     twoPane     = TwoPane delta ratio
     nmaster     = 1
     ratio       = 1/2
     delta       = 3/100
     mirrorTiled = Mirror tiled
     tConfig     = defaultTheme { inactiveTextColor = "#FF0000" , activeTextColor = "#00FF00"}

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobar"
  xmonad $ defaultConfig {
         manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig,
         layoutHook = myLayout,
         workspaces= myWorkSpaces,
         logHook = dynamicLogWithPP $ xmobarPP {
                     ppOutput = hPutStrLn xmproc
                   , ppTitle = xmobarColor "green" "" . shorten 80
                   },
         startupHook        = myStartupHook,
         borderWidth        = 3,
         modMask            = mod4Mask,
         focusedBorderColor = "DarkOrange"
       } `additionalKeys` keys'
       where

  keys' =  [ ((mod4Mask , xK_Return),           dwmpromote)

           , ((mod4Mask .|. shiftMask, xK_z),       spawn "xscreensaver-command -lock")
           , ((mod4Mask, xK_Print),                 spawn "sleep 0.2;scrot -d2 -s 'Zshot-%Y%m%d-%H.%M.%S.png' -e 'display $f'")
           , ((mod4Mask .|. shiftMask, xK_Print),   spawn "sleep 0.2;scrot -d2 'Zshot-%Y%m%d-%H.%M.%S.png' -e 'display $f'")
           , ((mod4Mask .|. controlMask, xK_Print), spawn "sleep 0.2;scrot -d2 -m 'Zshot-%Y%m%d-%H.%M.%S.png' -e 'display $f'")

           , ((mod4Mask .|. controlMask, xK_b), sendMessage $ JumpToLayout "myTabbed")
           , ((mod4Mask .|. controlMask, xK_f), sendMessage $ JumpToLayout "Full")
           , ((mod4Mask .|. controlMask, xK_m), sendMessage $ JumpToLayout "myMirrorTiled")
           , ((mod4Mask .|. controlMask, xK_t), sendMessage $ JumpToLayout "myTiled")

           , ((mod4Mask, xK_F1),                manPrompt defaultXPConfig)
           , ((mod4Mask, xK_g),                 windowPromptGoto defaultXPConfig { autoComplete = Just 500000 } )
           , ((mod4Mask .|. shiftMask, xK_g),   windowPromptBring defaultXPConfig { autoComplete = Just 500000 } )

           , ((mod4Mask, xK_F7),                namedScratchpadAction scratchpads "emacs-org")
           , ((mod4Mask, xK_F8),                scratchpadSpawnAction defaultConfig)
           , ((mod4Mask, xK_F9),                namedScratchpadAction scratchpads "htop")
           , ((mod4Mask, xK_F10),               namedScratchpadAction scratchpads "thunar")

           , ((mod4Mask, xK_b),                 sendMessage ToggleStruts)
           , ((mod1Mask, xK_F4),                kill)

           , ((mod4Mask, xK_Left),              prevWS)
           , ((mod4Mask, xK_Right),             nextWS)

           -- multimedia keys
           --
           -- XF86AudioLowerVolume
           --, ((0            , 0x1008ff11), spawn "aumix -v -2")
           -- XF86AudioRaiseVolume
           --, ((0            , 0x1008ff13), spawn "aumix -v +2")
           ]

