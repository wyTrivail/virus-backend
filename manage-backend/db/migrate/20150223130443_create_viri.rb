class CreateViri < ActiveRecord::Migration
  def change
    create_table :viri do |t|
      t.string :collected_gmt
      t.integer :upstream_id
      t.string :en_name
      t.string :family_name
      t.string :cn_name
      t.string :found_gmt
      t.text :family_cn_des
      t.text :family_en_des
      t.text :action_des
      t.string :pic_url
      t.integer :platform
      t.integer :type

      t.timestamps
    end
  end
end
