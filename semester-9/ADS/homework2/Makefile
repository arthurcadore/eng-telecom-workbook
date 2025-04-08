# Caminho do script
SCRIPT=./run.sh
LOGDIR=./log

# Targets
all: exec1 exec2 exec3 exec4

exec1:
	@echo "ETAPA1: Executando com DELAY=10000 FLUXES=1" | tee -a $(LOGDIR)/output.log
	@DELAY=10000 FLUXES=1 $(SCRIPT) 2>&1 | tee -a $(LOGDIR)/output.log

exec2:
	@echo "ETAPA2: Executando com DELAY=100000 FLUXES=1" | tee -a $(LOGDIR)/output.log
	@DELAY=100000 FLUXES=1 $(SCRIPT) 2>&1 | tee -a $(LOGDIR)/output.log

exec3:
	@echo "ETAPA3: Executando com DELAY=10000 FLUXES=4" | tee -a $(LOGDIR)/output.log
	@DELAY=10000 FLUXES=4 $(SCRIPT) 2>&1 | tee -a $(LOGDIR)/output.log

exec4:
	@echo "ETAPA4: Executando com DELAY=100000 FLUXES=4" | tee -a $(LOGDIR)/output.log
	@DELAY=100000 FLUXES=4 $(SCRIPT) 2>&1 | tee -a $(LOGDIR)/output.log

.PHONY: all exec1 exec2 exec3 exec4
