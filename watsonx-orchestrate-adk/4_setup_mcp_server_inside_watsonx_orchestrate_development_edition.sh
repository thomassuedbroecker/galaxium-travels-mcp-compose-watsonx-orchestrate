echo "#######################"
echo "# 1. Create a connection for the _MCP remote server_"
echo "#######################"

source ./.venv/bin/activate
export APP_ID="galaxium-mcp-remote-server"
orchestrate connections remove --app-id ${APP_ID}
orchestrate connections add --app-id ${APP_ID}

echo "#######################"
echo "# 2. Configure the watsonx Orchestrate  _MCP remote server_ connection"
echo "#######################"

source ./.venv/bin/activate
export ENVIRONMENT="draft"
export TYPE="team"
export KIND="basic"
export APP_ID="galaxium-mcp-remote-server"
export MCP_REMOTE_SERVER_URL="http://booking_system_mcp:8084/mcp"
orchestrate connections configure --app-id ${APP_ID} --env ${ENVIRONMENT} --kind ${KIND} --type ${TYPE} --url ${MCP_REMOTE_SERVER_URL}


echo "#######################"
echo "# 3. Configure basic authentication for the connection"
echo "#######################"

export APP_ID="galaxium-mcp-remote-server"
export ENVIRONMENT="draft"
export SERVICE_USERNAME="admin"
export SERVICE_PASSWORD="admin"
orchestrate connections set-credentials --app-id ${APP_ID} --environment ${ENVIRONMENT} --username ${SERVICE_USERNAME} --password ${SERVICE_PASSWORD}

echo "#######################"
echo "# 4. Import the tools from the MCP server"
echo "#######################"

export APP_ID="galaxium-mcp-remote-server"
export NAME="Galaxium-Travels-Booking-MCP-remote"
export DESCRIPTION="Galaxium import from 'MCP server'."
export ENVIRONMENT="draft"
export TYPE="team"
export KIND="mcp"
export TRANSPORT="streamable_http"
# Inside compose
export MCP_REMOTE_SERVER_URL="http://booking_system_mcp:8084/mcp"
export TOOLS=list_flights
source ./.venv/bin/activate
orchestrate toolkits remove --name ${NAME}
orchestrate toolkits list
orchestrate toolkits add --kind ${KIND} --name ${NAME} --description "${DESCRIPTION}" --transport ${TRANSPORT} --tools=${TOOLS} --url ${MCP_REMOTE_SERVER_URL}

echo "#######################"
echo "# 7. Open watsonx Orchestrate Lite Chat"
echo "# htto://localhost:3000" 
echo "# - Visit Manage Agents"
echo "# - Ensure the 'AllFlights Tool' is available"
echo "# - Add 'AllFlights Tool' to an agent"
echo "# - Ask the question: Which flights are available?"
echo "#######################"