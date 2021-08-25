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
- Jupyter 1.0 with Black and lots of [extensions](#jupyter-extensions)

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

Please ensure that the Docker container has sufficient resources.
Go to _Docker Desktop > Preferences > Resources_ and set the number of CPUs to at least half of the
total number available.
Assign at least 4 GB of RAM to the container.
Note that the Jupyter kernel may crash when loading large data sets (into memory).
These settings apply to _all_ local containers.

# Neo4j

Zoose also kicks off a [Neo4j](https://neo4j.com) web server. 
The UI is available at [localhost:7474](https://127.0.0.1:7474).
Please check out [this value stream example](https://databaseline.tech/mapping-a-value-stream-in-neo4j/)
to learn more about Neo4j and Cypher.

If you use Neo4j, please ensure that your Docker container has at least 6 GB of RAM allocated.
This can be configured in the Docker client under 'Resources'.

# Jupyter extensions
The following [Jupyter extensions](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions.html)
come pre-loaded with Zoose:

- Black for cell auto-formatting
- [Code folding](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions/codefolding/readme.html) with Alt-F
- [Code font size](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions/code_font_size/README.html)
- [Comment/uncomment](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions/comment-uncomment/readme.html) lines with Alt-C
- [Configurator](https://github.com/Jupyter-contrib/jupyter_nbextensions_configurator) for customization of extensions
- [Initialization cells](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions/init_cell/README.html), available in _View &rarr; Cell Toolbar &rarr; Initialization Cell_
- Integrated [table of contents](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions/toc2/README.html)
- [Python in Markdown](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions/python-markdown/readme.html), as demonstrated in [notebook versioning](#notebook-versioning)
- [Rubberband](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions/rubberband/readme.html)
- [Scratchpad](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions/scratchpad/README.html), accessible through the upward arrow at the bottom right (near the vertical scroll bar)
- [Skip traceback](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions/skip-traceback/readme.html) to de-clutter the screen upon exceptions
- [Snippets](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions/snippets/README.html), with a few snippets for common imports already pre-defined
- [Spelling checker](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions/spellchecker/README.html)
- [Variable inspector](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions/varInspector/README.html)

# Notebook versioning
As of Zoose 0.1.5, you can include the following line in each of your 
_[trusted](https://jupyter-notebook.readthedocs.io/en/stable/security.html)_ notebooks:

```md
**This notebook has been created with Zoose {{ %env ZOOSE_VERSION }}**
```

Your readers will thank you, as they can now download the correct image to reproduce the notebook,
provided they have the same access to data as you.
Please note that any dynamic Markdown is _not_ rendered as text outside of the Jupyter environment
(e.g. in GitHub).
