#!/bin/bash
# Script to start a interactive GPU job
sinteractive --partition=atesting_a100 --gres=gpu:1
--time=00:20:00 --nodes=1 --ntasks=8


Set Env variables

# Step 1: Download the script using `wget` or `curl`
wget https://raw.githubusercontent.com/iportilla/Ollama_CURC/main/scripts/setOllamaEnv.sh -O
setOllamaEnv.sh

# Alternative using curl
curl -o setOllamaEnv.sh
https://raw.githubusercontent.com/iportilla/Ollama_CURC/main/scripts/setOllamaEnv.sh


# Step 2: Change permissions to make it executable
chmod +x setOllamaEnv.sh


#Step 3: Set $OLLAMA_USER variable
export OLLAMA_USER=jepo7247


# Step 4: Execute the script
./setOllamaEnv.sh


Start Ollama server (BG)

#!/bin/bash
# Script to start Ollama in the background
nohup ollama serve > /dev/null 2>&1 &


7. Run LLM model
ollama run tinyllama
