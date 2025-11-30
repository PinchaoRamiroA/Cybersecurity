## Configuración de contenedores vulnerables para el laboratorio

### Objetivos

- Instalar Docker y Docker Compose (si se usa).

- Configurar y ejecutar contenedores vulnerables para prácticas de pentesting.

- Crear un entorno seguro y aislado para pruebas.

### Instalación de Docker
- Linux (Debian/Ubuntu)
~~~ bash
sudo apt update
sudo apt install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
~~~
Comprobar instalación
docker --version
docker run hello-world

**Recomendaciones de seguridad**

Ejecutar los contenedores solo en red local.

No exponer puertos innecesarios a Internet.

No ejecutar contenedores vulnerables en redes públicas o de trabajo.

Usar siempre puertos altos (3000+, 8000+, etc.) para evitar conflictos.

### Contenedores vulnerables para el laboratorio

En esta sección se muestran las configuraciones recomendadas para los contenedores DVWA, JuiceShop y WebGoat. Todos estos contenedores se ejecutarán en el host, mientras que Kali y Metasploitable estarán en máquinas virtuales.

#### DVWA (Damn Vulnerable Web Application)
Ejecutar DVWA con Docker
~~~bash
docker run -d \
  --name dvwa \
  -p 8080:80 \
  vulnerables/web-dvwa
~~~ 

Acceso

Abrir en el navegador:

http://localhost:8080

Credenciales por defecto
usuario: admin
contraseña: password

####  JuiceShop
Ejecutar OWASP Juice Shop
~~~bash
docker run -d \
  --name juiceshop \
  -p 3000:3000 \
  bkimminich/juice-shop
~~~
Acceso
http://localhost:3000

#### WebGoat + WebWolf
~~~bash
docker run -d \
  --name webgoat \
  -p 8081:8080 \
  webgoat/goatandwolf
~~~
Acceso

WebGoat:

http://localhost:8081/WebGoat


WebWolf:

http://localhost:8081/WebWolf

### Opción alternativa: docker-compose.yml

Para ejecutar los tres contenedores juntos, se recomienda usar un archivo docker-compose.yml.

Ejemplo:
~~~yaml
version: '3'
services:
  dvwa:
    image: vulnerables/web-dvwa
    ports:
      - "8080:80"
    restart: always

  juiceshop:
    image: bkimminich/juice-shop
    ports:
      - "3000:3000"
    restart: always

  webgoat:
    image: webgoat/goatandwolf
    ports:
      - "8081:8080"
    restart: always
~~~

Ejecutar
~~~bash
docker compose up -d
~~~
### Apagar, reiniciar y eliminar contenedores
Listar contenedores
~~~bash
docker ps
docker ps -a
~~~
Detener contenedores
~~~bash
docker stop dvwa juiceshop webgoat
~~~
Reiniciar contenedores
~~~bash
docker restart dvwa
~~~
Eliminar contenedores
~~~bash
docker rm dvwa juiceshop webgoat
~~~
### Consejos finales

- Mantener el laboratorio en red local aislada.

- No exponer estos servicios en redes externas.

- Recordar que son aplicaciones intencionalmente vulnerables.

- Limpiar contenedores no utilizados para ahorrar recursos.

- Se recomienda reiniciar DVWA si la base de datos presenta errores.
