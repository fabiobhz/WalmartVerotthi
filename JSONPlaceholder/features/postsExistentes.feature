#language: pt
#encoding=utf-8

  Funcionalidade: Posts existentes na API jsonplaceholder


    Cenário: Obter uma lista com todos os posts existentes

      Dado que eu acesse a API jsonplaceholder
      Então eu obtenho a lista com todos os posts existentes


    Cenário: Buscar os detalhes de cada post através do seu ID

      Dado que eu solicite os detalhes de cada post
      Então eu obtenho os detalhes de cada post através do userID

      
    Cenário: Tratamento de erro para ID inexistente

      Dado que eu acesse a API jsonplaceholder
      Quando eu buscar um post inxistente através do ID
      Então eu obtenho resposta do tratamento de Erro
      
    Cenário: Criar um novo post passando título, corpo e ID do usuário
    
        Dado que eu acesse a API jsonplaceholder
        Quando eu realizar um novo post informando
        Então eu obtenho a confirmação do post criado com os itens informados

     
    Cenário: Deletar um post existente através do ID

      Dado que eu acesse a API jsonplaceholder
      Quando eu solicitar a deleção de um post através do ID
      Então eu obtenho a confirmação do post deletado

      
    Cenário: Tratamento de erro para deleção

      Dado que eu acesse a API jsonplaceholder
      Quando eu solicitar a deleção de um post inexistente
      Então eu obtenho resposta do tratamento de erro

      
    Cenário: Alterar o título de um post existente

      Dado que eu acesse a API jsonplaceholder
      Quando eu solicitar a alteração de título de um post existente
      Então eu obtenho a confirmação de alteração do título