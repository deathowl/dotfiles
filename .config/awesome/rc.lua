-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local vicious = require("vicious")
local revelation = require("revelation")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init("/usr/share/awesome/themes/blackburn/theme.lua")
--Autorun

--dofile (basedir .. "lib/revelation.lua")

autorunApps =
   {
--remove already running "daemons" if restarting WM
   "killall -9 conky",
   "killall -9 nm-applet",
   "killall -9 nitrogen",
   "killall -9 xmobar",
   "killall -9 cbatticon",
   "killall -9 nm-applet",
   "killall -9 obmixer",
    --end
   "setxkbmap hu",
--autorun apps
   "conky -c /home/deathowl/.conkyrc",
   "xcompmgr -r 12.00 -o 0.75 -l -15.0 -t -15.0 -I 0.028 -O 0.03 -D 10.$&",
   "nm-applet",
   "xmobar -b",
   "nitrogen --restore",
   "cbatticon",
   "ssh-add /home/deathowl/.ssh/id_rsa",
   "ssh-agent"
}
local autorun = true
if autorun then
   for app = 1, #autorunApps do
      awful.util.spawn(autorunApps[app])
   end
end

-- This is used later as the default terminal and editor to run.
terminal = "terminator"
editor = "nano"
browser="google-chrome"
colorlight = "#4b7885"
colordark = "#223b56"
editor_cmd = terminal .. " -e " .. editor
--Calendar


-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tool$
-- However, you can use another modifier like Mod1, but it may interact w$
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.floating
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ "[1]WWW", "[2]Chat", "[3]Music", "[4]DEV", "[5] TERM ","[6]Misc" }, s, layouts[1])
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", "terminator -e 'man awesome'" },
   { "edit config", "terminator -e 'nano /home/deathowl/.config/awesome/rc.lua'" },
   { "restart", awesome.restart },
   { "Nitrogen","nitrogen "},
   { "GTK-Theme","gtk-chtheme"},
   { "quit", awesome.quit }
}
music = {
   { "AlsaMixer", "terminator -e alsamixer" },
   { "Ncmpcpp", "terminator -e ncmpcpp"},
   { "M.O.C.","terminator -e mocp"},
   {"Shell-fm","terminator -e shell-fm"}
}
development={
   { "Sublime", "subl"},
   { "Pycharm","pycharm"}
}
graphics= {
 {"Gimp","gimp"},
 {"Paint.mono","paint.mono"},
 {"Gpicview", "gpicview"}

}
browser= {
  {"Chrome","google-chrome"},
  {"Thunderbird","thunderbird"},
  {"Firefox","firefox"}

}
myevilmenu = {
   { "Music",music,beautiful.awesome_icon},
   { "Browsers",browser,beautiful.awesome_icon},
   { "Development",development,beautiful.awesome_icon},
   { "Terminal", "Terminator" },
   { "Files", "thunar" },
   { "MC","terminator -e mc"},
   {"XPDF","xpdf"}
}


mysocialmenu = {
   { "skype", "skype"} 
}


timetoleave = {
   { "Log Out", awesome.quit },
   { "Power Off", "gksudo poweroff"},
   { "Reboot System","gksudo reboot"}
       
}
mygamesmenu={
  {"Steam","steam"}
}


mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "Apps", myevilmenu },
                                    { "Chitchat",mysocialmenu},
                                    { "Game",mygamesmenu},
                                    { "Power off",timetoleave},
                                    { "close menu", function () awful.menu.close("mymainmenu") end }

                                    --{ "open terminal", terminal }
                                  }
                        })




mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock()

local alsawidget =
{
  channel = "Master",
  step = "5%",
  colors =
  {
    unmute = "#AECF96",
    mute = "#FF5656"
  },
  mixer = terminal .. " -e alsamixer", -- or whatever your preferred sound mixer is
  notifications =
  {
    icons =
    {
      -- the first item is the 'muted' icon
      "/usr/share/icons/gnome/48x48/status/audio-volume-muted.png",
      -- the rest of the items correspond to intermediate volume levels - you can have as many as you want (but must be >= 1)
      "/usr/share/icons/gnome/48x48/status/audio-volume-low.png",
      "/usr/share/icons/gnome/48x48/status/audio-volume-medium.png",
      "/usr/share/icons/gnome/48x48/status/audio-volume-high.png"
    },
    font = "Monospace 11", -- must be a monospace font for the bar to be sized consistently
    icon_size = 48,
    bar_size = 20 -- adjust to fit your font if the bar doesn't fit
  }
}

