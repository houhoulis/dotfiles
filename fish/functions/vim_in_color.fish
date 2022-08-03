# Great for viewing log or other files with embedded color escape sequences.
# Unless you prefer
#   ^[[36mcarp_1   |^[[0m 2022-07-28 03:30:47 ^[[36mI^[[0m [9:5100] ^[[36mcarp^[[0m -- Failed imports
# See https://vi.stackexchange.com/a/22692
# Takes about 10 seconds to open the color pane on a 57,000,000-character file.
# Also: "Terminal buffers are by default unmodifiable, and any modification will make the colours disappear."
function vim_in_color --argument-names file
  vim -c ":term ++hidden ++open cat $file"
end

