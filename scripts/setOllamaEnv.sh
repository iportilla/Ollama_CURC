#!/bin/bash
# Script to set Ollama environment variables

# Set version
export OLLAMA_V="v0.4.2"

#Set $OLLAMA_USER with value provided in class
#hint: export $OLLAMA_USER='VALUE'

# Update PATH to include Ollama binary directory
export PATH="$PATH:/projects/$OLLAMA_USER/ollama/$OLLAMA_V/bin"


# Define temporary directory
export OLLAMA_TMPDIR="$SCRATCHDIR/$USER/ollama_temp"

# Set host and port
export OLLAMA_HOST="0.0.0.0:9999"

# Define the model storage directory
export OLLAMA_MODELS="/projects/$USER/my_ollama_models"

# Set parallelism constraints
export OLLAMA_NUM_PARALLEL=1
export OLLAMA_MAX_LOADED_MODELS=1

# Print confirmation
echo "Ollama environment variables have been set."
