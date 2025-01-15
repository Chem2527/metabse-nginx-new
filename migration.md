# Migrate Production Dashboards to staging

1. Backup Existing Data in the Staging Container:

•	On the Staging server, back up the existing database files inside the staging container:
```bash
docker exec -it <staging container name> bash -c "mv /metabase.db/metabase.db.mv.db /metabase.db/metabase.db.mv.db.bak"
```
docker exec -it <staging container name> bash -c "mv /metabase.db/metabase.db.trace.db /metabase.db/metabase.db.trace.db.bak"

2. Copy Database File from the Production Container to the Production server:

•	On the production server, copy the database files from the production container to any directory inside production server. In below case its /root directory.

docker cp <prod container name>:/metabase.db/metabase.db/metabase.db.mv.db /root/metabase.db.mv.db

docker cp <prod container name>:/metabase.db/metabase.db/metabase.db.trace.db /root/metabase.db.trace.db

3. Transfer the Database Files to the Staging Server:

•	Transfer the database files from the Production server to the Staging server using scp:

scp -i "<.pem file>" /root/metabase.db.mv.db ubuntu@<stagingserver>:/home/ubuntu/metabase.db.mv.db

scp -i "<.pem file>" /root/metabase.db.trace.db ubntu@<stagingserver>:/home/ubuntu/metabase.db.trace.db

•	Move the transferred files to the root directory on the staging server:

sudo mv /home/ubuntu/metabase.db.mv.db /root/metabase.db.mv.db

sudo mv /home/ubuntu/metabase.db.trace.db /root/metabase.db.trace.db

4. Replace the Database Files in the Staging Container:

•	On the staging server, copy the transferred database files into the Staging container:

docker cp /root/metabase.db.mv.db <staging container name>:/metabase.db/metabase.db/metabase.db.mv.db


docker cp /root/metabase.db.trace.db <staging container name>:/metabase.db/metabase.db/metabase.db.trace.db


5. Restart the Staging Container:
•	Restart the Metabase staging container to apply the changes:
docker restart <staging container name>

6. Verify Migration:
•	Open the staging Metabase instance in your browser.
•	Log in and verify that all dashboards, collections, and settings from the source are present.
•	Open Metabase settings and update the environment variables and configurations to reflect the staging environment.
