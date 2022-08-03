# https://github.com/masukomi/masuconfigs/blob/master/.config/fish/functions/where.fish
# edited to use `sed` instead of `sd`

function where --argument-names 'exe_or_function' \
  --description "finds an executable or fish function with the supplied name"

  set exe_path (command -v $exe_or_function)
  if test $status -eq 0
    echo $exe_path
    return 0
  else
    set function_names (functions --names | sed s/,\ /\\n/g | grep "^$exe_or_function")
    for x in $function_names
      set function_path (functions -D $x)
      echo $function_path
    end
    return 0
  end
  return 1
end

