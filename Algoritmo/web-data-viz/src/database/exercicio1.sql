USE sprint2;


CREATE TABLE animal (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    especie VARCHAR(50),
    raca VARCHAR(50),
    idade INT
);

CREATE TABLE ficha_medica (
    id int primary key auto_increment,
    data_ultima_consulta date,
    peso decimal(5,2),
    vacina_em_dia bool,
    observacao varchar(255),
    fk_animal int unique,
    foreign key (fk_animal) references animal(id)
);


insert into animal (nome, especie, raca, idade) values
('Rex', 'Cachorro', 'Labrador', 5),
('Mia', 'Gato', 'Siamês', 2),
('Thor', 'Cachorro', 'Golden Retriever', 1),
('Luna', 'Gato', NULL, 8),
('Bob', 'Cachorro', 'Poodle', 10);

insert into ficha_medica (data_ultima_consulta, peso, vacina_em_dia, observacao, fk_animal) values
('2026-08-10', 25.50, TRUE, 'Animal saudável', 1),
('2026-07-15', 4.20, FALSE, 'Precisa atualizar vacina', 2),
('2026-09-01', 32.00, TRUE, NULL, 3),
('2026-06-20', 3.80, FALSE, 'Acompanhamento de peso', 4);

select * from animal;

select * from ficha_medica;

INSERT INTO ficha_medica
(data_ultima_consulta, peso, vacina_em_dia, observacao, fk_animal)
VALUES
('2026-09-20', 26.00, TRUE, 'Nova consulta', 1);

select nome, especie from animal;

select animal.nome, ficha_medica.vacina_em_dia from animal join ficha_medica on animal.id = ficha_medica.fk_animal where ficha_medica.vacina_em_dia = false;

select * from animal  order by idade desc;

select * from animal where especie = 'Cachorro';

select nome as 'Pet', especie as 'Tipo' from animal;

select peso as 'Peso (kg)', data_ultima_consulta as 'Ultima Consulta' from ficha_medica;

select nome, idade * 7 as 'Idade Humana Aproximada' from animal;

select nome as 'Nome do Pet',raca as 'Raca/Tipo' from animal;

select nome,
case
        when idade < 2 then 'Filhote'
        when idade between 2 and 7 then 'Adulto'
        else 'Idoso'
    end as 'fase_vida'
from animal;


select animal.nome,
    case
        when ficha_medica.vacina_em_dia = true then 'Vacinado'
        else 'Pendente'
     end as 'vacinacao'
from animal join ficha_medica on animal.id = ficha_medica.fk_animal;

select animal.nome, ficha_medica.peso,
    case
        when ficha_medica.peso < 5 then 'Pequeno'
        when ficha_medica.peso between 5 and 20 then 'Médio'
        else 'Grande'
    end as 'porte'
from animal join  ficha_medica ON animal.id = ficha_medica.fk_animal;


select nome,
    case
        when especie = 'Cachorro' then 'Canino'
        when especie = 'Gato' then 'Felino'
        else 'Outro'
    end as 'especie_tipo'
from animal;

select animal.nome, ifnull(ficha_medica.observacao, 'Nenhuma observação') as observacao
from animal left join ficha_medica on animal.id = ficha_medica.fk_animal;

select animal.nome,
ifnull(ficha_medica.data_ultima_consulta, 'sem ficha') as 'Ultima Consulta'
from animal left join ficha_medica on animal.id = ficha_medica.fk_animal;

select animal.nome, ficha_medica.peso, ficha_medica.data_ultima_consulta
from animal  join ficha_medica on animal.id = ficha_medica.fk_animal;

select concat(animal.nome,' - ',animal.especie,' - ',ficha_medica.peso,' kg') as resumo
from animal
join ficha_medica on animal.id = ficha_medica.fk_animal;

select nome, ifnull(raca, 'Raca não informada') as raca from animal;

USE sprint2;

CREATE TABLE farmacia (
    id int primary key auto_increment,
    nome varchar(100),
    cnpj varchar(20) unique
);

