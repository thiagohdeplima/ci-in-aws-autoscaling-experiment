# Testes: Vaga de Engenheiro de Software

Este repositório tem como objetivo cumprir o segundo teste técnico para a vaga de Engenheiro de Software.

## Escopo

Criação total de um ambiente de esteira CI/CD, contendo os seguintes softwares:

* Jenkins;
* Nexus;
* SonnarQube;

Requisitos:

* O ambiente deverá ser criado em um instância em cloud, criado através de script Terraform;

  * Deverá ter script de subida e descida de ambiente em horário das 8:00 as 20:00.

* Essa instância deverá aceitar multi-cloud, ou seja, as três principais clouds (AWS, GCP e Azure) poderão subir a instância criada;

* A criação da esteira deverá ser criada via docker-compose, tendo:

  * Portas expostas para acessar ambiente;*

  * Volumes persistidos para manipular artefatos;*

  * Containers caso haja algum problema, deverão subir outra vez.

 