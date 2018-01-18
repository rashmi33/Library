class ChangePhoneNoTypeInLibraryAndMember < ActiveRecord::Migration
  def change
  	change_column :libraries, :phone_no, :string
  	change_column :members, :phone_no, :string
  end
end