CREATE TABLE endereco (
    id int primary key auto_increment,
    rua varchar(100),
    numero int,
    bairro varchar(100),
    cidade varchar(100),
    fk_farmacia int unique,
    foreign key (fk_farmacia) references farmacia(id)
);

CREATE TABLE farmaceutico (
    id int primary key auto_increment,
    nome varchar(100),
    crf varchar(30),
    turno varchar(10),
    fk_farmacia int,
    constraint chk_turno check (turno in ('Manhã', 'Tarde', 'Noite')),
    foreign key (fk_farmacia) references farmacia(id)
);

insert into farmacia (nome, cnpj) values
('Farmácia Saúde', '12345678000110'),
('Drogaria Vida', '22345678000120'),
('Farmácia Popular', '32345678000130');

insert into endereco (rua, numero, bairro, cidade, fk_farmacia) values
('Rua das Flores', 120, 'Santana', 'São Paulo', 1),
('Avenida Paulista', 500, 'Bela Vista', 'São Paulo', 2);

insert into farmaceutico (nome, crf, turno, fk_farmacia) values
('Carlos Silva', 'CRF001', 'Manhã', 1),
('Mariana Souza', 'CRF002', 'Tarde', 1),
('Pedro Santos', 'CRF003', 'Noite', 2),
('Ana Oliveira', 'CRF004', 'Manhã', 2),
('Lucas Costa', 'CRF005', 'Noite', 3);

select * from farmacia;

select * from endereco;

select * from farmaceutico;


insert into endereco (rua, numero, bairro, cidade, fk_farmacia) values
('Rua Nova', 250, 'Tatuapé', 'São Paulo', 1);

select nome, cnpj from farmacia;

select * from farmaceutico where turno = 'Noite';

select * from endereco order by cidade;

select nome, crf from farmaceutico;

select nome as 'Estabelecimento', cnpj as 'Documento'
from farmacia;


select nome as 'Profissional', turno as 'Horario de Trabalho'
from farmaceutico;

select rua as 'Logradouro', numero as 'Num.'
from endereco;

select concat(rua, ' - ', numero) as 'Endereço Completo'
from endereco;

select nome,
case
    when turno = 'Manhã' then '06h-12h'
    when turno = 'Tarde' then '12h-18h'
    else '18h-00h'
end as 'periodo'
from farmaceutico;

select nome,
case
    when left(cnpj, 1) = '1' then 'Matriz'
    else 'Filial'
end as 'tipo_cnpj'
from farmacia;

select bairro,
case
    when bairro = 'Santana' then 'Zona Norte'
    when bairro = 'Bela Vista' then 'Zona Sul'
    else 'Outra'
end as 'zona'
from endereco;

select nome,
case
    when turno = 'Noite' then 'Adicional Noturno'
    else 'Normal'
end as 'carga_horaria'
from farmaceutico;

select farmacia.nome,
ifnull(endereco.rua, 'SEM ENDERECO') as rua
from farmacia
left join endereco on farmacia.id = endereco.fk_farmacia;

select farmaceutico.nome, farmaceutico.crf, farmacia.nome
from farmaceutico
join farmacia on farmaceutico.fk_farmacia = farmacia.id;

select farmacia.nome, endereco.cidade, farmaceutico.nome
from farmacia
join endereco on farmacia.id = endereco.fk_farmacia
join farmaceutico on farmacia.id = farmaceutico.fk_farmacia;

select concat(farmaceutico.nome, ' - ', farmaceutico.crf, ' - ', farmacia.nome) as 'info'
from farmaceutico
join farmacia on farmaceutico.fk_farmacia = farmacia.id;

select id, rua, numero,
ifnull(bairro, 'Bairro não informado') as bairro,
cidade, fk_farmacia
from endereco;

USE sprint2;

CREATE TABLE artista (
    id int primary key auto_increment,
    nome varchar(100),
    genero_musical varchar(50),
    pais varchar(50),
    ativo bool
);

