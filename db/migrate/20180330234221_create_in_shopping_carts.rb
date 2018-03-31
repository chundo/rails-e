class CreateInShoppingCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :in_shopping_carts do |t|
      t.references :product, foreign_key: true
      t.references :shopping_cart, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
