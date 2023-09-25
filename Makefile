# Definindo o 'init-script' para executar o script init-local.sh
init-script:
	@echo "Executando o script start..."
	@sh ./docker/scripts/init-local.sh

up: init-script
	@echo "Iniciando o Docker Compose..."
	@docker-compose up

down: init-script
	@echo "Parando os contêineres do Docker Compose..."
	@docker-compose down

up-detached: init-script
	@echo "Iniciando o Docker Compose em modo detached..."
	@docker-compose up -d

up-build: init-script
	@echo "Construindo as imagens do Docker Compose..."
	@docker-compose up --build