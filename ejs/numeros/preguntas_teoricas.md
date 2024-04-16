# Preguntas teóricas

## Aporte de los mensajes de DD

> En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

El primer llamado define el "que" se va a hacer y el objeto que recibe el mensaje. El segundo llamado define el "como" se va a hacer y el objeto que recibe el mensaje en primera instancia.

## Lógica de instanciado

> Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

Para la creación de un objeto, lo ideal es tener los métodos de creación en las clases ya sea en la abstracta o en las clases concretas dependiendo del caso. Esto asegura tener una instancia valida y completa de la clase concreta ya que se pueden realizar validaciones y configuraciones iniciales como los famosos `intialize`.

Podemos instanciar un objeto desde diferentes lugares llamando a los respectivos métodos de clase donde, dependiendo del comportamiento esperado, podemos definir 1 o más métodos de creación (mensaje de clase).

## Nombres de las categorías de métodos

> Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

En primeria instancia diferenciamos aquellos que son parte del protocolo público de aquellos que son más bien privados. Esto nos permite definir claramente cual es el protocolo visible para el usuario sin que interfiera con el funcionamiento interno de la clase.

Por otro lado una vez separado el protocolo, categorizamos los métodos según su comportamiento y responsabilidad. De tal modo, resulta más fácil encontrar la implementación de cada uno de los mensajes y mantenerlos a largo plazo.

## Subclass Responsibility

> Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

Exactamente, el mensaje `subclassResponsibility` se utiliza para indicar que el método está efectivamente implementado por todos sus subclases. Esto siginifica que la clase padre no especifica el `como` de ese mensaje y que tan solo se encarga de definir el `que`.

Esto tiene un efecto secuendario que es que la clase padre no debería ser más instanciada, ya que contiene el comportamiento de la clase en su totalidad, y pasa a ser una clase **abstracta**, por lo que aquellas clases que hereden su comportamiento e implementen el **método abstracto** deberían ser instanciadas en su lugar.

## No rompas

> ¿Por qué está mal/qué problemas trae romper encapsulamiento?

Rompemos el encapsulamiento cuando accedemos al protocolo privado de un colaborador. Esto puede ser un problema no solo para el colaborador ya que al acceder a los métodos internos cambiando su estado y dejarlo en uno invalido, incosistente o inesperado sino que también puede ser un problema para la clase que accede ya que queda acoplado al comportamiento interno de su colaborador cuando este no tiene porque mantenerse a diferencia de su protocolo público.
