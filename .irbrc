IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 50
IRB.conf[:VERBOSE] = true

if IRB.conf[:PROMPT][:RVM]
  prompt_n = IRB.conf[:PROMPT][:RVM][:PROMPT_N].gsub(" ","")
  prompt_i = IRB.conf[:PROMPT][:RVM][:PROMPT_I].gsub(" ","")
  prompt_c = IRB.conf[:PROMPT][:RVM][:PROMPT_C].gsub(" ","")
  prompt_s = IRB.conf[:PROMPT][:RVM][:PROMPT_S].gsub(" ","")

  IRB.conf[:PROMPT][:TIGHTER] = {
    :PROMPT_N => prompt_n,
    :PROMPT_I => prompt_i,
    :PROMPT_C => prompt_c,
    :PROMPT_S => prompt_s,
    :RETURN => " => %s\n",
    :AUTO_INDENT => true
  }
end

IRB.conf[:PROMPT_MODE] = :TIGHTER
