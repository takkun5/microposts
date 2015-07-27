class AddAvatarToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :avatar, :string
  end
end
