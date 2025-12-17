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
echo "# 4. Export compose and environment configuration"
echo "#######################"
orchestrate server eject -e $(pwd)/.env

echo "#######################"
echo "# 5. Stop server"
echo "#######################"
orchestrate server stop

echo "#######################"
echo "# 6. Show server"
echo "#######################"
orchestrate --version

echo "#######################"
echo "# 6. Now insert the Galaxium Travels container configuration into the watsonx Orchestrate Compose file."
echo "# !!! REMINDER: THIS IS NOT OFFICIALLY SUPPORTED !!!"
echo "# ... but it currently works."
echo "# Ensure you use the correct version in the repository"
echo "# documentation related to your watsonx Orchestrate version!"
echo "# Version 1.x or version 2.0–2.1"
echo "#######################"



