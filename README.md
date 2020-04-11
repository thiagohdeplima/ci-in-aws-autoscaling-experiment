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

Para garantir reprodutividade deste ambiente em qualquer máquina, o ambiente de execução do Terraform foi dockerizado.

Além disto, para compartilhar o [estado](https://www.terraform.io/docs/state/index.html) do Terraform com quem quer que utilize o projeto, utilizamos o [S3 como backend de estado e DynamoDB como controle de consistência do mesmo](https://www.terraform.io/docs/backends/types/s3.html).

Deste modo, ao executar o projeto por favor, tenha certeza que seu usuário [possui as permissões adequadas](https://www.terraform.io/docs/backends/types/s3.html) para tal.

Além disto, caso você ou qualquer um em seu projeto tenha criado infraestrutura utilizando algum recurso aqui, por favor, siga o passo a passo abaixo:

* Crie um bucket de S3 destinado ao armazenamento de estado do Terraform;
* Habilite o [versionamento dos objetos](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/enable-versioning.html) do Bucket;
* Altere a variável `bucket` em todos arquivos `main.tf`, para o nome do bucket criado;
* Crie uma tabela de DynamoDB chamada `terraform-lock`;
  * A chave primária desta tabela deverá chamar-se `LockID`.

Feito isto, declare as seguintes variáveis de ambiente:

- `TERRAFORM_AWS_ACCESS_KEY_ID`
- `TERRAFORM_AWS_SECRET_ACCESS_KEY`

## Executando

Após realização de todo passo a passo da sessão anterior, execute `docker-compose up -d` para subir o container do Terraform, e por fim acesse o container utilizando `docker-compose exec terraform bash`.

Para subir uma infraestrutura com este projeto você deve executar os módulos presentes nele na ordem abaixo:

1. [firewall](modules/firewall/)
2. [networking](modules/networking/)
3. [server](modules/server/)

Nada impede, no entanto, que com poucas alterações você possa executar eles individualmente, desde que tenha compreendido como eles funcionam e altere o valor de certas variáveis via linha de comando ao executar `terraform apply`.

Lembre-se de ler o `README.md` presente em cada uma destas pastas também.
