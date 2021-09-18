# Automate Postgres backup from a remote server via SSH tunnel
You can easily setup a daily backup system for your postgres database with a docker image.\
This boilerplate help you connect to destination database server via SSH tunnel (by id_rsa) and make a backup every day at 00:00 (the period is customizable by modifying the `config/cronjobs` file).\
By default it keeps backup file till 14 days and you can change it with evn variables in `.env` file.
## how to deploy
1. Copy the SSH private key in id_rsa file (`config/id_rsa`)
2. Clone .env from example.env and set your environment variables
3. docker compose build ; docker compose up -d
4. You can explore backup files in browser (`localhost:80`).

## Options in `.env`
`BACKUP_DIR` the backup files will save there.
`DAYS_TO_KEEP` Maximum number of days that backup files are kept in the system (in `BACKUP_DIR` dir)
`FILE_SUFFIX` Suffix of backups files.