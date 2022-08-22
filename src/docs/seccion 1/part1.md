
<!-- multilingual suffix: en, es -->

<!-- [en] -->

<!-- [es] -->

<!-- [common] -->
# Desarrollo de una arquitectura IIoT en la nube (*cloud computing*)

Este documento guía solo cubre la primera parte del proyecto, que tiene por objetivo generar la arquitectura IIoT y verificar que tiene la capacidad de gestionar flujos de datos. Las comunicaciones con el entorno industrial y el procesado de datos se llevarán a cabo en la segunda parte del proyecto.

**En la sección 1. se presenta la estructura de la arquitectura IIoT y se definen los objetivos de esta primera parte del proyecto, así como los resultados que debéis obtener y aportar.**

# Introducción a la primera parte del proyecto

En la arquitectura IIoT, vosotros mismos generaréis datos artificiales dentro del propio software de gestión de flujos de comunicación (Node-RED) que os permitan verificar que la base de datos y los paneles de visualización funcionan como se espera. Se espera que sigáis las secciones en orden ya que van tratando de forma pautada los pasos necesarios para implementar la arquitectura IIoT propuesta.

![](./img/001.png){: .center}

Cuando lo hayáis logrado, podréis avanzar a la segunda parte del proyecto, que también dispone de su respectiva guía, que consiste en la integración de la arquitectura IIoT que habéis generado en un sistema ciber-físico (arquitectura CPS).
## Motivación
La validación del correcto funcionamiento de una arquitectura IIoT de forma aislada resulta fundamental para garantizar que, en el futuro, cuando se integre en el diseño de la solución tecnológica de la que forma parte, cumpla con las especificaciones deseadas. 

En un entorno industrial, donde pueda ser necesario escalar una solución como la que vais a generar debido a que se quiera conectar varios PLCs y bases de datos, es especialmente importante asegurarse que la solución ha sido correctamente diseñada. De esta forma será posible abordar con más eficacia los problemas propios de la integración de esta solución en un entorno industrial, partiendo del supuesto que la solución diseñada puede tratarse como un producto en forma de paquete cerrado, que admite como *inputs* determinados tipos de datos y los gestiona de una forma concreta.


## Objetivos de la primera parte del proyecto
En esta primera parte del proyecto debéis cumplir **tres objetivos**:

1. Configurar un entorno virtual (*cloud computing*) utilizando una máquina virtual de la plataforma Azure de Microsoft y el sistema de encapsulado de software de Docker.
1. Generar una arquitectura IIoT base sobre la que podréis desarrollar aspectos relacionados con las comunicaciones industriales en la segunda parte de la práctica.
1. Poner en marcha aplicaciones que realizarán funciones específicas a través del siguiente software: NodeRED, InfluxDB y Grafana.
   ## Resultados de la primera parte del proyecto
Teniendo en cuenta los objetivos que se han mencionado en el apartado anterior, los **resultados** que debéis obtener y aportar al final de esta primera parte de la práctica son:

- Lograr que la máquina virtual esté operativa y que el software necesario está correctamente instalado.
- **Demostrar mediante capturas de pantalla** que sois capaces de generar datos sintéticos en Node-RED y los podéis visualizar en una base de datos de InfluxDB.


- **Demostrar mediante capturas de pantalla** que el generáis un *dashboard* de Grafana que os permite visualizar los datos almacenados en una base de datos de InfluxDB.
![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.002.png)
**A lo largo de este documento se indicará claramente en que puntos del proceso (en concreto son 3) se espera que toméis capturas para demostrar que vuestra implementación funciona correctamente. Se empleará un recuadro verde como el que enmarca este texto para su facilitar al máximo su identificación.**
## Recursos disponibles
Tenéis a vuestra disposición documentación adicional de las tecnologías que se utilizan a lo largo del proyecto:

- Protocolos de comunicaciones.
- Máquinas virtuales y Azure.
- SSH y claves criptográficas.
- Docker y Docker Compose.
- InfluxDB.
- Node-RED.
- Grafana.
- MATLAB Online.

Además, en Atenea encontraréis vídeos que introducen Node-RED e Influx de forma práctica, para que podáis ver como se espera que interactuéis con ambos softwares. 


# Creación de la máquina virtual
Para generar máquinas virtuales crearéis una cuenta personal de Azure a la que, posteriormente, le asignaréis vuestro email **@estudiant.upc.edu**. Una vez hecho esto deberéis activar una subscripción de Azure para estudiantes, con lo que tendréis acceso a algunos servicios de la plataforma, en los que podréis gastar 100 dólares que la plataforma os asignará gratuitamente. No es necesario que deis información de tarjetas bancarias ni realizar ningún gasto real para dar de alta el servicio en ningún momento del proceso.

