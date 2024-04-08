#!/bin/sh
export PERFIL=default
export NOMBRE_STREAM=

# usar la version correcta de python
# usar el path correcto del entorno
# usar la version correcta de pip
python -m venv env
source env/bin/activate
pip install boto3
python main.py