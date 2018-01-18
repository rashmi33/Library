class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.string :name
    	t.string :author
    	t.string :code
    	t.decimal :price
    	t.decimal :version
    	t.integer :no_of_copies
    	t.references :library, foreign_key: true
    	t.references :category, foreign_key: true
      t.timestamps null: false
    end
  end
end