A continuación, tenéis las páginas web donde poder daros de alta en los servicios.

- **Web UPC Azure.** Para dar de alta la cuenta, debe ser con un email personal, después podréis poner el email de la UPC. Deberéis autenticar la cuenta varias veces y poner vuestro número de teléfono para recibir los códigos de verificación. 

<https://serveistic.upc.edu/ca/distsoft/faq/microsoft-imagine/acord-upc-microsoft-imagine>

- **Web de Azure donde activar el servicio gratuito para estudiantes.** Existen dos promociones gratuitas, la común de 170€ durante un mes, y la versión de estudiantes, que proporciona 100€ durante 12 meses. Esta última es la que deberéis activar desde la siguiente página web. 

<https://azure.microsoft.com/es-es/free/students/>

Una vez realizado este proceso podréis acceder al portal de Azure en el botón “Portal” de la web de Microsoft Azure indicada primeramente o accediendo directamente a <https://portal.azure.com> , como se ve en las siguientes capturas de pantalla.

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.003.png)

Una vez en el portal deberíais ver el siguiente web:

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.004.png)

Una vez dentro del portal debéis hacer clic en “Todos los servicios” y buscar “Education”, para verificar que tenéis disponibles los 100 USD en el inicio del proyecto y para consultar la cantidad restante a lo largo del mismo.

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.005.png)

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.006.png)

Una vez hecho esto ya podéis poner en marcha vuestra máquina virtual, que será el principal elemento evaluable de vuestro proyecto que será tutorizado, pero no resuelto por el profesor. En caso de que tengáis dudas de operación con la plataforma deberéis primero buscar soluciones e información mediante los manuales profesionales de Azure. 

Para empezar a trabajar, deberéis entrar la página de inicio de Azure y buscar el botón Máquinas Virtuales. 

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.008.png)
![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.007.png)
Una vez allí podréis acceder al creador de máquinas virtuales. Más abajo tenéis las capturas de las características de la máquina que debéis generar. Como podéis comprobar, **NO se trata de la máquina más económica posible ya que emplearéis una máquina más potente para llevar a cabo la instalación inicial**. Os indicaremos a lo largo de la guía en qué momento podéis modificar las prestaciones de la máquina para que la arquitectura funcione sobre la máquina más económica, con un coste de 3,40€ al mes estando 24 horas activa. 

Vosotros las tendréis conectada mucho menos tiempo, por tanto, podríais optar por una máquina virtual con más prestaciones (¡cuidado, gastar los 100 USD de la cuenta implica el fin del acceso gratuito a los servicios, con impacto en la ejecución del proyecto!). Dado que la gestión económica y temporal es importante en cualquier implementación real, se os ruega que seáis cuidadosos.

A continuación, as capturas de pantalla muestran los pasos a realizar para generar la máquina virtual:

Paso 1 (Tipo de suscripción y tipo de máquina):

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.009.png)

Paso 2 (Método de acceso):

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.010.png)



Paso 3 (Reglas de puerto de entrada):

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.011.png)

Paso 4 (Opciones de disco):

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.012.png)



Paso 4 (Redes):

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.013.png)![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.014.png)

Paso 5 (Administración, apagado automático):

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.015.png)

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.016.png)

Al hacer clic en “Revisar y crear”, deberéis esperar unos segundos y se os mostrará el siguiente mensaje:

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.017.png)

Finalmente, hacer clic en “Crear” y se os mostrará el siguiente mensaje:

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.018.png)

Hacer clic en “Descargar la clave privada y crear el recurso”. Una vez se haya creado el recurso se os mostrará el siguiente mensaje:

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.019.png)

**Deberéis almacenar el archivo de la clave privada en la siguiente ruta:**

***C:\Users\<UsuariodevuestroPC>\.ssh***

Si accedéis al recurso máquina virtual veréis que podéis iniciarla y detenerla. Además, para evitar sustos, en la configuración veréis que se os ha indicado que activéis el apagado automático de la máquina cada día a las 24:00:00, para que no haya problemas si se queda encendida después de trabajar en ella. 
![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.020.png)
Podréis acceder a la siguiente página web para poder ver el saldo que os queda y el consumo que realizáis:

<https://www.microsoftazuresponsorships.com>

