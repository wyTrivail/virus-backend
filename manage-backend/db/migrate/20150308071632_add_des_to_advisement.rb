class AddDesToAdvisement < ActiveRecord::Migration
  def change
    add_column :advisements, :des, :string
  end
end
