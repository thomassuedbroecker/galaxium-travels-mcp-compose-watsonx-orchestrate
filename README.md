# Galaxium Travels local MCP Server, MCP Gateway, `watsonx Orchestrate Development Edition`, and `Docker-Compose`

This repository demonstrates how to set up an MCP server locally and integrate it into the `watsonx Orchestrate Development Edition` using `Docker-Compose`.

* **MCP Server**

![](/images/mcp-server-overview-01.png)

This repository contains resources for the "galaxium_travels_mcp-compose-watsonx-orchestrate" project, utilizing the `watsonx Orchestrate Development Edition`.

* Galaxium Travels Applications:
    * Galaxium Travels Booking MCP: http://localhost:8084/mcp
    * Galaxium Travels WebApp: http://localhost:8083
    * Galaxium Travels Booking: http://localhost:8082/docs
    * Galaxium Travels HR: http://localhost:8081/docs


* watsonx Orchestrate 
    * Langfuse: http://localhost:3010
    * watsonx Orchestrate LiteChat: http://localhost:3000

* Related resources:


## The steps in the related [YouTube video: TBD](XXX).

#### 1. Start your container engine

Ensure your container engine is running on your desktop.

#### 2. [Set up the example `Galaxium Travels Infrastructure`](https://github.com/thomassuedbroecker/draft-galaxium-travels-mcp-compose-watsonx-orchestrate/blob/main/1-galaxium_setup.md)

#### 3. [Set up the watsonx Orchestrate ADK and watsonx Orchestrate Development Server](https://github.com/thomassuedbroecker/draft-galaxium-travels-mcp-compose-watsonx-orchestrate/blob/main/2-watsonx_adk_setup.md)

#### 4. [Connect to the MCP server with MCP inspector](https://github.com/thomassuedbroecker/draft-galaxium-travels-mcp-compose-watsonx-orchestrate/blob/main/3-connect-to-the-mcp-server-with-mcp-inspector.md)

#### 5. [Connect to MCP Gateway and MCP server](https://github.com/thomassuedbroecker/draft-galaxium-travels-mcp-compose-watsonx-orchestrate/blob/main/4-connect-to-the-mcp-server.md) 

#### 6. Additional resources

* **The Galaxium Travels Example**   
    * [Galaxium Travels Infrastructure](https://github.com/thomassuedbroecker/galaxium-travels-infrastructure)
    * [Galaxium Travels Idea](https://github.com/Max-Jesch/galaxium-travels)

* **Blog posts**

    * [Integrating watsonx Orchestrate Agent Chat in Web Apps](https://suedbroecker.net/2025/08/08/integrating-watsonx-orchestrate-agent-chat-in-web-apps/)
    * [Getting Started with Local AI Agents in the watsonx Orchestrate Development Edition](https://suedbroecker.net/2025/06/25/getting-started-with-local-ai-agents-in-the-watsonx-orchestrate-developer-edition/)
    * [`Building Agentic AI solutions with WatsonX Orchestrate and Remote MCP Servers: A Weather Tool Example`](https://medium.com/@rishraj.2000/building-agentic-ai-solutions-with-watsonx-orchestrate-and-remote-mcp-servers-a-weather-tool-4dc795de76bb)
    * [Converting SSE to STDIO via the MCP Gateway](https://heidloff.net/article/mcp-gateway/)

* **ADK documentation**
    * [Importing remote MCP toolkits](https://developer.watson-orchestrate.ibm.com/tools/toolkits/remote_mcp_toolkits#using-streamable-http)
    * [IBM watsonx Orchestrate Agent Development Kit](https://developer.watson-orchestrate.ibm.com/)

* **MCP documentation**
    * [Transports](https://modelcontextprotocol.io/specification/2025-06-18/basic/transports)
