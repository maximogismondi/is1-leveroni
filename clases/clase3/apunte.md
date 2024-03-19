# Clase 3

## Heurísticas que debemos seguir en la POO

### Cohesion

Algo es altamente cohesivo, cuando sus partes están fuertemente relacionadas entre sí. En el caso de los objetos, la cohesión se refiere a que los métodos de un objeto tengan escencialmente el mismo enfoque y propósito y no algo totalmente distinto.

### Acoplamiento

El acoplamiento se refiere a la dependencia que tienen los objetos entre sí. Si un objeto depende de otro, se dice que están acoplados. Si un objeto depende de muchos otros, se dice que está altamente acoplado. El acoplamiento es algo que se debe evitar, ya que si un objeto depende de muchos otros, se vuelve muy difícil de mantener y de entender.

## Mensajes

Los mensajes se llaman así porque mediante ellos los objetos se comunican entre sí. Los mensajes son enviados por un objeto a otro, y el objeto que recibe el mensaje, ejecuta un método en respuesta a ese mensaje.

### Mensajes unarios

Son mensajes que no llevan parámetros. Por ejemplo si tenemos un objeto `Persona` y le enviamos el mensaje `saludar` este es un mensaje unario.

### Mensajes binarios

Estos son binarios porque trabajan con 2 colaboradores, el objeto receptor y el parámetro. Estos se limitan a un solo parámetro y el nombre del mensaje es un operador. Por ejemplo si tenemos un objeto `Numero` y le enviamos el mensaje `+ 5` este es un mensaje binario. Siendo el objeto receptor el `Numero` y el parámetro el `5` y el mensaje el `+`.

### Mensajes de palabra clave (keyword)

Son mensajes que llevan más de un parámetro. Por ejemplo si tenemos un objeto `Persona` y le enviamos el mensaje `saludarA: 'Juan' yDecir: 'Hola'` este es un mensaje de palabra clave. Estos son de palabra clave porque trabajan con más de 2 colaboradores, el objeto receptor y los parámetros.

Estos se pueden identificar porque llevan dos puntos `:` y un espacio entre los parámetros.

### Pioridad de mensajes

Los mensajes unarios tienen mayor prioridad que los binarios y estos a su vez tienen mayor prioridad que los de palabra clave.

A su vez, si son del mismo tipo, estos se ejecutan de izquierda a derecha. La única excepción es cuando se utilizan paréntesis para cambiar el orden de ejecución de los mensajes.

### DoesNotUnderstand: aMessage

Es un mensaje que se envía a un objeto cuando este no entiende el mensaje que se le envía. Este mensaje se utiliza para manejar errores en tiempo de ejecución. Por defecto, este mensaje lanza un error, pero se puede redefinir para que haga algo distinto.

## Colaboraciones

Los programas se basan en objetos que colaboran entre sí, por eso se llaman colaboraciones. Los objetos colaboran entre sí para lograr un objetivo común.

### Colaborador INTERNO

Es un colaborador que forma parte del objeto. Por ejemplo si tenemos un objeto `Persona` y este tiene un colaborador `nombre` este es un colaborador interno de la 'Persona'.

### Colaborador EXTERNO

Es un colaborador que no es parte de la misma clase sino que muchas veces los recibe como parámetros. Por ejemplo si tenemos un objeto `Persona` y recibimos un colaborador 'Amigo' como parámetro, estaremos recibiendo un colaborador externo.

### Colaborador TEMPORAL

Es un colaborador que se declara en un método y se destruye al finalizar el mismo. Por ejemplo si tenemos un método `saludar` y declaramos el colaborador `saludo` este es un colaborador temporal.

## Pseudovariables

Son variables, con palabras reservadas, que se utilizan para referenciar a un objeto en particular y son solo 3, estas pueden ser accedidas pero no modificadas. Estas son:

### self

Hace referencia a si mismo, es decir, al objeto receptor del mensaje.

### super

Hace referencia a la superclase del objeto receptor del mensaje.

### thisContext

Hace referencia al contexto de ejecución actual.

## Instancias únicas

Son instancias únicas que se utilizan a lo todo el programa y se crean una sola vez. Estas son:

### true

### false

### nil

Hace referencia a la nada, es decir, a la ausencia de un objeto.

## Morphs

Son objetos que se utilizan para representar elementos gráficos en la pantalla. Estos objetos son muy utilizados en el entorno de desarrollo de Smalltalk.
