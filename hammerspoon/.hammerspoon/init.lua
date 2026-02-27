-- Launch or Focus Firefox with ⌘F1
hs.hotkey.bind({"cmd"}, 'F1', function()
  hs.application.launchOrFocus("/Applications/Firefox.app")
end)

-- Launch or Focus Terminal with ⌘F2
hs.hotkey.bind({"cmd"}, 'F2', function()
  hs.application.launchOrFocus("/Applications/Ghostty.app")
end)

-- Launch or Focus Teams with ⌘F3
hs.hotkey.bind({"cmd"}, 'F3', function()
  hs.application.launchOrFocus("/Applications/Microsoft Teams.app")
end)

-- Launch or Focus Outlook with ⌘F4
hs.hotkey.bind({"cmd"}, 'F4', function()
  hs.application.launchOrFocus("/Applications/Microsoft Outlook.app")
end)

