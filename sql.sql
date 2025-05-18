create database livraria; 
use livraria; 
CREATE TABLE cliente ( 
idCliente INT PRIMARY KEY NOT NULL, 
nome VARCHAR(50) NOT NULL, 
telefone VARCHAR(20) NOT NULL, 
email VARCHAR(50) NOT NULL, 
endereco VARCHAR(100) NOT NULL 
); 
CREATE TABLE editora ( 
idEditora INT PRIMARY KEY NOT NULL, 
nome VARCHAR(50) NOT NULL, 
telefone VARCHAR(20) NOT NULL, 
email VARCHAR(50) NOT NULL, 
endereco VARCHAR(100) NOT NULL 
); 
CREATE TABLE pedido ( 
idPedido INT PRIMARY KEY NOT NULL, 
idCliente INT NOT NULL, 
dataPedido DATE NOT NULL, 
valorPedido DECIMAL(5 , 2 ) NOT NULL, 
CONSTRAINT fk_Pedido_Cliente FOREIGN KEY (idCliente) 
REFERENCES cliente (idCliente) 
); 
CREATE TABLE livro ( 
idLivro INT PRIMARY KEY NOT NULL, 
idEditora INT NOT NULL, 
titulo VARCHAR(100) NOT NULL,  
autor VARCHAR(50) NOT NULL, 
ano INT NOT NULL, 
ISBN VARCHAR(20) NOT NULL, 
preco DECIMAL(5 , 2 ) NOT NULL, 
CONSTRAINT fk_Livro_Editora FOREIGN KEY (idEditora) 
REFERENCES editora (idEditora) 
); 
CREATE TABLE itemPedido ( 
idPedido INT NOT NULL, 
idLivro INT NOT NULL, 
quantidade INT NOT NULL, 
valorItemPedido DECIMAL(5 , 2 ) NOT NULL, 
PRIMARY KEY (idPedido , idLivro), 
CONSTRAINT fk_ItemPedido_Pedido FOREIGN KEY (idPedido) 
REFERENCES pedido (idPedido), 
CONSTRAINT fk_ItemPedido_livro FOREIGN KEY (idLivro) 
REFERENCES livro (idLivro) 
); 
CREATE TABLE estoque ( 
idlivro INT PRIMARY KEY NOT NULL, 
quantidade INT NOT NULL, 
CONSTRAINT fk_Estoque_Livro FOREIGN KEY (idLivro) 
REFERENCES livro (idLivro) 
);




SELECT  
COUNT(*) AS quantidade_de_livros 
FROM 
livro;




SELECT nome FROM cliente 
ORDER BY nome ASC;





select editora.nome as nome_da_editora, livro.titulo as titulo_do_livro 
from editora 
join livro on editora.ideditora = livro.ideditora 
order by editora.nome desc; 





select cliente.nome as nome_do_cliente, count(itempedido.quantidade) 
as quantidade_de_livros_comprados from cliente 
join pedido on cliente.idcliente = pedido.idcliente 
join itempedido on pedido.idpedido = itempedido.idpedido 
group by cliente.nome; 







