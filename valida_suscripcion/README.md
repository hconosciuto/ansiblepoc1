# This playbook validates if the node has a valid and active subscription.

The goal of this playbook is to validate if the nodes have a valid Red Hat subscription.

This playbook could be the first part of a Ansible Automation Workflow which after a successful result installs some products on RHEL systems.

It is used in the Red Hat Insight Demo.

## Use:

```
The playbook execute the subscription-manager command and the analucez the result searching for a valid response.
In case not, the playbook fails.

Also the playbook has a crea_motd role which, in case the validation process fails, create a login message into the node which shows that the system has an invalid subscription and how to subscribe it.

