class RemovePictureColumnFromProfile < ActiveRecord::Migration[7.1]
  def change
    safety_assured { remove_column :profiles, :picture }
  end
end
