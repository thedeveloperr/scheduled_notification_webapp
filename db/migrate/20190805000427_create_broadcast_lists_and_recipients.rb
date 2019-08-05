class CreateBroadcastListsAndRecipients < ActiveRecord::Migration[5.2]
    # rubocop:disable MethodLength
  def change
    create_table :broadcast_lists do |t|
      t.string :name, null: false
      t.string :event_code, null: false
      t.timestamps
    end
    add_index :broadcast_lists, :name, unique: true
    add_index :broadcast_lists, :event_code, unique: false

    create_table :recipients do |t|
      t.string :phone_number
    end
    add_index :recipients, :phone_number, unique: true
    create_table :subscriptions do |t|
      t.belongs_to :broadcast_list, index: true
      t.belongs_to :recipient, index: true
      t.boolean :confirmed, default: true
      t.timestamps
    end
  end
  # rubocop:enable MethodLength
end
