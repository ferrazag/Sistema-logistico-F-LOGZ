# Sistema-logistico-F-LOGZ

Este repositório contém o script SQL responsável pela criação do banco de dados utilizado em um Sistema Logístico. O objetivo principal é fornecer a estrutura necessária para gerenciar usuários, motoristas e produtos associados, garantindo controle de acesso e organização das operações internas.

O script implementa:
‣ Estrutura de Usuários:
  ▻ Tabela usuarios contendo informações de autenticação e identificação.
  ▻ Campo tipo_usuario que define se o usuário é admin ou motorista.
  ▻ Restrições que garantem consistência e integridade dos dados.

‣ Tabela de Motoristas
  ▻ Ligação direta com a tabela de usuários (id_usuario).
  ▻ Armazena dados específicos do motorista.

‣ Tabela de Produtos
  ▻ Cada produto é vinculado a um motorista.
  ▻ Permite que cada motorista visualize somente os seus próprios produtos.

‣ Regras de Relacionamento
  ▻ Uso de chaves estrangeiras para manter integridade entre usuários → motoristas → produtos.
  ▻ Delete e update protegidos para evitar inconsistências.