-- Initialize widget
cpuwidget = awful.widget.graph()
-- Graph properties
cpuwidget:set_width(50)
cpuwidget:set_background_color("#494B4F")
cpuwidget:set_color({ type = "linear", from = { 0, 0 }, to = { 10,0 }, stops = { {0, "#FF5656"}, {0.5, "#88A175"}, 
                    {1, "#AECF96" }}})
-- Register widget
vicious.register(cpuwidget, vicious.widgets.cpu, "$1")


--cputxtWidget
-- Initialize widget
cputxtwidget = wibox.widget.textbox()
-- Register widget
vicious.register(cputxtwidget, vicious.widgets.cpu, "CPU Usage: $1%")


-- Initialize widget
memwidget = awful.widget.graph()
-- Progressbar properties
memwidget:set_width(8)
memwidget:set_height(10)
memwidget:set_background_color("#494B4F")
memwidget:set_border_color(nil)
memwidget:set_color({ type = "linear", from = { 0, 0 }, to = { 10,0 }, stops = { {0, "#AECF96"}, {0.5, "#88A175"}, 
                    {1, "#FF5656"}}})
-- Register widget
vicious.register(memwidget, vicious.widgets.mem, "$1", 13)


-- widget
alsawidget.bar = awful.widget.progressbar ()
alsawidget.bar:set_width (8)
alsawidget.bar:set_vertical (true)
alsawidget.bar:set_background_color ("#494B4F")
alsawidget.bar:set_color (alsawidget.colors.unmute)
alsawidget.bar:buttons (awful.util.table.join (
  awful.button ({}, 1, function()
    awful.util.spawn (alsawidget.mixer)
  end),
  awful.button ({}, 3, function()
                -- You may need to specify a card number if you're not using your main set of speakers.
                -- You'll have to apply this to every call to 'amixer sset'.
                -- awful.util.spawn ("amixer sset -c " .. yourcardnumber .. " " .. alsawidget.channel .. " toggle")
    awful.util.spawn ("amixer sset " .. alsawidget.channel .. " toggle")
    vicious.force ({ alsawidget.bar })
  end),
  awful.button ({}, 4, function()
    awful.util.spawn ("amixer sset " .. alsawidget.channel .. " " .. alsawidget.step .. "+")
    vicious.force ({ alsawidget.bar })
  end),
  awful.button ({}, 5, function()
    awful.util.spawn ("amixer sset " .. alsawidget.channel .. " " .. alsawidget.step .. "-")
    vicious.force ({ alsawidget.bar })
  end)
))
-- tooltip
alsawidget.tooltip = awful.tooltip ({ objects = { alsawidget.bar } })
-- naughty notifications
alsawidget._current_level = 0
alsawidget._muted = false
function alsawidget:notify ()
  local preset =
  {
    height = 75,
    width = 300,
    font = alsawidget.notifications.font
  }
  local i = 1;
  while alsawidget.notifications.icons[i + 1] ~= nil
  do
    i = i + 1
  end
  if i >= 2
  then
    preset.icon_size = alsawidget.notifications.icon_size
    if alsawidget._muted or alsawidget._current_level == 0
    then
      preset.icon = alsawidget.notifications.icons[1]
    elseif alsawidget._current_level == 100
    then
      preset.icon = alsawidget.notifications.icons[i]
    else
      local int = math.modf (alsawidget._current_level / 100 * (i - 1))
      preset.icon = alsawidget.notifications.icons[int + 2]
    end
  end
  if alsawidget._muted
  then
    preset.title = alsawidget.channel .. " - Muted"
  elseif alsawidget._current_level == 0
  then
    preset.title = alsawidget.channel .. " - 0% (muted)"
    preset.text = "[" .. string.rep (" ", alsawidget.notifications.bar_size) .. "]"
  elseif alsawidget._current_level == 100
  then
    preset.title = alsawidget.channel .. " - 100% (max)"
    preset.text = "[" .. string.rep ("|", alsawidget.notifications.bar_size) .. "]"
  else
    local int = math.modf (alsawidget._current_level / 100 * alsawidget.notifications.bar_size)
    preset.title = alsawidget.channel .. " - " .. alsawidget._current_level .. "%"
    preset.text = "[" .. string.rep ("|", int) .. string.rep (" ", alsawidget.notifications.bar_size - int) .. "]"
  end
  if alsawidget._notify ~= nil
  then
    
    alsawidget._notify = naughty.notify (
    {
      replaces_id = alsawidget._notify.id,
      preset = preset
    })
  else
    alsawidget._notify = naughty.notify ({ preset = preset })
  end
