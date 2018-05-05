class CreateMemos < ActiveRecord::Migration[4.2]
  def change
    create_table :memos do |t|
      t.belongs_to :user, index: true
      t.string :memo_status

      t.timestamps
    end
  end
end
