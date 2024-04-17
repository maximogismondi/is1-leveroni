# Clase 9

## Patrones

|                       | ¿Abstacto o Concreto? | ¿Específico del lenguaje? | ¿Específico de un dominio?    |
| :---                  | :---:                 | :---:                     | :---:                         |
| **Idioma**            | Concreto              | Sí                        | No                            |
| **Patrón de diseño**  | Abstracto             | No                        | No                            |
| **Biblioteca**        | Concreto              | No                        | No                            |
| **Framework**         | Concreto              | No                        | No                            |

### Idioms

Son patrones que implementa el lenguaje para resolver problemas comunes. Por ejemplo, el `if` es un idiom, el `for` es un idiom, el `while` es un idiom.

### Patrones de diseño

Son patrones que resuelven problemas comunes en el diseño de software. Por ejemplo, el patrón `Singleton` resuelve el problema de tener una única instancia de una clase o el patrón `Factory` resuelve el problema de instanciar objetos de una jerarquía de clases.

Recordar no implementarlos porque si, sino identificarlos y usarlos como método de comunicación.

## Tipos

El tipo en si, es una abstracción que define un conjunto mensajes que un objeto puede responder y como lo hace.

Si tenemos 2 objetos de una misma clase, ambos pertenecen al mismo tipo. Pero si tenemos 2 objetos del mismo tipo, no necesariamente pertenecen a la misma clase ya que pueden ser de clases distintas pero que responden a los mismos mensajes.

### Tipado estático

El tipo de una variable es conocido en tiempo de compilación. Por ejemplo, en C++, Java o Go.

### Tipado dinámico

El tipo de una variable es conocido en tiempo de ejecución. Por ejemplo, en Ruby, Python o Smalltalk.
