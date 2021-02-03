#!/bin/bash

cat <<EOF > /config/rclone.conf
  [$RCLONE_REMOTE_NAME]
  type = $RCLONE_REMOTE_TYPE
  token = {"access_token":"$RCLONE_ACCESS_TOKEN","token_type":"$RCLONE_AT_TOKEN_TYPE","refresh_token":"$RCLONE_AT_REFRESH_TOKEN","expiry":"$RCLONE_AT_EXPIRY"}
  drive_id = $RCLONE_DRIVE_ID
  drive_type = $RCLONE_DRIVE_TYPE
  scope = $RCLONE_SCOPE
EOF

echo "Running PG Backup Rotated script.."
/scripts/pg_backup_rotated.sh
echo "Syncing with cloud storage via rclone..."
/scripts/rclone-upload.sh
echo "Git time"
/scripts/git-sync.sh
echo "Done"
