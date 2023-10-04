create database PassarinhoMoveisPlanejados;
use PassarinhoMoveisPlanejados;

CREATE TABLE funcionario (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeCompleto VARCHAR(60),
    cpf VARCHAR(11),
    email VARCHAR(50),
    cargo VARCHAR(20),
    dtAdmissao DATE,
    situacao BOOLEAN,
    telefone VARCHAR(11),
    salario DOUBLE,
    senha VARCHAR(8),
    cep VARCHAR(8),
    rua VARCHAR(40),
    cidade VARCHAR(20),
    numero INT,
    bairro VARCHAR(40),
    estado VARCHAR(2)
);

CREATE TABLE fornecedor (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50),
    nomeEmpresa VARCHAR(40),
    cnpj VARCHAR(14),
    telefone VARCHAR(11),
    cep VARCHAR(8),
    rua VARCHAR(40),
    cidade VARCHAR(20),
    numero INT,
    bairro VARCHAR(40),
    estado VARCHAR(2)
);

CREATE TABLE cliente (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(11),
    nomeCompleto VARCHAR(60),
    telefone VARCHAR(11),
    cep VARCHAR(8),
    rua VARCHAR(40),
    cidade VARCHAR(20),
    numero INT,
    bairro VARCHAR(40),
    estado VARCHAR(2),
    email VARCHAR(50)
);

CREATE TABLE materiaPrima (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(120),
    estoque INT,
    cor VARCHAR(20),
    preco DOUBLE,
    tipo VARCHAR(20)
);

CREATE TABLE movel (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(10)
);

CREATE TABLE producao (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    valorTotal DOUBLE,
    dt DATE
);

CREATE TABLE itensDaProducao (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idMovel INT,
    idProducao INT,
    qtMateriaPrima INT,
    idMateriaPrima INT,
    valor DOUBLE
);

CREATE TABLE venda (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    valorTotal DOUBLE,
    idCliente INT,
    dt DATE,
    idFuncionario INT,
    pagamento VARCHAR(20)
);

CREATE TABLE itensDaVenda (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idMovel INT,
    idVenda INT,
    valor DOUBLE,
    qt INT
);

CREATE TABLE compra (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idFornecedor INT,
    valorTotal DOUBLE,
    idFuncionario INT,
    dt DATE,
    pagamento VARCHAR(20)
);

CREATE TABLE itensDaCompra (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    valor DOUBLE,
    qt INT,
    idMateriaPrima INT,
    idCompra INT
);

CREATE TABLE fornece (
    idFornecedor INT,
    idMateriaPrima INT
);
	
alter table itensDaProducao
add constraint FKIdMovelItensProducao foreign key(idMovel) references movel(id),
add constraint FKIdProducao foreign key(idProducao) references producao(id),
add constraint FKIdMateriaPrimaProducao foreign key(idMateriaPrima) references materiaPrima(id);

alter table venda
add constraint FKIdCliente foreign key(idCliente) references cliente(id),
add constraint FKIdFuncionarioVenda foreign key(idFuncionario) references funcionario(id);

alter table itensDaVenda
add constraint FKIdMovelItensVenda foreign key(idMovel) references movel(id),
add constraint FKIdVenda foreign key(idVenda) references venda(id);

alter table compra
add constraint FKIdFornecedorCompra foreign key(idFornecedor) references fornecedor(id),
add constraint FKIdfuncionarioCompra foreign key(idFuncionario) references funcionario(id);

alter table itensDaCompra
add constraint FKIdMateriaPrimaItensCompra foreign key(idMateriaPrima) references materiaPrima(id),
add constraint FKIdCompra foreign key (idCompra) references compra(id);

alter table fornece 
add constraint FKIdFornecedorFornece foreign key(idFornecedor) references fornecedor(id),
add constraint FKIdMateriaPrima foreign key(idMateriaPrima) references materiaPrima(id);


