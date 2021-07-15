# chk_ret_login.sh
# Version: 1.0 (Yes! very draft! )
# This shell script checks the failed login retries from a specific user ($user) and after 3 retries launches a playbook placed in Tower using the API with the OS curl command.
# This script uses a file to save the number of invalid logins ($failed_file).
# If there exists a file flag ($flag_cancel) then cancel the check.
# In this version uses user and password in text plane. Next release will uses oauth2 token.
# Created by Hernan Conosciuto - Red Hat Argentina (hconosci@redhat.com).
# History:
# 2021-07-07: Creation.
# 2021-07-15: Script Tuning.


# Seteo de variables.
user=hernan
node=`hostname`
dir=/root/scripts/chk_ret_login
failed_file=$dir/'failed_'$user'_login.txt'
sleeps=5   # In seconds.
flag_cancel=/tmp/cancela_chk_logs

# En caso que se haya rotado (logs rotation) igualo valores.
mal_login=`egrep "Failed|Failure" /var/log/secure|grep $user|wc -l`
echo $mal_login>$failed_file

# Leo la cantidad de logins erroneos guardados
mal_inicial=`cat $failed_file` 

while  [ ! -f $flag_cancel ]
do

	clear

	echo "Logins invlaidos - Historial: " $mal_inicial
	mal_login=`egrep "Failed|Failure" /var/log/secure|grep $user|wc -l`
	echo "Logins invalidos: " $mal_login
	diferencia=$((mal_login-mal_inicial))
	echo "Reintentos: " $diferencia

	if [ $diferencia -gt 2 ]
	then

		echo "CAMBIO LA CLAVE!"
		# Actualizo contador y diferencia
		echo $mal_login>$failed_file
		mal_inicial=$mal_login
		diferencia=0
		
		# Ejecuto el playbook de tower que la cambia.
		curl -k -H 'Content-Type: application/json' -XPOST \
		     -d '{"extra_vars": {"username":"'$user'","nombre_host":"'$node'"}}' \
		     --user dsecure:redhat54321 https://tower.herdom.com/api/v2/job_templates/66/launch/

	fi

	# Espero N segundos
	sleep $sleeps

done
	
# Al finalizar de manera ordenada actualiza el contador.

# Si existe el flag del archivo pone el ultimo valor para no grabar vacio en el contador.
if [ -z "$mal_login" ]
then
	echo "no arrranco"
	mal_login=$mal_inicial
fi

echo $mal_login>$failed_file




