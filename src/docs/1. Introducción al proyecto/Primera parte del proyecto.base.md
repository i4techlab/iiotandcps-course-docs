<!-- multilingual suffix: en, es -->

<!-- [en] -->




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