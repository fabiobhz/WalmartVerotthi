#language: pt
#encoding: UTF-8

class Walmart
  include Capybara::DSL

    def visit_page
        visit 'https://www.walmart.com.br'
        self 
    end
    
    def searchProduct
      fill_in 'suggestion-search', :with => "TV"
      self
    end
    
    def searchButton
      click_on 'Procurar'
      self
    end
    
    def showResult
      page.has_content?('main') do
      temTexto = page.has_text?('resultados')
      expect(temTexto).to be_truthy
      self
      end
    end
    
    def chooseProduct
       first('shelf-item') do
       click_link(',00')
       self
      end
    end
    
    def confirmProduct
        page.has_content?('product-title-header') do
        temTexto = page.has_text?('Smart TV')
        expect(temTexto).to be_truthy
        self
        end
    end
    
    def addToCart
       page.has_selector?('buy-button-wrapper') do
       click_on('Adicionar ao carrinho')
       self
       end
    end
    
    def confirmCart
      click_on('cart')
      page.has_selector?('my-cart-content-wrapper') do
      temTexto = page.has_text?('Valor')
      expect(temTexto).to be_truthy
      self
      end
    end
    
    def loginSite
      page.has_content?('wraper-right-icons') do
      click_on 'Entre'
      self
      end
    end
      
    def fillLogin
      page.has_selector?('sign-in-wrapper') do
      fill_in 'signinField', :with=> cpf
      fill_in 'password', :with=> password
      self
      end
    end
    
    def enterLogin
      page.has_selector?('sign-in-wrapper') do
      click_on 'signinButtonSend'
      self
      end
    end  
end

visit=Walmart.new

Dado(/^que eu acesse o site do Walmart$/) do 
  visit.visit_page
end

Quando(/^eu preencher o campo de busca$/) do
  visit.searchProduct.searchButton
end

E(/^mostrar todas as opções de TV$/) do
  visit.showResult
end

E(/^escolher uma TV$/) do
  visit.chooseProduct
end

E(/^confirmar o produto$/) do
  visit.confirmProduct
end

E(/^adicionar ao carrinho$/) do
  visit.addToCart
end

Então(/^entrar no carrinho de compras e verificar se o produto foi adicionado$/) do
   visit.confirmCart
end


Dado(/^que eu clique no botão de entrar$/) do
  visit.loginSite
end

Quando(/^eu preencher (\d+) e a(\d+) nos campos de login$/) do |cpf, password|
  visit.fillLogin
end


Então(/^eu logo no site$/) do

end