CREATE TABLE musica (
    id int primary key auto_increment,
    titulo varchar(100),
    duracao_segundos int,
    ano_lancamento int,
    fk_artista int,
    foreign key (fk_artista) references artista(id)
);


insert into artista (nome, genero_musical, pais, ativo) values
('7 Minutoz', 'Rap', 'Brasil', true),
('Imagine Dragons', 'Rock', 'Estados Unidos', true),
('Michael Jackson', 'Pop', null, false);


insert into musica (titulo, duracao_segundos, ano_lancamento, fk_artista) values
('Rap do Itachi', 245, 2015, 1),
('Believer', 204, 2017, 2),
('Enemy', 173, 2021, 2),
('Billie Jean', 294, 1982, 3),
('Minha Música', 320, 2024, null);


select * from artista;

select * from musica;

select titulo, duracao_segundos
from musica;


select * from musica
where ano_lancamento > 2020;


select * from artista
order by nome;


select * from musica
where duracao_segundos > 200;


select titulo as 'Nome da Música', ano_lancamento as 'Ano'
from musica;


select nome as 'Cantor/Banda', genero_musical as 'Estilo'
from artista;


select duracao_segundos / 60 as 'Duração (min)'
from musica;


select titulo as 'Faixa', ano_lancamento as 'Lançamento'
from musica;


select titulo,
case
    when ano_lancamento < 2000 then 'Clássico'
    when ano_lancamento between 2000 and 2015 then 'Moderno'
    else 'Atual'
end as 'era'
from musica;


select nome,
case
    when ativo = true then 'Em atividade'
    else 'Inativo'
end as 'status'
from artista;


select titulo,
case
    when duracao_segundos < 180 then 'Curta'
    when duracao_segundos between 180 and 300 then 'Normal'
    else 'Longa'
end as 'tamanho'
from musica;


select nome,
case
    when pais = 'Brasil' then 'Nacional'
    else 'Internacional'
end as 'origem'
from artista;

select nome, ifnull(pais, 'Pais desconhecido') as pais
from artista;

select musica.titulo,
ifnull(artista.nome, 'ARTISTA DESCONHECIDO') as artista
from musica
left join artista on musica.fk_artista = artista.id;

select musica.titulo, musica.ano_lancamento, artista.nome
from musica
join artista on musica.fk_artista = artista.id;

select concat(musica.titulo, ' - ', artista.nome, ' - ', musica.ano_lancamento) as 'catalogo'
from musica
join artista on musica.fk_artista = artista.id;

select artista.nome, musica.titulo
from musica
right join artista on musica.fk_artista = artista.id;

USE sprint2;


CREATE TABLE cliente (
    id int primary key auto_increment,
    nome varchar(100),
    telefone varchar(20),
    email varchar(100)
);

CREATE TABLE veiculo (
    id int primary key auto_increment,
    placa varchar(10) unique,
    marca varchar(50),
    modelo varchar(50),
    ano int,
    fk_cliente int,
    foreign key (fk_cliente) references cliente(id)
);

insert into cliente (nome, telefone, email) values
('Carlos Silva', '11999999999', 'carlos@gmail.com'),
('Mariana Souza', '11988888888', 'mariana@gmail.com'),
('Pedro Santos', '11977777777', null);

insert into veiculo (placa, marca, modelo, ano, fk_cliente) values
('ABC1D23', 'Fiat', 'Argo', 2022, 1),
('DEF4G56', 'Chevrolet', 'Onix', 2018, 1),
('GHI7J89', 'Volkswagen', 'Gol', 2012, 2),
('KLM1N23', 'Toyota', 'Corolla', 2008, 2),
('OPQ4R56', 'Fiat', 'Uno', 2010, null);

select * from cliente;

select * from veiculo;

select placa, marca, modelo
from veiculo;

select * from veiculo
where marca = 'Fiat';

select * from veiculo
order by ano desc;

select * from veiculo
where ano < 2015;

select placa as 'Placa do Veículo', modelo as 'Modelo do Carro'
from veiculo;

