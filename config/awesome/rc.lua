-- shifty to make awesome tags work like xmonad
-- example at
-- https://github.com/dunz0r/awesome-configs

-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")

-- Theme handling library
require("beautiful")

-- Notification library
require("naughty")

-- widget library
require("vicious")

-- scratchpads.
require("scratch")

-- expose effect
require("revelation")

-- Themes define colours, icons, and wallpapers
function file_exists(path_name)
   local f = io.open(path_name)
   if f then
      io.close(f)
      return true
   end
   return false
end

if file_exists("/usr/share/awesome/themes/lunar/theme.lua") then
   beautiful.init("/usr/share/awesome/themes/lunar/theme.lua")
elseif file_exists("/usr/share/awesome/themes/zenburn/theme.lua") then
   beautiful.init("/usr/share/awesome/themes/zenburn/theme.lua")
end

-- {{{ Variable definitions

-- This is used later as the default terminal and editor to run.
terminal = "urxvt"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts = {
   awful.layout.suit.tile,
   -- awful.layout.suit.tile.left,
   awful.layout.suit.tile.bottom,
   -- awful.layout.suit.tile.top,
   -- awful.layout.suit.fair,
   -- awful.layout.suit.fair.horizontal,
   awful.layout.suit.spiral,
   -- awful.layout.suit.spiral.dwindle,
   awful.layout.suit.max,
   -- awful.layout.suit.max.fullscreen,
   -- awful.layout.suit.magnifier,
   awful.layout.suit.floating
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {
   names  = {"1", "2", "3", "4", "5", "6", "7", "8", "9"},
   layout = {layouts[1], layouts[1], layouts[1], layouts[1], layouts[1], layouts[1], layouts[1], layouts[1], layouts[1] }
}
for s = 1, screen.count() do
   -- Each screen has its own tag table.
   tags[s] = awful.tag(tags.names, s, tags.layout)
end
-- }}}

-- {{{ Menu

-- applications menu
require('freedesktop.utils')
freedesktop.utils.terminal = terminal  -- default: "xterm"
freedesktop.utils.icon_theme = 'gnome' -- look inside /usr/share/icons/, default: nil (don't use icon theme)
require('freedesktop.menu')
-- -require("debian.menu")
freedesktop.utils.icon_theme = 'gnome'

menu_items = freedesktop.menu.new()
myawesomemenu = {
   { "manual", terminal .. " -e man awesome", freedesktop.utils.lookup_icon({ icon = 'help' }) },
   { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua", freedesktop.utils.lookup_icon({ icon = 'package_settings' }) },
   { "restart", awesome.restart, freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   { "quit", awesome.quit, freedesktop.utils.lookup_icon({ icon = 'gtk-quit' }) }
}

table.insert(menu_items, { "awesome", myawesomemenu, beautiful.awesome_icon })
table.insert(menu_items, { "open terminal", terminal, freedesktop.utils.lookup_icon({icon = 'terminal'}) })

mymainmenu = awful.menu.new({ items = menu_items, width = 150 })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                      menu = mymainmenu })

-- desktop icons
-- require('freedesktop.desktop')
-- for s = 1, screen.count() do
--    freedesktop.desktop.add_applications_icon({screen = s, showlabels = true})
--    freedesktop.desktop.add_dirs_and_files_icon({screen = s, showlabels = true})
-- end

--}}}

-- {{{ Wibox
-- network usage widget
netwidget = widget({type = "textbox"})
vicious.register(netwidget, vicious.widgets.net, '<span color="#CC9393">${eth0 down_kb}</span> <span color="#7F9F7F">${eth0 up_kb}</span>')

--Create a weather widget
weatherwidget = widget({ type = "textbox" })
weatherwidget.text = awful.util.pread("weather -i YSSY --headers=Temperature --quiet -m | awk '{print $2, $3}'")
weathertimer = timer({ timeout = 900 })
weathertimer:add_signal("timeout", function()
                                      weatherwidget.text = awful.util.pread("weather -i YSSY --headers=Temperature --quiet -m | awk '{print $2, $3}' &")
                                   end)

weathertimer:start()
weatherwidget:add_signal(
                         "mouse::enter", function()
                                            weather = naughty.notify({title="Weather",text=awful.util.pread("weather -i YSSY -m")})
                                         end)
weatherwidget:add_signal(
                         "mouse::leave", function()
                                            naughty.destroy(weather)
                                         end)

-- I added some spacing because on my computer it is right next to my clock.
awful.widget.layout.margins[weatherwidget] = { right = 5 }

-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" })

-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                                          awful.button({ }, 1, awful.tag.viewonly),
                                          awful.button({ modkey }, 1, awful.client.movetotag),
                                          awful.button({ }, 3, awful.tag.viewtoggle),
                                          awful.button({ modkey }, 3, awful.client.toggletag),
                                          awful.button({ }, 4, awful.tag.viewnext),
                                          awful.button({ }, 5, awful.tag.viewprev)
                                       )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                                           awful.button({ }, 1, function (c)
                                                                   if not c:isvisible() then
                                                                      awful.tag.viewonly(c:tags()[1])
                                                                   end
                                                                   client.focus = c
                                                                   c:raise()
                                                                end),
                                           awful.button({ }, 3, function ()
                                                                   if instance then
                                                                      instance:hide()
                                                                      instance = nil
                                                                   else
                                                                      instance = awful.menu.clients({ width=250 })
                                                                   end
                                                                end),
                                           awful.button({ }, 4, function ()
                                                                   awful.client.focus.byidx(1)
                                                                   if client.focus then client.focus:raise() end
                                                                end),
                                           awful.button({ }, 5, function ()
                                                                   awful.client.focus.byidx(-1)
                                                                   if client.focus then client.focus:raise() end
                                                                end))

for s = 1, screen.count() do
   -- Create a promptbox for each screen
   mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
   -- Create an imagebox widget which will contains an icon indicating which layout we're using.
   -- We need one layoutbox per screen.
   mylayoutbox[s] = awful.widget.layoutbox(s)
   mylayoutbox[s]:buttons(awful.util.table.join(
                                                awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                                                awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                                                awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                                                awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
   -- Create a taglist widget
   mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

   -- Create a tasklist widget
   mytasklist[s] = awful.widget.tasklist(function(c)
                                            return awful.widget.tasklist.label.currenttags(c, s)
                                         end, mytasklist.buttons)

   -- Create the wibox
   mywibox[s] = awful.wibox({ position = "top", screen = s })
   -- Add widgets to the wibox - order matters
   mywibox[s].widgets = {
      {
         mylauncher,
         mytaglist[s],
         mypromptbox[s],
         layout = awful.widget.layout.horizontal.leftright
      },
      mylayoutbox[s],
      s == 1 and mysystray or nil,
      s == 1 and mytextclock or nil,
      s == 1 and netwidget or nil,
      s == 1 and weatherwidget or nil,
      mytasklist[s],
      layout = awful.widget.layout.horizontal.rightleft
   }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
                                   awful.button({ }, 3, function () mymainmenu:toggle() end),
                                   awful.button({ }, 4, awful.tag.viewnext),
                                   awful.button({ }, 5, awful.tag.viewprev)
                             ))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
                                   awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
                                   awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
                                   awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

                                   awful.key({ modkey,           }, "j",
                                             function ()
                                                awful.client.focus.byidx( 1)
                                                if client.focus then client.focus:raise() end
                                             end),
                                   awful.key({ modkey,           }, "k",
                                             function ()
                                                awful.client.focus.byidx(-1)
                                                if client.focus then client.focus:raise() end
                                             end),
                                   awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

                                   -- Layout manipulation
                                   awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
                                   awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
                                   awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
                                   awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
                                   awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
                                   awful.key({ modkey,           }, "Tab",
                                             function ()
                                                awful.client.focus.history.previous()
                                                if client.focus then
                                                   client.focus:raise()
                                                end
                                             end),

                                   -- Standard program
                                   awful.key({ modkey, "Shift"   }, "Return", function () awful.util.spawn(terminal) end),
                                   awful.key({ modkey,           }, "q", awesome.restart),
                                   awful.key({ modkey, "Shift"   }, "q", awesome.quit),

                                   awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
                                   awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
                                   awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
                                   awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
                                   awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
                                   awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
                                   awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
                                   awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

                                   -- Popup terminal
                                   awful.key({ modkey }, "F11", function () scratch.drop("urxvt -e htop", "top") end),
                                   awful.key({ modkey }, "F12", function () scratch.drop("urxvt", "top") end),

                                   -- Prompt
                                   --awful.key({ modkey },            "p",     function () mypromptbox[mouse.screen]:run() end),
                                   awful.key({ modkey },            "p",     function ()
                                                                                awful.util.spawn("dmenu_run -i -p 'Run command:' -nb '" ..
                                                                                                 beautiful.bg_normal .. "' -nf '" .. beautiful.fg_normal ..
                                                                                                    "' -sb '" .. beautiful.bg_focus ..
                                                                                                    "' -sf '" .. beautiful.fg_focus .. "' -sb '#955'")
                                                                             end),

                                   -- Run or raise applications with dmenu
                                   awful.key({ modkey }, "r",
                                             function ()
                                                local f_reader = io.popen( "dmenu_path | dmenu -b -nb '".. beautiful.bg_normal .."' -nf '".. beautiful.fg_normal .."' -sb '#955'")
                                                local command = assert(f_reader:read('*a'))
                                                f_reader:close()
                                                if command == "" then return end

                                                -- Check throught the clients if the class match the command
                                                local lower_command=string.lower(command)
                                                for k, c in pairs(client.get()) do
                                                   local class=string.lower(c.class)
                                                   if string.match(class, lower_command) then
                                                      for i, v in ipairs(c:tags()) do
                                                         awful.tag.viewonly(v)
                                                         c:raise()
                                                         c.minimized = false
                                                         return
                                                      end
                                                   end
                                                end
                                                awful.util.spawn(command)
                                             end),

                                   awful.key({ modkey }, "x",
                                             function ()
                                                awful.prompt.run({ prompt = "Run Lua code: " },
                                                                 mypromptbox[mouse.screen].widget,
                                                                 awful.util.eval, nil,
                                                                 awful.util.getdir("cache") .. "/history_eval")
                                             end),
                                   awful.key({ modkey }, "b", function ()
                                                                 mywibox[mouse.screen].visible = not mywibox[mouse.screen].visible
                                                              end),
                                   awful.key({ modkey }, "e", revelation.revelation),
                                   awful.key({ "Mod1" }, "Escape", function ()
                                                                      -- If you want to always position the menu on the same place set coordinates
                                                                      awful.menu.menu_keys.down = { "Down", "Alt_L" }
                                                                      local cmenu = awful.menu.clients({width=245}, { keygrabber=true }) --, coords={x=525, y=330} })
                                                                   end),
                                   awful.key({ modkey }, "F1", function ()
                                                                  awful.prompt.run({ prompt = "Manual: " }, mypromptbox[mouse.screen].widget,
                                                                                   --  Use GNU Emacs for manual page display
                                                                                   -- function (page) awful.util.spawn("emacsclient --eval '(manual-entry \"'" .. page .. "'\")'", false) end,
                                                                                   function (page) awful.util.spawn("emacsclient -c -a '' --eval '(manual-entry \"'" .. page .. "'\")'", false) end,
                                                                                   --  Use the KDE Help Center for manual page display
                                                                                   --  function (page) awful.util.spawn("khelpcenter man:" .. page, false) end,
                                                                                   --  Use the terminal emulator for manual page display
                                                                                   -- function (page) awful.util.spawn("xterm -e man " .. page, false) end,
                                                                                   function(cmd, cur_pos, ncomp)
                                                                                      local pages = {}
                                                                                      local m = 'IFS=: && find $(manpath||echo "$MANPATH") -type f -printf "%f\n"| cut -d. -f1'
                                                                                      local c, err = io.popen(m)
                                                                                      if c then while true do
                                                                                            local manpage = c:read("*line")
                                                                                            if not manpage then break end
                                                                                            if manpage:find("^" .. cmd:sub(1, cur_pos)) then
                                                                                               table.insert(pages, manpage)
                                                                                            end
                                                                                         end
                                                                                         c:close()
                                                                                      else io.stderr:write(err) end
                                                                                      if #cmd == 0 then return cmd, cur_pos end
                                                                                      if #pages == 0 then return end
                                                                                      while ncomp > #pages do ncomp = ncomp - #pages end
                                                                                      return pages[ncomp], cur_pos
                                                                                   end)
                                                               end)
                                )

