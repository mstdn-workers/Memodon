class CreateUsers < ActiveRecord::Migration[4.2] # :nodoc:
  def change
    create_table :users do |t|
      t.string :username
      t.string :display
    end
  end
end
