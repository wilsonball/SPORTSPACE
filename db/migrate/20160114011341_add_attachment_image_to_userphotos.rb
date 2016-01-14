class AddAttachmentImageToUserphotos < ActiveRecord::Migration
  def self.up
    change_table :userphotos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :userphotos, :image
  end
end