select nome as 'Proprietario', telefone as 'Contato'
from cliente;

select ano, year(curdate()) - ano as 'Idade do Veículo'
from veiculo;

select concat(marca, ' - ', modelo) as 'Veículo Completo'
from veiculo;

select placa,
case
    when ano >= 2020 then 'Novo'
    when ano between 2010 and 2019 then 'Seminovo'
    else 'Antigo'
end as 'classificação'
from veiculo;


select modelo,
case
    when marca = 'Fiat' then 'Nacional'
    when marca = 'Chevrolet' then 'Nacional'
    when marca = 'Volkswagen' then 'Nacional'
    else 'Importado'
end as 'tipo_marca'
from veiculo;


select nome,
case
    when email is not null then 'Sim'
    else 'Não'
end as 'possui_email'
from cliente;


select placa,
case
    when ano between 2000 and 2009 then 'Anos 2000'
    when ano between 2010 and 2019 then 'Anos 2010'
    else 'Anos 2020'
end as 'decada'
from veiculo;


select nome, ifnull(email, 'Email não cadastrado') as email
from cliente;


select veiculo.placa, veiculo.modelo,
ifnull(cliente.nome, 'SEM DONO') as proprietario
from veiculo
left join cliente on veiculo.fk_cliente = cliente.id;


select veiculo.placa, veiculo.modelo, cliente.nome
from veiculo
join cliente on veiculo.fk_cliente = cliente.id;


select concat(veiculo.placa, ' - ', veiculo.modelo, ' - ', cliente.nome) as 'registro'
from veiculo
join cliente on veiculo.fk_cliente = cliente.id;


select cliente.nome, veiculo.placa, veiculo.modelo
from veiculo
right join cliente on veiculo.fk_cliente = cliente.id;

use sprint2;

create table equipe(
id int primary key,
nome varchar(40),
regiao varchar(20) check(regiao in('america','Europa','Asia')),
ranking int
);

create table jogador_cs(
id int primary key,
nickname varchar(40),
nome_real varchar(40),
funcao varchar(50) check(funcao in('Rifler','AWPer','Entry','IGL','Suporte')),
fk_equipe int,
foreign key(fk_equipe) references equipe(id)
);

 insert into equipe (id,nome, regiao, ranking) values
    (1,'FURIA', 'America', 5),
    (2,'Vitality', 'Europa', 1),
    (3,'The MongolZ', 'Asia', null);

insert into jogador_cs (id,nickname, nome_real, funcao, fk_equipe) values
    (1,'KSCERATO', 'Kaike Cerato', 'Rifler', 1),
    (2,'yuurih', 'Yuri Santos', 'Rifler', 1),
    (3,'ZywOo', 'Mathieu Herbaut', 'AWPer', 2),
    (4,'apEX', 'Dan Madesclaire', 'IGL', 2),
    (5,'Ric', 'Ricardo', 'Entry', null);

select * from equipe;

select * from jogador_cs;

select nickname,funcao from jogador_cs;

select * from jogador_cs where funcao = 'AWPer';

select * from equipe order by ranking asc;

select * from jogador_cs where nickname like 'F%';

select nickname as 'Nick',nome_real as 'Nome Verdadeiro' from jogador_cs;

select nome as 'Time',regiao  as 'Região Competitiva' from equipe;

select ranking   as 'Posição no Ranking Mundial' from equipe;

select concat(nickname,' - ',funcao )as 'Jogador e Função' from jogador_cs;

select nome,
case 
when ranking < 5 then 'Tier 1'
when ranking >6 and ranking<20 then 'Tier 2'
else 'tier 3'
end as 'nivel'
from equipe;

select nickname,
case 
when funcao = 'Rifler' or funcao = 'Entry' then 'Agressivo'
when funcao = 'AWPer' then 'Sniper'
else 'Tático'
end as 'tipo_função'
from jogador_cs;

select nome,
case 
when regiao = 'America' then 'Ocidente'
else 'Oriente'
end as continente
from equipe;

