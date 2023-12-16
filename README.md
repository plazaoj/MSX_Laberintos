# MSX_Laberintos

Creador de laberintos en MSX BASIC.

Usa el método de *Backtrace* para generar el laberinto de forma aleatoria. 


## Carga y Ejecución

    LOAD"mazes_a.bas"[,R]

o

    RUN"mazes_a.bas"

## Uso

Ejecutar con `run`.

El laberinto se crea de forma aleatoria. Se puede modificar la extensión (anchura y altura) en la línea `30`, cambiando el valor de las variables `WD` y `HG`.

Una vez generado, se puede navegar por él con los cursores.

Pulsando `S` se puede grabar en formato binario (`BSAVE`) denominado `MAZES.BIN` a partir de la  dirección `&HA8000`. De esta forma, podría cargarse en otro programa con `BLOAD`. 

Pulsar `ESC` para terminar.

## Formato del laberinto y del fichero binario

El fichero generado `MAZES.BIN`  carga en `&HA800` y `&HA801` las dimensiones (anchura y altura), y a continuación la configuración del laberinto por filas. Cada casilla del laberinto se describe por un valor entre 0 y 15 que indica qué dirección es pasillo o pared:

     Casilla = &Bosen 

Cada posición del código binario (`osen`) equivale a una dirección: la dirección Norte (n) es el `LSB` , y el Oeste (o) es el `MSB`. `0` equivale a pared, y `1` a pasillo.

## Enlace

Explicación del método de *Backtrace*, y comentarios al código:  http://cacharreomsx.blogspot.com/2022/07/laberintos.html

## Disclaimer

Este código ni se mantiene ni se actualiza. Simplemente se comparte para quien pueda interesar. Úsalo por tu cuenta y riesgo.

