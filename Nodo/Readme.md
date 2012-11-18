### Nodo

Este es el programa que hace la busqueda de un indice i en una lista l de numeros.
La lista es enviada por el controlador y varia segun la cantidad de Nodos
Retorna un entero con el numero de ocurrecias del indice en el numero

### Ejemplo de ejecución

    Buscando el numero 9 en ["8", "9", "6", "5", "6", "7", "8"]


### Uso

Tener en cuenta que se debe correr primero el Controllador y el Cliente.
En una consola
    $ cd path/to/project/Nodo/lib
    $ ruby nodo.rb

Si el programa empieza bien vera un mensaje como este

    Modo de uso
    ====================
    El controlador informa cuando hay nodos nuevos de la siguiente forma.
    El numero de nodos ha aumentado, hay N nodos
    para saber cuantos nodos hay escriba
     nodos?
    para correr la simualcion escriba
     run [##/random] [numero_a_buscar]
    para ayuda escriba
     ayuda?

La lista de numeros se puede pasar de dos formas.

#### Tener en cuenta la convención

    run [##/random] [numero_a_buscar]

1.Numero aleatorio, generado de la forma 1000 ** 1000 (elevado a la 1000), estó generará un numero de 3000 digitos

    run random 9

2.Numero Manual, se puede ingresar un numero manualmente

    run 233445678887 9