end
-- register the widget through vicious
vicious.register (alsawidget.bar, vicious.widgets.volume, function (widget, args)
  alsawidget._current_level = args[1]
  if args[2] == "♩"
  then
    alsawidget._muted = true
    alsawidget.tooltip:set_text (" [Muted] ")
    widget:set_color (alsawidget.colors.mute)
    return 100
  end
  alsawidget._muted = false
  alsawidget.tooltip:set_text (" " .. alsawidget.channel .. ": " .. args[1] .. "% ")
  widget:set_color (alsawidget.colors.unmute)
  return args[1]
end, 5, alsawidget.channel) -- relatively high update time, use of keys/mouse will force update

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
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({
                                                      theme = { width = 250 }
                                                  })
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
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(cputxtwidget)
    left_layout:add(cpuwidget)
    left_layout:add(memwidget)

    left_layout:add(mypromptbox[s])
    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(alsawidget.bar)
    right_layout:add(mytextclock)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
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

    awful.key({modkey, "Shift"}, "l",  function() awful.util.spawn("i3lock-fancy", false) end),
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
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

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
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

globalkeys = awful.util.table.join(globalkeys, awful.key({ }, "XF86AudioRaiseVolume", function()
    awful.util.spawn("amixer sset " .. alsawidget.channel .. " " .. alsawidget.step .. "+")
    vicious.force({ alsawidget.bar })
    alsawidget.notify()
end))
globalkeys = awful.util.table.join(globalkeys, awful.key({ }, "XF86AudioLowerVolume", function()
    awful.util.spawn("amixer sset " .. alsawidget.channel .. " " .. alsawidget.step .. "-")
    vicious.force({ alsawidget.bar })
    alsawidget.notify()
end))
globalkeys = awful.util.table.join(globalkeys, awful.key({ }, "XF86MonBrightnessDown", function ()
        awful.util.spawn("xbacklight -dec 15") end))
globalkeys = awful.util.table.join(globalkeys, awful.key({ }, "XF86MonBrightnessUp", function ()
        awful.util.spawn("xbacklight -inc 15") end))
globalkeys = awful.util.table.join(globalkeys, awful.key({ }, "XF86AudioMute", function()
    awful.util.spawn("amixer sset " .. alsawidget.channel .. " toggle")
    -- The 2 following lines were needed at least on my configuration, otherwise it would get stuck muted
    -- However, if the channel you're using is "Speaker" or "Headpphone"
    -- instead of "Master", you'll have to comment out their corresponding line below.
    awful.util.spawn("amixer sset " .. "Speaker" .. " unmute")
    awful.util.spawn("amixer sset " .. "Headphone" .. " unmute")
    vicious.force({ alsawidget.bar })
    alsawidget.notify()
end))

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.toggletag(tag)
                          end
                      end
                  end)),
        awful.key({}, "F10", function() raise_conky() end, function() lower_conky() end),
        awful.key({}, "Pause", function() toggle_conky() end)
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
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
    { rule = { class = "Conky" },
  properties = {
      floating = true,
      sticky = true,
      ontop = false,
      focusable = false,
      size_hints = {"program_position", "program_size"}
  } }
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
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

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
function get_conky()
    local clients = client.get()
    local conky = nil
    local i = 1
    while clients[i]
    do
        if clients[i].class == "Conky"
        then
            conky = clients[i]
        end
        i = i + 1
    end
    return conky
end
function raise_conky()
    local conky = get_conky()
    if conky
    then
        conky.ontop = true
    end
end
function lower_conky()
    local conky = get_conky()
    if conky
    then
        conky.ontop = false
    end
end
function toggle_conky()
    local conky = get_conky()
    if conky
    then
        if conky.ontop
        then
            conky.ontop = false
        else
            conky.ontop = true
        end
    end
end

