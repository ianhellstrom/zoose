[![Master CI](https://github.com/ianhellstrom/zoose/actions/workflows/merge.yml/badge.svg)](https://github.com/ianhellstrom/zoose/actions/workflows/merge.yml)
[![PR CI](https://github.com/ianhellstrom/zoose/actions/workflows/pull.yml/badge.svg)](https://github.com/ianhellstrom/zoose/actions/workflows/pull.yml)

# What is Zoose?

> Jupyter is to Jupiter as Zoose is to Zeus.

Zoose is a [Docker container image](https://hub.docker.com/repository/docker/databaseline/zoose) for
Jupyter notebooks pre-loaded with common Python packages as well as a Neo4j web server for graph
analytics with Cypher.
Containerized notebooks with a standard set of packages make sharing and reproducing notebooks
easier: no need for virtual environments and brittle configurations that break on Python upgrades.

## Flavours
Zoose comes in a few flavours: `base`, `neo4j`, and `quantum`.
What is included in `base` is always included in the rest, too.

### Zoose Base
- Python 3.10
- JupyterLab 3.4.5 with extensions

Python packages:
- Beautiful Soup 4.11
- Gower 0.0.5
- Keras 2.9
- Matplotlib 3.5
- NLTK 3.7
- Numpy 1.23
- Pandas 1.4 with Google BigQuery 0.17
- Prince 0.7  
- Requests 2.28
- SciPy 1.9
- Scikit-learn 1.1
- Scrapy 1.0
- Seaborn 0.11
- StatsModels 0.13
- spaCy 3.4

### Zoose Neo4j
Zoose Neo4j includes everything from Zoose Base as well as:
- Neo4j Community Edition 4.4
- py2neo 2021.2.3

### Zoose Quantum
Zoose Quantum includes everything from Zoose Base as well as:
- Cirq 1.0
- cuQuantum 22.7
- PennyLane 0.25 with Cirq, Stawberry Fields, and Qiskit plugins
- Qiskit 0.37
- Strawberry Fields 0.23

### Zoose R (temporarily disabled)
Zoose R includes everything from Zoose Base as well as:
- R 4.1.2
- arrow
- bigrquery
- caret
  lubridate
- randomForest
- reshape
- tidymodels 
- tidyverse 

# How to use?
Execute `./zoose.sh`, which launches a Jupyter notebooks session.
By default it launches Zoose Base.
If you want Neo4j or Quantum, just use `./zoose.sh neo4j` or `./zoose.sh quantum` instead.

Please use the link from the command line to access it, as it requires a token.

If you do not want to `git clone` the repo, you can use the public Docker image:

```bash
docker run --rm -it \
  -v $(pwd):$(pwd) -w $(pwd) \
  -p 8888:8888 \ 
  "databaseline/zoose-base"
```

Please ensure that the Docker container has sufficient resources.
Go to _Docker Desktop > Preferences > Resources_ and set the number of CPUs to at least half of the
total number available.
Assign at least 4 GB of RAM to the container.
Note that the Jupyter kernel may crash when loading large data sets (into memory).
These settings apply to _all_ local containers.

## BigQuery credentials
If you use Zoose with BigQuery often, you may want to preserve credentials.
You can do so by adding `-v $(pwd)/.config:/root/.config/pandas_gbq/` to the command above.

Just make sure you ignore `.config` and do not share your personal credentials in a git repository!

## IBMQ credentials
If you use Zoose Quantum with Qiskit often, you may want to preserve IBMQ credentials.
You can do so by adding `-v $(pwd)/.qiskit:/root/.qiskit` to the command above.
You need to execute `IBMQ.save_account(...)` from Zoose Quantum once to save the credentials.
Afterwards, you can execute `IBMQ.load_account()`, provided you have mounted the `.qiskit` volume prior to launching Zoose Quantum.

Just make sure you ignore `.qiskit` and do not share your API token in a git repository!

# Neo4j
Zoose also kicks off a [Neo4j](https://neo4j.com) web server. 
The UI is available at [localhost:7474](https://127.0.0.1:7474).
Please check out [this value stream example](https://databaseline.tech/mapping-a-value-stream-in-neo4j/)
to learn more about Neo4j and Cypher.

If you use Neo4j, please ensure that your Docker container has at least 6 GB of RAM allocated.
This can be configured in the Docker client under 'Resources'.

# What is new?
## 2.0
- With Zoose 2.0 comes a setup with `docker compose` that splits Zoose into different flavours: `base`, `neo4j`, `quantum`, and `r`. This makes it easier to manage and users who have no need of Neo4j, quantum libraries, or R, do not need these included.
- Python has been upgraded to 3.10, and various packages have also been upgraded to the latest versions.
- The R kernel has been dropped _temporarily_ for 2.0 due to lack of popular demand and because the kernel crashes frequently. The cause of this issue is to be investigated.
