class CreateSemanticsCaches < ActiveRecord::Migration[5.0]
  def change
    create_table :semantics_caches do |t|
      t.text :response, null: false
      t.integer :product_id, null: false
      t.timestamps
    end
  end
end
