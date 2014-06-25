class CreateOttrickTickets < ActiveRecord::Migration
  def change
    create_table :ottrick_tickets do |t|
      t.references :ticketfor, index: true
      t.string :ticketfor_type
      t.string :sender
      t.references :queue, index: true
      t.string :subject
      t.text :text

      t.timestamps
    end
  end
end
