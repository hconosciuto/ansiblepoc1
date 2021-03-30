# Valida si los nodos tienen una suscripción activa y válida de Red Hat.

El objetio de este playbook y validar si los nodos cuentan con una suscripción válida de Red Hat.
Este playbook podría ser el primer componente de un Workflow de Ansible Tower.

## Uso:

```
El playbook ejecuta el comando subscription-manager y analiza la salida del mismo para validar si
la suscripción está Activa y Válida. En caso negativo devuelve el playbook como "Failed".
