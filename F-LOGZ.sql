CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    tipo ENUM('ADMIN', 'SUPERVISOR', 'MOTORISTA') NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE motoristas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    cnh VARCHAR(20) NOT NULL UNIQUE,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE veiculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(50) NOT NULL,
    capacidade INT NOT NULL,
    disponivel BOOLEAN DEFAULT TRUE
);

CREATE TABLE entregas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    motorista_id INT,
    veiculo_id INT,
    status ENUM('PENDENTE', 'EM_TRANSITO', 'ENTREGUE', 'CANCELADA') DEFAULT 'PENDENTE',
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (motorista_id) REFERENCES motoristas(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,

    FOREIGN KEY (veiculo_id) REFERENCES veiculos(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE rastreamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entrega_id INT NOT NULL,
    status VARCHAR(100) NOT NULL,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    observacao TEXT,
    FOREIGN KEY (entrega_id) REFERENCES entregas(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
