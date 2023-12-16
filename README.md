# MSX_Laberintos

Creador de laberintos en MSX BASIC.

Usa el método de *Backtrace* para generar el fichero. 


## Carga y Ejecución

    LOAD"mazes_a.bas"

o

    RUN"mazes_a.bas"

## Uso

Ejecutar con `run`.

El laberinto se crea de forma aleatoria. Se puede modificar la extensión (anchura y altura) en la línea `30`, cambiando las variables WD y HG.

Una vez generado, se puede navegar por él con los cursores.

Pulsando `S` se puede grabar en formato  binario (`BSAVE`), a partir de la  dirección `&HA8000`. De esta forma, podría cargarse en otro programa con 'BLOAD`.


## Enlace

Explicación del método de Backtrace, y comentarios al código:  http://cacharreomsx.blogspot.com/2022/07/laberintos.html

## Disclaimer

Este código ni se mantiene ni se actualiza. Simplemente se comparte para quien pueda interesar. Úsalo por tu cuenta y riesgo.

