class CreateMemos < ActiveRecord::Migration[4.2] # :nodoc:
  def change
    create_table :memos, id: false do |t|
      t.column :id, 'BIGINT PRIMARY KEY'
      t.belongs_to :user, index: true
      t.text :memo_status

      t.timestamps
    end
  end
end
