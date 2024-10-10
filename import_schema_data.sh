#!/bin/bash

# Database connection parameters
DB_HOST="hostname"
DB_PORT="portno"
DB_USER="user"
DB_NAME="dbbame"
SCHEMA_NAME="schema"

# Directory where CSV files are located (current directory)
CSV_DIR="."

# Function to create table
create_table() {
    local TABLE=$1
    local CSV_FILE=$2
    local COLUMNS=$(head -n 1 "$CSV_FILE" | sed 's/,/ TEXT,/g') # Infer columns as TEXT type

    local CREATE_TABLE_QUERY="CREATE TABLE $SCHEMA_NAME.$TABLE ($COLUMNS TEXT);"

    echo "Creating table $SCHEMA_NAME.$TABLE with columns: $COLUMNS"
    psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -c "$CREATE_TABLE_QUERY"
}

# Loop through each CSV file in the directory
for CSV_FILE in "$CSV_DIR"/*.csv; do
    # Extract table name from CSV file name (assuming CSV file naming convention is TableName.csv)
    TABLE=$(basename "$CSV_FILE" .csv)

    # Create the table
    create_table "$TABLE" "$CSV_FILE"

    # Import data from CSV into the corresponding table
    echo "Importing data from $CSV_FILE into $SCHEMA_NAME.$TABLE"
    psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME \
         -c "\\copy $SCHEMA_NAME.$TABLE FROM '$CSV_FILE' WITH CSV HEADER NULL 'NULL';"

    echo "Imported data from $CSV_FILE into $SCHEMA_NAME.$TABLE"
done

echo "Import completed"
