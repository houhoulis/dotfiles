function stoppg
    if test $POSTGRES_PATH
      and test $POSTGRES_USER
        pg_ctl stop -D $POSTGRES_PATH/data -U $POSTGRES_USER
    else
        echo "Need \$POSTGRES_PATH and \$POSTGRES_USER to be set."
    end
end
