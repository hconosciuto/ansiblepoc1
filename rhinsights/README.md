# Installation Red Hat Insight Demo

This playbook deploys Red Hat Insight in a RHEL system and then register and run the agent to collect info.
It is part of a Red Hat Insight demo with Ansible Automation Platform and it is called by a Workflow which first validates if the OS has a valid and active subscription.

## Use:

```
This playbook includes only one role which has two tasks:

   1) Red Hat Insights RPMs install.

   2) Red Hat Insight node registration to collect the data.

