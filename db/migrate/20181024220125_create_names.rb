class CreateNames < ActiveRecord::Migration[5.2]
  def change
    create_table :names do |t|
      t.string :input
      t.string :gifttext
      t.string :spouse
      t.string :giftspouse

      t.timestamps
    end
  end
end
