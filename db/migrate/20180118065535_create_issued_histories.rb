class CreateIssuedHistories < ActiveRecord::Migration
  def change
    create_table :issued_histories do |t|
    	t.string :issue_type
    	t.datetime :date_of_issue
    	t.datetime :date_of_return
    	t.integer :issued_no
    	t.references :book, foreign_key: true
    	t.references :member, foreign_key: true
      t.timestamps null: false
    end
  end
end
