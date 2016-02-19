#language: pt
#encoding: UTF-8

Funcionalidade: Comprando TV no Walmart
	
	Cenário: Realizar pesquisa da TV

		Dado que eu acesse o site do Walmart
		Quando eu preencher o campo de busca
		E mostrar todas as opções de TV
		E escolher uma TV
		E confirmar o produto
		E adicionar ao carrinho
		Então entrar no carrinho de compras e verificar se o produto foi adicionado
		
	Esquema do Cenário: Login no site
		Dado que eu clique no botão de entrar
		Quando eu preencher <cpf> e <password> nos campos de login
		Então eu logo no site
	  Exemplos:
		|cpf        |password |
		|01234567890|a12345678|