Os animamos en este punto a dedicar unos minutos a conocer la interfaz de Azure. Podéis intentar localizar la información de vuestra máquina virtual (IP pública, versión de sistema operativo, información acerca de CPU y discos). Debido a la riqueza de menús y opciones de la interfaz de Azure es imposible conocerla entera, pero creemos que es importante que dediquéis un poco de tiempo a localizar funciones importantes para trabajar con vuestra máquina virtual (iniciar, reiniciar, detener, eliminar) y podáis emplear dichas funciones a la hora de resolver problemas que vayan surgiendo a lo largo de la implementación del proyecto.
## Acceso a la máquina virtual mediante cliente SSH
Una vez arranquéis la maquina deberéis conectaros a ella para poder ejecutar comandos y utilizarla. Esta conexión se logra mediante SSH, un protocolo de línea de comandos que permite hacer algo parecido a programas de conexión remota de escritorios como TeamViewer. La máquina creada no tiene por qué tener una interfaz gráfica, es solo un ordenador con línea de comando, como es el caso que os ocupa.

En esta implementación, **accederéis a la máquina virtual mediante el par de claves SSH que ya habéis creado**, en lugar de utilizar usuario y contraseña. Este sistema minimiza las posibilidades que se reciba un ataque de intermediario (*man-in-the-middle attack*) a la hora de conectarse a la máquina virtual.

NOTA: Linux, Mac OSX y algunas versiones de Windows traen un cliente SSH instalado de fábrica, al que se puede acceder des del terminal de comandos (cmd para Windows). Si necesitáis instalarlo a parte, aquí tenéis un tutorial sencillo para Windows 10:

<https://www.profesionalreview.com/2018/11/30/ssh-windows-10/>

Para acceder a la máquina virtual mediante SSH hacer clic en el botón Conectar que podéis ver en la siguiente captura:

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.021.png)

Haced clic en *SSH* en el desplegable que se os abre, y llegaréis al siguiente menú:

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.022.png)

Ahora deberéis copiar la ruta de la clave privada que habéis descargado al crear la máquina virtual y pegarla en el espacio disponible en el punto 3. Una vez hecho esto, copiad el contenido del punto 4, ya que el comando se completará con la ruta de la clave privada que habéis indicado.



La respuesta del terminal debería ser parecida a la siguiente:

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.023.png)

En la parte inferior podéis ver que ya se indica el usuario y el nombre de vuestra máquina virtual. Por tanto, ya podréis ejecutar comandos sobre la máquina virtual a partir de esa línea.
## Habilitar acceso para el equipo docente
Se os proporcionará una clave pública que deberéis habilitar dentro de la máquina virtual.

Para hacerlo, copiad dicha clave pública y una vez dentro de la máquina virtual ejecutad los siguientes comandos para situaros en el directorio .ssh/:

      $ ls -a

      $ cd. ssh

El siguiente commando permite acceder al archivo que debéis configurar:

      $ sudo nano authorized\_keys

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.024.png)



El archivo *authorized\_keys* permite registrar las claves públicas que la máquina virtual considerará conocidas. Deberéis pegar en la línea inferior (marcada en rojo en la captura) a la que ya está escrita la clave pública que se os ha proporcionado:

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.021.png)

Para salir guardad los cambios con CTRL+O, pulsad *Enter* para mantener el nombre del archivo guardado y salid con CTRL+X.

Finalmente podéis validar si hay dos claves registradas introduciendo el siguiente comando:

      $ sudo cat authorized\_keys
## Instrucciones de manejo de la máquina virtual
De cara al uso general del terminal Bash de Linux, podéis utilizar la siguiente web que os explicará los comandos básicos del terminal:

<https://es.wikibooks.org/wiki/Manual_de_consola_Bash_de_Linux>

Resaltar el uso de los siguientes comandos:

- “**cd**”. Permite desplazarse entre directorios.
- “**ps –A**”. Permite ver los procesos (programas) que está ejecutando el sistema operativo, muy útil para comprobar si el software que necesitareis está en ejecución.
- “**docker ps**”. Devuelve una lista con información de los contenedores generados (identificador, imagen a partir de la que se ha creado y estado).

Por otro lado, para los usuarios de Windows recomendamos instalar Windows Terminal, un programa que ofrece un terminal con muchas funcionalidades (navegar arriba y abajo para poder visualizar todos los comandos introducidos y la información devuelta por la máquina, generar varias sesiones de terminal en forma de pestañas en una misma ventana, …). Esta aplicación es gratuita y la podéis encontrar en la Microsoft Store.
# Instalación de software en contenedores
Los recursos que haréis correr en la máquina virtual son:

- **Node-RED**, un gestor de comunicaciones con la planta y otras aplicaciones en nube, que permite además ejecutar programas (en la primera parte del proyecto, para comprobar su funcionamiento, NodeRed contendrá un generador de señales sinusoidales a cierta frecuencia y amplitud que emulará la señal capturada).
- **Grafana**, un interfaz gráfico de baja complejidad que permite presentar datos en una web en forma de gráficos, mapas, etc. Es fácilmente configurable para trabajar con InfluxDB.
- **InfluxDB**, un servidor de base de datos en el que almacenaremos data.

