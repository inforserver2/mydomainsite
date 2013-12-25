class CreateOfficeBlogs < ActiveRecord::Migration
  def change
    create_table :office_blogs do |t|
      t.string :title

      t.timestamps
    end
  end
end
