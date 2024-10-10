# Import CSV Files to PostgreSQL Using Shell Script
This repository contains a shell script for importing CSV files into a PostgreSQL database. The script automatically creates tables based on CSV headers and imports the data.

#### Blog: https://blog.niteshapte.com/2024-10-09-how-to-import-csv-files-to-postgres-using-shell-script.htm

## Prerequisites
#### Create the .pgpass file in the home folder
```
touch ~/.pgpass
```

#### Add Your Database Credentials
Add your DB credentials in below format
```
your_host:your_port:your_database_name:your_username:your_password
```

#### Set the permissions on the .pgpass file
```
chmod 600 ~/.pgpass
```

## Usage
#### Clone the repository
```
git clone https://github.com/niteshapte/import-csv-file-to-postgres-shell-script
```

#### Move to directory
```
cd import-csv-file-to-postgres-shell-script
```

#### Make the Script Executable
```
chmod +x import_schema_data.sh
```

#### Run the script
```
./import_schema_data.sh
```

## Important Notes:
1. Ensure the schema is already created in your PostgreSQL database before running the script.
2. The script assumes the CSV files contain headers and creates the table with all columns as TEXT type.
3. It automatically imports all CSV files in the specified directory.
