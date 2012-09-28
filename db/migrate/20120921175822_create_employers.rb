class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :company
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