select nickname,
case 
when funcao = 'IGL' then 'Sim - In-Game Leader'
else 'Não'
end as líder
from jogador_cs;

select nome, ifnull(ranking, 'Sem ranking') from equipe;

select 
    jogador_cs.nickname,
    jogador_cs.funcao,
    case
        when equipe.nome is null then 'FREE AGENT'
        else equipe.nome
    end as equipe
from jogador_cs
left join equipe
    on jogador_cs.fk_equipe = equipe.id;
    
    select jogador_cs.nickname,jogador_cs.funcao,equipe.nome from jogador_cs join equipe
    on jogador_cs.fk_equipe = equipe.id;
    
    select concat(jogador_cs.nickname, ' - ', jogador_cs.funcao, ' - ', equipe.nome) as perfil
from jogador_cs
 join equipe
    on jogador_cs.fk_equipe = equipe.id;
    
    select jogador_cs.nickname,jogador_cs.funcao,equipe.nome
from jogador_cs
right join equipe
    on jogador_cs.fk_equipe = equipe.id;

create table marca (
    id int primary key auto_increment,
    nome varchar(40),
    pais_origem varchar(40)
);

create table tenis (
    id int primary key auto_increment,
    modelo varchar(60),
    tamanho int,
    preco decimal(10,2) check (preco > 0),
    categoria varchar(20) check (categoria in ('Corrida', 'Casual', 'Basquete', 'Futebol')),
    fk_marca int,
    foreign key (fk_marca) references marca(id)
);


insert into marca (nome, pais_origem) values
    ('Nike', 'Estados Unidos'),
    ('Adidas', 'Alemanha'),
    ('Olympikus', null);


insert into tenis (modelo, tamanho, preco, categoria, fk_marca) values
    ('Air Max 270', 42, 799.90, 'Corrida', 1),
    ('Superstar', 40, 399.90, 'Casual', 2),
    ('Corre 3', 41, 299.90, 'Corrida', 3),
    ('Air Jordan 1', 43, 999.90, 'Basquete', 1),
    ('Street Basic', 38, 189.90, 'Casual', null);


select * from marca;

select * from tenis;

select modelo, preco from tenis;

select * from tenis where categoria = 'Corrida';

select * from tenis order by preco desc;

select * from tenis where tamanho >= 40;

select modelo as 'Produto', preco as 'Valor (R$)' from tenis;

select nome as 'Fabricante', pais_origem as 'Pais' from marca;

select preco * 1.15 as 'Preço com Frete' from tenis;

select concat(modelo, ' - ', tamanho) as 'Descrição do Produto' from tenis;

select modelo,
    case
        when preco < 200 then 'Econômico'
        when preco between 200 and 500 then 'Intermediário'
        else 'Premium'
    end as 'faixa_preço'
from tenis;

select modelo,
    case
        when categoria = 'Corrida' then 'Esporte - Performance'
        when categoria = 'Casual' then 'Dia a Dia'
        else 'Esporte - Específico'
    end as 'uso'
from tenis;

select nome,
    case
        when pais_origem = 'Brasil' then 'Nacional'
        else 'Importada'
    end as 'origem'
from marca;

select modelo,
    case
        when tamanho < 38 then 'Pequeno'
        when tamanho between 38 and 42 then 'Médio'
        else 'Grande'
    end as 'numeração'
from tenis;

select nome, ifnull(pais_origem, 'Origem desconhecida') as pais_origem from marca;

select tenis.modelo, ifnull(marca.nome, 'MARCA GENERICA') as marca from tenis left join marca
on tenis.fk_marca = marca.id;

select tenis.modelo, tenis.preco, marca.nome from tenis inner join marca on tenis.fk_marca = marca.id;

select concat(tenis.modelo,' - ',tenis.categoria,' - ',marca.nome) as vitrine from tenis inner join marca
on tenis.fk_marca = marca.id;

select tenis.modelo, tenis.preco, marca.nome from tenis right join marca on tenis.fk_marca = marca.id;