clientkeys = awful.util.table.join(
                                   awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
                                   awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
                                   awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
                                   awful.key({ modkey,           }, "Return", function (c) c:swap(awful.client.getmaster()) end),
                                   awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
                                   awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
                                   awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
                                   awful.key({ modkey,           }, "n",      function (c) c.minimized = not c.minimized    end),
                                   awful.key({ modkey, "Shift"   }, "z",      function () awful.util.spawn("xscreensaver-command --lock") end),
                                   awful.key({ modkey,           }, "m",
                                             function (c)
                                                c.maximized_horizontal = not c.maximized_horizontal
                                                c.maximized_vertical   = not c.maximized_vertical
                                             end)
                                )

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
   globalkeys = awful.util.table.join(globalkeys,
                                      awful.key({ modkey }, "#" .. i + 9,
                                                function ()
                                                   local screen = mouse.screen
                                                   if tags[screen][i] then
                                                      awful.tag.viewonly(tags[screen][i])
                                                   end
                                                end),
                                      awful.key({ modkey, "Control" }, "#" .. i + 9,
                                                function ()
                                                   local screen = mouse.screen
                                                   if tags[screen][i] then
                                                      awful.tag.viewtoggle(tags[screen][i])
                                                   end
                                                end),
                                      awful.key({ modkey, "Shift" }, "#" .. i + 9,
                                                function ()
                                                   if client.focus and tags[client.focus.screen][i] then
                                                      awful.client.movetotag(tags[client.focus.screen][i])
                                                   end
                                                end),
                                      awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                                                function ()
                                                   if client.focus and tags[client.focus.screen][i] then
                                                      awful.client.toggletag(tags[client.focus.screen][i])
                                                   end
                                                end))
