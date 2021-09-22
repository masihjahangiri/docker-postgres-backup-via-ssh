#!/bin/sh

FILE=`date +"%Y-%m-%d-%H_%M"`${FILE_SUFFIX}
OUTPUT_FILE=${BACKUP_DIR}/${FILE}

mkdir -p ${BACKUP_DIR}
ssh -oStrictHostKeyChecking=no -o ExitOnForwardFailure=yes -f -L 1111:localhost:${DB_PORT} ${SSH_USERNAME}@${SSH_HOST} -p ${SSH_PORT} sleep 10
PGPASSWORD=${DB_PASSWORD} pg_dump -c -h localhost --port 1111 -U ${DB_USER} ${DB_NAME} -F p -f ${OUTPUT_FILE}

gzip $OUTPUT_FILE

echo "${OUTPUT_FILE}.gz was created:"
ls -l ${OUTPUT_FILE}.gz

find $BACKUP_DIR -maxdepth 1 -mtime +$DAYS_TO_KEEP -name "*${FILE_SUFFIX}.gz" -exec rm -rf '{}' ';'
