# 2.1 Set up the `watsons Orchestrate ADK` and `watsonx Orchestrate Development Server` (wxo 2.0 and 2.1 versions)

>For watsonx Orchestrate ADK 1.x versions please visit this [documentation](/2-watsonx_adk_setup.md).

>The image below shows the relevant changes made to run the `Galaxium Travels mcp server` also as a container inside the docker-compose of watsonx Orchestrate Development Edition.

- Compose network setting
- Attach watsonx Orchestrate Development Edition to container engine, because to load the container from the local container engine. [IBM watsonx Orchestrate Documentation](https://developer.watson-orchestrate.ibm.com/developer_edition/manage_local_server#attaching-watsonx-orchestrate-developer-edition-to-a-docker-engine)

![](/images/watsonx-orchestrate-2.0-2.1-update.png)

### Step 1: Set up the virtual Python environment

Start a new terminal in folder **watsonx-orchestrate-adk** and insert the following commands.

```sh
cd /watsonx-orchestrate-adk
python3.12 -m venv .venv
source ./.venv/bin/activate
python3 -m pip install --upgrade pip
```

### Step 2: Install the watsonx Orchestrate CLI

```sh
cd watsonx-orchestrate-adk
source ./.venv/bin/activate
python3 -m pip install ibm-watsonx-orchestrate
orchestrate --version
```

### Step 3: Generate the environment file for the ADK

```sh
cd watsonx-orchestrate-adk
cat .env_template > .env
```

Configuration for local usage and watsonx.ai.

>To get the relevant information for the local configuration with IBM Cloud and watsonx.ai, please visit the blog post [Getting Started with Local AI Agents in the watsonx Orchestrate Development Edition](https://suedbroecker.net/2025/06/25/getting-started-with-local-ai-agents-in-the-watsonx-orchestrate-developer-edition/) or the [IBM watsonx Orchestrate ADK documentation](https://developer.watson-orchestrate.ibm.com/getting_started/installing#ibm-cloud).


```sh
# Developer
export WO_DEVELOPER_EDITION_SOURCE=myibm
# IBM ENTITLEMENT
export WO_ENTITLEMENT_KEY=<YOUR_ENTITLEMENT_KEY>
# IBM API KEY
export WATSONX_APIKEY=<YOUR_WATSONX_API_KEY>
export WATSONX_SPACE_ID=<YOUR_SPACE_ID>
# Optional configuration
#export WATSONX_REGION=us-south
#export WATSONX_URL=https://${WATSONX_REGION}.ml.cloud.ibm.com
```

### Step 4: Start the watsonx Orchestrate Developer Edition

>Ensure the `Galaxium Container` are not running.

```sh
cd watsonx-orchestrate-adk
orchestrate server start --env-file .env
orchestrate --version
```

### Step 5: Generate an export of the Docker Compose configurations

```sh
cd watsonx-orchestrate-adk
orchestrate server eject -e $(pwd)/.env
```

This command generates a `docker-compose.yml` and a `server.env` file in the current folder.

### Step 6: Stop the server

```sh
cd watsonx-orchestrate-adk
orchestrate server stop
```

### Step 7: Add the "Galaxium Travels Infrastructure" to the Docker Compose file

Search for the `volumes:` section and add the following code to the services in the `docker-compose.yml`.

* Starting point of the volumes section

```yaml
volumes:
  tools:
    driver: local
  wxo-server-redis-data:
```

* Code to insert

```yaml 
  ########################
  # Galaxium Travel Infrastructure 
  # ------- begin -------
  ########################
  booking_system_mcp:
    image: booking_system_mcp:1.0.0
    container_name: wx_booking_system_mcp
    ports:
      - 8084:8084
    networks:
      - default
  ########################
  # Galaxium Travel Infrastructure 
  # ------- end -------
  ########################
```

### Step 8: Start the watsonx Orchestrate Development Edition Server again

We start the server with [Langfuse](https://github.com/langfuse/langfuse) for monitoring the local [LangGraph](https://github.com/langchain-ai/langgraph) agents.

Therefore we use the generated and configured `server.env` and `docker-compose.yml` file.

```sh
cd watsonx-orchestrate-adk
source ./.venv/bin/activate
export SERVER_ENVIRONMENT=server.env
export DOCKER_COMPOSE_FILE=docker-compose.yml
orchestrate server start -e ${SERVER_ENVIRONMENT} -f ${DOCKER_COMPOSE_FILE}  --with-langfuse
```

### [Home](https://github.com/thomassuedbroecker/galaxium-travels-mcp-compose-watsonx-orchestrate?tab=readme-ov-file)