En la solución tecnológica que vais a implementar instalaréis cada software en un contenedor aislado (*container*), como podéis ver en la siguiente captura:

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.025.png)
## Instalación de Docker
Una vez conectados a vuestra máquina virtual mediante SSH, deberéis ejecutar los comandos que se presentan en esta sección para descargar e instalar Docker. Los comandos que se encuentran a continuación son los mismos que se aportan en la documentación oficial de Docker, que podéis encontrar en el siguiente enlace:

<https://docs.docker.com/engine/install/ubuntu/>

**NOTA**: si disponéis de un procesador AMR consultad la documentación oficial, <https://docs.docker.com/engine/install/ubuntu/>, ya que el último comando será diferente en vuestro caso)

      $ sudo apt-get udpate

      $ sudo apt-get install \

         apt-transport-https \

         ca-certificates \

         curl \

         gnupg \

         lsb-release

      $ sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

      $ echo \

         "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \

      $(lsb\_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

      $ sudo apt-get update

      $ sudo apt-get install docker-ce docker-ce-cli containerd.io

Podéis verificar que Docker se ha instalado correctamente ejecutando el siguiente comando, para descargar y ejecutar una imagen en un contenedor, imprimiendo al hacerlo un mensaje informativo por pantalla.

      $ sudo docker run hello-world
## Instalación de Docker Compose
A continuación, deberéis descargar e instalar Docker-compose con los siguientes comandos:

      $ sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

      $ sudo chmod +x /usr/local/bin/docker-compose

Podéis verificar que se ha instalado correctamente ejecutando el siguiente comando:

      $ sudo docker-compose –version
## Transferencia de archivos a la máquina virtual
Ahora deberéis descargar el directorio IIACPS\_base\_folder de Atenea y enviarlo a la máquina virtual que habéis creado. Esta transferencia de archivos se llevará a cabo mediante el protocolo SCP (Security Copy Protocol) que está basado en SSH.

Una vez abierto *cmd* o *Windows Terminal* en vuestro ordenador, introducir el siguiente comando:

      scp -r -i <rutaclaveprivada> <rutadeorigen> usuarioVM@ipVM:<ruta dedestino>

NOTA: La **-r** en el comando indica que se está enviando un directorio completo, si necesitáis enviar solo un archivo podéis utilizar el mismo comando, eliminando la **-r**.

En el terminal deberíais observar que se indica el progreso de la transferencia de archivos, alcanzando el 100% cuando se haya completado. Se recomienda que verifiquéis, estando conectados por SSH a la VM, que podéis localizar fácilmente el directorio IIACPS\_base\_folder.

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.026.png)
## Creación de imagen *custom* de Node-RED
Debido a que vamos a necesitar usar algunos paquetes concretos de Node-RED que no vienen incluidos en la versión base, será necesario que montéis una imagen que incluya dichos paquetes. **La arquitectura docker que habéis enviado por SCP a la máquina virtual ya está preparada para ello**. Para montar la imagen, deberéis situaros dentro de la carpeta IIA\_CPS\_base\_folder y ejecutar el siguiente comando (NOTA: El punto después de **tag** está incluido en el comando):

      $ sudo docker build -t nodered:<tag> .

Observaréis al pulsar “Enter” que se inicia una secuencia de 4 pasos. 

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.027.png)

Cuando finalice la secuencia, podéis verificar que se ha creado correctamente con el siguiente comando:

      $ sudo docker image ls

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.028.png)

Una vez terminada, **deberéis editar el archivo “docker-compose.yml” el tag de la imagen que acabáis de montar**.  Podéis salir del directorio de Nodered con el siguiente comando:

      $ cd ..

Una vez en la carpeta donde se encuentra “docker-compose.yml”, podéis editar el archivo con el siguiente comando:

      $ sudo nano docker-compose.yml

Tened cuidado de no añadir espacios o tabulaciones. Solo debéis editar la línea que se muestra en la siguiente captura modificando el tag que habéis elegido para vuestra imagen. Podréis navegar por el archivo con las flechas direccionales del teclado.

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.029.png)



Cuando hayáis realizado la modificación, recordar que podéis guardar los cambios mediante “CTRL+O”, os pedirá que nombréis el archivo y no debéis modificar el nombre, así que será suficiente con pulsar “Enter”. Finalmente, para salir del editor de archivos *nano*, usad “CTRL+X”. El proceso de crear la imagen *custom* para Node-RED solo deberéis realizarlo una vez.

