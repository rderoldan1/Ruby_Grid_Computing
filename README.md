Ruby_Grid_Computing
===================

#### Problema

Describir un algoritmo  para resolver el problema de encontrar todas las ocurrencias de un  numero `i`
de una lista de enteros `L` de tamaño `n`. Evaluar el tiempo de computación y comunicación del algoritmo en base
a parámetros de la arquitectura y el tamaño del problema.

Se busca comprobar que si el numero de tamaño `n` se divide en `m` nodos, el tiempo de procesamiento disminuira
en n/m, a la vez se debe tener en cuenta el tiempo de la comunicación `t`

Por lo tanto la formula es 

`Tiempo = (n / m) + t`

####Arquitectura

Se cuenta con 3 agentes en el problema

1. Cliente
2. Controlador
3. Nodo

##### El Cliente

Este programa es con el que el usuario interactua y le ingresa el numero y el indice, para
mas informacion [Ver](https://github.com/rderoldan1/Ruby_Grid_Computing/tree/master/Cliente)

##### El Controlador

Este programa es el que recive los parametros del cliente, conoce los nodos y les envia una subcadena de numeros y 
el indice, cuando ya tiene la información de todos los nodos envia la respuesta al cliente, para
mas informacion [Ver](https://github.com/rderoldan1/Ruby_Grid_Computing/tree/master/Control)

##### El Nodo

Este Programa Recive un numero del controlador, busca el numero de ocurrencias del indice y devuelve el numero de 
ocurrencias a el controlador para
mas informacion [Ver](https://github.com/rderoldan1/Ruby_Grid_Computing/tree/master/Nodo)


#### Ejemplo

Lista = 123456789369258147

Indice = 56

Ocurrencias = 1