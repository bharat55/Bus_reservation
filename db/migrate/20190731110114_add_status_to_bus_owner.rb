class AddStatusToBusOwner < ActiveRecord::Migration[5.2]
  def change
    add_column :bus_owners, :status, :string, default: "Approval Pending"
  end
end