Ahora, para verificar que la imagen se ha generado correctamente ejecutaréis el archivo “docker-compose.yml” (encontraréis el comando con el que hacerlo en la página siguiente). **Esta operación la deberéis realizar cada vez que os conectéis a la máquina virtual** ya que, aunque dejéis los contenedores montados, se eliminarán cuando la máquina virtual se apague automáticamente a las 00:00.
## Creación de imagen *custom* de Grafana
Para el caso de Grafana también será necesario generar una imagen. Para montar la imagen, deberéis situaros dentro de la carpeta IIA\_CPS\_base\_folder y ejecutar el siguiente comando (NOTA: El punto después de **tag** está incluido en el comando):

      $ sudo docker build -t grafana:<tag> .

Acceded al archive “docker-compose.yml” como se indica en la sección anterior y en el servicio de Grafana escribid el tag de la imagen que habéis montado.

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.030.png)


## Levantado de contenedores
El siguiente comando toma la información recogida en el docker-compose para generar los contenedores. En el caso que nos ocupa, el archivo docker-compose que estáis utilizando ha sido escrito para que levante un contenedor para cada software, tres en total.  

      $ sudo docker-compose up

**La sesión de terminal que estáis utilizando se quedará bloqueada devolviendo información acerca de los contenedores en forma de logs, esto puede ser útil a la hora de determinar que sucede si algo no funciona como esperabais. Deberéis abrir una nueva para continuar trabajando.** 

Alternativamente es posible levantar los contenedores sin que la sesión se quede bloqueada y por tanto no se reciban los logs. Para ello, debéis añadir *-d* al comando anterior, quedando como sigue:

      $ sudo docker-compose up -d

En cualquiera de los dos casos, para verificar que los contenedores están activos utilizad el siguiente comando, que devuelve la lista de contenedores:

      $ sudo docker ps

En la consola deberíais visualizar una lista como la siguiente. Tened en cuenta que es posible que la primera vez que ejecutáis el comando no se hayan generado los tres contenedores. Volved a introducir el comando hasta verificar que los tres contenedores están funcionando.

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.032.png)
![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.031.png)
En este punto, si lo deseáis, ya podéis modificar las prestaciones de la máquina virtual debido a que **ya se ha instalado todo el software necesario**. La opción más económica es **B1ls**, ver la siguiente captura. 

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.033.png)


# Configuración de los puertos de la máquina virtual
En soluciones tecnológicas como la que estáis implementando, se requiere acceder a la configuración de los elementos de software para garantizar que su operación cumplirá con el funcionamiento requerido. Para programar y configurar dichos programas será necesario habilitar los puertos de comunicaciones en la máquina virtual.

Debido a que InfluxDB se trata de una base de datos a la que no vamos a acceder des del exterior, sino que accederán las otras aplicaciones cuando realicen operaciones de lectura o escritura de datos, solo deberéis habilitar los puertos de Node-RED y Grafana. **Por defecto, Node-RED ocupa el puerto 1880 y Grafana el 3000.**

En Azure, deberéis acceder a vuestra máquina virtual. Lo podéis hacer mediante el icono de “Máquinas virtuales”, remarcado en la siguiente captura.

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.034.png)

Accederéis a la lista de máquinas virtuales creadas, y haciendo clic en la vuestra se os abrirá la información general de la máquina virtual. Ahora, en el apartado “Redes” del menú de configuración, se desplegará una lista.  Deberéis definir nuevas reglas de puertos de entrada, una regla para cada puerto, para poder acceder a cada software y configurarlo. Como ejemplo, a continuación, podéis ver que datos rellenar para configurar el puerto correspondiente a Node-RED.

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.035.png)

NOTA: Cuando hagáis clic en “Agregar” es posible que tarde unos segundos en verse reflejada la nueva regla en la lista de reglas de puerto de entrada.

Una vez tengáis ambas reglas definidas, deberíais ver una lista de reglas de puerto de entrada como la de la captura siguiente:

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.036.png)

Pese a que no es necesario hacerlo, también se puede generar una regla con el puerto de InfluxDB, que es el 8086. De esta forma, os podréis comunicar des del navegador con la base de datos que crearéis en InfluxDB de la máquina virtual.

El siguiente ejemplo de dirección HTTP realiza una petición GET al “endpoint” query, con los parámetros “q” y “pretty”. Según la API de InfluxDB, el parámetro “q” debe contener el comando que queremos ejecutar, en este caso “SHOW DATABASES”, y el parámetro “pretty” contiene un booleano para indicar que la respuesta sea con saltos de línea fáciles de visualizar. 

Esta es la petición:

*http://”IPpublicaDeVuestraVM”:8086/query?q=show databases&pretty=true*

Y este un mensaje de respuesta semejante al que vosotros recibiréis:

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.037.png)

