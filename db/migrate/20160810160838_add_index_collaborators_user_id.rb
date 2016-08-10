class AddIndexCollaboratorsUserId < ActiveRecord::Migration
  def change
    add_index :collaborators, :user_id, unique: false
    add_index :collaborators, :wiki_id, unique: false
  end
end
