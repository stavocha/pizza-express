# Builds the compose file.
docker-compose -f docker-compose.yml build
# Brings up the containers, captures test exit code and exits if tests dodn't pass.
docker-compose -f docker-compose.yml up --exit-code-from tests
ec=$? ; if [[ $ec != 0 ]]; then
  echo "---tests didn't pass---" ;exit $ec;
fi
echo "---tests completed with success---"
docker-compose -f docker-compose.yml up -d
# Curl to application and exit if unsuccessful.
curl http://localhost:8081
ec=$?; if [ $ec != "0" ] && [ $ec != "200" ]; then
  printf "\n---healthcheck failed----\n" ;exit $ec;
fi
printf "\n---healthcheck succeeded---\n"
# Login to repository. It's possible to add -p $PASSWORD and inject the password from CI.
docker login -u stavocha
docker tag pizza-express:latest stavocha/pizza-express:latest
docker push stavocha/pizza-express:latest
