echo "#######################"
echo "# Example: Localhost"
echo "# 1. Galaxium Travels runs on a local container engine with Docker Compose!"
echo "# 2. watsonx Orchestrate Development Edition 2.0–2.1 runs on its own container engine in a VM"
echo "# "
echo "# You need to start the Galaxium Travels containers"
echo "# with Docker Compose using the bash script:"
echo "# 'example-application-infrastructure/galaxium-travels-infrastructure/local-container/start-build-containers.sh'"
echo "# "
echo "# This example does not require exporting the"
echo "# Docker Compose file!"
echo "# Basic watsonx Orchestrate Development Edition 2.0–2.1."
echo "# - NO 'orchestrate server attach-docker'"
echo "#######################"
source .venv/bin/activate

echo "#######################"
echo "# 1. Start virtual environment"
echo "#######################"
source .venv/bin/activate

echo "#######################"
echo "# 2. Start development server"
echo "#######################"
orchestrate server start --env-file .env

echo "#######################"
echo "# 3. Activate local environment"
echo "#######################"
orchestrate env activate local

echo "#######################"
echo "# 4. Start watsonx Orchestrate 'Lite Chat'"
echo "#######################"
orchestrate chat start

echo "#######################"
echo "# 5. Create a connection for the _MCP remote server_"
echo "#######################"

source ./.venv/bin/activate
export APP_ID="galaxium-mcp-remote-server-localhost"
orchestrate connections remove --app-id ${APP_ID}
orchestrate connections add --app-id ${APP_ID}

echo "#######################"
echo "# 6. Configure the watsonx Orchestrate  _MCP remote server_ connection"
echo "#######################"

source ./.venv/bin/activate
export ENVIRONMENT="draft"
export TYPE="team"
export KIND="basic"
export APP_ID="galaxium-mcp-remote-server-localhost"
export MCP_REMOTE_SERVER_URL="http://0.0.0.0:8084/mcp"
orchestrate connections configure --app-id ${APP_ID} --env ${ENVIRONMENT} --kind ${KIND} --type ${TYPE} --url ${MCP_REMOTE_SERVER_URL}


echo "#######################"
echo "# 7. Configure basic authentication for the connection"
echo "#######################"

export APP_ID="galaxium-mcp-remote-server-localhost"
export ENVIRONMENT="draft"
export SERVICE_USERNAME="admin"
export SERVICE_PASSWORD="admin"
orchestrate connections set-credentials --app-id ${APP_ID} --environment ${ENVIRONMENT} --username ${SERVICE_USERNAME} --password ${SERVICE_PASSWORD}

echo "#######################"
echo "# 8. Import the tools from the MCP server"
echo "#######################"

export APP_ID="galaxium-mcp-remote-server-localhost"
export NAME="Galaxium-Travels-Booking-MCP-remote-localhost"
export DESCRIPTION="Galaxium import from 'MCP server' from localhost."
export ENVIRONMENT="draft"
export TYPE="team"
export KIND="mcp"
export TRANSPORT="streamable_http"
# Localhost
export MCP_REMOTE_SERVER_URL="http://0.0.0.0:8084/mcp"
export TOOLS=list_flights
source ./.venv/bin/activate
orchestrate toolkits remove --name ${NAME}
orchestrate toolkits list
orchestrate toolkits add --kind ${KIND} --name ${NAME} --description "${DESCRIPTION}" --transport ${TRANSPORT} --tools=${TOOLS} --url ${MCP_REMOTE_SERVER_URL}

echo "#######################"
echo "# 9. Open watsonx Orchestrate Lite Chat"
echo "# http://localhost:3000"
echo "# - Visit Manage Agents"
echo "# - Ensure the 'AllFlights Tool' is available"
echo "# - Add the 'AllFlights Tool' to an agent"
echo "# - Ask the question: Which flights are available?"
echo "#######################"
