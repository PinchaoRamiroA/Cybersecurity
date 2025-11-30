## Proyecto: Laboratorio de Ciberseguridad (White Hat Lab)

### Objetivo
Crear un entorno aislado, seguro y reproducible para practicar técnicas de hacking ético, análisis de vulnerabilidades, explotación, pentesting web y experimentación. El laboratorio utiliza:

- Máquinas virtuales: Kali Linux (atacante) y Metasploitable 2 (víctima) en red interna.

- Contenedores Docker: DVWA, con posibilidad de añadir otras aplicaciones vulnerables.

### Estructura general

El laboratorio está dividido en tres capas principales:

- Capa de ataque: Máquina virtual con Kali Linux, desde donde se realizarán auditorías, escaneos y explotación de vulnerabilidades.

- Capa de víctima: Máquina virtual Metasploitable 2, que contiene múltiples fallos de seguridad.

	- Se usará Metasploitable 2 de Rapid7, disponible en SourceForge.

- Capa de contenedores: Servicios vulnerables como DVWA, WebGoat, JuiceShop, entre otros, ejecutados mediante Docker para optimizar recursos.

Esta arquitectura permite reproducir el laboratorio incluso en equipos con bajo poder de cómputo. Sin embargo, se incluyen recomendaciones de hardware para ejecutar las máquinas virtuales y los contenedores. Si el equipo no cumple los requisitos mínimos, no se recomienda ejecutar todo al mismo tiempo.

Se usará VirtualBox como plataforma de virtualización debido a su sencillez para principiantes. Docker se empleará para ejecutar aplicaciones vulnerables de forma ligera y modular, aprovechando la gran cantidad de imágenes existentes para practicar diferentes tipos de vulnerabilidades (DVWA, WebGoat, JuiceShop, bWAPP, Vulnversity, etc.).

**Recomendación de seguridad:**
Se aconseja mantener todo el laboratorio en una red aislada, preferiblemente configurando una red interna sin acceso a Internet, para evitar riesgos en el entorno real del usuario.

**Diagrama visual del laboratorio:**
~~~bash
                ┌─────────────────────────┐
                │     Kali Linux (VM)     │
                │   Máquina del atacante  │
                └──────────┬──────────────┘
                           | Internal Net
                           |
                ┌──────────┴──────────┐      
                │ Metasploitable 2 VM │      
                └─────────────────────┘      
                        Internal Net           

                ┌────────────────────────────┐
                │    Docker (en tu host)     │
                │ DVWA │ Juice │ WebGoat     │
                └────────────────────────────┘
~~~

### Documentación

A continuación se describen los archivos esenciales del proyecto, organizados para realizar el laboratorio en la secuencia adecuada:

- Configuration_docker.md
	Manual de instalación, configuración y pasos para ejecutar contenedores vulnerables (DVWA, JuiceShop, WebGoat). Incluye recomendaciones de puertos, persistencia y seguridad.

- Configuration_vm.md
	Guía de instalación y configuración de las máquinas virtuales (Kali Linux y Metasploitable 2). Incluye requisitos, ajustes de red interna y solución de problemas comunes.

- Scripts_kali/
	Carpeta con scripts útiles para automatizar tareas desde Kali Linux: reconocimiento, escaneo, enumeración y explotación básica tanto para Metasploitable como para los contenedores.

- Tests.md
	Muestras de algunas pruebas y ejecuciones dentro del laboratorio
