class CreateOkuribitoRecorderMethodCallSituations < ActiveRecord::Migration
  def change
    create_table :okuribito_recorder_method_call_situations do |t|
      t.string :class, null: false
      t.string :method_type, null: false
      t.string :method_name, null: false
      t.integer :called_num, null: false, default: 0

      t.timestamps
    end
    add_index :okuribito_recorder_method_call_situations, :class
    add_index :okuribito_recorder_method_call_situations, :method_name
  end
end
