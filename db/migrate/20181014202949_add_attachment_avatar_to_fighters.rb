class AddAttachmentAvatarToFighters < ActiveRecord::Migration[5.2]
  def self.up
    change_table :fighters do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :fighters, :avatar
  end
end
