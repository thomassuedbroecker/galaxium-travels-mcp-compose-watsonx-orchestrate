# Connect to the MCP Server

### Step 1: Activate the local environment

Open a new Terminal in the **watsonx-orchestrate-adk** folder.

```sh
cd watsonx-orchestrate-adk
source ./.venv/bin/activate
orchestrate env list
orchestrate env activate local
```

### Step 2: Start the chat lite

```sh
cd watsonx-orchestrate-adk
source ./.venv/bin/activate
orchestrate chat start 
```

### Step 3: Create a connection for the _MCP remote server_

```sh
export APP_ID="galaxium-mcp-remote-server"
orchestrate connections remove --app-id ${APP_ID}
orchestrate connections add --app-id ${APP_ID}
```

### Stet 4: Configure the watsonx Orchestrate  _MCP remote server_ connection


* MCP remote server

```sh
cd watsonx-orchestrate-adk
source ./.venv/bin/activate
export ENVIRONMENT="draft"
export TYPE="team"
export KIND="basic"
export APP_ID="galaxium-mcp-remote-server"

export MCP_REMOTE_SERVER_URL="http://booking_system_mcp:8084/mcp"
orchestrate connections configure --app-id ${APP_ID} --env ${ENVIRONMENT} --kind ${KIND} --type ${TYPE} --url ${MCP_REMOTE_SERVER_URL}
```

### Step 6: Set the authentication

* MCP remote server _"basic auth"_

```sh
export APP_ID="galaxium-mcp-remote-server"
export ENVIRONMENT="draft"
export SERVICE_USERNAME="admin"
export SERVICE_PASSWORD="admin"
orchestrate connections set-credentials --app-id ${APP_ID} --environment ${ENVIRONMENT} --username ${SERVICE_USERNAME} --password ${SERVICE_PASSWORD}
```

### Step 7. Import the tools from the MCP server

* MCP remote server

```sh
cd watsonx-orchestrate-adk
source ./.venv/bin/activate
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

orchestrate toolkits remove --name ${NAME}
orchestrate toolkits import --kind ${KIND} --name ${NAME} --description ${DESCRIPTION} --transport ${TRANSPORT} --tools=${TOOLS} --url ${MCP_REMOTE_SERVER_URL}
```

Output:

```sh
[INFO] - Successfully removed tool Galaxium-Travels-Booking-MCP-remote
[INFO] - Successfully imported tool kit Galaxium-Travels-Booking-MCP-remote
```

### 8. Start watsonx Orchestrate `lite chat`

```sh
cd watsonx-orchestrate-adk
source ./.venv/bin/activate
orchestrate chat start
```

You can verify that the tool is imported in the UI.

![](/images/connect-to-mcp-locally-03.jpg)

### [Home](https://github.com/thomassuedbroecker/galaxium-travels-mcp-compose-watsonx-orchestrate/blob/main/README.md)

