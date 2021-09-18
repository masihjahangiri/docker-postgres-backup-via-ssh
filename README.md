# Automate Postgres backup from a remote server via SSH tunnel
You can easily setup a daily backup system for your postgres database.\
This boilerplate help you connect to destination database server via SSH tunnel (by id_rsa) and make a backup every day at 00:00 (the period is customizable by modifying the `config/cronjobs` file).\
By default it keeps backup file till 14 days and you can change it with evn variables in `.env` file. 

1. Copy the SSH private key in id_rsa file (`config/id_rsa`)
2. Clone .env from example.env and set your environment variables
3. docker compose build ; docker compose up -d
