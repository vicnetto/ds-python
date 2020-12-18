# :leaves: Spring Framework :leaves:
:fire: **Spring** é um framework que facilita o desenvolvimento do aplicativo, pulando algumas etapas de configuração de um projeto. Na verdade essas configurações são feitas por de baixo dos panos pelo framework, não sendo "puladas". 
> Uma informação importante é que Spring trata-se de uma **dependência**, sendo basicamente uma biblioteca externa do ambiente Java (JKD/JRE).

## 	Quais as vantagens do Spring Boot?

- Ele configura os projetos a partir de convenções do projeto.
- Já apresenta as convenções das dependências mais seguras.
- Já tem um servidor embarcado (Apache Tomcat).
- Deixa sempre o *pom.xml* sempre organizado.
- Ajuda com tarefas do dia a dia, com o *devtools*.
- Apresenta uma junção com o *LiveReload*.
- Ajuda com as métricas da aplicação, utilizando a dependência *Actuator*.
- Não sabe de onde vem os dados, somente faz suas aplicações.

E o melhor disso, é que ele faz tudo isso sem adicionar nenhuma linha de código! :trophy:

## Quais são os projetos do Spring Framework?

Alguns deles são:

- **Spring MVC** :arrow_forward: É o cavalo de guerra para fazer aplicações baseadas em web. É o framework mais comum para buildar aplicações web baseadas em Java atualmente.
- **Spring Data** :arrow_forward: Foca em fazer persistência com armazenamento de dados.
- **Spring Security** :arrow_forward: Faz a parte de segurança.
- **Spring Boot** :arrow_forward: É um framework de desenvolvimento rápido de aplicações, que rapidamente já faz você utilizar o Spring.
- **Spring Integration** :arrow_forward: A integração deixa mais fácil a introdução baseado na sua aplicação.

## Inicializando o Spring

Primeiramente como organização de código, é sempre importante deixar os arquivos do seu projeto "IDE Agnostic", sem pertencimento a nenhum tipo de IDE. Assim, dependendo do usuário, irá utilizar a sua IDE preferida e que mais se encaixa ao seu projeto.

Para inicializar esse projeto em diferentes IDE's, é necessário o **Apache Maven**. A ferramenta de automação tem como objetivo instalar todas as dependências utilizadas no projeto, para facilitar o processo de build.

Para inicializa-lo via **IntelliJ** é necessário usar uma ferramenta online [Spring Initializr](https://start.spring.io/). Esse programa gerará a versão basica do Spring para ser usado. Ao utilizar a ferramenta, é necessário fazer o download do projeto e pelo *IntelliJ*, criar um projeto com fontes já existentes.

## O que é *Dependency Injection*?

É um método de acoplamento entre diferentes classes em um programa. Nessa solução as dependências não são declaradas programaticamente, mas sim por um programa que fica responsável por "injetar" em cada componente suas dependências declaradas, em tempo real de código.

O grande objetivo da injeção de dependências é manter o baixo acoplamento entre as classes, tornando o código mais independente.

Devido a isso ocorre a *Inversão de Controle*, onde basicamente quem tem controle das dependência é o framework.

**EM RESUMO:** A injeção de dependências ocorre pelo código enquanto a inversão de controle ocorre em tempo real de código, sendo controlado pela framework.

###  Existem alguns tipos de *Dependency Injection*, entre eles:

- **Constructor Based**, onde a classe não pode ser instanciada sem suas dependências. Isso significa que quando a classe é chamada, recebe por um construtor uma instância da classe que ela irá utilizar.
-  **Setter Based**, preferível para aplicações Spring, um pouco mais flexível que a primeira.

Em geral, existe uma discussão entre qual das duas é preferível, porém a **Interface Based** acaba sendo mais utilizada para deixar o CRUD mais ajeitado, sendo sempre necessário a declaração das funções novamente caso use a interface.

## E o que o Spring faz com essa injeção?

O objetivo do framework é automatizar esse processo manual. Por isso é necessário entender e como configurar corretamente os pontos de injeção.

### Para isso existem alguns comandos:
 - **@Autowired** :arrow_forward: Serve para marcar pontos de injeção dentro da classe.
	- Para que uma classe seja injetada, é necessário ela ser um **bean Spring**.
 - **@Component** :arrow_forward: Gera um novo bean genérico Spring.
	- Tem algumas especializações, filhas de @Component: @Respository, @Service e @Controller.
		- @Repository é para os *DAO's* (*Data Access Object*). É usado na camada de persistência.
		- @Service é para a camada de serviço.
		- @Controller é para a apresentação (*Spring-MVC*).
 - **@Qualifier** :arrow_forward: É utilizado para qualificar as classes e diferencia-las, no caso de utilização de interfaces.

## Diferenciando serviços com o **application.properties**

Quando existem dois serviços utilizando a mesma interface, o **Spring** não consegue escolher uma opção entre duas implementações, e por isso é necessário utilizar as propriedades do *Spring*. Primeiramente, é necessário identificar cada implementação, com a tag **@Profile("*name*")**, logo abaixo da declaração como componente.

É importante saber que o **name** pode ser substituído por **default**, para deixar como padrão uma opção, evitando erros futuros na falta de uma configuração. E também é possível passar uma lista de *nomes*, na seguinte forma: **@Profile({"*default*", "*name*"})**.

Ao realizar tal tarefa, é necessário declarar qual *perfil* estará ativo, com o código `spring.profiles.active=name` dentro do **application.properties**.

> Caso queira deixar sua compilação mais legível, utilize `spring.output.ansi.enabled=ALWAYS` no **application.properties** para apresentar cores.

## Classes de configuração para Spring

As classes de configuração são utilizadas para definir **beans** em classes que não existe acesso ao código fonte, as famosas "third-party libraries", como o próprio *hibernate*. Para isso é necessário declarar uma classe de configuração, com o **@Configuration** e implementar funções que retornem uma instância da classe, todas com a tag **@Bean**.


## Comandos importantes

- **@ComponentScan("*package*")** :arrow_forward: Busca por componentes em um certo pacote passado por parâmetro.
- **@Primary** :arrow_forward: Define um *bean* como primário, sendo procurado antes que os outros.
- **@Qualifier *name*** :arrow_forward: Coloca um *bean* como preferencial.
