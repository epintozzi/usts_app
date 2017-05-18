class AddAttachmentSanctionToRaces < ActiveRecord::Migration
  def self.up
    change_table :races do |t|
      t.attachment :sanction
    end
  end

  def self.down
    remove_attachment :races, :sanction
  end
end
