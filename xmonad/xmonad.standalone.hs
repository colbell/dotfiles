-- -*- mode: haskell; -*-
import Control.Monad
import Data.List
import System.Exit
import System.IO
import System.Posix.Env (putEnv)

import XMonad
import XMonad.Util.Dmenu

import qualified XMonad.StackSet as W

import XMonad.Actions.CycleWS
import XMonad.Actions.DwmPromote
import XMonad.Actions.GridSelect
import XMonad.Actions.Warp
import XMonad.Actions.WindowMenu

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

import XMonad.Layout.NoBorders
import XMonad.Layout.ShowWName
import XMonad.Layout.Tabbed

import XMonad.Prompt (XPConfig(..), XPPosition(..), defaultXPConfig)
import XMonad.Prompt.Man
import XMonad.Prompt.RunOrRaise
import XMonad.Prompt.Ssh
import XMonad.Prompt.Window

import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.Scratchpad
import XMonad.Util.WorkspaceCompare

-- Use the Windoze key.
myModMask :: KeyMask
myModMask = mod4Mask

myWorkspaces :: [WorkspaceId]
myWorkspaces = ["1-emacs", "2-shell", "3-web", "4-fm", "5", "6", "7-ssh",
                "8-vms", "9-mail"]

-- Mate/gnome terminals don't work for ssh/man prompts etc.
myPromptTerminal :: String
myPromptTerminal = "xterm"

-- Terminal to use for <CTRL><ENTER>.
myTerminal :: String
myTerminal = "mate-terminal"

-- Popup terminal
manageScratchPad :: ManageHook
manageScratchPad = scratchpadManageHook (W.RationalRect l t w h)
    where
      h = 0.6          -- terminal height
      w = 0.9          -- terminal width
      t = (1 - h) / 2  -- distance from top edge
      l = (1 - w) / 2  -- distance from left edge

-- Windows requiring special handling.
myManageHook :: ManageHook
myManageHook = manageScratchPad <+>composeAll (
    [ className =? "Tilda"             --> doFloat
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

-- Log hook for xmobar
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
          , ppTitle = xmobarColor myTitleFgColor myBgColor . shorten 50
          }


myInactiveBorderColor, myActiveBorderColor, myHighlightedFgColor :: String
myHighlightedBgColor, myFgColor, myBgColor :: String

myBgColor             = "#000000"
myFgColor             = "#CC5500"
myHighlightedBgColor  = myBgColor
myHighlightedFgColor  = "#FF4500"
myActiveBorderColor   = myHighlightedFgColor
myInactiveBorderColor = "#89CFF0"

-- ARE THESE used?
myCurrentWsBgColor    = myHighlightedBgColor

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


myBarFont :: String
myBarFont = "xft:inconsolata"
-- myBarFont = "xft:Source Code Pro-16"

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

myLayout = smartBorders $ avoidStruts $ showWName' mySWNConfig $
           (Full ||| tiled ||| mirrorTiled ||| tabbed shrinkText myTabConfig)
    where
      tiled       = Tall nmaster delta ratio
      nmaster     = 1
      ratio       = 1/2
      delta       = 3/100
      mirrorTiled = Mirror tiled

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

logoutWithWarning :: X ()
logoutWithWarning = do
    let logoutMenu = ["Logout", "Cancel"]
    str <- dmenu(logoutMenu)
    when (logoutMenu!!0 == str) (io exitSuccess)

main :: IO ()
main = do
  putEnv "_JAVA_AWT_WM_NONREPARENTING=1"
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobar"
  xmonad $ defaultConfig {
               workspaces         = myWorkspaces
             , manageHook         = manageDocks <+> myManageHook  <+> manageHook defaultConfig
             , borderWidth        = 1
             , modMask            = myModMask
             , layoutHook         = myLayout
             , logHook            = myLogHook xmproc
             , normalBorderColor  = myInactiveBorderColor
             , focusedBorderColor = myHighlightedFgColor
             , focusFollowsMouse  = True
             , terminal           = myPromptTerminal
             -- , clickJustFocuses   = False
             } `additionalKeys` keys'
    where
      keys' =  [ ((myModMask , xK_Return),               dwmpromote)
               , ((myModMask .|. shiftMask, xK_Return),  spawn myTerminal)
               , ((mod1Mask, xK_F4),                     kill)

               , ((myModMask, xK_b),                 sendMessage ToggleStruts)

               , ((myModMask, xK_F1),                manPrompt myXPConfig)
               , ((myModMask, xK_F8),                sshPrompt myXPConfig)
               , ((myModMask, xK_g),                 windowPromptGoto myXPConfig  { autoComplete = Just 500000, searchPredicate = myFinder, alwaysHighlight = True })
               , ((myModMask .|. shiftMask, xK_g),   windowPromptBring myXPConfig { autoComplete = Just 500000, searchPredicate = myFinder, alwaysHighlight = True })
               , ((myModMask, xK_s),                 goToSelected defaultGSConfig)
               , ((myModMask, xK_o ),                windowMenu)

               , ((myModMask .|. controlMask, xK_w), swapPrevScreen)
               , ((myModMask .|. controlMask, xK_e), swapNextScreen)

               , ((myModMask, xK_z             ), warpToWindow (0.5) (0.5))
               , ((myModMask .|. mod1Mask, xK_w), warpToScreen 0 (0.5) (0.5))
               , ((myModMask .|. mod1Mask, xK_e), warpToScreen 1 (0.5) (0.5))
               , ((myModMask .|. mod1Mask, xK_r), warpToScreen 2 (0.5) (0.5))

               , ((myModMask, xK_p),               runOrRaisePrompt myXPConfig)
               , ((myModMask .|. shiftMask, xK_p), spawn "dmenu_run -nb '#000000' -nf '#FFFFFF' -sb '#000000' -sf '#FF4500' -fn '-xos4-terminus-medium-r-*-*-14-*'")


               , ((myModMask, xK_F12), scratchpadSpawnActionTerminal myPromptTerminal)
               , ((myModMask, xK_F2),  spawn "~/bin/xmenud.py")

               , ((myModMask .|. shiftMask, xK_q), logoutWithWarning)
               ]
              ++
              [((m .|. myModMask, k), windows $ f i) -- Don't use Greedy view
              | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]
              , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
