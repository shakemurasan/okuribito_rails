class CreateOkuribitoRailsMethodCallSituations < ActiveRecord::Migration
  def change
    create_table :okuribito_rails_method_call_situations do |t|
      t.string :class_name, null: false
      t.string :method_symbol, null: false
      t.string :method_name, null: false
      t.integer :called_num, null: false, default: 0

      t.timestamps
    end
    add_index :okuribito_rails_method_call_situations, :class_name
    add_index :okuribito_rails_method_call_situations, :method_name
  end
end
