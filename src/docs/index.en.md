# Introduction

## Project description

The purpose of the practice is to delve into the use of cloud computing and IIoT tools for data acquisition in industrial systems. The overall objective of the project will be to create a *dashboard* that allows visualizing the data acquired and calculated, through graphs in different configurable panels in a web environment.

For this it will be necessary to learn to use several tools that will allow:

- Create Linux virtual machines and work on them remotely through commands, using communication protocols such as SSH and SCP.
- Learn how information flow management software environments are used and what they are based on, and how data can be transmitted or viewed in the cloud.
- Learn how to design and implement a structure of software containers (*containers*) using Docker.
- Learn how to perform database read and write operations from applications capable of processing data and obtaining value-added information, such as MATLAB Online.

These tools and technologies are going to be introduced in stages and specific objectives are going to be set that allow the final solution to be designed cumulatively.

Keep in mind that the most important part of this project is that you know how to create these virtual machines, that you work with the Docker environment, that you install the necessary software and that you are able to start up the proposed IIoT architecture.

During the course of the entire practice you will face the difficulties of implementation and start-up, and you will develop problem-solving skills related to the joint operation of all the elements present in the architecture that is intended to be implemented. Also, indicate that it is a project in which you must be able to solve the problems that you find. Do not be afraid to delete a virtual machine and create a new one if you see that you have made mistakes or if you are not sure about something, it is part of the process.


## Table of contents


[1.	Introducción a la primera parte del proyecto	3](#_Toc72700123)

[1.1.	Motivación	3](#_Toc72700124)

[1.2.	Objetivos de la primera parte del proyecto	4](#_Toc72700125)

[1.3.	Resultados de la primera parte del proyecto	4](#_Toc72700126)

[1.4.	Recursos disponibles	4](#_Toc72700127)

[2.	Creación de la máquina virtual	5](#_Toc72700128)

[2.1.	Acceso a la máquina virtual mediante cliente SSH	12](#_Toc72700129)

[2.2.	Habilitar acceso para el equipo docente	13](#_Toc72700130)

[2.3.	Instrucciones de manejo de la máquina virtual	14](#_Toc72700131)

[3.	Instalación de software en contenedores	15](#_Toc72700132)

[3.1.	Instalación de Docker	15](#_Toc72700133)

[3.2.	Instalación de Docker Compose	16](#_Toc72700134)

[3.3.	Transferencia de archivos a la máquina virtual	16](#_Toc72700135)

[3.4.	Creación de imagen *custom* de Node-RED	17](#_Toc72700136)

[3.5.	Creación de imagen *custom* de Grafana	18](#_Toc72700137)

[3.6.	Levantado de contenedores	19](#_Toc72700138)

[4.	Configuración de los puertos de la máquina virtual	20](#_Toc72700139)

[5.	Acceso a la base de datos InfluxDB	23](#_Toc72700140)

[6.	Generación y volcado de datos en Node-RED	24](#_Toc72700141)

[6.1.	Bloque Debug	24](#_Toc72700142)

[6.2.	Bloque Inject	24](#_Toc72700143)

[6.3.	Bloque function	25](#_Toc72700144)

[6.4.	Bloque InfluxDB Batch	27](#_Toc72700145)

[7.	Visualización de datos en Grafana	29](#_Toc72700146)