Para acceder a Node-RED o Grafana utilizaréis el puerto de cada uno, el que habéis configurado en las reglas de puertos de entrada de vuestra máquina virtual. 

**Así, para acceder a NodeRed mediante el navegador debéis usar:**

[*http://”IPpublicaDeVuestraVM”:1880*]()

**Y para acceder a Grafana debéis usar:**

[*http://”IPpublicaDeVuestraVM”:3000*]()



Ahora recomendamos que, mediante vuestro navegador, accedáis a la instalación de Node-RED creada en un contenedor específico para este software y verifiquéis que se han instalado correctamente los siguientes paquetes:

- Modbus.
- InfluxDB
- Dashboard.

Lo podéis hacer consultando la lista de bloques disponibles en la barra vertical a la izquierda de vuestra pantalla, remarcada en la siguiente captura.

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.038.png)

Si tecleáis los nombres de los paquetes en el buscador de nodos, en la parte superior de la paleta de nodos, podréis verificar que tenéis disponibles los bloques del paquete Modbus (de color rojo), los bloques del paquete Influxdb (de color marrón) y los bloques del paquete dashboard (de color azul).


# Acceso a la base de datos InfluxDB
Una vez levantados los contenedores, será necesario generar una base de datos dentro del contenedor que ejecuta el software InfluxDB. Para hacerlo, entraréis al terminal dedicado del contenedor y accederéis a la interfaz de línea de comandos de InfluxDB.

En primer lugar, deberéis identificar el nombre del contenedor de Influxdb, como se indica en la siguiente captura:

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.039.png)

Ahora deberéis introducir el siguiente comando para acceder al terminal del contenedor:

      $ sudo docker exec -it <nombre\_del\_contenedor> bash

A continuación, deberéis introducir la palabra “influx” para acceder a la interfaz de línea de comandos de InfluxDB, recibiendo una respuesta como la de la siguiente captura.

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.040.png)

Finalmente, mediante el siguiente comando podréis generar una base de datos:

      > create database <nombre\_de\_la\_base\_de\_datos>

Para verificar que lo habéis hecho correctamente, podéis acceder a la lista de bases de datos creadas introduciendo el siguiente comando:

      > show databases

El terminal os debería devolver una lista en la que encontraréis dos bases de datos: una con el nombre “\_internal”, que almacena datos internos de InfluxDB, y la que habéis creado vosotros.

Podéis encontrar toda la documentación referente a los comandos que sirven para gestionar bases de datos a partir de la interfaz de línea de comandos de Influxdb en el siguiente enlace:

<https://docs.influxdata.com/influxdb/v1.8/query_language/manage-database/>


# Generación y volcado de datos en Node-RED
El siguiente paso será **programar sobre Node-RED un flujo de comunicaciones capaz de generar datos artificiales y volcarlos en la base de datos de InfluxDB que habéis creado.**

Recordad que para acceder al contenedor de Node-RED mediante el navegador podéis utilizar la siguiente dirección: [*http://”IPpublicaDeVuestraVM”:1880*]()

De forma progresiva y cumpliendo los objetivos que os vamos marcando, se os propone generar un *flow* con la siguiente estructura:

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.041.png)
## Bloque Debug
Pese a que no se incluyan bloques *debug* en la estructura del *flow* que tenéis que programar, se recomienda que utilicéis los bloques *debug* para verificar que las modificaciones que hacéis en el Flow producen el efecto esperado.

Los bloques *debug* pueden conectarse a la salida de cualquier bloque y mostrarán en la parte derecha de la pantalla, concretamente en la pestaña *debug*, la información que han recibido.

Por tanto, no es descabellado utilizar un bloque *debug* a la salida de cada bloque que genere o modifique datos. Hacerlo puede permitir localizar rápidamente que bloque no ejecuta la operación que se desea. Una vez validado que el funcionamiento es el esperado, eliminar los bloques *debug* no tendrá ningún efecto.

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.042.png)

A continuación, se presentan varias secciones dedicadas a los distintos tipos de bloques que vais a necesitar. Se pretende que los objetivos que os fijamos al final de cada sección sirvan para verificar que habéis entendido como trabajar con cada tipo de bloque. Para completar dichos objetivos vais a necesitar combinar los bloques que ya se hayan presentado, de forma acumulativa, con lo que terminaréis generando el *flow* completo.
   ## Bloque inject
Los bloques *inject* permiten la generación de mensajes en el *flow* de manera manual, mediante un botón (cuadrado de color azul, en la parte izquierda del bloque) en el que es posible hacer clic, o de manera periódica.  Estos mensajes son objetos que contienen información y la almacenan en una estructura predefinida. Normalmente los mensajes tendrán un elemento llamado *payload* (al que se puede acceder mediante *msg.payload*) donde se acostumbra a almacenar los datos que contiene el mensaje.

