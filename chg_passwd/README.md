# Create a random password and change that password to a RHEL user.

This playbook creates a random password and then changes the password of a RHEL user to this new password. At the end using DEBUG mode show the password to get it into the jobs historial in Tower.
The idea is to use a shell script which is in the Scripts folder. This script checks the invalid retries to login and after 3 retries launch the playbook by Tower API using the curl command from OS.
It is part of a Demo playbook to be used with Red Hat Security Events.

## Use:

```
This playbook uses two variables:

   1) username: The RHEL user to change the password.

   2) hostname: The hostname in which to change the user password.


