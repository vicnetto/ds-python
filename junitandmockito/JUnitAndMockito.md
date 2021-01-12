# Java Unit Testing with JUnit & Mockito

Testes são necessários. Utilizando testes, erros podem ser previstos e corrigidos sem dor de cabeça. Por isso, existem duas ferramentas extremamente importantes para testes: **JUnit e Mockito**.

O objetivo das ferramentas é evitar o teste manual de classes, funções e métodos, realizando funções próprias de teste para as ferramentas.

>  **Unit Testing** é realizar testes em um conjunto de métodos específicos, ou somente um método se for o caso.

## UnitTesting com JUnit

**Informações:**
- O seu código de teste nunca deve estar misturado com o seu código fonte. Misturando com o código fonte, os testes serão executados em toda compilação, o que está incorreto.
- Não é bom ter dois testes em uma mesma função de teste.
- O teste sempre deve ser ``public void {...}``,  qualquer outro formato não será rodado.
- Logicamente um bom teste é aquele que passa, mas não só isso, é também aquele que falha quando está errado.
- Utilizar **test** na frente no nome da função é apenas uma convenção, isso ocorre pois nas antigas versões do *Java*, era necessário colocar para diferenciar, pois não existia a tag **@Test**.
	- É possível ainda colocar parâmetros na tag, por exemplo esperando que uma exceção aconteça. *Ex.:* **@Test** (expect = *NullPointerException*). Caso não ocorra a a exceção, será dado como teste falho. 
	- Outro parâmetro é o **@Test** (timeout = *time in milisseconds*). Isso executa o teste, e caso passe desse tempo o teste começará  a ser falho.
- A tag **@Before** é associada a uma função de configuração, que vai ser executada todo começo de teste. E consecutivamente, a tag **@After** é executada todo fim de teste. Ou seja, caso existam 5 testes, existirão 5 chamadas para o **@Before** e para o **@After**.
	- O *Before* é extremamente utilizado para setups.
	- Já o *After* é utilizado em casos de chamadas de banco de dados, para fechar a conexão com o banco.
- Existe também o **@BeforeClass** e o **@AfterClass** que se diferem por alguns motivos. Diferentemente do *Before* e do *After*, esses são executados apenas **uma** vez durante a execução dos testes, no começo e no final.
	- Ainda é preferível utilizar o *Before* e o *After*, a não ser que exista algum problema de performance.
- Uma ferramente importante são as **Suite Classes**. Nela é possível fazer somente alguns testes serem executados. Isso tem uma ótima aplicação, pois caso existam testes de performance, que não são necessários ser executados o tempo inteiro, seria importante realizar uma *Suite Class*. 

## Mockito

O que é Mockito? Para que serve?

**Informações:**
- Os *Services* são dependências, enquanto as *BusinessImpl* são **SUT** (*System Under Test*).
- Uma **STUB** é basicamente uma implementação da interface *Service*, utilizada somente para *Unit Testing*. Faz alguns testes de caso somente para teste.
	- *Stub's* não são muito utilizadas. Isso ocorre pois como é uma implementação de um *Service*, a toda mudança é necessária uma alteração na *Stub*, sendo muito complicado manter o código.
- **Mocking** é criar objetos que simulam o comportamento de objetos reais. Diferentemente de *Stubs*, *Mocks* são dinamicamente criadas em código, em *runtime*. 
- Após entender o funcionamento do **Mocking**, é importante conhecer o BDD -- **Behavior Driven Development**. Basicamente, separa todo o seu código *Mock* em **Given** (executa todo o setup) , **When** (realiza a chamada de algumas funções) e **Then** (faz os devidos testes).

É importante saber alguns comandos utilizados pelo Mockito, como:
- **mock** (*ClassName*.class).
- **when** (*method*).**thenReturn** (*return value*) ou **given** - **willReturn**
	- **when** (*method*).**thenThrow** (*exception*).
- **anyInt()**.
- **assertThat** (*method*, **is**(*value*) ).
- **verify**(*service*).*function*(*parameter*),
	- **verify**(*service*, **times**(*Integer*)).*function*(*parameter*),
	- **verify**(*service*, **never**() ).*function*(*parameter*).
	- **verify**(*service*, **atLeast**(*value*) ).*function*(*parameter*).
	- **then**(*service*).**should**(*shouldFunction*).*function*(*parameter*).
- **ArgumentCaptor**<*Type*> ac = **ArgumentCaptor**.forClass(*ClassName*.class).

Também existem os comandos do **Hamcrest**, como:
- **assertThat**(*listName*, **hasSize**(4));
	- **assertThat**(*listName*, **hasItems**(100, 101));
	- **assertThat**(*listName*, **everyItem**(**greaterThan**(90)));
	- **assertThat**(*listName*, **everyItem**(**lessThan**(200)));

> É possível ver todos os comandos de um .jar utilizando o **Ctrl + O** ao clicar em uma função do arquivo .jar.
