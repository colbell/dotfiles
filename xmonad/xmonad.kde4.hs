-- -*- mode: haskell; -*-
import XMonad

import qualified XMonad.StackSet as W

import XMonad.Actions.CycleWS
import XMonad.Actions.DwmPromote
import XMonad.Actions.GridSelect
--import XMonad.Actions.UpdatePointer
import XMonad.Actions.Warp
import XMonad.Actions.WindowMenu

import XMonad.Config.Desktop (desktopLayoutModifiers)
import XMonad.Config.Kde

import XMonad.Hooks.FadeInactive
import XMonad.Hooks.SetWMName

--import XMonad.Layout.NoBorders
import XMonad.Layout.ShowWName
import XMonad.Layout.Tabbed

import XMonad.Prompt ( XPConfig(..), XPPosition(..), defaultXPConfig
                     , defaultXPKeymap , moveHistory,  deleteConsecutive
                     , deleteString, Direction1D(..)
                     , setSuccess, setDone )
import XMonad.Prompt.Man
import XMonad.Prompt.RunOrRaise
import XMonad.Prompt.Window

import XMonad.Util.EZConfig(additionalKeys)
--import XMonad.Util.NamedScratchpad
import XMonad.Util.Scratchpad

myStartupHook = setWMName "LG3D"

myModMask     = mod4Mask

myWorkspaces  = ["1-emacs","2-cmd","3-web","4-fm","5","6","7","8-ssh","9-mail"]

myManageHook = scratchpadManageHookDefault <+>composeAll (
    [ manageHook kde4Config
    , className =? "Tilda"             --> doFloat
    , className =? "Guake.py"          --> doFloat
    , className =? "Yakuake"           --> doFloat
    , className =? "Unity-2d-panel"    --> doIgnore
    , className =? "Unity-2d-shell"    --> doIgnore
    , className =? "Unity-2d-launcher" --> doIgnore
    , resource  =? "desktop_window"    --> doIgnore
    , resource  =? "kdesktop"          --> doIgnore
    , className =? "MPlayer"           --> doFloat
    , className =? "Gimp"              --> doFloat
    , className =? "Plasma"            --> doFloat
    , className =? "Plasma-desktop"    --> doFloat
    , className =? "knotes"            --> doFloat
    , className =? "Knotes"            --> doFloat
    ])

myLayout = showWName' mySWNConfig $ desktopLayoutModifiers (tiled ||| Mirror tiled ||| simpleTabbed)
  where
     tiled       = Tall nmaster delta ratio
     nmaster     = 1
     ratio       = 1/2
     delta       = 3/100
     mirrorTiled = Mirror tiled


myLogHook =  do
     -- fadeInactiveLogHook fadeAmount      -- Requires xcompmgr or similar
     -- updatePointer (Relative 0.5 0.5)    -- Move cursor to newly focused windows.
     logHook kde4Config
    where
      fadeAmount = 0.8

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

myXPConfig :: XPConfig
myXPConfig = defaultXPConfig
                { bgColor               = myBgColor
                , fgColor               = myFgColor
                , bgHLight              = myHighlightedBgColor
                , position              = Top
                , promptBorderWidth     = 0
                }

main = do
  xmonad $ kde4Config {
               workspaces         = myWorkspaces
             , logHook            = myLogHook
             , manageHook         = myManageHook
             , borderWidth        = 1
             , modMask            = myModMask
             , layoutHook         = myLayout
             , normalBorderColor  = myInactiveBorderColor
             , focusedBorderColor = myActiveBorderColor
             } `additionalKeys` keys'
      where
        keys' =  [ ((myModMask , xK_Return),               dwmpromote)
                 , ((myModMask .|. shiftMask, xK_Return),  spawn "konsole")
                 , ((myModMask .|. shiftMask, xK_z),       spawn "/usr/lib/kde4/libexec/kscreenlocker --forcelock")
                 , ((mod1Mask, xK_F4),                     kill)

                 , ((myModMask, xK_F1),                manPrompt myXPConfig)

                 , ((myModMask, xK_g),                 windowPromptGoto myXPConfig { autoComplete = Just 500000 } )
                 , ((myModMask .|. shiftMask, xK_g),   windowPromptBring myXPConfig { autoComplete = Just 500000 } )
                 , ((myModMask, xK_s),                 goToSelected defaultGSConfig)
                 , ((myModMask, xK_o ),                windowMenu)

                 , ((myModMask .|. controlMask, xK_w), swapPrevScreen)
                 , ((myModMask .|. controlMask, xK_e), swapNextScreen)

                 , ((myModMask, xK_z             ), warpToWindow (0.5) (0.5))
                 , ((myModMask .|. mod1Mask, xK_w), warpToScreen 0 (0.5) (0.5))
                 , ((myModMask .|. mod1Mask, xK_e), warpToScreen 1 (0.5) (0.5))
                 , ((myModMask .|. mod1Mask, xK_r), warpToScreen 2 (0.5) (0.5))

                 --, ((myModMask, xK_p), spawn "dmenu_run -nb '#000000' -nf '#DCDCCC' -sb '#000000' -sf '#CC5500'")
                 , ((myModMask, xK_r), runOrRaisePrompt myXPConfig)
                 , ((myModMask, xK_F2), spawn "~/bin/xmenud.py")
                 ]
                 ++
                 [((m .|. myModMask, k), windows $ f i) -- Don't use Greedy view
                      | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]
                      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
