[![Master CI](https://github.com/ianhellstrom/zoose/actions/workflows/merge.yml/badge.svg)](https://github.com/ianhellstrom/zoose/actions/workflows/merge.yml)
[![PR CI](https://github.com/ianhellstrom/zoose/actions/workflows/pull.yml/badge.svg)](https://github.com/ianhellstrom/zoose/actions/workflows/pull.yml)

# What is Zoose?

> Jupyter is to Jupiter as Zoose is to Zeus.

Zoose is a [Docker container image](https://hub.docker.com/repository/docker/databaseline/zoose-base) for
Jupyter notebooks pre-loaded with common Python packages as well as a Neo4j web server for graph
analytics with Cypher.
Containerized notebooks with a standard set of packages make sharing and reproducing notebooks
easier: no need for virtual environments and brittle configurations that break on Python upgrades.

## Flavours
Zoose comes in a few flavours: `base`, `neo4j`, `pytorch`, and `quantum`.
What is included in `base` is always included in the rest, too.

### Special flavours
There are also two special flavours suitable for use with [Gitpod](https://gitpod.io), an IDE as a Service:
- `base-gitpod`
- `pytorch-gitpod`
- `quantum-gitpod`

To get started with these special flavours for Gitpod, please use the [template](https://github.com/ianhellstrom/zoose-gitpod) to create a repository that you use to spin up a [workspace](https://www.gitpod.io/docs/introduction/getting-started) from that repo.

In Gitpod, you have two options for Zoose notebooks:
1. A VSCode experience
2. JupyterLab, which you can start from the Gitpod workspace terminal with `/jupyter.sh`.

### Zoose Base
- Python 3.10
- JupyterLab 3.5.0 with extensions

Python packages:
- Beautiful Soup 4.11
- Gower 0.0.5
- Keras 2.10
- Matplotlib 3.6
- NLTK 3.7
- Numpy 1.21
- Pandas 1.5
- Prince 0.7  
- Requests 2.28
- SciPy 1.9
- Scikit-learn 1.1
- Scrapy 2.7
- Seaborn 0.21
- StatsModels 0.13
- spaCy 3.4

### Zoose Neo4j
Zoose Neo4j includes everything from Zoose Base as well as:
- Neo4j Community Edition 4.4
- py2neo 2021.2.3

### Zoose PyTorch
Zoose PyTorch includes everything from Zoose Base as well as:
- PyTorch 1.13
- PyTorch Audio 0.13 (CPU)
- PyTorch Text 0.13 (CPU)
- PyTorch Vision 0.13 (CPU)

### Zoose Quantum
Zoose Quantum includes everything from Zoose Base as well as:
- Amazon Braket SDK 1.33
- Cirq 1.0
- cuQuantum 22.7
- OpenFermion 1.5
- PennyLane 0.25 with plugins for Cirq, Stawberry Fields, Qiskit
- pytket 1.8
- Qiskit 0.39
- QuTiP 4.7
- Strawberry Fields 0.23

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
BigQuery support has been dropped from the base image in 3.1.
You can install `pandas_gbq` and `google.auth` easily from within a notebook with `pip`: `! pip install pandas_gbq`.

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
