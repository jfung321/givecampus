class CreateFunds < ActiveRecord::Migration[5.1]
  def change
    create_table :funds do |t|
      t.string :name
      t.integer :total
      t.integer :total_donars
      t.references :user, foreign_key:true
      t.timestamps
    end
  end
end
