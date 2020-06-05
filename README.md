# gazou
Barebones image hosting website.

# Development
## Requirements
* Crystal
* SQLite
* OpenSSL

## Building
    shards install
    ./init_db
    crystal build --release src/gazou.cr
    
## Usage
    ./gazou
    
# License
Licensed under AGPL-3.0-only.
