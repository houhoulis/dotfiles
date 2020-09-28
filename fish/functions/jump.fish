function jump
  set TARGET_NAME $argv[1]
  echo $TARGET_NAME
  echo "$MARKPATH/$TARGET_NAME"
#  echo "$MARKPATH/$HELL" # 2>/dev/null || echo "No such mark: $1"
#  /usr/bin/cd -P "$MARKPATH/$TARGET_NAME" 2>/dev/null || echo "No such mark: $TARGET_NAME"
  cd "$MARKPATH/$TARGET_NAME" 2>/dev/null || echo "No such mark: $TARGET_NAME"
end