-- Inserções para a tabela funcionario
INSERT INTO funcionario (nomeCompleto, cpf, email, cargo, dtAdmissao, situacao, telefone, salario, senha, cep, rua, cidade, numero, bairro, estado)
VALUES
('João da Silva', '12345678901', 'joao.silva@email.com', 'gerente', '2023-01-15', true, '1122334455', 3500.00, 'senha123', '12345678', 'Rua A', 'Cidade A', 123, 'Bairro A', 'SP'),
('Maria Oliveira', '98765432109', 'maria.oliveira@email.com', 'vendedor', '2023-02-20', true, '5544332211', 2500.00, 'senha456', '87654321', 'Rua B', 'Cidade B', 456, 'Bairro B', 'RJ'),
('Carlos Santos', '45678901234', 'carlos.santos@email.com', 'vendedor', '2023-03-25', true, '9988776655', 2500.00, 'senha789', '56789012', 'Rua C', 'Cidade C', 789, 'Bairro C', 'MG'),
('Ana Souza', '34567890123', 'ana.souza@email.com', 'vendedor', '2023-04-30', true, '8877665544', 2500.00, 'senha012', '34567890', 'Rua D', 'Cidade D', 1011, 'Bairro D', 'BA'),
('Paulo Pereira', '23456789012', 'paulo.pereira@email.com', 'vendedor', '2023-05-05', true, '2233445566', 2500.00, 'senha345', '23456789', 'Rua E', 'Cidade E', 1213, 'Bairro E', 'SC'),
('Isabela Lima', '78901234567', 'isabela.lima@email.com', 'vendedor', '2023-06-10', true, '3344556677', 2500.00, 'senha678', '78901234', 'Rua F', 'Cidade F', 1415, 'Bairro F', 'RS'),
('Lucas Oliveira', '56789012345', 'lucas.oliveira@email.com', 'vendedor', '2023-07-15', true, '7766554433', 2500.00, 'senha901', '56789012', 'Rua G', 'Cidade G', 1617, 'Bairro G', 'PR'),
('Mariana Silva', '67890123456', 'mariana.silva@email.com', 'vendedor', '2023-08-20', true, '9900112233', 2500.00, 'senha234', '67890123', 'Rua H', 'Cidade H', 1819, 'Bairro H', 'PE'),
('Carlos Rodrigues', '67890123456', 'carlos.rodrigues@example.com', 'Vendedor', '2023-09-10', true, '4321098765', 2500.00, 'senha123', '87654321', 'Rua dos Pinheiros', 'Curitiba', 1415, 'Jardim Botânico', 'PR'),
('Fernanda Oliveira', '78901234567', 'fernanda.oliveira@example.com', 'Gerente', '2023-09-05', false, '3210987654', 3500.00, 'senha456', '98765432', 'Avenida das Palmeiras', 'São Paulo', 2022, 'Moema', 'SP'),
('Ricardo Santos', '89012345678', 'ricardo.santos@example.com', 'Vendedor', '2023-09-15', true, '2109876543', 2200.00, 'senha789', '12345678', 'Rua das Mangueiras', 'Rio de Janeiro', 303, 'Copacabana', 'RJ'),
('Luana Pereira', '90123456789', 'luana.pereira@example.com', 'Vendedor', '2023-09-12', true, '1098765432', 2400.00, 'senha102', '23456789', 'Avenida dos Flamboyants', 'Salvador', 404, 'Pituba', 'BA'),
('Eduardo Alves', '01234567890', 'eduardo.alves@example.com', 'Vendedor', '2023-09-20', true, '0987654321', 2600.00, 'senha165', '34567890', 'Rua dos Girassóis', 'Florianópolis', 505, 'Centro', 'SC');

