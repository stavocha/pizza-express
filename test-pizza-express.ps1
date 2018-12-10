docker-compose.exe -f docker-compose.yml build
docker-compose.exe -f docker-compose.yml up 

if $? ! = 0; then
  exit 1
docker-compose.exe -f docker-compose.yml up -d
curl http://localhost:8081
if $? ! = ;then
  exit 1
docker login -u stavocha -p $PASSWORD
docker tag pizza-express:latest stavocha/pizza-express:latest
docker push stavocha/pizza-express:latest