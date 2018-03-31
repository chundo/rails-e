class InShoppingCartsController < ApplicationController

    def create
        #Agregar a un carrito de compra
        in_shopping_cart = InShoppingCart.new(product_id: params[:product_id], shopping_cart_id: @shopping_cart.id)

        if in_shopping_cart.save
            redirect_to carrito_path, notice: "producto Agregado"
        else
            redirect_to product_path(id: params[:product_id]), notice: "no se agrego el productoz"
        end
    end

    def destroy
        #Eliminar de un carrito de compra
        @in_shopping_cart = InShoppingCart.find(params[:id])
        @in_shopping_cart.destroy
        redirect_to carrito_path
    end


end
