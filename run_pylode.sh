#!/usr/bin/env bash

# Run pylode.
echo "Running pyLODE"
python3 cli.py -i input/${ONTOLOGY_FILE} ${OPTIONS}

echo "Renaming pyLODE output file doc.html to index.html"
mv input/doc.html input/index.html
echo

# Run ontology diagram generator
echo "Running ontology diagram generator"
echo "PlantUML output: "
python3 /ontology_diagram_generator/app.py input/${ONTOLOGY_FILE} input/${ONTOLOGY_FILE}
echo 

# Run PlantUML
echo "Running PlantUML JAR"
java -jar /ontology_diagram_generator/plantuml.jar -tsvg input/${ONTOLOGY_FILE}.txt

# Run pylode-inject.
echo "Running pylode-inject"
python3 /pylode-inject/pylode_inject.py input/pylode_inject.yml input/index.html input/index.html