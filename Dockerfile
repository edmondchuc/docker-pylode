FROM python:3.8-alpine

RUN apk add git --no-cache

RUN apk add --no-cache --upgrade bash

RUN git clone https://github.com/RDFLib/pyLODE.git

RUN git clone https://github.com/edmondchuc/pylode-inject.git

RUN git clone https://github.com/edmondchuc/ontology_diagram_generator.git

# Required by PlantUML
RUN apk add openjdk8-jre fontconfig ttf-dejavu --no-cache
RUN apk add graphviz --no-cache

WORKDIR /ontology_diagram_generator/

RUN pip install -r requirements.txt

WORKDIR /pylode-inject/

RUN pip install -r requirements.txt

WORKDIR /pyLODE/src/pylode/

RUN pip install -r ../../requirements.txt

ADD run_pylode.sh .
ADD generate_rdf.py .

RUN chmod 744 run_pylode.sh

CMD ./run_pylode.sh