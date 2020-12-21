declare -i total
declare -i totalf

if [ $# -ne 1 ]; then
echo Uso: $0 directorio
exit
fi

if [ ! -d $1 ]; then
echo -e "Uso: $0 directorio\n El parámetro debe ser un directorio\n"
exit
fi

# listar contenido del directorio:
ls $1

#Contar ficheros y directorios:
total=`ls -l $1|wc -l`
total=$total-1
echo -e "Total de ficheros más directorios: $total."

#Ficheros que comienzan por a:
totalf=0
for i in `ls $1/a*`; do
	if [ -f $i ]; then
	       	totalf=$totalf+1
	fi	
done
echo -e "Ficheros que comienzan por a: $totalf."
