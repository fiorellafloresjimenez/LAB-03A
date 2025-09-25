# Laboratorio 03A – MIPS Básico (MARS)

Curso: Arquitectura de Computadores  
Semestre: 2025-II  
Estudiante: Fiorella Mariana Flores Jiménez

## 1) Objetivos
- Verificar el funcionamiento del simulador MARS en macOS (ítem 3.1).
- Desarrollar dos programas MIPS: Fibonacci y Upcase 2.0.
- Identificar las syscalls empleadas y documentar la lógica general de cada programa.

## 2) Entorno
- macOS (MacBook Pro)
- Java Temurin 17
- MARS (MIPS Assembler and Runtime Simulator)

## 3) Ítem 3.1 — Verificación de MARS
- MARS abre correctamente y permite cargar, ensamblar y ejecutar archivos .asm.
- Se validó la entrada/salida básica mediante syscalls estándar y la inspección de registros y datos.

## 4) Programa 1 — Fibonacci
Descripción: leer un entero n y mostrar los n términos de la serie; si n ≤ 0, no se imprimen términos.  
Syscalls utilizadas: 5 (leer entero), 4 (imprimir string), 1 (imprimir entero), 10 (salir).  
Lógica resumida: ventana (a, b) iniciada en (0, 1); se imprime el primer término y se itera sig = a + b, actualizando la ventana hasta completar n.

## 5) Programa 2 — Upcase 2.0
Descripción: leer una cadena y convertir a mayúscula la primera letra de cada palabra (solo a..z); separadores considerados: espacio, tabulador y salto de línea; no se modifican dígitos ni símbolos.  
Syscalls utilizadas: 8 (leer string), 4 (imprimir string), 10 (salir).  
Lógica resumida: recorrido del buffer con un indicador de inicio de palabra; si el carácter inicial está en a..z, se ajusta a A..Z (diferencia ASCII 32).

## 6) Estructura del proyecto
- Carpeta raíz: LAB 03A/
  - src/ → Fibonacci.asm, Upcase2_0.asm
  - report/ → materiales adicionales
