class AddColumnToBus < ActiveRecord::Migration[5.2]
  def change
    add_column :buses, :status, :string ,default:"active"
  end
end
