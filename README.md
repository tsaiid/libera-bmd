## LiberaBMD

A ruby-on-rails based web application for analysis of Hologic bone densitometry. It provides a web interface to show the patient and examination lists, and with a pre-defined reporting template, it generates the final report according to the interpretation algorithm of bone mineral density. It also has web APIs for the final report generation, which can be integrated into other radiology information system.

### Before Setup

1. Install Git
2. Install Python
3. Install Ruby
4. Install Rails

```
gem install rails 
```

### Exporting Database from Hologic Software

1. At the first time, you need to exporting the reference curve and all the existed data in the database. 
2. After setting up, you only need to export the new data.
3. Convert the database file with [MDB Tools].
	- A python script `bin/mdb2sqlite.py` can convert the mdb file into mysql style sql file.
4. Due to the naming policy, we also have to change the table names from the Holotic software. Two scripts can help in doing it. 
	- `bin/data2sql2pl.sh` is for the patient and examination data.
  	- `bin/ref2sql2pl.sh` is for the reference curve data.
  	- These scripts use stdout for the result.

[MDB Tools]:  http://mdbtools.sourceforge.net/

### Setup

1\. Clone the repository

```
git clone https://github.com/tsaiid/libera-bmd.git YOUR_APP_PATH
```

2\. Installing gems with Bundler (in YOUR_APP_PATH)
 
```
bundle install
```

3\. Initialize the database (default is SQLite)

```
rake db:setup
```

4\. Importing the sql files, including the reference curve and all the data. 

5\. Start the Rails app

- You can use `rails server` and test http://localhost:3000/
- On Mac OS X, you also can use [Pow] for a prettier url.  

[Pow]:	http://pow.cx/

