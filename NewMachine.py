# !/usr/bin/python3

import sys
import os

if len(sys.argv) == 3:
	plataforma = sys.argv[1]
	carpeta = int(sys.argv[2])
	
else:
	print("Error - Introduce los argumentos correctamente")
	print ('Ejemplo: python3 NewMachine.py "THM" "Nombre_Maquina"')


