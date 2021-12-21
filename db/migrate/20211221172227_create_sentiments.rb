class CreateSentiments < ActiveRecord::Migration[6.1]
  def change
    create_table :sentiments do |t|
      t.bigint :tweetId
      t.string :irony
      t.string :hate
      t.string :sentiment
      t.string :emotion

      t.timestamps
    end
  end
end
