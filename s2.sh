#!/bin/bash

if [ $# -ne 2 ]; then
	echo Uso:$0 usuario grupo
	exit
fi

#Comprobamos si existe una línea en el fichero passwd que comience con el nombre del usuario que queremos buscar. Los dos puntos son el delimitador que usa el fichero passwd. Las opciones -ql de grep no son imprescindibles pero mejoran la salida y la eficacia del script:
if grep -ql "^$1:" /etc/passwd; then
	echo El usuario $1 existe
else
	echo El usuario $1 no existe
fi

#Hacemos lo mismo con el grupo:
if grep -ql "^$2:" /etc/group; then
	echo El grupo $2 existe
else
	echo El grupo $2 no existe
fi

#Otra opción:
id -u $1 >/dev/null
if [ $? -eq 0 ]; then
	echo El usuario $1 existe
fi

#Por último comprobamos si el usuario pertenece al grupo:
if id -nG "$1" | grep -qw "$2"; then
	echo El usuario $1 pertenece al grupo $2.
	exit 0
else 
	echo El usuario $1 no pertenece al grupo $2.
fi	

