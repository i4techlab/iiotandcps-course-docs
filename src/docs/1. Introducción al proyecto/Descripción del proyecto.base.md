<!-- multilingual suffix: en, es -->

<!-- [en] -->

# Desarrollo de una arquitectura IIoT en la nube (*cloud computing*)

La primera parte del proyecto tiene por objetivo generar la arquitectura IIoT y verificar que tiene la capacidad de gestionar flujos de datos. Las comunicaciones con el entorno industrial 

<!-- [es] -->

# Desarrollo de una arquitectura IIoT en la nube (*cloud computing*)

La primera parte del proyecto tiene por objetivo generar la arquitectura IIoT y verificar que tiene la capacidad de gestionar flujos de datos. Las comunicaciones con el entorno industrial y el procesado de datos se llevarán a cabo en la segunda parte del proyecto.

**En la sección 1. se presenta la estructura de la arquitectura IIoT y se definen los objetivos de esta primera parte del proyecto, así como los resultados que debéis obtener y aportar.**

# Introducción a la primera parte del proyecto

En la arquitectura IIoT, vosotros mismos generaréis datos artificiales dentro del propio software de gestión de flujos de comunicación (Node-RED) que os permitan verificar que la base de datos y los paneles de visualización funcionan como se espera. Se espera que sigáis las secciones en orden ya que van tratando de forma pautada los pasos necesarios para implementar la arquitectura IIoT propuesta.
<!-- [common] -->
![](./img/001.png){: .center}

<!-- [es] -->
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


#  Introducción a la segunda parte del proyecto 

La segunda parte del proyecto tiene por objetivo la integración  de la arquitectura IIoT ya generada sobre un sistema ciber-físico o *CPS*. Un sistema ciber ciber físico es todo aquel dispositivo que integra capacidades de computación, almacenamiento y  comunicación para controlar e interactuar con un proceso físico. Los sistemas ciber-físicos  pueden estar conectados entre sí y también con servicios remotos de almacenamiento y gestión  de datos, como con los que trabajáis en el proyecto de la asignatura. 


Una vez implementada la arquitectura IIoT se os propone que integréis un sistema de  comunicaciones con un entorno industrial simulado e incluyáis un procesado de datos previo a  la visualización de los datos en Grafana. 

