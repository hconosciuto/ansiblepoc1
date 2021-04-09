# Demo de Instalación de Red Hat Insight

Este playbook realiza la instalación de Red Hat Insights en un RHEL y luego registra el nodo en dicha herramienta.
Es parte de la Demo de Red Hat Insights con Ansible Automation Plarform y es llamado en un Workflow luego de validar que la suscripción es válida y está ativa.

## Uso:

```
Incluye un único role que tiene 2 tareas:

   1) La instalación del paquetes de Red Hat Insights.

   2) La registración del nodo en Red Hat Insights.

La idea es poder utilizar un nombre de Grupo en el host inventory para mostrar como lo hace en mas de un nodo.