En la configuración de vuestro bloque *inject* podréis decidir qué queréis que se incluya en el *payload* del objeto emitido. Por defecto se envía un *timestamp*, es decir, la maca de tiempo (en formato *Tiempo Unix*) del momento en el que se ha ejecutado ese bloque *inject*.

En esta primera parte del proyecto, este bloque sustituye al conjunto de bloques encargado de tomar datos de algún sensor, base de datos, estación meteorológica o PLC. 

**Objetivo**

1. **Deberéis verificar que sois capaces de programar un Flow en el que un bloque *inject* genera mensajes manualmente y también de forma periódica.**
## Bloque function
Los bloques *function* permiten manipular los mensajes y se programan en lenguaje *JavaScript*. Podéis consultar el siguiente tutorial para conocer cual es la sintaxis de *JavaScript* para cada caso.

<https://www.w3schools.com/js/default.asp>

El código que escribáis en el bloque *function*, dentro del espacio en blanco que podéis ver en la siguiente captura, se ejecutará cada vez que este bloque reciba un mensaje.

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.043.png)

Encontrareis información sobre las capacidades operativas que ofrece este tipo de bloques en el siguiente link: 

<https://nodered.org/docs/user-guide/writing-functions>

**Objetivos**

1. **Programad que se asigne un valor numérico constante al *payload* del mensaje. Verificad que es así mediante un bloque *debug*.**
1. **Programad que se generen datos variables a lo largo del tiempo (Algunos ejemplos pueden ser funciones matemáticas periódicas, contadores, o simplemente valores aleatorios; el apartado “JS Math” del tutorial indicado anteriormente puede ser de utilidad). Verificad que funciona correctamente mediante un bloque *debug*.**

El siguiente objetivo, que se especifica en la próxima página, consiste en programar el bloque *function* para que genere datos en el formato que aceptan las bases de datos InfluxDB. 

La siguiente captura es un ejemplo de *function* para preparar el mensaje para ser volcado a la base de datos mediante un bloque “Influx Batch”. Como veis, por cada medida que se quiera escribir en la serie de datos, que se indica como *measurement*, de la base de datos podemos incluir valores, que correspondan a los datos que se quieran almacenar, y tags, que son indicadores que permiten filtrar los datos a posteriori. 

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.044.png)

Por ejemplo, en un *measurement* donde se almacenen datos de varios sensores de temperatura, existiría una sola columna de temperatura y una columna donde indicase de que sensor se trata. Los datos se organizarían como en la siguiente tabla, donde la columna de temperatura, que sería el dato a almacenar, sería una columna de tipo *field*, y el nombre del sensor al que corresponde esa medición sería una columna de tipo *tag*.

|**Temperatura**|**Sensor**|
| :-: | :-: |
|23|sensor1|
|21|sensor1|
|29|sensor2|

3. **Programad la señal que deseéis escribir en la base de datos y ver en Grafana (ello implica que ya no deberíais volver a modificar el bloque *function)*. Adaptar la estructura y los datos del mensaje para que el bloque Influx los pueda volcar en la base de datos.**
![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.045.png)

**Debéis aportar una captura o recorte de pantalla** del código que habéis programado en el bloque *function* para generar la señal que posteriormente escribiréis en la base de datos. Más adelante, se os pedirá una captura de los datos escritos en la base de datos donde se pueda apreciar que los datos escritos por el *flow* de Node-RED son los mismos que visualizáis en la base de datos de InfluxDB. Por eso se hace referencia a que no se modifique el bloque *function* durante el resto de esta primera parte del proyecto.	


## Bloque InfluxDB Batch
El bloque InfluxDB permite conectar el *flow* de Node-RED con una base de datos de InfluxDB. Los pasos para configurar el bloque son los siguientes:

1) Hacer clic sobre el lápiz para editar la información referente a la base de datos a la que se va a conectar el bloque.

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.046.png)

2) En las opciones de edición del nodo, deberéis rellenar los campos *host* y *port* con la información de la captura. Tened en cuenta que esta IP ha sido asignada manualmente al container de InfluxDB en el archivo *docker-compose*. Pese a que sería totalmente equivalente utilizar la IP de la máquina virtual indicando el puerto 8086, recordad que la IP de la máquina virtual cambia cada vez que la arrancáis (lo que implicaría modificar este parámetro en el Flow de Node-RED cada vez), mientras que la IP del container será siempre la misma.

3) Finalmente, deberéis rellenar el campo *database* con el nombre que le habéis dado a vuestra base de datos, la que anteriormente habéis creado en el contenedor de InfluxDB.

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.047.png)

