class AddIndexToMoviesTitle < ActiveRecord::Migration
  def change
  	add_index :movies, [:title, :year], unique: true
  end
end
