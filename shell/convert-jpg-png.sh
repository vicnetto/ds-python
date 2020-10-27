
#!/bin/bash

image_convert() {
cd ~/Personal/1-Programming/5-Shell/1-Shell-Learning/imagens-livros/

if [ ! -d png ]
then
	mkdir png
fi

for image in *.jpg
do
	local image_name=$(ls $image | awk -F. '{ print $1 }')
	convert $image png/$image_name.png
done
}

image_convert 2>errors.txt
if [ $? -eq 0 ]
then 
	echo "Converted with success!"
else
	echo "Failed to convert the file!"
fi
