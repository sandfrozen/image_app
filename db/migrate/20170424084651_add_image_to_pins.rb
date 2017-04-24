class AddImageToPins < ActiveRecord::Migration
  def change
    add_column :pins, :image, :string
  end
end
