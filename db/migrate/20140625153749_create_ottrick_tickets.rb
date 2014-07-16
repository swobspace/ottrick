class CreateOttrickTickets < ActiveRecord::Migration
  def change
    create_table :ottrick_tickets do |t|
      t.references :ticketfor, index: true
      t.string :ticketfor_type
      t.string :sender
      t.references :otrs_queue, index: true
      t.string :subject, default: ""
      t.text :text
      t.string :ticketnumber, default: ""
      t.integer :otrs_ticket_id

      t.timestamps
    end
    add_index :ottrick_tickets, :otrs_ticket_id
  end
end