![]({./img/Aspose.Words.413534b6-4ca3-41d6-9fb4-e8e165328afe.001.png)

## Comunicaciones con entorno industrial 

Mediante un protocolo de comunicación, como será en este caso TCP/IP, es posible introducir  un flujo de datos provenientes de una planta (e.g. a través de sus PLCs) en una arquitectura IIoT  como la desarrollada hasta ahora.  

A la práctica, el uso TCP/IP os permitirá recibir y almacenar los datos que envía un sensor de  vibración ubicado en una máquina, que se componen de cuatro parámetros estadísticos  calculados sobre la señal de vibración de la máquina: *RMS, Skewness, Kurtosis* y *Mean*. Estos  parámetros son capturados y registrados en unas posiciones de memoria de un PLC compatible  con el protocolo de comunicaciones Modbus TCP/IP, que dispone de un puerto de  comunicaciones Ethernet. 

## Procesado de datos 

El procesado de datos tiene por analizar los datos almacenados para obtener información útil  (e.g. alarmas, costes, gestión logística). En vuestro caso implementaréis un código en el entorno  MATLAB que permita extraer información de valor añadido de los datos recibidos. Este código  deberá calcular valor medio de cada uno de los cinco parámetros tomando los datos que se han  enviado en el último minuto de información registrada.

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



# Introducción a la tercera parte del proyecto 

La tercera parte del proyecto tiene por objetivo la integración de  una aplicación de análisis de datos en la nube.

Después de haber completado la implementación de la arquitectura CPS & IIoT se os propone que  implementéis una aplicación de análisis de datos sobre MATLAB Online, utilizando los cuatro  indicadores estadísticos de los datos de vibración que han sido medidos y almacenados en la base  de datos. 

![](Aspose.Words.cd0f075b-9459-4822-81b8-107b2930d75d.001.png)

## Motivación 

En esta parte del proyecto utilizaréis modelos matemáticos generados en MATLAB para determinar  si los datos de vibración indican que el equipo industrial está sano o si se está produciendo un fallo  concreto, que responde a una distribución concreta de los parámetros.  

Los modelos matemáticos, que se os proporcionan en forma de *workspace* (archivo con extensión  .mat) de MATLAB, se han generado fuera de línea (*offline*) utilizando datos del mismo PLC simulado  con el que habéis estado trabajando hasta ahora. Así, estos modelos están entrenados para  identificar ciertos patrones en los datos, siempre que estos provengan del mismo equipo. Estos  modelos interpretarán los datos que leeréis desde MATLAB Online y los clasificarán, primero como  conocidos o desconocidos, y luego si son conocidos se decidirá si se cree que corresponden a la  condición de funcionamiento de sistema sano o de sistema con un fallo concreto, que en este caso  se define como un desgaste excesivo de uno de los cojinetes del motor eléctrico en el que están  montados los sensores de vibración que mandan información al PLC. 

Además, se determinará un valor de pertenencia para cada entrada de datos considerada como  conocida. El modelo matemático expresa como valor de pertenencia la probabilidad del que el dato  pertenezca a una clase o a otra. Por tanto, en este caso habrá dos probabilidades, que en total  deberán sumar 1 (o 100%) debido a que solo se consideran dos condiciones de funcionamiento,  “Sano” y “Fallo cojinete”. 

A la práctica, este valor de pertenencia aporta información extra a técnicos de mantenimiento que  se encuentran en el entorno industrial donde está ubicado el motor eléctrico y el PLC. De esta forma,  se puede llevar a cabo una toma de decisiones basada en: 

- La experiencia y el conocimiento de la máquina o de equipos similares por parte del  personal técnico.

- Los valores de pertenencia que la red neuronal ha evaluado con datos recientes, pese a que  la red neuronal ha sido generada tomando un histórico de datos y por tanto aporta esa  capacidad de identificar patrones y potencialmente aportar información que permita  anticiparse a mantenimientos o averías. 

## Objetivos de la tercera parte del proyecto 

En esta tercera parte del proyecto debéis cumplir con 2 objetivos: 

1. Implementar sobre MATLAB Online un único script que deberéis completar para lograr que  se lleve a cabo el análisis de datos deseado. 

2. Integrar en la arquitectura CPS & IIoT generada en la segunda parte del proyecto la  aplicación en la nube de análisis de datos, de forma que puedan visualizarse por Grafana. 

## Resultados de la tercera parte del proyecto 

Teniendo en cuenta los objetivos que se han mencionado en el apartado anterior, los **resultados** que debéis obtener y aportar al final de esta tercera parte de la práctica son: 

- Utilizando MATLAB Online, realizar la lectura de los datos de la base de datos, recuperar los  cuatro indicadores originales y realizar el procesado de datos. 

- Determinar según el resultado del análisis de los datos si las condiciones descritas por los  datos son conocidas y si lo son, concluir si el equipo industrial está fallando y escribir en la  base de datos el resultado. 

- Escribir los datos del diagnóstico y de la detección de novedad en la base de datos. • Visualizar los datos procesados en Grafana. 

**Para demostrar que habéis logrado estos resultados, se os pedirá que, en un período tiempo de  aproximadamente 1 o 2 semanas de duración, configuréis la máquina virtual con la opción más  económica y la dejéis encendida con los contenedores de Docker funcionando y compartáis la IP  con el equipo docente. Ello implicará que durante todo este tiempo la IP será la misma y nosotros  podremos acceder para validar vuestra arquitectura.**  
