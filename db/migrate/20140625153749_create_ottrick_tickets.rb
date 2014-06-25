class CreateOttrickTickets < ActiveRecord::Migration
  def change
    create_table :ottrick_tickets do |t|
      t.references :ticketfor, index: true
      t.string :ticketfor_type
      t.string :sender
      t.references :queue, index: true
      t.string :subject
      t.text :text
      t.string :ticketnumber
      t.integer :otrs_ticket_id

      t.timestamps
    end
    add_index :ottrick_tickets, :otrs_ticket_id
  end
end