INSERT INTO cliente (cpf, nomeCompleto, telefone, cep, rua, cidade, numero, bairro, estado, email)
VALUES
('12345678901', 'Rafaela Oliveira', '1122334455', '12345678', 'Rua A', 'Cidade A', 123, 'Bairro A', 'SP', 'rafaela.oliveira@email.com'),
('98765432109', 'Pedro Santos', '5544332211', '87654321', 'Rua B', 'Cidade B', 456, 'Bairro B', 'RJ', 'pedro.santos@email.com'),
('45678901234', 'Joaquim Souza', '9988776655', '56789012', 'Rua C', 'Cidade C', 789, 'Bairro C', 'MG', 'joaquim.souza@email.com'),
('34567890123', 'Silvia Pereira', '8877665544', '34567890', 'Rua D', 'Cidade D', 1011, 'Bairro D', 'BA', 'silvia.pereira@email.com'),
('23456789012', 'Marcos Lima', '2233445566', '23456789', 'Rua E', 'Cidade E', 1213, 'Bairro E', 'SC', 'marcos.lima@email.com'),
('78901234567', 'Camila Oliveira', '3344556677', '78901234', 'Rua F', 'Cidade F', 1415, 'Bairro F', 'RS', 'camila.oliveira@email.com'),
('56789012345', 'Guilherme Silva', '7766554433', '56789012', 'Rua G', 'Cidade G', 1617, 'Bairro G', 'PR', 'guilherme.silva@email.com'),
('67890123456', 'Leticia Lima', '9900112233', '67890123', 'Rua H', 'Cidade H', 1819, 'Bairro H', 'PE', 'leticia.lima@email.com'),
('34561237890', 'Luciana Almeida', '7766554433', '23456789', 'Rua I', 'Cidade I', 2021, 'Bairro I', 'SP', 'luciana.almeida@email.com'),
('90876543210', 'Fernando Pereira', '9900112233', '90876543', 'Rua J', 'Cidade J', 2223, 'Bairro J', 'RJ', 'fernando.pereira@email.com'),
('65432109876', 'Larissa Oliveira', '1122334455', '65432109', 'Rua K', 'Cidade K', 2425, 'Bairro K', 'MG', 'larissa.oliveira@email.com'),
('12345678909', 'Carlos Souza', '5544332211', '12345670', 'Rua L', 'Cidade L', 2627, 'Bairro L', 'BA', 'carlos.souza@email.com'),
('98765432101', 'Elaine Lima', '9988776655', '87654321', 'Rua M', 'Cidade M', 2829, 'Bairro M', 'SC', 'elaine.lima@email.com'),
('45678901234', 'Lucas Pereira', '8877665544', '56789012', 'Rua N', 'Cidade N', 3031, 'Bairro N', 'RS', 'lucas.pereira@email.com'),
('34567890123', 'Isabel Silva', '2233445566', '34567890', 'Rua O', 'Cidade O', 3233, 'Bairro O', 'PR', 'isabel.silva@email.com'),
('23456789012', 'Mariana Oliveira', '1122334455', '23456789', 'Rua P', 'Cidade P', 3435, 'Bairro P', 'BA', 'mariana.oliveira@email.com'),
('78901234567', 'Gustavo Lima', '5544332211', '78901234', 'Rua Q', 'Cidade Q', 3637, 'Bairro Q', 'MG', 'gustavo.lima@email.com'),
('56789012345', 'Luiza Santos', '9988776655', '56789012', 'Rua R', 'Cidade R', 3839, 'Bairro R', 'RS', 'luiza.santos@email.com'),
('67890123456', 'Mateus Souza', '8877665544', '67890123', 'Rua S', 'Cidade S', 4041, 'Bairro S', 'SP', 'mateus.souza@email.com'),
('34561237890', 'Fernanda Oliveira', '7766554433', '23456789', 'Rua T', 'Cidade T', 4243, 'Bairro T', 'RJ', 'fernanda.oliveira@email.com'),
('90876543210', 'Luan Almeida', '9900112233', '90876543', 'Rua U', 'Cidade U', 4445, 'Bairro U', 'MG', 'luan.almeida@email.com'),
('65432109876', 'Amanda Pereira', '1122334455', '65432109', 'Rua V', 'Cidade V', 4647, 'Bairro V', 'BA', 'amanda.pereira@email.com'),
('12345678909', 'Giovanna Lima', '5544332211', '12345670', 'Rua W', 'Cidade W', 4849, 'Bairro W', 'RS', 'giovanna.lima@email.com'),
('98765432101', 'Rafael Oliveira', '9988776655', '87654321', 'Rua X', 'Cidade X', 5051, 'Bairro X', 'PR', 'rafael.oliveira@email.com'),
('12345678901', 'Maria da Silva', '987654321', '12345678', 'Rua das Flores', 'São Paulo', 123, 'Centro', 'SP', 'maria.silva@example.com'),
('23456789012', 'José Santos', '876543210', '23456789', 'Avenida Central', 'Rio de Janeiro', 456, 'Lapa', 'RJ', 'jose.santos@example.com'),
('34567890123', 'Ana Oliveira', '765432109', '34567890', 'Rua da Praia', 'Salvador', 789, 'Barra', 'BA', 'ana.oliveira@example.com'),
('45678901234', 'Paulo Pereira', '654321098', '45678901', 'Avenida Paulista', 'São Paulo', 1011, 'Bela Vista', 'SP', 'paulo.pereira@example.com'),
('56789012345', 'Mariana Almeida', '543210987', '56789012', 'Rua dos Coqueiros', 'Florianópolis', 1213, 'Centro', 'SC', 'mariana.almeida@example.com');


