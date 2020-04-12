# Firewall

Este módulo é responsável pela criação e gerenciamento de regras de acesso via [Security Groups](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html).

## Criando novos grupos

Para alterar, criar ou excluir ou excluir Security Groups, basta alterar a variável `groups` no arquivo [variables.tf](variables.tf), a semelhança dos que já estão lá presentes.

Por exemplo, adicionar a entrada abaixo nesta varíavel fará com que um `terraform apply` crie um novo `security group`, chamado http, com a porta 80 liberada para toda internet:

```hcl
http = {
  ingress = {
    allowed_port  = 80
    allowed_proto = "tcp"
    allowed_cidrs = ["0.0.0.0/0"]
    allowed_secgrps = []
  }
}
```

## Deficiências

Talvez, substituir a abstração criada por meio da variável `groups` por um modelo mais explicito diretamente em [main.tf](main.tf) seja mais adequado, pois possibilitaria criar relacionamentos entre os Security Groups.
