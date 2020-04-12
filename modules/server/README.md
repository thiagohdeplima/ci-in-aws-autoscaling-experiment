# Servidor de CI

Este módulo é responsável por realizar deploy de um ambiente para integração contínua e deploy contínuo na estrutura de nuvem da AWS.

Este ambiente funcionará das 08:00 às 20:00, e persistirá seus dados utilizando volumes que ficam armazenados em um NFS.

## Pré-requisitos

A correta execução deste módulo requer execução prévia dos módulos `networking` e `firewall`, respectivamente.

## Visão geral da solução

Os recursos criados por este módulo podem ser sub-divididos em dois grupos:

* Camada de execução
* Camada de persistência

A camada de execução consiste em uma [instância EC2](https://aws.amazon.com/ec2), cuja execução é disparada pelo [AWS Autoscaling](https://aws.amazon.com/pt/autoscaling/), sendo este responsável por ligar a instância a partir das 08:00 e desligá-la a partir das 20:00.

Esta instância executará containers de docker com os seguintes serviços:

* Jenkins;
* Nexus;
* Sonarqube;
* PostgreSQL, utilizado por este último.

Todos estes containers armazenam seus dados em [volumes](https://docs.docker.com/storage/volumes/), que são o elo de ligação entre a camada de persistência e a camada de execução.

A camada de persistência consiste em um NFS disponibilizado pelo serviço [EFS](https://aws.amazon.com/efs/) da AWS, onde todos os volumes de docker estão armazenados e mantidos mesmo quando a instância está desligada.

## Deficiências

Este módulo possui algumas deficiências que podem facilmente serem resolvidas com mais algumas poucas horas de atuação.

São elas:

### Alterações de IP

Por serem disparadas pelo autoscaling, as instâncias naturalmente possuem IP randômico, ou seja, todo dia, o endereço para acesso aos serviços será alterado, causando problemas tanto para os usuários quanto para as integrações destes serviços.

Este problema pode ser resolvido de duas formas diferentes:

* Utilizar um ELB como proxy reverso do ambiente;
* Utilizar uma entrada DNS que é atualizada automaticamente via [user_data](https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/user-data.html);
  * Sempre que uma instância nova subir, ela atualizará esta entrada;
  * Esta entrada deverá ter um TTL baixíssimo para evitar problemas com cache DNS;

### Falta de certificado SSL

Não existe, hoje, criptografa de dados transferidos entre os usuários e o servidor. 

Idealmente, isto deve ser implementado [emitindo um certificado via letsencrypt](https://www.terraform.io/docs/providers/acme/r/certificate.html) e implementando o mesmo por meio de um [container de nginx](https://hub.docker.com/_/nginx) que faria proxy reverso às aplicações.

### Backup

Este ambiente não conta com uma rotina de backup.

Para resolver isto, uma vez que estamos usando EFS para criar servidores NFS, é preferível utilizar o [AWS backup](https://aws.amazon.com/pt/backup/) para tal.

Na camada de banco de dados (PostgreSQL), é importante também considerar uma migração para o [RDS](https://aws.amazon.com/rds/), a depender do volume de uso do ambiente.