Haced clic en *Update* o *Add* cuando terminéis para guardar los cambios.

**Objetivo**

1. **Generad varios mensajes de forma manual mediante el bloque *Inject*. Confirmad que los datos se han escrito correctamente en la base de datos siguiendo el siguiente procedimiento:**

Repetid el proceso que se ha llevado a cabo para crear la base de datos en el contenedor de Influx ([haced clic aquí para volver a las instrucciones para dicho proceso](#_Acceso_a_la)). Una vez dentro del contenedor de Influx, introducid los siguientes comandos:

      > use <nombre\_de\_la\_base\_de\_datos>

Este comando sirve para indicar que a partir de ahora los comandos introducidos se referirán a una base de datos concreta.

      > select \* from <nombre\_de\_la\_serie\_de\_medidas>

Así le indicamos a influx que queremos visualiar todas las columnas (\*) de (*from*) una serie de medidas en particular. Como ejemplo os mostramos una respuesta semejante a la que deberíais recibir en el terminal. 

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.048.png)

Tened en cuenta que si habéis mantenido el *flow* de Node-RED escribiendo periódicamente, la lista de medidas que visualizaréis puede ser muy larga.

2. **Generad una señal durante un tiempo (2 minutos es suficiente si estáis escribiendo una medida cada segundo, ya que saldrían 120 medidas). Esta señal será la que deberéis visualizar en Grafana; se explica cómo hacerlo en el siguiente apartado.**
![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.045.png)
**Debéis aportar una captura de pantalla de los datos escritos en la base de datos de InfluxDB.** Recordad que en este punto estáis demostrando que los datos sintéticos generados por como habéis programado en el bloque *function* (que ha quedado reflejado en la última captura que os hemos pedido) llegan correctamente a la base de datos. Como ejemplo, pensad que si habéis generado una señal senoidal de amplitud entre -1 y 1, es muy fácil apreciar que se trata de la misma señal en la base de datos. 


# Visualización de datos en Grafana

Con los contenedores levantados, podréis acceder mediante vuestro navegador al contenedor que contiene Grafana utilizando la siguiente URL:

[*http://”IPpublicaDeVuestraVM”:3000*]()

Para iniciar sesión utilizaréis las siguientes credenciales que se indican en el archivo “docker-compose.yml”, que son las siguientes:

**User: admin**

**Password: supersecretpassword**

Ahora deberéis configurar la base de datos que de la que queréis que Grafana haga la lectura de datos. Para ello, deberéis acceder al menú de configuración y acceder al apartado de *Data Sources*.

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.049.png)

Haced clic en *Add Data Source* y seleccionad como tipo de base de datos *InfluxDB*.

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.050.png)

Deberéis dar un nombre a esta Fuente de datos (no tiene porque ser el mismo que el de la base de datos de InfluxDB) e indicar la dirección URL del container de InfluxDB.

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.051.png)

En el campo *Database* deberéis introducir el nombre de vuestra base de datos. Aseguraos que los campos *HTTP Method* y *Min time Interval* quedan como en la captura.

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.052.png)

Podéis validar que Grafana ha detectado la base de datos haciendo clic en el botón *Save & Test*. Un resultado satisfactorio debería devolver el siguiente mensaje:

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.053.png)



Para visualizar los datos escritos en la base de datos de InfluxDB, deberéis crear un *Dashboard* de Grafana:

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.054.png)

Haced clic en *Add new panel* y se os abrirá un panel que se va a ir actualizando con la información que añadáis en la pestaña *Query*. Ahora deberéis modificar los campos destacados en la captura con el nombre de la serie de medidas de InfluxDB donde habéis escrito los datos y la variable que contiene los valores numéricos de las medidas.

![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.055.png)

Una vez lo hayáis hecho, en el panel gráfico de la parte superior podréis visualizar los datos sintéticos que habéis generado en Node-RED. Podéis seleccionar un período de tiempo sobre el que hacer *zoom* para ver mejor los datos. **Con esto habréis cumplido el objetivo fijado para esta primera parte del proyecto, ¡buen trabajo!**

Haced clic en *Apply* en la esquina superior derecha de la pantalla para guardar los cambios en el panel que habéis generado. Una vez hecho, en la parte superior del *dashboard* tenéis también una opción para guardar los cambios en el *dashboard*.
![](../img/Aspose.Words.b1061091-e8de-4e39-91fb-4ba4b8e356ff.056.png)
**Debéis aportar una captura del dashboard de Grafana donde se puedan ver claramente los datos que están escritos en la base de datos de InfluxDB.** Configurad el dashboard de forma que se pueda apreciar claramente el comportamiento de los datos.
