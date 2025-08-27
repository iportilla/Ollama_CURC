### RC Lab - Ollama



1. Login to rc

   ssh IDENTYKEY@login.rc.colorado.edu

   ``` 
   ssh 7247@login.rc.colorado.edu
   ```

2. Duomobil approval

3. Create A100 partition with:

   sinteractive ...

   ```
   sinteractive \
     --partition=atesting_a100 \
     --nodes=1 \
     --gres=gpu:a100_3g.20gb:1 \
     --ntasks=1 \
     --cpus-per-task=8 \
     --mem=24G \
     --time=30:00 \
     --qos=testing
   ```

4. See the queue

5. ```
   squeue -u $USER
                JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
             17074810 atesting_ sinterac jepo7247  R       0:41      1 c3gpu-c2-u13
   ```

6. Set `env` variables with:

7. ```script
   # Set version
   export OLLAMA_V="v0.4.2"
   
   #Set $OLLAMA_USER with value provided in class
   #hint: export OLLAMA_USER="your_username"
   export OLLAMA_USER="7247"
   # Update PATH to include Ollama binary directory
   export PATH="$PATH:/projects/$OLLAMA_USER/ollama/$OLLAMA_V/bin"
   
   # Define temporary directory
   export OLLAMA_TMPDIR="$SCRATCHDIR/$USER/ollama_temp"
   mkdir -p "$OLLAMA_TMPDIR"
   
   # Set host and port
   export OLLAMA_HOST="0.0.0.0:9999"
   
   # Define the model storage directory
   export OLLAMA_MODELS="/projects/$USER/my_ollama_models"
   mkdir -p "$OLLAMA_MODELS"
   
   # Set parallelism constraints
   export OLLAMA_NUM_PARALLEL=1
   export OLLAMA_MAX_LOADED_MODELS=1
   ```

8.  Or 

   `source ollama_env.sh`

9. Run ollama server with:

   ```script nohup ollama serve > /dev/null 2>&1 &
   nohup ollama serve > /dev/null 2>&1 &
   ```

   

10. Check ollama is running with:

    ```script
    ollama list
    ```

    

    You will see a list of ollama models

    ```text
    NAME                    ID              SIZE      MODIFIED
    deepseek-r1:latest      0a8c26691023    4.7 GB    6 months ago
    deepseek-r1:1.5b        a42b25d8c10a    1.1 GB    6 months ago
    tinyllama:latest        2644915ede35    637 MB    6 months ago
    llama3.3:latest         a6eb4748fd29    42 GB     8 months ago
    granite-code:8b         36c3c3b9683b    4.6 GB    8 months ago
    granite-code:8b-base    446b079c08d8    4.6 GB    8 months ago
    llama3.2:latest         a80c4f17acd5    2.0 GB    8 months ago
    ```

    

11. Load small ollama model with:

     `ollama run tinyllama --verbose`

12. Example prompt

    ```text
    write a 1000-word zen story about love
    ```

13. Output

    ```text
    Love, like the rainbow before it, always manages to cover up the darkness with its light. It is a constant reminder of hope, joy and happiness. And as much as it
    brightens our lives, it is often accompanied by pain, heartbreak, disappointment, and betrayal.
    
    In this story, I will be exploring the complexities of love and how they are reflected in different aspects of life. There's always a moment when you find
    yourself falling for someone who is not what you expected or hoped for. The first time it happens, you feel something inside that feels so pure and beautiful.
    You can't help but fall deeper into their embrace, as if they have a special key to the universe, opening up a world of joy and excitement.
    
    ....
    
    
    total duration:       4.466678493s
    load duration:        9.007118ms
    prompt eval count:    48 token(s)
    prompt eval duration: 3ms
    prompt eval rate:     16000.00 tokens/s
    eval count:           1158 token(s)
    eval duration:        4.453s
    eval rate:            260.05 tokens/s
    ```

    

