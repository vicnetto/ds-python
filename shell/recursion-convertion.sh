#!/bin/bash

sweep_all_files () {

cd $1

for archive in *
do
	local path=$(find ~/Personal/1-Programming/5-Shell/1-Shell-Learning/3-Imagens-Novos-Livros/ -name $archive)

	if [ -d $path ]
	then
		sweep_all_files $path
	else
		local name=$(echo $path | awk -F. '{ print $1 }')
		convert ${name}.jpg ${name}.png
	fi
done
}

sweep_all_files ~/Personal/1-Programming/5-Shell/1-Shell-Learning/3-Imagens-Novos-Livros/
if [ $? -eq 0 ]
then
	echo "Success!"
else
	echo "Failure in the process"
fi
