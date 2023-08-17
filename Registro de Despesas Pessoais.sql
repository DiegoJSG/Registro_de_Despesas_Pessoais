-- Criação da tabela de Categorias
CREATE TABLE Categorias (
    CategoriaID INTEGER PRIMARY KEY,
    NomeCategoria TEXT
);

-- Inserção de categorias
INSERT INTO Categorias (CategoriaID, NomeCategoria)
VALUES (1, 'Alimentação');

INSERT INTO Categorias (CategoriaID, NomeCategoria)
VALUES (2, 'Transporte');

-- Criação da tabela de Despesas
CREATE TABLE Despesas (
    DespesaID INTEGER PRIMARY KEY,
    Data DATE,
    Valor DECIMAL(10, 2),
    Descricao TEXT,
    CategoriaID INTEGER,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);

-- Inserção de despesas
INSERT INTO Despesas (DespesaID, Data, Valor, Descricao, CategoriaID)
VALUES (1, '2023-05-28', 43.00, 'Almoço no restaurante', 1); -- exemplo

INSERT INTO Despesas (DespesaID, Data, Valor, Descricao, CategoriaID)
VALUES (2, '2023-07-16', 21.00, 'Uber para o trabalho', 2); -- exemplo

-- Consulta para gerar um relatório mensal de despesas
SELECT
    strftime('%Y', Data) AS Ano,
    strftime('%m', Data) AS Mes,
    NomeCategoria,
    SUM(Valor) AS TotalDespesas
FROM Despesas
JOIN Categorias ON Despesas.CategoriaID = Categorias.CategoriaID
GROUP BY Ano, Mes, NomeCategoria
ORDER BY Ano, Mes, NomeCategoria;
-- Lembre-se de ajustar os detalhes conforme necessário, especialmente se você estiver usando um sistema de gerenciamento de banco de dados diferente do SQLite. 
-- Este exemplo fornece uma base para o seu projeto de registro de despesas pessoais, e você pode expandir a partir daqui com mais recursos e refinamentos.
