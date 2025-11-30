## Configuración de las máquinas virtuales del laboratorio

### Objetivos

- Crear la red interna del laboratorio en VirtualBox.

- Crear la máquina virtual de Kali Linux (máquina del atacante).

- Crear la máquina víctima Metasploitable 2.

### Pasos 

#### Crear la red interna del laboratorio

        Abrir VirtualBox → Preferencias → Red → Redes de solo anfitrión.

        Crear una nueva Host-Only Network.

        Asignar una IP, por ejemplo:

                192.168.56.1
        (O puedes conservar la que VirtualBox asigna automáticamente).

        Las máquinas virtuales usarán esta red interna.

**Importante:**
        Esta red NO tiene acceso a Internet.
        Solo permite la comunicación entre las máquinas virtuales y el host.

### Instalación de Kali Linux (máquina atacante)

- Opción recomendada:

        Descargar la máquina ya preparada para VirtualBox desde:
        https://www.kali.org/get-kali/#kali-virtual-machines

        Esta versión incluye un entorno completo con la mayoría de 
        herramientas básicas y profesionales para hacking ético.

Solo debes selecciónar la ISO y te aparecera el login que es por defecto 
user: kali
password: kali

![Kali Instalada](laboratory/Evidence/kali_instalada.jpeg)

- Opción alternativa (instalar desde ISO)

- Descargar ISO oficial:
https://www.kali.org/get-kali/

- Abrir VirtualBox → Nueva

        - Nombre: Kali-Lab

        - Imagen ISO: Seleccionar la ISO descargada

        - Tipo: Linux

        - Versión: Debian (64-bit)

        - RAM: 2–4 GB

        - CPU: 2 núcleos

        - Disco: 30 GB

- Configurar la red de la máquina:

  - Adaptador 1: Solo anfitrión (Host-Only) → comunicación con Metasploitable

  - Adaptador 2: NAT → para actualizaciones y repositorios

- Iniciar la máquina e instalar Kali normalmente.

Herramientas recomendadas dentro de Kali

Una vez instalada, configurar el entorno con las siguientes herramientas básicas del pentester:

- nmap

- metasploit

- wireshark

- burp suite community

- sqlmap

- hydra

- gobuster / ffuf

- john / hashcat

- herramientas esenciales del sistema (git, curl, build-essential, etc.)

### Instalación de Metasploitable 2 (máquina víctima)

Descargar desde:
https://sourceforge.net/projects/metasploitable/files/Metasploitable2/

Descomprimir el archivo. Dentro encontrarás:
~~~ bash
Metasploitable.nvram
Metasploitable.vmdk
Metasploitable.vmsd
Metasploitable.vmx
Metasploitable.vmxf
~~~

- Abrir VirtualBox.

  - Crear una nueva máquina vacía:

  - Nombre: Metasploitable2

  - Tipo: Linux

  - Versión: Ubuntu (32-bit)

  - RAM: 512 MB – 1 GB

  - Cuando pida disco duro:

        Seleccionar: Usar un archivo de disco duro existente

        Escoger: Metasploitable.vmdk

  - Finalizar creación.

  - Configurar la red de la máquina:

        Adaptador 1: Solo anfitrión (Host-Only)

  - Iniciar la máquina.

Si todo está correcto, aparecerá:

Metasploitable login:
~~~
usuario: msfadmin
contraseña: msfadmin
~~~
