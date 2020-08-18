FROM python:3.8-alpine

RUN apk add git --no-cache

RUN apk add --no-cache --upgrade bash

# RUN git clone https://github.com/RDFLib/pyLODE.git

RUN git clone https://github.com/edmondchuc/pylode-inject.git

WORKDIR /pylode-inject/

RUN pip install -r requirements.txt

WORKDIR /pyLODE/src/pylode/

# RUN pip install -r ../../requirements.txt

ADD run_pylode.sh .
ADD generate_rdf.py .

RUN chmod 744 run_pylode.sh

CMD ./run_pylode.sh