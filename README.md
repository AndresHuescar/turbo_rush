# Turbo Rush

Juego de carreras contrarreloj en 2D visto desde arriba. El coche avanza solo y el jugador solo tiene que girar para dar la vuelta al circuito en el menor tiempo posible.

## Versión 0.1

Primera versión jugable con el bucle principal:

1. Cuenta atrás de 3 segundos.
2. Empieza la carrera y se pone en marcha el cronómetro.
3. Se conduce por el circuito. Si el coche choca con un borde, pierde velocidad.
4. Al llegar a la meta, después de pasar por el checkpoint, el coche se para y sale el tiempo.
5. Con R se vuelve a empezar para intentar mejorar el tiempo.

Todavía no tiene turbo, récord ni medallas.

## Cómo abrirlo

1. Abrir Godot 4.6.
2. En el gestor de proyectos, pulsar Importar y elegir `project.godot`.
3. Pulsar F5. La escena principal es `scenes/main.tscn`.

## Controles

| Tecla | Acción |
|---|---|
| ← / A | Girar a la izquierda |
| → / D | Girar a la derecha |
| R | Reiniciar la carrera |

## Mecánica principal

| Pregunta | En Turbo Rush |
|---|---|
| ¿Qué hace el jugador? | Gira el coche, que avanza solo |
| ¿Qué se comprueba? | Si choca con un borde y si llega a la meta después del checkpoint |
| ¿Qué dato cambia? | La velocidad, los choques y el tiempo |
| ¿Qué respuesta recibe? | El coche va más lento al chocar y al final ve su tiempo |

## Escenas y scripts

- `scenes/car.tscn` + `scripts/car.gd`: movimiento del coche. Emite la señal `crashed` cuando choca.
- `scenes/main.tscn` + `scripts/main.gd`: coordina la carrera (cuenta atrás, tiempo, checkpoint, meta y reinicio).
- `StartTimer` (Timer de 3 s) controla la cuenta atrás.
- `Finish` y `Checkpoint` son Area2D y avisan con `body_entered`.
