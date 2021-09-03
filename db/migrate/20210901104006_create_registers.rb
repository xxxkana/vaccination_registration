class CreateRegisters < ActiveRecord::Migration[6.0]
  def change
    create_table :registers do |t|
      t.references :user, foreign_key: true
      t.string :public_uid
      t.timestamps
    end
  end
end
