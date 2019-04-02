class CreateGreetingCards < ActiveRecord::Migration[5.2]
  def change
    create_table :greeting_cards do |t|
      t.string :title
      t.text :message
      t.string :sender_name
      t.string :sender_email
      t.string :recipient_name
      t.string :recipient_email
      t.string :status

      t.timestamps
    end
  end
end
