class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.references :item,      foreign_key: true
      t.references :user,      foreign_key: true
      t.timestamps
    end
  end
end
