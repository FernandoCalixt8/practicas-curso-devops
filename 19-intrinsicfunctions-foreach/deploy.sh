#!/bin/sh
export LISTA_SUFIJOS=errores,logs,imagenes
export NOMBRE_PROYECTO=

# deploy
aws cloudformation deploy \
--template-file template.yaml \
--parameter-overrides \
    NombreProyecto=$NOMBRE_PROYECTO \
    ListaSufijos=$LISTA_SUFIJOS \
--stack-name $NOMBRE_PROYECTO