# https://github.com/masukomi/masuconfigs/blob/master/.config/fish/functions/where.fish
# edited to use `sed` instead of `sd`
# edited to return both binaries & fish functions if both found

function where --argument-names 'exe_or_function' \
  --description "finds executable and fish function(s) with the supplied name"

  set -l where_status 1

  set -l exe_path (command -v $exe_or_function)
  if test $status -eq 0
    echo $exe_path
    set where_status 0
  end

  set -l function_names (functions --names | sed s/,\ /\\n/g | grep "^$exe_or_function\$")
  for fun in $function_names
    echo (functions -D $fun)
    set where_status 0
  end

  return $where_status
end