-- Inserções para a tabela fornecedor
INSERT INTO fornecedor (email, nomeEmpresa, cnpj, telefone, cep, rua, cidade, numero, bairro, estado)
VALUES
('empresa1@email.com', 'Empresa A', '12345678901234', '1122334455', '12345678', 'Rua A', 'Cidade A', 123, 'Bairro A', 'SP'),
('empresa2@email.com', 'Empresa B', '23456789012345', '5544332211', '87654321', 'Rua B', 'Cidade B', 456, 'Bairro B', 'RJ'),
('empresa3@email.com', 'Empresa C', '34567890123456', '9988776655', '56789012', 'Rua C', 'Cidade C', 789, 'Bairro C', 'MG'),
('empresa4@email.com', 'Empresa D', '45678901234567', '8877665544', '34567890', 'Rua D', 'Cidade D', 1011, 'Bairro D', 'BA'),
('empresa5@email.com', 'Empresa E', '56789012345678', '2233445566', '23456789', 'Rua E', 'Cidade E', 1213, 'Bairro E', 'SC'),
('empresa6@email.com', 'Empresa F', '67890123456789', '3344556677', '78901234', 'Rua F', 'Cidade F', 1415, 'Bairro F', 'RS'),
('empresa7@email.com', 'Empresa G', '78901234567890', '7766554433', '56789012', 'Rua G', 'Cidade G', 1617, 'Bairro G', 'PR'),
('empresa8@email.com', 'Empresa H', '89012345678901', '9900112233', '67890123', 'Rua H', 'Cidade H', 1819, 'Bairro H', 'PE'),
('empresa9@email.com', 'Empresa I', '90123456789012', '7766554433', '23456789', 'Rua I', 'Cidade I', 2021, 'Bairro I', 'SP'),
('empresa10@email.com', 'Empresa J', '01234567890123', '9900112233', '90876543', 'Rua J', 'Cidade J', 2223, 'Bairro J', 'RJ'),
('contato@mdfexpress.com', 'MDF Express', '12345678901234', '987654321', '12345678', 'Rua das Madeiras', 'São Paulo', 123, 'Centro', 'SP'),
('contato@colabrasil.com', 'Cola Brasil', '23456789012345', '876543210', '23456789', 'Avenida da Cola', 'Rio de Janeiro', 456, 'Lapa', 'RJ'),
('contato@ferragensmaster.com', 'Ferragens Master', '34567890123456', '765432109', '34567890', 'Rua das Ferramentas', 'Salvador', 789, 'Barra', 'BA'),
('contato@vidrospremium.com', 'Vidros Premium', '45678901234567', '654321098', '45678901', 'Avenida dos Vidros', 'São Paulo', 1011, 'Bela Vista', 'SP'),
('contato@parafusosindustriais.com', 'Parafusos Industriais', '56789012345678', '543210987', '56789012', 'Rua dos Parafusos', 'Florianópolis', 1213, 'Centro', 'SC');


-- Inserções para a tabela materiaPrima
INSERT INTO materiaPrima (id, nome, estoque, cor, preco, tipo)
VALUES
(1, 'MDF', 100, 'Arenito', 20.00, 'comum'),
(2, 'MDF', 150, 'Basalto', 25.00, 'ultra'),
(3, 'MDF', 200, 'Eclipse', 30.00, 'super ultra'),
(4, 'cola', 500, 'branca', 5.00, 'comum'),
(5, 'cola', 300, 'amarela', 6.00, 'de contato'),
(6, 'vidro', 80, 'transparente', 15.00, 'comum'),
(7, 'vidro', 60, 'transparente', 20.00, 'temperado'),
(8, 'parafuso', 1000, 'dourado', 0.50, 'frances'),
(9, 'parafuso', 800, 'prateado', 0.60, 'Sextavado'),
(10, 'fita', 500, 'Arenito', 2.00, 'comum'),
(11, 'fita', 400, 'Basalto', 2.50, 'brilhante'),
(12, 'puxador', 200, 'Eclipse', 3.00, 'comum'),
(13, 'puxador', 150, 'Gobi', 3.50, 'brilhante'),
(14, 'MDF Comum', 1000, 'Arenito', 30.00, 'mdf'),
(15, 'MDF Ultra', 800, 'Basalto', 35.00, 'mdf'),
(16, 'MDF Super Ultra', 600, 'Eclipse', 40.00, 'mdf'),
(17, 'Cola Branca', 500, 'Branca', 10.00, 'cola'),
(18, 'Cola de Contato', 400, 'Amarela', 12.00, 'cola'),
(19, 'Vidro Comum', 300, 'Transparente', 25.00, 'vidro'),
(20, 'Vidro Temperado', 200, 'Transparente', 30.00, 'vidro'),
(21, 'Parafuso Francês', 1000, 'Dourado', 5.00, 'parafuso'),
(22, 'Parafuso Sextavado', 800, 'Prateado', 6.00, 'parafuso'),
(23, 'Fita Comum', 1200, 'Arenito', 2.00, 'fita'),
(24, 'Fita Brilhante', 1000, 'Basalto', 2.50, 'fita');

