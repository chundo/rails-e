class CreateArchives < ActiveRecord::Migration[5.1]
  def change
    create_table :archives do |t|
      t.string :archive
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
