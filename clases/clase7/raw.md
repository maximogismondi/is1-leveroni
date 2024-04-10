# Clase 7 - Repaso

## Heurísticas de diseño

- **Buscar el 1:1 entre objeto y ente**: Cada objeto debe representar un ente del dominio del problema.
- **Favorecer composicion por sobre subclasificación**: Siempre que sea posible, usar composición en lugar de herencia.
- **Quitar código repetido**: Señal de que falta una abstacción.
- **No romper encapsulamiento**: No acceder a los atributos de una clase desde afuera.
- **Nombrar a los objetos según el ROL que cumplen en un determinado contexto**:
- **No subclasificar de clases concretas**: Subclasificar de clases abstractas.
- **Favorecer objetos inmutables**: Siempre que sea posible, hacer objetos inmutables.
- **Guiarnos por aspectos funcionales**: Enfocarnos en la funcionalidad de los objetos.
- **Favorecer el polimorfismo**: Siempre que sea posible, usar polimorfismo.
- **No tener objetos incompletos o invalidos**: Siempre que sea posible, tener objetos completos y válidos.

## Polimorfismo

Es la capacidad de diferentes objetos de responder ante el mismo mensaje.

Tener una misma interfaz en común entre varios objetos.

- Misma forma de responder.
- Mismo propósito de mensaje
- Misma firma
- Mismos efectos colaterales
- Semántica similar

### Firma de un método

- Misma cantidad de parámetros
- Mismos tipos de parámetros
- Mismos nombre de mensaje
- Mismo tipo de resultado
