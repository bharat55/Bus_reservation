class AddColoumnToBuses < ActiveRecord::Migration[5.2]
  def change
    add_column :buses, :suspended_by ,:string
  end
end
