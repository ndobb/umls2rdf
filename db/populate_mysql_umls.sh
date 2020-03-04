#!/bin/sh -f
#
# For useful information on loading your Metathesaurus subset
# into a MySQL database, please consult the on-line
# documentation at:
#
# http://www.nlm.nih.gov/research/umls/load_scripts.html
#

#
# Database connection parameters
# Please edit these variables to reflect your environment
#

# Note to MySQL users implementing MySQL version 5.6:
# MySQL version 5.6 and above defaults to use the InnoDB storage engine. Users have reported disk space issues while 
# loading RRF data into MySQL 5.6 databases due to default InnoDB settings that store all tables and indexes within the 
# system tablespace. MySQL 5.6.6 now sets the 'innodb_file_per_table' configuration setting to 'on' so that each newly 
# created table and index are assigned a separate .idb data file. Users should read the MySQL documentation for 
# additional information.

MYSQL_HOME=127.0.0.1
user=umls
password=umls
db_name=umls

/bin/rm -f mysql.log
touch mysql.log
ef=0
mrcxt_flag=0
echo "See mysql.log for output"

echo "----------------------------------------" >> mysql.log 2>&1
echo "Starting ... `/bin/date`" >> mysql.log 2>&1
echo "----------------------------------------" >> mysql.log 2>&1
echo "MYSQL_HOME = $MYSQL_HOME" >> mysql.log 2>&1
echo "user =       $user" >> mysql.log 2>&1
echo "db_name =    $db_name" >> mysql.log 2>&1

# Create empty mrcxt if it doesn't exist, expected by mysql_tables.sql script
if [ ! -f MRCXT.RRF ]; then mrcxt_flag=1; fi
if [ ! -f MRCXT.RRF ]; then `touch MRCXT.RRF`; fi

echo "    Create tables ... `/bin/date`" >> mysql.log 2>&1
mysql -vvv -u $user -p$password $db_name --protocol=tcp --local-infile=1 < mysql_tables_create.sql >> mysql.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi

echo "finished creating tables ... `/bin/date`" >> mysql.log 2>&1

echo "    Load tables ... `/bin/date`" >> mysql.log 2>&1
mysql -vvv -u $user -p$password $db_name --protocol=tcp --local-infile=1 < mysql_tables_load.sql >> mysql.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi

echo "finished loading tables ... `/bin/date`" >> mysql.log 2>&1

if [ $ef -ne 1 ]
then
echo "    Create indexes ... `/bin/date`" >> mysql.log 2>&1
mysql -vvv -u $user -p$password $db_name --protocol=tcp --local-infile=1 < mysql_indexes.sql >> mysql.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
fi

echo "finished indexes ... `/bin/date`" >> mysql.log 2>&1

if [ $mrcxt_flag -eq 1 ]
then
rm -f MRCXT.RRF
echo "DROP TABLE IF EXISTS MRCXT;" >> drop_mrcxt.sql
mysql -vvv -u $user -p$password $db_name --protocol=tcp --local-infile=1 < drop_mrcxt.sql >> mysql.log 2>&1
if [ $? -ne 0 ]; then ef=1; fi
rm -f drop_mrcxt.sql
fi


echo "----------------------------------------" >> mysql.log 2>&1
if [ $ef -eq 1 ]
then
  echo "There were one or more errors.  Please reference the mysql.log file for details." >> mysql.log 2>&1
  retval=-1
else
  echo "Completed without errors." >> mysql.log 2>&1
  retval=0
fi
echo "Finished ... `/bin/date`" >> mysql.log 2>&1
echo "----------------------------------------" >> mysql.log 2>&1
exit $retval