-- Inserções para a tabela producao
INSERT INTO producao (valorTotal, dt)
VALUES
(500.00, '2023-09-20'),
(700.00, '2023-09-21'),
(600.00, '2023-09-22'),
(800.00, '2023-09-23'),
(900.00, '2023-09-24'),
(500.00, '2023-09-10'),
(600.00, '2023-09-11'),
(700.00, '2023-09-12'),
(800.00, '2023-09-13'),
(900.00, '2023-09-14');

-- Inserções para a tabela venda
INSERT INTO venda (valorTotal, idCliente, dt, idFuncionario, pagamento)
VALUES
(600.00, 1, '2023-09-20', 1, 'cartao'),
(800.00, 2, '2023-09-21', 2, 'dinheiro'),
(900.00, 3, '2023-09-22', 13, 'cartao'),
(1000.00, 4, '2023-09-23', 4, 'cheque'),
(700.00, 5, '2023-09-24', 5, 'dinheiro'),
(300.00, 6, '2023-12-20', 1, 'Cartão de Débito'),
(250.00, 7, '2023-10-21', 2, 'Pix'),
(350.00, 8, '2023-11-22', 3, 'Boleto'),
(1000.00, 9, '2023-11-10', 11, 'Cartão'),
(1100.00, 10, '2023-10-11', 2, 'Boleto'),
(1200.00, 11, '2023-12-12', 13, 'Transferência'),
(1300.00, 12, '2023-01-13', 4, 'Dinheiro'),
(1400.00, 13, '2023-01-14', 5, 'Cartão'),
(600.00, 14, '2023-01-20', 11, 'cartao'),
(800.00, 15, '2023-02-21', 12, 'dinheiro'),
(900.00, 16, '2023-02-22', 13, 'cartao'),
(1000.00, 17, '2023-03-23', 4, 'cheque'),
(700.00, 18, '2023-04-24', 5, 'dinheiro'),
(300.00, 19, '2023-05-20', 1, 'Cartão de Débito'),
(250.00, 20, '2023-06-21', 2, 'Pix'),
(350.00, 21, '2023-06-22', 3, 'Boleto'),
(1000.00, 22, '2023-07-10', 6, 'Cartão'),
(1100.00, 23, '2023-07-11', 7, 'Boleto'),
(1200.00, 24, '2023-07-12', 8, 'Transferência'),
(1300.00, 25, '2023-07-13', 9, 'Dinheiro'),
(1400.00, 26, '2023-08-14', 10, 'Cartão'),
(1200.00, 27, '2023-08-12', 11, 'Transferência'),
(1300.00, 28, '2023-08-13', 12, 'Dinheiro'),
(1400.00, 29, '2023-08-14', 13, 'Cartão');

-- Inserções para a tabela compra
INSERT INTO compra (idFornecedor, valorTotal, idFuncionario, dt, pagamento)
VALUES
(1, 300.00, 1, '2023-09-20', 'cartao'),
(2, 400.00, 2, '2023-09-21', 'dinheiro'),
(3, 350.00, 3, '2023-09-22', 'cheque'),
(4, 600.00, 4, '2023-01-23', 'dinheiro'),
(5, 450.00, 5, '2023-12-24', 'cartao'),
(6, 500.00, 1, '2023-11-22', 'Boleto'),
(7, 400.00, 2, '2023-10-22', 'Transferência'),
(8, 600.00, 3, '2023-01-23', 'Cartão de Crédito'),
(9, 300.00, 1, '2023-02-15', 'Cartão'),
(10, 400.00, 2, '2023-03-16', 'Boleto'),
(11, 500.00, 3, '2023-04-17', 'Transferência'),
(12, 600.00, 4, '2023-05-18', 'Dinheiro'),
(13, 700.00, 5, '2023-06-19', 'Cartão'),
(14, 600.00, 4, '2023-07-18', 'Dinheiro'),
(15, 700.00, 5, '2023-08-19', 'Cartão');

