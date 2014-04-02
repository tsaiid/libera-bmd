#!/usr/bin/env python

## Settings
## For production mode only
mdb_dir = '/home/tsaiid/rails/bone-density/shared/LiberaBMD'
done_dir = '/home/tsaiid/rails/bone-density/shared/LiberaBMD/Done'
sql_dir = '/home/tsaiid/rails/bone-density/shared/LiberaBMD/sql'

data2sql_path = '/home/tsaiid/rails/bone-density/current/bin/data2sql2pl.sh'
db_path = '/home/tsaiid/rails/bone-density/shared/production.sqlite3'

## Modules
import os, sqlite3
from shutil import copyfile

## Main
for root, dirs, files in os.walk(mdb_dir):
	for f in files:
		if f.endswith('.mdb'):
			f_name = os.path.splitext(f)[0]
			mdb_path = mdb_dir + '/' + f
			sql_path = sql_dir + '/' + f_name + '.sql'
			command_str = 'sh ' + data2sql_path + ' ' + mdb_path + ' > ' + sql_path

			# convert
			os.system(command_str)

			# backup db
			db_bak_path = db_path + '.bak'
			copyfile(db_path, db_bak_path)

			# import
			qry = open(sql_path, 'r').read()
			conn = sqlite3.connect(db_path)
			cursor = conn.cursor()
			try:
				cursor.executescript(qry)
			except Exception as e:
				error_str = db_path + ': ' + str(e)
				print error_str + "\n"
				cursor.close()
				raise

			# move mdb file into Done folder if success
			done_path = done_dir + '/' + f
			os.rename(mdb_path, done_path)
	break	# depth only 1.
