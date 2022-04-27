[![Master CI](https://github.com/ianhellstrom/zoose/actions/workflows/merge.yml/badge.svg)](https://github.com/ianhellstrom/zoose/actions/workflows/merge.yml)
[![PR CI](https://github.com/ianhellstrom/zoose/actions/workflows/pull.yml/badge.svg)](https://github.com/ianhellstrom/zoose/actions/workflows/pull.yml)

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
- R 4.0.4
- Jupyter Lab 3.3.4 with extensions

Python packages:
- Beautiful Soup 4.9
- Gower 0.0.5
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

R packages:
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
Please use the link from the command line to access it, as it requires a token.

If you do not want to `git clone` the repo, you can use the public Docker image:

```bash
docker run --rm -it \
  -v $(pwd):$(pwd) -w $(pwd) 
  -p 8888:8888 -p 7473:7373 -p 7474:7474 -p 7687:7687 
  "databaseline/zoose"
```

Please ensure that the Docker container has sufficient resources.
Go to _Docker Desktop > Preferences > Resources_ and set the number of CPUs to at least half of the
total number available.
Assign at least 4 GB of RAM to the container.
Note that the Jupyter kernel may crash when loading large data sets (into memory).
These settings apply to _all_ local containers.

If you use Zoose with BigQuery often, you may want to preserve credentials.
You can do so by adding `-v $(pwd)/.config:/root/.config/pandas_gbq/` to the command above.
Just make sure you ignore `.config` and do not share your personal credentials in a git repository!

# Neo4j

Zoose also kicks off a [Neo4j](https://neo4j.com) web server. 
The UI is available at [localhost:7474](https://127.0.0.1:7474).
Please check out [this value stream example](https://databaseline.tech/mapping-a-value-stream-in-neo4j/)
to learn more about Neo4j and Cypher.

If you use Neo4j, please ensure that your Docker container has at least 6 GB of RAM allocated.
This can be configured in the Docker client under 'Resources'.

# What is new?
As of 1.0.0, Zoose is based on JupyterLab instead of the classic Jupyter experience.
This means, among others, that it offers code completion, refactoring capabilities, autoformatting, 
and git integration (incl. diffs) out of the box.

## Deprecations
### Scratchpad
If you relied on the [scratchpad extension](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions/scratchpad/README.html), 
that is not available any longer because of the migration to JupyterLab.
You can, however, have a similar experience with JupyterLab, too.
Just open a Python console and share the notebook kernel with the console (Kernel &rarr; Change Kernel...).
That way, you can reference objects from the notebook in the JupyterLab console.

### Initialization cells
[Initialization cells](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions/init_cell/README.html)
are gone, as these are [not supported](https://github.com/jupyterlab/jupyterlab/issues/7620) by
JupyterLab.
[Scenes](https://github.com/schmidi314/jupyterlab-scenes), a partial replacement, is included, 
although there is no automatic migration path available.

### Dynamic markdown
[Dynamic markdown](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions/python-markdown/readme.html)
has been deprecated.
It did not render properly outside JupyterLab in, say, GitHub anyway.
No replacement is available or planned.

### Snippets
[Snippets](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions/snippets/README.html) are gone.
A [replacement](https://github.com/QuantStack/jupyterlab-snippets) is not planned for inclusion.
