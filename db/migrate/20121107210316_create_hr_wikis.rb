class CreateHrWikis < ActiveRecord::Migration
  def change
    create_table :hr_wikis do |t|
      t.string:term
      t.text   :definition
      t.timestamps
    end
  end
end