end

clientbuttons = awful.util.table.join(
                                      awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
                                      awful.button({ modkey }, 1, awful.mouse.client.move),
                                      awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
   -- All clients will match this rule.
   { rule = { },
      properties = { border_width = beautiful.border_width,
         border_color = beautiful.border_normal,
         focus = true,
         keys = clientkeys,
         maximized_vertical = false,
         maximized_horizontal = false,
         buttons = clientbuttons } },
   { rule = { class = "MPlayer" },
      properties = { floating = true } },
   { rule = { class = "pinentry" },
      properties = { floating = true } },
   { rule = { class = "gimp" },
      properties = { floating = true } },
   -- Set Firefox to always map on tags number 2 of screen 1.
   -- { rule = { class = "Firefox" },
   --   properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
                               -- Add a titlebar
                               awful.titlebar.add(c, { modkey = modkey })

                               -- Enable sloppy focus
                               c:add_signal("mouse::enter", function(c)
                                                               if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
                                                                  and awful.client.focus.filter(c) then
                                                                  client.focus = c
                                                               end
                                                            end)

                               if not startup then
                                  -- Set the windows at the slave,
                                  -- i.e. put it at the end of others instead of setting it master.
                                  -- awful.client.setslave(c)

                                  -- Put windows in a smart way, only if they does not set an initial position.
                                  if not c.size_hints.user_position and not c.size_hints.program_position then
                                     awful.placement.no_overlap(c)
                                     awful.placement.no_offscreen(c)
                                  end
                               end
                            end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
