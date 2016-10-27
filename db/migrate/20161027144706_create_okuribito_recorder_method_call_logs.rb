class CreateOkuribitoRecorderMethodCallLogs < ActiveRecord::Migration
  def change
    create_table :okuribito_recorder_method_call_logs do |t|
      t.string :class, null: false
      t.string :method_type, null: false
      t.string :method_name, null: false
      t.text :back_trace

      t.timestamps
    end
    add_index :okuribito_recorder_method_call_logs, :class
    add_index :okuribito_recorder_method_call_logs, :method_name
  end
end
