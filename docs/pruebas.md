# Pruebas

## v0.1

| Acción | Resultado esperado | Resultado real | Corrección |
|---|---|---|---|
| Ejecutar con F5 | Sale la cuenta atrás 3, 2, 1 y después "¡Ya!" | Correcto | - |
| No tocar nada durante la cuenta atrás | El coche no se mueve hasta el "¡Ya!" | Correcto | - |
| Salir: el coche cruza la meta nada más empezar | La carrera no termina | Correcto, sigue porque todavía no ha pasado por el checkpoint | - |
| Dar una vuelta completa sin chocar | El coche se para en la meta y sale el tiempo | Correcto, unos 7,6 s | - |
| Chocar de frente con un borde | Pierde velocidad y "Choques" sube a 1 | Correcto | - |
| Quedarse empujando contra el mismo muro | Debe contar un solo choque | Contaba un choque cada 0,5 s (7 choques en 3,5 s) | Quito el `crash_cooldown` y uso `touching_wall`: solo cuenta cuando empieza a tocar el muro. Repetida la prueba: 1 choque |
| Pulsar R al llegar a la meta | Vuelve a empezar con el tiempo a 0 y la cuenta atrás | Correcto | - |

## Pendiente

- Exportar la v0.1 y probarla fuera del editor.
- Añadir el turbo.
- Guardar el mejor tiempo.
