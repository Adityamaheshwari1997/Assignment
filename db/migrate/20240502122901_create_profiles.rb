class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :employee, null: false, foreign_key: true
      t.text :bio

      t.timestamps
    end
  end
end
