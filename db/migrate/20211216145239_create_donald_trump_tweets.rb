class CreateDonaldTrumpTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :trump_tweets do |t|
      t.bigint :tweetId
      t.string :link
      t.text :content
      t.datetime :publishedAt
      t.integer :retweets
      t.integer :favorites
      t.string :mentions
      t.string :hashtags
      t.timestamps default: -> { 'NOW()' }
    end
  end
end