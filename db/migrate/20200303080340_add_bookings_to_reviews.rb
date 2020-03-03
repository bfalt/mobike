class AddBookingsToReviews < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reviews, :motorbike, index: true, foreign_key: true
    add_reference :reviews, :booking, foreign_key: true
  end
end
