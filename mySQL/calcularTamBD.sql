SELECT
  TABLE_NAME AS `Table`,
  DATA_LENGTH AS `Data_length`, -- tamanho dos dados em cada tabela (em bytes)
  INDEX_LENGTH AS `Index_length`, -- tamanho do ficheiro de indíce para a tabela (em bytes)
  (DATA_LENGTH + INDEX_LENGTH) AS `Size (Bytes)`,
  ROUND((data_length + index_length) / 1024, 3) AS `Size (KiB)`
FROM
  information_schema.TABLES
WHERE
  TABLE_SCHEMA = "ultimo_a_saber"
UNION
SELECT
	'TOTAL',
    SUM(data_length),
    SUM(index_length),
    round(SUM(data_length + index_length)),
	ROUND((SUM(data_length) + SUM(index_length)) / 1024, 3)
FROM
  information_schema.TABLES
WHERE
  TABLE_SCHEMA = "ultimo_a_saber"
ORDER BY (DATA_LENGTH + INDEX_LENGTH) DESC