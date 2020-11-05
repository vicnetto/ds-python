# **Shell Script**

Dentro desse markdown, será apresentado algumas anotações sobre o funcionamento do shell e como executar corretamente seus scripts.

## O que é **Shell**?

Basicamente, *Shell* é uma interface de comunicação do usuário com o sistema operacional. *Shell* atualmente causa grandes conflitos, pois pode ser extremamente necessário no manejamento de arquivos e diversos programadores atuais não tem diverso conhecimento sobre o assunto.

Uma das fraquezas do *Shell* são os próprias linhas, que dependendo das execuções, tem demoras extremamente diferentes. Por exemplo o código ```cat /tmp/myfile | grep "mystring"``` é levemente mais lento que a linha ```grep "mystring" /tmp/myfile```, e isso em um laço de loop pode ser muitas vezes decisivo na velocidade de execução.

## Como fazer um **Shell Script**

Primeiramente é necessário indicar qual é o interpretador dos comandos presentes no script, sendo que para o *Shell* é utilizado o:
```bash
#!/bin/bash
```
sendo essa a primeira linha necessária.

Após isso, é possível colocar todos os comandos abaixo desse interpretador, como um terminal do próprio linux.

Agora, é possível fazer algumas coisas diferentes dentro desse ambiente, como utilizar parâmetros e paths, na seguinte forma:

```bash
#!/bin/bash

# Criando uma variável local para armazenar um caminho.
PATH_IMAGES=~/Downloads/images/

# Caso seja necessário utilizar argumentos, é possível colocar o $NUMERO para acessar a variável.
convert $PATH_IMAGES/$1.jpg $PATH_IMAGES/$1.png
```

Por exemplo, esse shell poderia ser inicializado da seguinte forma:

```vim
# Terminal LINUX
bash nome_do_script.sh
```

Existem diversas informações importantes sobre variáveis em **Shell**, como as seguintes:
- É importante o uso de aspas em formatação de strings, pois uma variável armazena uma string e não várias palavras. Por exemplo, o código ```var=Victor Netto``` é diferente de ```var="Victor Netto"```.
- Para realizar a compilação do shell, é sempre iniciado um novo shell interativo, não armazenando as variáveis salvas. Para utiliza-las no novo shell, é necessário dar ```export VAR``` nelas.
- Para trabalhar com o seu próprio shell, é necessário iniciar a compilação dessa forma: ```. ./myshell.sh```.

## Utilizando a lógica **for**

Como todas as outras linguagens, o Shell apresenta suas diferenciações mas não foge muito do funcionamento dos laços de repetição. Sua sintaxe é a seguinte:

> Algumas informações:
- $NUMBER **->** Mostra uma variavel. 
- $# **->** Número de parâmetros.
- $@ **->** Todos os parâmetros em uma string.

```bash
#!/bin/bash

PATH_IMAGES=~/Downloads/images/

# Bem parecido com o Python, nesse caso a diferenciação se dá pelo $@. Nessa variável, é armazenado todos os parâmetros iniciais.
for image in $@
do
    convert $PATH_IMAGES/$1.jpg $PATH_IMAGES/$1.png
done
```

Certamente, esse código não está de 100% vantajoso. Como se trata de um *bash*, podemos utilizar comandos do próprio terminal para realizar as tarefas, que estávamos fazendo até agora. Por isso, podemos alterar o código para o seguinte:

```bash
#!/bin/bash

cd ~/Personal/1-Programming/5-Shell/1-Shell-Learning/imagens-livros/

# Caso não tenha um diretório chamado *png*, essa parte está criando ele.
if [ ! -d png ]
then
	mkdir png
fi

for image in *.jpg
do
    # Uma variável com a utilização do *awk*, para realizar uma separação na string retornada por essa função. Local é para ser uma variável somente dentro do escopo.
	local image_name=$(ls $image | awk -F. '{ print $1 }')
	convert $image png/$image_name.png
done
```

> **É importante notar** que a atribuição para a variável *image_name* foi dada a partir de um **$(CÓDIGO)**, indicando que isso não é apenas um armazenamento, na verdade ele deve manter o retorno da função.

### Criando funções e tratando erros

O processo de criação de funções é extremamente simples, e vem junto com o tratamento de erros, que pode ser utilizado para detectar qual foi o retorno da função. No exemplo abaixo, é chamado uma função e tratado caso tenha algum erro de retorno:

```bash
#!/bin/bash

print_name() {
# Essa variável só será inicializada se existir esse arquivo no diretório ~
VAR=$(ls nome.png)
echo $VAR
}

print_name
if [ $? -eq 0 ]
then
    "Tudo certo, sem erros!"
else
    "Ocorreu um erro na abertura do arquivo"
fi
```

## Realizando uma varredura em arquivos para a transformação

Para realizar uma varredura nos arquivos, será necessário a utilização de funções **recursivas**. Ao entrar em cada pasta, será verificado se é possível fazer a transformação, caso não seja possível, será chamado a função novamente. Para fazer isso podemos fazer o seguinte código:

```bash
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
```














