CREATE OR REPLACE PROCEDURE relatorio_diario()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Criação de uma tabela temporária para armazenar os resultados diários
    CREATE TEMPORARY TABLE temp_relatorio_diario AS
    SELECT
        data,
        SUM(quantidade) AS total_produtos_comprados
    FROM
        vendas
    GROUP BY
        data;

    -- Exibe os resultados
    SELECT * FROM temp_relatorio_diario;

END;
$$;