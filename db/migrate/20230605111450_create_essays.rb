class CreateEssays < ActiveRecord::Migration[7.0]
  def change
    create_table :essays do |t|
      t.string :heading
      t.text :detail
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
