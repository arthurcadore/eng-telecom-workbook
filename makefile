# Nome do ambiente virtual
VENV_DIR=venv

# Comando do Python (use python3 se necessário)
PYTHON=python3

# Arquivo de dependências
REQUIREMENTS=requirements.txt

# Alvo principal
all: venv install

# Criar o ambiente virtual
venv:
	@echo "Criando ambiente virtual em $(VENV_DIR)..."
	python3 -m venv $(VENV_DIR)

# Instalar as dependências
install: venv
	@echo "Instalando dependências de $(REQUIREMENTS)..."
	@$(VENV_DIR)/bin/pip install --upgrade pip
	@$(VENV_DIR)/bin/pip install -r $(REQUIREMENTS)

# Limpar arquivos e diretórios gerados
clean:
	@echo "Removendo ambiente virtual..."
	@rm -rf $(VENV_DIR)

# Ativar o ambiente virtual (exibe instrução)
activate:
	@echo "Para ativar o ambiente virtual, execute:"
	@echo "source $(VENV_DIR)/bin/activate"

# Ajuda
help:
	@echo "Comandos disponíveis:"
	@echo "  make          - Criar venv e instalar dependências"
	@echo "  make clean    - Remover o venv"
	@echo "  make activate - Exibir instruções para ativar o venv"
