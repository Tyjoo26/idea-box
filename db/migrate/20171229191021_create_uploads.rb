class CreateUploads < ActiveRecord::Migration[5.1]
  def change
    create_table :uploads do |t|
      t.integer   :picture_id
      t.integer   :idea_id
      
      t.timestamps
    end
  end
end
