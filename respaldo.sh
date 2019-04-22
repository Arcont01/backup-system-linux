#!/bin/bash
cont=0
$(mkdir $HOME/Escritorio/RESPALDO)
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for i in $(find $HOME -not -path "*/.*" -a -type f -iname "*.xlsx" -o -iname "*.docx" -o -iname "*.c" -o -iname "*.pptx" -o -iname "*.pdf" -o -iname "*.cpp" -o -iname "*.c++" -o -name "*.sh" -a ! -name "respaldo.sh"); do
	fichero=${i##*/}
	if [ ! -f $HOME/Escritorio/RESPALDO/$fichero ]; then
		$(cp $i $HOME/Escritorio/RESPALDO/)
		$(rm $i)
	else
		$(cp $i $HOME/Escritorio/RESPALDO/$cont$fichero)
		$(rm $i)
		((cont++))
	fi
done
$(tar -cC $HOME/Escritorio RESPALDO | bzip2 > $HOME/Escritorio/$(date +%d-%m-%Y).tar.bz2)
$(rm -r $HOME/Escritorio/RESPALDO)
IFS=$SAVEIFS
