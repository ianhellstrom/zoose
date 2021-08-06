# What is Zoose?

> Jupyter is to Jupiter as Zoose is to Zeus.

Zoose is a [Docker container image](https://hub.docker.com/repository/docker/databaseline/zoose) for
Jupyter notebooks pre-loaded with common Python packages as well as a Neo4j web server for graph
analytics with Cypher.
Containerized notebooks with a standard set of packages make sharing and reproducing notebooks
easier: no need for virtual environments and brittle configurations that break on Python upgrades.

# What is included?

- Neo4j Community Edition 4.3
- Python 3.9 
- Jupyter 1.0 with Black

Python packages:
- Beautiful Soup 4.9
- Keras 2.4
- Matplotlib 3.4
- NLTK 3.6
- Numpy 1.21
- Pandas 1.3 with Google BigQuery 0.15
- py2neo 2021.1.5
- Requests 2.26
- SciPy 1.7
- Scikit-learn 0.24
- Scrapy 1.0
- Seaborn 0.11
- StatsModels 0.12
- spaCy 3.1

# How to use?

Execute `./zoose.sh`, which launches both a Jupyter notebooks session.
Please use the link from the command line to access it, as it requires a token.

If you do not want to `git clone` the repo, you can use the public Docker image:

```bash
docker run --rm -it \
  -v $(pwd):$(pwd) -w $(pwd) 
  -p 8888:8888 -p 7473:7373 -p 7474:7474 -p 7687:7687 
  "databaseline/zoose"
```

# Neo4j

Zoose also kicks off a [Neo4j](https://neo4j.com) web server. 
The UI is available at [localhost:7474](https://127.0.0.1:7474).
Please check out [this value stream example](https://databaseline.tech/mapping-a-value-stream-in-neo4j/)
to learn more about Neo4j and Cypher.
