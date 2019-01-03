class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.boolean :is_one_to_one_match
      t.boolean :is_set_match
      t.boolean :is_person_match
      t.integer :match
      t.integer :base
      t.integer :cap
      t.references :fund, foreign_key:true
      t.references :user, foreign_key:true
      t.timestamps
    end
  end
end
