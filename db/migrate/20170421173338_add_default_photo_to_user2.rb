class AddDefaultPhotoToUser2 < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :image, "/assets/profile_avatar.png"
  end
end
