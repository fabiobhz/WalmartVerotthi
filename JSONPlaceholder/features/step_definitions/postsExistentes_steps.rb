#language: pt
#encoding=utf-8

require 'httparty'
require 'json'

class JSONPlaceholder
  include HTTParty

  base_uri "http://jsonplaceholder.typicode.com/posts"

  def home_page
    self.class.get ("/")
  end
  
  def user_id(id)
    self.class.get("?userId="+id.to_s)
  end
  
  def post_id(id)
    self.class.get("/"+id.to_s)
  end

  def status=(status)
    @status = HTTParty::Response::Headers.Status Code(status)
  end
  
  def newContent
    url="http://jsonplaceholder.typicode.com/posts"
    @result = HTTParty.post(url.to_s, 
    :body => { :userId => '20', 
               :title => 'Hello', 
               :body => 'Hello World', 
             }.to_json,
    :headers => { 'Content-Type' => 'application/json' } )    
  end

  def deletePost(id)
    self.class.delete("/"+id.to_s)
  end

  def newTitle(id)
#    self.class= HTTParty.post (base_uri, { body: { userId: 1, title: "World", body: "Hello World" } } )
    url="http://jsonplaceholder.typicode.com/posts/"
    @result = HTTParty.put(url.to_s+id.to_s, 
    :body => { 
               :title => 'Olá',  
             }.to_json,
     :headers => { 'Content-Type' => 'application/json' })
  end
end

json=JSONPlaceholder.new

Dado(/^que eu acesse a API jsonplaceholder$/) do   
  json
end

Então(/^eu obtenho a lista com todos os posts existentes$/) do
  puts json.home_page
end

Dado(/^que eu solicite os detalhes de cada post$/) do
  json
end

Então(/^eu obtenho os detalhes de cada post através do userID$/) do
  puts json.user_id(1)
end

Quando(/^eu buscar um post inxistente através do ID$/) do
  json
end

Então(/^eu obtenho resposta do tratamento de Erro$/) do
  response = json.post_id(150)
  case response.header.code
    when "404"
    puts "Erro #{response.header.code} - Não encontrado."
    when "200"
    puts json.post_id
  end
end

Quando(/^eu realizar um novo post informando$/) do
  response = json.newContent
end

Então(/^eu obtenho a confirmação do post criado com os itens informados$/) do
  response = json.newContent
  case response.header.code
    when "404"
    puts "Erro #{response.header.code} - Não encontrado."
    when "201"
    puts "Código #{response.header.code} - Post criado com sucesso."
  end
end

Quando(/^eu solicitar a deleção de um post através do ID$/) do
  response = json.deletePost(3)
end

Então(/^eu obtenho a confirmação do post deletado$/) do
  response = json.deletePost(3)
  case response.header.code
    when "404"
    puts "Erro #{response.header.code} - Não encontrado."
    when "200"
    puts "Código #{response.header.code} - Post deletado com sucesso."
  else
    puts response.header.code
  end
end

Quando(/^eu solicitar a deleção de um post inexistente$/) do
  response = json.deletePost(150)
end

Então(/^eu obtenho resposta do tratamento de erro$/) do
  response = json.deletePost(150)
  case response.header.code
    when "404"
    puts "Erro #{response.header.code} - Não encontrado."
    when "200"
    puts "Código #{response.header.code} - Post deletado com sucesso."
  else
    puts response.header.code
  end
end

Quando(/^eu solicitar a alteração de título de um post existente$/) do
  response = json.newTitle(3)
end

Então(/^eu obtenho a confirmação de alteração do título$/) do
    response = json.newTitle(3)
  case response.header.code
    when "404"
    puts "Erro #{response.header.code} - Não encontrado."
    when "200"
    puts "Código #{response.header.code} - Título alterado com sucesso."
  else
    puts response.header.code
  end
end