-- Inserções para a tabela movel
INSERT INTO movel (tipo)
VALUES
('Mesa'),
('Mesa'),
('Estante'),
('Estante'),
('Estante'),
('Sofa'),
('Sofa'),
('Sofa'),
('Cama'),
('Cama'),
('Cama'),
('Armario'),
('Armario'),
('Armario'),
('Bancada'),
('Bancada'),
('Bancada'),
('Prateleira'),
('Prateleira'),
('Prateleira'),
('Cadeira'),
('Mesa'),
('Estante'),
('Sofá'),
('Armario');

-- Inserções para a tabela itensDaProducao
INSERT INTO itensDaProducao (idMovel, idProducao, qtMateriaPrima, idMateriaPrima, valor)
VALUES
(1, 1, 5, 1, 100.00),
(1, 1, 5, 4, 100.00),
(1, 1, 5, 5, 100.00),
(2, 1, 2, 2, 120.00),
(2, 1, 2, 12, 120.00),
(3, 2, 3, 3, 150.00),
(3, 2, 3, 3, 150.00),
(4, 2, 4, 14, 180.00),
(4, 2, 4, 4, 180.00),
(5, 3, 1, 5, 80.00),
(6, 3, 5, 1, 100.00),
(7, 4, 2, 2, 120.00),
(8, 5, 3, 3, 150.00),
(9, 6, 4, 4, 180.00),
(10, 7, 1, 5, 80.00),
(11, 8, 2, 6, 90.00),
(12, 9, 3, 7, 110.00),
(13, 10, 4, 8, 130.00),
(14, 4, 1, 9, 70.00),
(15, 1, 2, 10, 85.00),
(16, 6, 5, 1, 100.00),
(17, 7, 2, 2, 120.00),
(18, 8, 3, 3, 150.00),
(19, 9, 4, 4, 180.00),
(20, 10, 1, 15, 80.00),
(21, 6, 5, 1, 100.00),
(22, 7, 2, 2, 120.00),
(23, 8, 3, 3, 150.00),
(24, 9, 4, 2, 180.00),
(25, 10, 1, 16, 80.00);


-- Inserções para a tabela itensDaVenda
INSERT INTO itensDaVenda (idMovel, idVenda, valor, qt)
VALUES
(1, 1, 150.00, 2),
(2, 1, 180.00, 1),
(3, 2, 120.00, 1),
(4, 2, 100.00, 3),
(5, 3, 80.00, 2),
(6, 4, 150.00, 2),
(7, 4, 180.00, 1),
(8, 5, 120.00, 1),
(9, 5, 100.00, 3),
(20, 6, 80.00, 2),
(11, 6, 90.00, 1),
(12, 7, 110.00, 2),
(13, 7, 130.00, 2),
(14, 8, 70.00, 1),
(15, 8, 85.00, 3),
(16, 9, 200.00, 1),
(17, 10, 220.00, 2),
(18, 10, 240.00, 3),
(19, 4, 260.00, 4),
(20, 5, 280.00, 5),
(21, 1, 200.00, 1),
(22, 2, 220.00, 2),
(23, 3, 240.00, 3),
(24, 4, 260.00, 4),
(25, 5, 280.00, 5);

-- Inserções para a tabela itensDaCompra
INSERT INTO itensDaCompra (valor, qt, idMateriaPrima, idCompra)
VALUES
(30.00, 5, 1, 1),
(25.00, 4, 2, 1),
(20.00, 3, 3, 2),
(15.00, 2, 4, 2),
(10.00, 1, 5, 3),
(30.00, 5, 6, 4),
(25.00, 4, 7, 4),
(20.00, 3, 8, 5),
(15.00, 2, 9, 5),
(10.00, 1, 10, 6),
(12.00, 3, 11, 6),
(18.00, 2, 12, 7),
(21.00, 3, 13, 7),
(8.00, 1, 14, 8),
(9.00, 2, 15, 8),
(50.00, 2, 16, 9),
(60.00, 3, 17, 15),
(70.00, 4, 18, 10),
(80.00, 5, 19, 10),
(90.00, 1, 20, 11),
(60.00, 3, 21, 11),
(70.00, 4, 22, 12),
(80.00, 5, 23, 13),
(90.00, 1, 24, 14);


-- Inserções para a tabela fornece
INSERT INTO fornece (idFornecedor, idMateriaPrima)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(1, 11),
(2, 12),
(4, 13),
(5, 14),
(6, 15),
(7, 16),
(8, 17),
(9, 18),
(10, 19),
(11, 20),
(12, 21),
(13, 22),
(14, 23),
(15, 24);
