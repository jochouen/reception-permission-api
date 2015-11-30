class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_identifier
      t.integer :reception_flag, limit: 1

      t.timestamps null: false
    end
  end
end
