CREATE TRIGGER ATUALIZASALDOESTOQUE FOR MOVIMENTOESTOQUE AFTER INSERT POSITION 10 AS
BEGIN
  IF (MOVIMENTOESTOQUE.MVESN3QTDENTRADA > 0) THEN
    UPDATE PRODUTOSALDO SET PRODUTOSALDO.PSLDN3QTDE = PRODUTOSALDO.PSLDN3QTDE + MOVIMENTOESTOQUE.MVESN3QTDENTRADA WHERE 
    PRODUTOSALDO.EMPRICOD = MOVIMENTOESTOQUE.EMPRICOD AND PRODUTOSALDO.PRODICOD = MOVIMENTOESTOQUE.PRODICOD;
  ELSE
    UPDATE PRODUTOSALDO SET PRODUTOSALDO.PSLDN3QTDE = PRODUTOSALDO.PSLDN3QTDE - MOVIMENTOESTOQUE.MVESN3QTDSAIDA WHERE 
    PRODUTOSALDO.EMPRICOD = MOVIMENTOESTOQUE.EMPRICOD AND PRODUTOSALDO.PRODICOD = MOVIMENTOESTOQUE.PRODICOD;  
END
