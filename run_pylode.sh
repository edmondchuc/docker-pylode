#!/usr/bin/env bash

# Run pylode.
echo "Running pyLODE"
# python3 cli.py -i input/${ONTOLOGY_FILE} ${OPTIONS}
pip3 install pylode
pylode -i input/${ONTOLOGY_FILE} ${OPTIONS} > input/index.html

# echo "Renaming pyLODE output file doc.html to index.html"
# mv input/doc.html input/index.html
# echo

# Run ontogram
echo "Running Ontogram - diagram generator"
pip3 install ontogram
ontogram input/${ONTOLOGY_FILE}

# Run pylode-inject.
echo "Running pylode-inject"
python3 /pylode-inject/pylode_inject.py input/pylode_inject.yml input/index.html input/index.html

# Output the ontology in different RDF serialisations - (input: Turtle, output: RDF/XML, JSON-LD, N-Triples, Notation3)
echo "Creating additional RDF serialisations of the ontology"
pip3 install rdflib-jsonld
python3 generate_rdf.py input/${ONTOLOGY_FILE} input/