function sleepsay -d "sleep arg1 seconds and then sayk the rest"
  sleep $argv[1] && sayk "$argv[2..-1]"
end
