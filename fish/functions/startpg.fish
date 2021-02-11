function startpg
    if test $POSTGRES_PATH
      and test $POSTGRES_USER
      and test $POSTGRES_LOG
        pg_ctl start -D $POSTGRES_PATH/data -U $POSTGRES_USER -l $POSTGRES_LOG -o "-d 2"
    else
        echo "Need \$POSTGRES_PATH, \$POSTGRES_USER, and \$POSTGRES_LOG to be set."
    end
end
