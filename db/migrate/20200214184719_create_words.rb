class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :word
      t.string :wordtype
      t.string :definition

      t.timestamps
    end
  end
end
