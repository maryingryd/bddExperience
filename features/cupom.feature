#language:pt

##User Story: Uso de Cupons no Checkout

#Como um usuário do site de venda de cafés, Eu quero poder aplicar cupons de desconto na página de checkout, Para que eu possa obter reduções no preço de produtos específicos ou na minha compra total, aumentando a satisfação com a minha experiência de compra.

#Critérios de Aceitação:

#Aplicar Desconto de 20%:

#O usuário deve ser capaz de aplicar um cupom de 20% de desconto válido no checkout.
#O desconto deve ser aplicado apenas ao valor do produto e o valor final deve ser recalculado corretamente.

#Cupom Expirado:

#Ao tentar usar um cupom expirado, o usuário deve receber uma notificação informando que o cupom está expirado.
#Nenhum desconto deve ser aplicado e o valor total da compra deve permanecer inalterado.

#Cupom Inválido:

#Ao tentar usar um cupom inválido, o usuário deve receber uma notificação informando que o cupom é inválido.
#Nenhum desconto deve ser aplicado e o valor total da compra deve permanecer inalterado.
#Notas:

#A funcionalidade de cupom deve ser fácil de usar e intuitiva, garantindo uma boa experiência de usuário.
#As mensagens de erro devem ser claras e informativas para orientar o usuário adequadamente.


### Escrita em Gherkin (especificação em Gherkin)
    #Nessa fase aplica-se o BDD (Behavior-Driven Developent/ Desenvolvimento Orientado por Comportamento)

##Funcionalidade: Uso de Cupons no Checkout

    #Como um usuário da Starbugs, Eu quero poder aplicar cupons de desconto na página de checkout
    #Para que eu possa obter reduções no preço de produtos, aumentando a satisfação com a minha experiência de compra.

    #Cenário: Aplicar Desconto de 20%

    #O usuário deve ser capaz de aplicar um cupom de 20% de desconto válido no checkout.
    #O desconto deve ser aplicado apenas ao valor do produto e o valor final deve ser recalculado corretamente.

    #Dado que estou na página de Checkout
        #E o item que está no meu carrinho é o Café com Leite no valor de R$ 19,99
        #E que a taxa de entrega é de R$ 10,00
        #E o valor total é de R$29,99
        #E tenho um cupom com 20% de desconto "MEUCAFE"
    #Quando aplico esse cupom de desconto
    #Então o desconto de 20% deve ser aplicado apenas no valor do Café com Leite
    #E o valor final da compra deve ser atualizado para R$25,99    

    #Cenário: Cupom expirado

    #Ao tentar usar um cupom expirado, o usuário deve receber uma notificação informando que o cupom está expirado.
    #Nenhum desconto deve ser aplicado e o valor total da compra deve permanecer inalterado.

    #Dado que estou na página de Checkout
        #E o item que está no meu carrinho é o Café com Leite no valor de R$ 19,99
        #E que a taxa de entrega é de R$ 10,00
        #E o valor total é de R$29,99
        #E tenho um cupom que está expirado "PROMO20"
    #Quando aplico esse cupom de desconto    
    #Então deve ver a seguinte notificação "Cupom expirado!"
        #E o valor deve permanecer o mesmo

    #Cenário: Cupom inválido  

    #Ao tentar usar um cupom inválido, o usuário deve receber uma notificação informando que o cupom é inválido.
    #Nenhum desconto deve ser aplicado e o valor total da compra deve permanecer inalterado.  
    
    #Dado que estou na página de Checkout
        #E o item que está no meu carrinho é o Café com Leite no valor de R$ 19,99
        #E que a taxa de entrega é de R$ 10,00
        #E o valor total é de R$29,99
        #E tenho um cupom que está inválido "PROMO100"
    #Quando aplico esse cupom de desconto    
    #Então deve ver a seguinte notificação "Cupom inválido!"
        #E o valor deve permanecer o mesmo



###Escrita para Automação:

    Funcionalidade: Uso de Cupons no Checkout

    Como um usuário da Starbugs, Eu quero poder aplicar cupons de desconto na página de checkout
    Para que eu possa obter reduções no preço de produtos, aumentando a satisfação com a minha experiência de compra.

    
    Contexto:
    Dado que iniciei a compra do item:
        | name     | Café com Leite |
        | price    | R$ 19,99       |
        | delivery | R$ 10,00       |
        | total    | R$ 29,99       |

    Cenario: Aplicar Desconto de 20%
        
    Quando aplico o seguinte cupom: "MEUCAFE"
    Então o valor final da compra deve ser atualizado para "R$ 25,99"


Esquema do Cenário: Tentativa de aplicar o desconto

    Quando aplico o seguinte cupom: "<cupom>"
    Então devo ver a notificação: "<saida>"
        E o valor final da compra deve permanecer o mesmo

    Exemplos:
    | cupom    | saida           |
    | PROMO20  | Cupom expirado! |
    | PROMO100 | Cupom inválido! |



