#!/bin/bash
neo4j start && jupyter lab --ip 0.0.0.0 --port=8888 --allow-root --no-browser
