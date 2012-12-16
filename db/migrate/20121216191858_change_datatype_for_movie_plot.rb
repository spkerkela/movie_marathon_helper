class ChangeDatatypeForMoviePlot < ActiveRecord::Migration
  def up
  	change_table :movies do |t|
  		t.change :plot, :text
  	end
  end

  def down
  	change_table :movies do |t|
  		t.change :plot, :string
  	end
  end
end
