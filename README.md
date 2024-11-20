# Ollama_CURC
Set of instructions to install Ollama models and running it over CURC


The default installation instructions provided by software libraries and frameworks are often meant for personal computers rather than a shared environment like Alpine. To deal with these limitations, these are some of the documentation that discuss CURC software module system, how to compile software, and working with Containers.  

Module System: https://curc.readthedocs.io/en/latest/compute/modules.html
Compiling Software: https://curc.readthedocs.io/en/latest/compute/compiling.html 
Containerization: https://curc.readthedocs.io/en/latest/software/Containerization.html

Now, for running Ollama on on Alpine cluster, CURC does recommend downloading and running the pre-compiled binaries provided by the creators of Ollama. This removes the need to install software into directories, like /usr , which you generally people don't not have access to. These are some of the set of instructions that one can use to download and run the Ollama binaries initially:

Step 1 - Download and prepare binaries. Downloading v0.4.2 which is the latest version of Ollama

acompile --ntasks=4 --time=01:00:00
export ollama_v="v0.4.2"
mkdir -p /projects/$USER/$ollama_v
cd /projects/$USER/$ollama_v 

#grab ollama binary version
curl -L https://github.com/ollama/ollama/releases/download/${ollama_v}/ollama-linux-amd64.tgz -o ollama

#unzip the binary version
tar -xvzf .tar.gz

#make binary executable 
chmod +x ollama

#End acompile session
exit

Now, you can start up an ollama server in an sinteractive session on Alpine if you want to run it on CPU and a_testing partition if we want to run on GPU
Note: Verify the bin location once and adjust the PATh variable below

For CPU, run the following commands:
- sinteractive --partition=amilan --time=00:20:00 --nodes=1 --ntasks=8
- export ollama_v="v0.4.2"; export PATH="$PATH:/projects/$USER/ollama/$ollama_v/bin"; export OLLAMA_TMPDIR="$SCRATCHDIR/$USER/ollama_temp"; export OLLAMA_HOST="0.0.0.0:9999"; export OLLAMA_MODELS="/projects/$USER/my_ollama_models"; export OLLAMA_NUM_PARALLEL=1; export OLLAMA_MAX_LOADED_MODELS=1
- mkdir -p $OLLAMA_TMPDIR; mkdir -p $OLLAMA_MODELS
- nohup ollama serve > /dev/null 2>&1 &
- ollama run llama3.2

The above should take 4-5 mins for model to load and run. For running this fastly, let us run this over a_testing partition for running on GPU:
- sinteractive --partition=atesting_a100 --gres=gpu:1 --time=00:20:00 --nodes=1 --ntasks=8
- export ollama_v="v0.4.2"; export PATH="$PATH:/projects/$USER/ollama/$ollama_v/bin"; export OLLAMA_TMPDIR="$SCRATCHDIR/$USER/ollama_temp"; export OLLAMA_HOST="0.0.0.0:9999"; export OLLAMA_MODELS="/projects/$USER/my_ollama_models"; export OLLAMA_NUM_PARALLEL=1; export OLLAMA_MAX_LOADED_MODELS=1
- nohup ollama serve > /dev/null 2>&1 &
- ollama run llama3.2

This should run fastly and load quickly. Note that the timing for getting alloted for a job on NVIDIA server will take a lot of time(Atmost 1-2 hours sometimes), so pick some odd times for running the Ollama models. I usually run this in night time around 11-12 PM and find it getting alloted quite easily, maybe due to less people working at this hour. To avoid this, Blanca clusters can be something to look forward to.

