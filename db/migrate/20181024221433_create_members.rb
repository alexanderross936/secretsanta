class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :input
      t.string :gifttext
      t.string :spouse
      t.string :spousegift

      t.timestamps
    end
  end
end
