<!-- multilingual suffix: en, es -->

<!-- [en] -->




<!-- [es] -->

La segunda parte del proyecto tiene por objetivo la integración  de la arquitectura IIoT ya generada sobre un sistema ciber-físico o *CPS*. Un sistema ciber ciber físico es todo aquel dispositivo que integra capacidades de computación, almacenamiento y  comunicación para controlar e interactuar con un proceso físico. Los sistemas ciber-físicos  pueden estar conectados entre sí y también con servicios remotos de almacenamiento y gestión  de datos, como con los que trabajáis en el proyecto de la asignatura. 

**En la sección 1. se presenta la estructura de la arquitectura completa y se definen los objetivos  de esta segunda parte del proyecto, así como los resultados que debéis obtener y aportar.** 


#  Introducción a la segunda parte del proyecto 

Una vez implementada la arquitectura IIoT se os propone que integréis un sistema de  comunicaciones con un entorno industrial simulado e incluyáis un procesado de datos previo a  la visualización de los datos en Grafana. 

![]({./img/Aspose.Words.413534b6-4ca3-41d6-9fb4-e8e165328afe.001.png)

## Comunicaciones con entorno industrial 

Mediante un protocolo de comunicación, como será en este caso TCP/IP, es posible introducir  un flujo de datos provenientes de una planta (e.g. a través de sus PLCs) en una arquitectura IIoT  como la desarrollada hasta ahora.  

A la práctica, el uso TCP/IP os permitirá recibir y almacenar los datos que envía un sensor de  vibración ubicado en una máquina, que se componen de cuatro parámetros estadísticos  calculados sobre la señal de vibración de la máquina: *RMS, Skewness, Kurtosis* y *Mean*. Estos  parámetros son capturados y registrados en unas posiciones de memoria de un PLC compatible  con el protocolo de comunicaciones Modbus TCP/IP, que dispone de un puerto de  comunicaciones Ethernet. 


## Motivación 

En esta parte del proyecto simularéis el proceso de puesta en marcha de un flujo de  comunicaciones con un entorno industrial (que puede estar situado en cualquier parte del  mundo) con cierta capacidad de procesado de datos, que se llevará a cabo en la aplicación en la  nube de MATLAB. A parte de MATLAB, el resto de tecnologías que se utilizarán ya han sido  presentadas y configuradas en la primera parte del proyecto (Docker, Node-RED, Influx,  Grafana). 

## Objetivos de la segunda parte del proyecto 

En esta segunda parte del proyecto debéis cumplir con 2 objetivos: 

1. Implementar sobre MATLAB Online scripts para llevar a cabo el procesado de los datos  recibidos del sensor de vibración. 

2. Modificar la arquitectura IIoT generada en la primera parte del proyecto para que reciba  los datos del sensor de vibración. 

## Resultados de la segunda parte del proyecto 

Teniendo en cuenta los objetivos que se han mencionado en el apartado anterior, los **resultados**  que debéis obtener y aportar al final de esta segunda parte de la práctica son: 

- En Node-RED, recibir y preprocesar los datos emitidos por el sensor y escribirlos en una  base de datos de InfluxDB. 

- Utilizando MATLAB Online, realizar la lectura de los datos de la base de datos,  procesarlos y escribirlos de nuevo en la base de datos. 

- Visualizar en Grafana tanto los datos originales como los datos procesados. 

**Para demostrar que habéis logrado estos resultados, se os pedirá que, en un período tiempo  de aproximadamente 1 o 2 semanas de duración, configuréis la máquina virtual con la opción  más económica y la dejéis encendida con los contenedores de Docker funcionando y  compartáis la IP con el equipo docente. Ello implicará que durante todo este tiempo la IP será  la misma y nosotros podremos acceder para validar vuestra arquitectura.**  

## Recursos disponibles 

Tenéis a vuestra disposición documentación adicional de las tecnologías que se utilizan a lo largo  del proyecto: 

- Protocolos de comunicaciones. 

- Máquinas virtuales y Azure. 

- SSH y claves criptográficas. 

- Docker y Docker Compose. 

- InfluxDB. 

- Node-RED. 

- Grafana. 

- MATLAB Online. 

Además, en Atenea encontraréis vídeos que introducen Node-RED e Influx de forma práctica,  para que podáis ver como se espera que interactuéis con ambos softwares. 
