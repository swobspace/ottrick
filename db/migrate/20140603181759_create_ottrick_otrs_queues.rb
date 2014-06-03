class CreateOttrickOtrsQueues < ActiveRecord::Migration
  def change
    create_table :ottrick_otrs_queues do |t|
      t.string :name
      t.integer :otrs_queue_id

      t.timestamps
    end
  end
end
