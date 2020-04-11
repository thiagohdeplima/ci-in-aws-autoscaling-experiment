# Criação de rede

Este módulo é responsável por realizar a criação de uma ou mais redes VPC na AWS, com CIDR `10.0.0.0/16`.

## Grupos de sub-redes

Este módulo também criará, dentro da rede informada, famílias de sub-redes para alocar tipos especificos de servidores.

Para criar novas famílias de sub-redes, basta adicioná-las na variável `subnets_cidrs`, seguindo o mesmo modelo das sub-redes lá existentes.