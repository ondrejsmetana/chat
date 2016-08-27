class CreateAvatars < ActiveRecord::Migration[5.0]
  def change
    create_table :avatars do |t|
      t.string :image
      t.string :avatar_code
      t.timestamps
    end
  end
end
