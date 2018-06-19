#!/bin/bash
h=`date +"%Y"`
m=`date +"%m"`
s=`date +"%d"`
zip -r <backup-location>-$h-$m-$s.zip <file-location>
zip -r <backup-location>-$h-$m-$s.zip <file-location>
zip -r <backup-location>-$h-$m-$s.zip <file-location>
mysqldump -u <user-name> -p'<password>' <db_name> > <backup-location>-$h-$m-$s.sql
del_old() {
        j=0
        for i in `ls -t /backup/ | grep $1`
        do
                if [ $j -gt 5 ]
                then
                        #echo $i
                        rm -rf <backup-location>/$i
                fi
                j=$((j+1))
        done
}

del_old <key-word-1st-zip>
del_old <key-word-2nd-zip>
del_old <key-word-3rd-zip>
del_old <key-word-mysql-zip>
