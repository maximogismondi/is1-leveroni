# Clase 10 - TDD

TDD (Test Driven Development) es una metodología de desarrollo de software que se basa en escribir primero las pruebas y luego el código que las hace pasar.

Es una técnica que a primera vista puede parecer contraintuitiva, pero que a la larga aporta muchos beneficios.

## Conceptos

- Es una técnica de desarrollo
- Pasos pequeños e incrementales -> de hacerlos más grandes nos podríamos saltar cosas o ir en la dirección incorrecta
- Feedback inmediato
- Proceso de aprendizaje -> no tener miedo a equivocarse / borrar código
- Análisis + Diseño + Programación + Testing

## Pasos

### Escribir un test que falle

- Lo más simple posible
- No abarcar más de lo necesario
- Debe fallar al ejecutarlo

### Hacer que el test pase

- Lo más simple posible -> iterar rápidamente
- No abarcar más de lo necesario
- No pensar en el futuro

### ¿ Se puede mejorar el código ? Refactorizar

- Mejorar la calidad del código
- No agregar funcionalidad
- Deben seguir pasando los tests

## Estrucutra de un test

### Setup / Arrange

- Preparar el contexto
- Precondiciones

### Excercise / Act

- Ejecutar el código a testear

### Verify / Assert

- Verificar que el resultado es el esperado
- Post condiciones
