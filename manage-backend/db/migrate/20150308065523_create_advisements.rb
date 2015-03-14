class CreateAdvisements < ActiveRecord::Migration
  def change
    create_table :advisements do |t|
      t.string :avatar
      t.string :url

      t.timestamps
    end
  end
end
