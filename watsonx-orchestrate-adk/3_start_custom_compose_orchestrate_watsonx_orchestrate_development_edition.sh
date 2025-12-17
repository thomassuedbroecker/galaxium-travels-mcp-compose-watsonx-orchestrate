echo "#######################"
echo "# 1. Start virtual environment"
echo "#######################"
source .venv/bin/activate

#echo "#######################"
#echo "# 2. Attach-docker to watsonx Orchestrate development server"
#echo "#######################"
#orchestrate server attach-docker

echo "#######################"
echo "# 3. Start development server in with docker-compose configuration with langfuse"
echo "#######################"
export SERVER_ENVIRONMENT=server.env
export DOCKER_COMPOSE_FILE=docker-compose.yml
orchestrate server start -e ${SERVER_ENVIRONMENT} -f ${DOCKER_COMPOSE_FILE}  --with-langfuse

echo "#######################"
echo "# 4. Activate local environment"
echo "#######################"
orchestrate env activate local

echo "#######################"
echo "# 5. Start watsonx Orchestrate 'Lite Chat'"
echo "#######################"
orchestrate chat start

echo "#######################"
echo "# Optional: 6. View watsonx Orchestrate server logs"
echo "# Uncomment command in bash script!"
echo "#######################"
#orchestrate server logs 