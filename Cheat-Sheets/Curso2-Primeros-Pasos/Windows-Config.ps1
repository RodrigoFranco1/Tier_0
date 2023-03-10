# Tier 0
# Comandos Curso 2 (Configurando el entorno Windows)

- Aplicando Actualizaciones -
PS C:\usuario> Get-ExecutionPolicy -List  //Verificamos nuestra Política de ejecución de sistemas para asegurarnos de que podemos descargar, cargar y ejecutar módulos y scripts (undefinded o unrestricted).
PS C:\usuario> Set-ExecutionPolicy Unrestricted -Scope Process //Configuramos la pólitica de ejecución "unresticted" para la sesión actual
PS C:\usuario> Install-Module PSWindowsUpdate //instalamos el modulo de actualizaciones de windows
PS C:\usuario> Import-Module PSWindowsUpdate //importamos el modulo 
PS C:\usuario> Install-WindowsUpdate -AcceptAll //ejecutamos el modulo 


- Instalando Chocolatey -
PS C:\usuario> Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) 
//instalamos chocolatey en el sistema
PS C:\usuario> choco upgrade chocolatey -y //actualizamos los paquetes
PS C:\htb> choco info pkg //Nos mostrará información sobre un paquete si este se encuentra disponible en el repositorio.


- Instalando Windows Terminal con Chocolatey -
PS C:\htb> choco install microsoft-windows-terminal //instalamos la terminal en el sistema


- Instalando los paquetes esenciales con Chocolatey -
PS C:\htb> choco install WSL2 python vscode git openssh openvpn wsl2

- Añadiendo Exclusiones a Windows Defender - 
PS C:\htb> Add-MpPreference -ExclusionPath "C:\Users\your user here\AppData\Local\Temp\chocolatey\" //añadimos la carpeta espeecificada a exclusiones del windows defender

- Repositorios GIT desde PS -
PS C:\htb> git clone https://github.com/dafthack/DomainPasswordSpray.git //descargamos un repositorio de github desde PS
