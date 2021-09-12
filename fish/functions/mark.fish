function mark
  if test "$argv[1]" = "-h" ; or test "$argv[1]" = "--help"
    echo "Usage: mark [mark name] [directory]"
    echo "With no arguments, make a mark for the current directory using the directory name as the mark name."
    echo "With one argument, make a mark for the current directory using the name passed in as the mark name."
    echo "With two arguments, make a mark for the passed-in directory with the passed-in name."
    return 0
  end
  set -l name (test -n "$argv[1]" ; and echo $argv[1] ; or echo (string split -r -m1 / (pwd))[-1])
  test -n "$name" ; or echo "Problem creating mark from argument $argv[1] or directory "(pwd) && return 1
  set -l dir (test -n "$argv[2]" ; and echo (realpath $argv[2]) ; or echo (pwd))
  test -d $dir ; or echo "directory $dir not found" && return 1
  echo "Making mark $name for $dir"
  ln -s $dir "$MARKPATH/$name"
end

