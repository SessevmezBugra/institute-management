### Docker Compose ###
# Environment
RDS_PORT=3309
RDS_USERNAME=institutemanagement
# Run Command
docker-compose -p "institute-management" --file ./docker-compose-local.yml up -d