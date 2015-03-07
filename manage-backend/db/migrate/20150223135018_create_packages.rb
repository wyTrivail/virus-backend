#encoding utf-8
class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.integer :version
      t.string :url
      t.string :des

      t.timestamps
    end
  end
end
