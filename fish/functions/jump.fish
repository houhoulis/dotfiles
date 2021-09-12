function jump
  set -l mark "$MARKPATH/$argv[1]"
  test -L $mark; or echo "No such mark: $mark" && return 1
  set -l destination (realpath $mark)
  test -d $destination; or echo "No such target directory: $destination" && return 1
  # echo "mark: $mark; real target: $destination"
  cd $destination
end

