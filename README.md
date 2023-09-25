# PHP Raiz e Moderno com Clean Architecture

Olá, pessoal! Eu sou o Madson!

Este repositório foi criado com o propósito de explorar o PHP em sua essência RAIZ, mas de uma forma moderna e atualizada. A ideia é utilizar a última versão do PHP, juntamente com Docker, Docker-Compose e Xdebug no VSCode.

Com esta configuração, temos a capacidade de testar todos os novos recursos do PHP, aplicando boas práticas de Arquitetura e Design de Software.

É interessante notar que temos à disposição o Xdebug no VSCode, permitindo-nos depurar, passo a passo, as novas features do PHP e acompanhar a pilha de execução.

## Sobre o Projeto

Neste projeto, optei por não utilizar nenhum framework por completo. O objetivo principal é implementar a Clean Architecture, e para isso, já estruturei as pastas do projeto de acordo com este propósito.

É crucial destacar que a utilização de frameworks, ou partes deles, é totalmente possível e bem-vinda. Neste primeiro commit, estou utilizando apenas alguns componentes do Symfony para iniciar a arquitetura sem ter que criar tudo do zero. Estou utilizando os componentes de Rotas, Controladores e Respostas do Symfony. Até o Laravel utiliza bastante destes componentes, então decidimos também aproveitar esses recursos.

## Como Usar

O projeto já está todo configurado. 
Para iniciar os serviços, abra um terminal na raiz do projeto e execute o seguinte comando via Makefile:

### Com Makefile
- Para iniciar o Docker Compose: 
```make
make up
```
- Para parar o Docker Compose: 
```make
make down
```
- Para iniciar o Docker Compose em modo detached: 
```make
make up-detached
```
- Para construir as imagens do Docker Compose: 
```make
make build
```

## Rotas para Teste

Inicialmente, temos duas rotas para teste:
- PHP Info: http://0.0.0.0:8090/phpinfo
- Health Check: http://0.0.0.0:8090/health-check

Para adicionar novas funcionalidades, basta criar uma nova rota e os controladores correspondentes.

## Estrutura de Diretórios

A estrutura de diretórios está organizada conforme a Clean Architecture, e cada diretório tem um propósito específico dentro do projeto:

```plaintext
src/
├── Domain/
│   ├── Entities/
│   └── UseCases/
├── Application/
│   ├── Controllers/
│   ├── Presenters/
│   └── Routing/
├── Infrastructure/
│   ├── Database/
│   ├── Frameworks/
│   └── Drivers/
└── Tests/
```

## Configuração do Xdebug no VSCode

1. **Instale a Extensão PHP Debug:**  
   Abra o VSCode, vá até a aba de extensões e procure por "PHP Debug". Instale a extensão fornecida por XDebug.

2. **Configure o arquivo launch.json:**  
   Não precisar criar, já subindo ele configurado juntos com projeto.

3. **Inicie a Sessão de Depuração:**  
    Inicie o seu ambiente de desenvolvimento PHP (por exemplo, docker-compose up).
    Inicie a Sessão de Depuração no VSCode: Vá até a aba "Run" e clique em "Start Debugging" ou simplesmente pressione F5.
    Agora, o VSCode deverá estar escutando conexões do Xdebug. Quando você acessar a sua aplicação PHP no navegador, o Xdebug deverá conectar-se ao VSCode, e você poderá começar a depurar o seu código PHP informando os breakpoints nos arquivos.

## Repo do projeto 
- [Github]()

## Contato

- [LinkedIn](https://www.linkedin.com/in/madson-aguiar-rodrigues-5650472b/)
- [YouTube](https://www.youtube.com/@MadsonAguiarRodrigues)

## Conclusão
Este projeto é um ponto de partida para explorar o PHP de uma forma moderna e estruturada, utilizando boas práticas de arquitetura e design de software. Sinta-se à vontade para explorar, contribuir e, claro, entrar em contato se tiver alguma dúvida ou sugestão!