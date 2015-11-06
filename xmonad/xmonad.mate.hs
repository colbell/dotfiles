-- -*- mode: haskell; -*-
import Data.List

import System.Posix.Env (putEnv)

import XMonad

import qualified XMonad.StackSet as W

import XMonad.Actions.CycleWS
import XMonad.Actions.DwmPromote
import XMonad.Actions.GridSelect
import XMonad.Actions.Warp
import XMonad.Actions.WindowMenu

import XMonad.Config.Desktop (desktopLayoutModifiers)
import XMonad.Config.Mate -- In ~/.xmonad/lib/XMonad/Config

import XMonad.Layout.NoBorders
import XMonad.Layout.ShowWName
import XMonad.Layout.Tabbed

import XMonad.Prompt (XPConfig(..), XPPosition(..), defaultXPConfig)
import XMonad.Prompt.Man
import XMonad.Prompt.RunOrRaise
import XMonad.Prompt.Ssh
import XMonad.Prompt.Window

import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Scratchpad

myModMask :: KeyMask
myModMask = mod4Mask

myWorkspaces :: [WorkspaceId]
myWorkspaces = ["1-emacs", "2-shell", "3-web", "4-fm", "5", "6", "7-ssh",
                "8-im", "9-mail"]

-- Mate/gnome terminals don't work for ssh/man prompts etc.
myPromptTerminal :: String
myPromptTerminal = "xterm"

myTerminal :: String
myTerminal = "mate-terminal"

manageScratchPad :: ManageHook
manageScratchPad = scratchpadManageHook (W.RationalRect l t w h)
    where
      h = 0.6          -- terminal height
      w = 0.9          -- terminal width
      t = (1 - h) / 2  -- distance from top edge
      l = (1 - w) / 2  -- distance from left edge

myManageHook :: ManageHook
myManageHook = manageScratchPad <+>composeAll (
    [ manageHook mateConfig
    , className =? "Tilda"             --> doFloat
    , className =? "Guake.py"          --> doFloat
    , className =? "guake"             --> doFloat
    , className =? "Yakuake"           --> doFloat
    , className =? "Unity-2d-panel"    --> doIgnore
    , className =? "Unity-2d-shell"    --> doIgnore
    , className =? "Unity-2d-launcher" --> doIgnore
    , resource  =? "desktop_window"    --> doIgnore
    , resource  =? "kdesktop"          --> doIgnore
    , className =? "MPlayer"           --> doFloat
    , className =? "Plasma"            --> doFloat
    , className =? "plasmashell"       --> doIgnore
    , className =? "Plasma-desktop"    --> doFloat
    , className =? "Knotes"            --> doFloat
    , className =? "Klipper"           --> doFloat
    , className =? "stjerm"            --> doFloat
    , className =? "XCalc"             --> doFloat
    , className =? "Kcalc"             --> doFloat
    , className =? "ksmserver"         --> doIgnore
    , className =? "emulator-arm"      --> doFloat
    ])

myLayout = smartBorders $ showWName' mySWNConfig $
           desktopLayoutModifiers
           (Full ||| tiled ||| mirrorTiled ||| tabbed shrinkText myTabConfig)
    where
      tiled       = Tall nmaster delta ratio
      nmaster     = 1
      ratio       = 1/2
      delta       = 3/100
      mirrorTiled = Mirror tiled

myInactiveBorderColor, myActiveBorderColor, myHighlightedFgColor :: String
myHighlightedBgColor, myFgColor, myBgColor :: String

myBgColor             = "#000000"
myFgColor             = "#CC5500"
myHighlightedBgColor  = myBgColor
myHighlightedFgColor  = "#FFA000"
myActiveBorderColor   = myHighlightedFgColor
myInactiveBorderColor = "#89CFF0"

myBarFont :: String
myBarFont = "xft: inconsolata-14"

myTabConfig :: Theme
myTabConfig = defaultTheme {
                activeBorderColor   = myBgColor
              , activeTextColor     = myHighlightedFgColor
              , activeColor         = myBgColor
              , inactiveBorderColor = myBgColor
              , inactiveTextColor   = "#EEEEEE"
              , inactiveColor       = myBgColor
              , decoHeight          = 14
}

mySWNConfig :: SWNConfig
mySWNConfig = defaultSWNConfig {
                swn_color   = myActiveBorderColor
              , swn_fade    = 2.0
              , swn_bgcolor = myBgColor}

myXPConfig :: XPConfig
myXPConfig = defaultXPConfig
                { bgColor               = myBgColor
                , fgColor               = myFgColor
                , bgHLight              = myHighlightedBgColor
                , fgHLight              = myHighlightedFgColor
                , position              = Top
                , promptBorderWidth     = 0
                , font                  = myBarFont
                }


-- Finder for window prompts. By default they only match
-- the start of the window title. This also matches the
-- middle of the title.
myFinder :: String -> String -> Bool
myFinder = isInfixOf

main :: IO ()
main = do
  putEnv "_JAVA_AWT_WM_NONREPARENTING=1"
  xmonad $ mateConfig {
               workspaces         = myWorkspaces
             , manageHook         = myManageHook
             , borderWidth        = 1
             , modMask            = myModMask
             , layoutHook         = myLayout
             , normalBorderColor  = myInactiveBorderColor
             , focusedBorderColor = "#ff4500"
             , focusFollowsMouse  = True
             , terminal           = myPromptTerminal
             -- , clickJustFocuses   = False
             } `additionalKeys` keys'
    where
      keys' =  [ ((myModMask , xK_Return),               dwmpromote)
               , ((myModMask .|. shiftMask, xK_Return),  spawn myTerminal)
               , ((mod1Mask, xK_F4),                     kill)

               , ((myModMask, xK_F1),                manPrompt myXPConfig)

               , ((myModMask, xK_g),                 windowPromptGoto myXPConfig { autoComplete = Just 500000, searchPredicate = myFinder, alwaysHighlight = True })
               , ((myModMask .|. shiftMask, xK_g),   windowPromptBring myXPConfig { autoComplete = Just 500000, searchPredicate = myFinder, alwaysHighlight = True })
               , ((myModMask, xK_s),                 goToSelected defaultGSConfig)
               , ((myModMask, xK_o ),                windowMenu)
               , ((myModMask .|. controlMask, xK_h), sshPrompt myXPConfig)
               , ((myModMask .|. controlMask, xK_w), swapPrevScreen)
               , ((myModMask .|. controlMask, xK_e), swapNextScreen)

               , ((myModMask, xK_z             ), warpToWindow (0.5) (0.5))
               , ((myModMask .|. mod1Mask, xK_w), warpToScreen 0 (0.5) (0.5))
               , ((myModMask .|. mod1Mask, xK_e), warpToScreen 1 (0.5) (0.5))
               , ((myModMask .|. mod1Mask, xK_r), warpToScreen 2 (0.5) (0.5))

               , ((myModMask .|. shiftMask, xK_p), spawn "dmenu_run -nb '#000000' -nf '#DCDCCC' -sb '#000000' -sf '#CC5500' -fn '-xos4-terminus-medium-r-*-*-14-*'")
               , ((myModMask, xK_p), runOrRaisePrompt myXPConfig)

               , ((myModMask, xK_F12), scratchpadSpawnActionTerminal myPromptTerminal)
               , ((myModMask, xK_F2),  spawn "~/bin/xmenud.py")
               ]
              ++
              [((m .|. myModMask, k), windows $ f i) -- Don't use Greedy view
              | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]
              , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
