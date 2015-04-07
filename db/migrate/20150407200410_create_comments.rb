class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.belongs_to :task, index: true
    end
    add_foreign_key :comments, :tasks
  end
end
