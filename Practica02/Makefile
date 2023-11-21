# Universidad de La Laguna
# Escuela Superior de Ingeniería y Tecnología
# 2º Curso en Grado en Ingeniería Informática
# Estructuras de Computadores
# Práctica1: ALU
#
# @author Dario Fajardo alu0101564630@ull.edu.es
# @date 25 Oct 2023
# @brief Makefile del proyecto, permite compilar facilmente y hacer make clean
#		 para borrar los binarios de la carpeta después

COMPILATOR = iverilog
######################################
files = src/*v
######################################
all: programa

programa: $(files)
	@echo "======================================================"
	@echo "chambeando..."
	@echo "======================================================"
	@$(COMPILATOR) -o microc.vvp $(files)

######################################
.PHONY: clean
######################################
clean:
	@echo "cleaning up the directory..."
	@rm *.vvp *.vcd 2> /dev/null
######################################
