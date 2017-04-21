class AddDefaultPhotoToUser < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :image, "profile_avatar.png"
  end
end
