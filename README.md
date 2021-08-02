# What is Zoose?

Zoose is a Docker container image for Jupyter notebooks pre-loaded with common Python packages
as well as a Neo4j web server for graph analytics with Cypher.
What Jupyter is to Jupiter, Zoose is to Zeus.

# What is included?

- Neo4j Community Edition 4.3
- Python 3.9 
- Jupyter 1.0 with Black
- Matplotlib 3.4
- Numpy 1.21
- Pandas 1.3 with Google BigQuery 0.15
- Scikit-learn 0.24
- SciPy 1.7
- Seaborn 0.11
- Statsmodels==0.12

# How to use?

Execute `./zoose.sh`, which launches both a Jupyter notebooks session.
Please use the link from the command line to access it, as it requires a token.

# Neo4j

Zoose also kicks off a Neo4j web server. 
The UI is available at [localhost:7474](https://127.0.0.1:7474).
