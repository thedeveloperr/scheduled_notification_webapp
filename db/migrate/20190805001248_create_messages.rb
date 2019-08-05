class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.belongs_to :broadcast_list, index: true
      t.string :txt
      t.string :send_at
      t.timestamps
    end
  end
end
