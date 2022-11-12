class CreateReadStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :read_statuses do |t|

      t.integer :status, default: 0
      t.timestamps
    end
  end
end
