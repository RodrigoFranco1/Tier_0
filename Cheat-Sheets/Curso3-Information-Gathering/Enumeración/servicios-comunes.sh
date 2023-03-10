## Enumeración basada en infraestructura de servicios comunes 

WEB
Transparencia de certificados SSL
|  Comando | Descripción |
| curl -s https://crt.sh/\?q\=<target-domain>\&output\=json | jq . | Transparencia del certificado. |
| for i in $(cat ip-addresses.txt);do shodan host $i;done | Escanear cada dirección IP en una lista usando Shodan. |


FTP
| Comando | Descripción | 
| ftp <FQDN/IP> | Interactuar con el servicio FTP en el destino. |
| nc -nv <FQDN/IP> 21 | Interactuar con el servicio FTP en el destino. |
| telnet <FQDN/IP> 21 | Interactuar con el servicio FTP en el destino. |
| openssl s_client -connect <FQDN/IP>:21 -starttls ftp | Interactuar con el servicio FTP en el destino utilizando la conexión cifrada. |
| wget -m --no-passive ftp://hostname:password@[ip o servidor] | Descargar todos los archivos disponibles en el servidor FTP de destino. |
| put [ruta-archivo-local] | sube un archivo al directorio ftp
| get [nombre-archivo] | Descarga un archivo del servidor ftp a la maquina local

SMB
| Comando | Descripción |
| `smbclient -N -L //<FQDN/IP>` | Autenticación de sesión nula en SMB. |
| `smbclient //<FQDN/IP>/<share>` | Conectarse a un recurso compartido SMB específico. |
| `rpcclient -U "" <FQDN/IP>` | Interacción con el objetivo usando RPC. |
| `samrdump.py <FQDN/IP>` | Enumeración de nombres de usuario usando scripts Impacket. |
| `smbmap -H <FQDN/IP>` | Enumeración de acciones SMB. |
| `crackmapexec smb <FQDN/IP> -shares -u '' -p ''` | Enumeración de acciones SMB usando autenticación de sesión nula. |
| `enum4linux-ng.py <FQDN/IP> -A` | Enumeración de SMB usando enum4linux. |


NFS
| Comando | Descripción |
|-|-|
| `showmount -e <FQDN/IP>` | Mostrar las acciones NFS disponibles. |
| `mount -t nfs <FQDN/IP>:/<share> . /target-NFS/ -o nolock` | Montar el share.umount . /target-NFS específico |
| `umount . /target-NFS` | Desmontar la parte específica de NFS. |


DNS
| Comando | Descripción |
| `dig ns <domain.tld> @<nameserver>` | Solicitud NS al servidor de nombres específico. |
| `dig any <domain.tld> @<nameserver>` | CUALQUIER solicitud al servidor de nombres específico. |
| `dig axfr <domain.tld> @<nameserver>` | Solicitud AXFR al servidor de nombres específico. |
| `dnsenum --dnsserver <nameserver> --enum -p 0 -s 0 -o found_subdomains.txt -f ~/subdomains.list <domain.tld>` | Fuerza bruta del subdominio. |



SMTP
| Comando | Descripción |
| `telnet <FQDN/IP> 25` ||


IMAP/POP3
| Comando | Descripción |
| `curl -k 'imaps:/<FQDN/IP>' -user <user>:<password>` | Inicie sesión en el servicio IMAPS usando cURL. |
| `openssl s_client -connect <FQDN/IP>:imaps` | Conectarse al servicio IMAPS. |
| `openssl s_client -connect <FQDN/IP>:pop3s` | Conectarse al servicio POP3s. |


SNMP
| Comando | Descripción |
| `snmpwalk -v2c -c <community string> <FQDN/IP>` | Consulta de OIDs usando snmpwalk. |
| `onesixtyone -c community-strings.list <FQDN/IP>` | Cadenas de comunidad brutas del servicio SNMP. |
| `braa <community string>@<FQDN/IP>:. 1.*` | Bruteforcing SNMP service OIDs. |


MySQL
| Comando | Descripción |
| `mysql -u <user> -p<password> -h <FQDN/IP>` | Iniciar sesión en el servidor MySQL. |


MSSQL
| Comando | Descripción |
| `mssqlclient.py <user>@<FQDN/IP> -windows-auth` | Inicie sesión en el servidor MSSQL usando la autenticación de Windows. |


IPMI
| Comando | Descripción |
| msf6 auxiliar(escáner/ipmi/ipmi_version)` | Detección de versiones IPMI. |
| `msf6 auxiliar(escáner/ipmi/ipmi_dumphashes)` | Descarga hashes IPMI. |


------- Administración remota de Linux ------------

| Comando | Descripción |
| ssh-audit.py <FQDN/IP>` | Auditoría de seguridad remota contra el servicio SSH de destino. |
| ssh <user>@<FQDN/IP>` | Inicie sesión en el servidor SSH utilizando el cliente SSH. |
| ssh -i private.key <user>@<FQDN/IP>` | Inicie sesión en el servidor SSH usando clave privada. |
| `ssh <user>@<FQDN/IP> -o PreferredAuthentications=password` | Hacer cumplir la autenticación basada en contraseñas. |


------- Administración remota de Windows ----------
| Comando | Descripción |
| `rdp-sec-check.pl <FQDN/IP>` | Compruebe la configuración de seguridad del servicio RDP. |
| `xfreerdp /u:<user> /p:"<password>" /v:<FQDN/IP>` | Inicie sesión en el servidor RDP desde Linux. |
| `evil-winrm -i <FQDN/IP> -u <user> -p <password>` | Iniciar sesión en el servidor WinRM. |
| `wmiexec.py <user>:"<password>"@<FQDN/IP> "<system command>"` | Ejecutar comando usando el servicio WMI. |
