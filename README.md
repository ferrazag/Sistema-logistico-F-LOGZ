# Sistema-logistico-F-LOGZ

## **📦 Sistema Logístico — Estrutura do Banco de Dados.**

Este repositório contém o script SQL responsável pela criação e organização do banco de dados utilizado no Sistema Logístico F-LOGZ. O objetivo é estabelecer uma base sólida para o gerenciamento de usuários, motoristas e produtos, garantindo segurança, rastreabilidade e eficiência nas operações internas. 

---

### **📦 Estrutura de Usuários;**
A tabela usuarios armazena informações essenciais para autenticação e identificação dentro do sistema.  Destaques:
- Controle de acesso através do campo *tipo_usuario* (admin ou motorista);
- Validação de dados fundamentais como e-mail e senha;
- Integridade garantida por restrições e chaves primárias.

---

### **📦 Tabela de Motoristas;**
A tabela motoristas está diretamente vinculada a usuarios por meio do campo *id_usuario*.
Ela armazena informações específicas do motorista, como:
- CNH
- Matrícula

Esse vínculo garante que cada motorista seja também um usuário autenticado no sistema.

---

### **📦 Tabela de Produtos;**
A tabela produtos associa cada produto a um motorista responsável.    
    Com isso, o sistema permite:
- Que cada motorista visualize apenas os produtos sob sua responsabilidade;
- Um controle claro e organizado sobre entregas, cargas e movimentações.

---
    
```mermaid
erDiagram
    usuarios {
        INT id_usuario
        VARCHAR nome
        VARCHAR email
        VARCHAR senha
        VARCHAR tipo_usuario
    }

    motoristas {
        INT id_motorista
        INT id_usuario
        VARCHAR cnh
        VARCHAR matricula
    }

    produtos {
        INT id_produto
        INT id_motorista
        VARCHAR nome
        VARCHAR descricao
    }

    usuarios ||--|{ motoristas : possui
    motoristas ||--|{ produtos : responde
