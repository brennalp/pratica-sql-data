SELECT *

FROM produtos

WHERE DescNomeProduto IN ('Churn_10pp','Churn_2pp','Churn_5pp');

/*WHERE DescNomeProduto = 'Churn_10pp'
OR DescNomeProduto = 'Churn_2pp'
OR DescNomeProduto = 'Churn_5pp'*/


SELECT *

FROM produtos

WHERE DescNomeProduto LIKE 'Churn%'; --% - pega o pedaço do texto - algo parecido
