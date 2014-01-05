class CreateBinaries < ActiveRecord::Migration
  def change
    create_table :binaries do |t|
      t.integer :sponsor_id
      t.string :my_side

      t.timestamps
    end
  end
end
