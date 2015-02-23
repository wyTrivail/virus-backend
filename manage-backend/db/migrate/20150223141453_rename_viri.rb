class RenameViri < ActiveRecord::Migration
  def change
       change_table :viri do |t|
           t.rename :type, :virus_type
       end
  end
end
