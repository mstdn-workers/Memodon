class CreateMemos < ActiveRecord::Migration[4.2] # :nodoc:
  def change
    create_table :memos do |t|
      t.belongs_to :user, index: true
      t.text :memo_status

      t.timestamps
    end
  end
end
