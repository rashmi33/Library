class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
    	t.string :name
      t.string :address
      t.decimal :phone_no
      t.string :code
      t.boolean :is_author, default: false
      t.references :library, foreign_key: true
      t.timestamps null: false
    end
  end
end
