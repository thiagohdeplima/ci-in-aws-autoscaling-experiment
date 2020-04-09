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
  * Portas expostas para acessar ambiente;
  * Volumes persistidos para manipular artefatos;
  * Containers caso haja algum problema, deverão subir outra vez.

## Introdução

### Pré-configurações

Este projeto utiliza o [S3 como backend de estado](https://www.terraform.io/docs/backends/types/s3.html) do Terraform.

Assim, para cumprir os requisitos necessários para usar este ambiente, siga o passo a passo abaixo em sua conta da AWS;

* Crie um bucket de S3 destinado ao armazenamento de estado do Terraform;
* Habilite o [versionamento dos objetos](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/enable-versioning.html) do Bucket;
* Altere a variável `bucket` do arquivo [main.tf](main.tf), para o nome do bucket criado;
* Crie uma tabela de DynamoDB chamada `terraform-lock`;
  * A chave primária desta tabela deverá chamar-se `LockID`.
* Crie um usuário na AWS que tenha ao menos as permissões especificadas [aqui](https://www.terraform.io/docs/backends/types/s3.html);
* Crie credenciais para este usuário e guarde-os em um local seguro.

Feito isto, declare as seguintes variáveis de ambiente:

- `TERRAFORM_AWS_ACCESS_KEY_ID`
- `TERRAFORM_AWS_SECRET_ACCESS_KEY`
