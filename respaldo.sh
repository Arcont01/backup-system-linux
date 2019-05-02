#!/bin/bash
cont=0
$(mkdir ~/Escritorio/RESPALDO)
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for i in $(find ~ -not -path "*/.*" -a -type f -iname "*.xlsx" -o -iname "*.docx" -o -iname "*.c" -o -iname "*.pptx" -o -iname "*.pdf" -o -iname "*.cpp" -o -iname "*.c++" -o -name "*.sh" -a ! -name "respaldo.sh"); do
	fichero=${i##*/}
	if [ ! -f ~/Escritorio/RESPALDO/$fichero ]; then
		$(cp $i ~/Escritorio/RESPALDO/)
		$(rm $i)
	else
		$(cp $i ~/Escritorio/RESPALDO/$cont$fichero)
		$(rm $i)
		((cont++))
	fi
done
$(tar -cC ~/Escritorio RESPALDO | bzip2 > ~/Escritorio/$(date +%d-%m-%Y).tar.bz2)
$(rm -r ~/Escritorio/RESPALDO)
IFS=$SAVEIFS
