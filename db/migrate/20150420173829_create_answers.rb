class CreateAnswers < ActiveRecord::Migration
	def up
		create_table :answers do |t|
			t.text :text
			t.belongs_to :question, index: true

			t.timestamps
		end
	end

	def down
		drop_table :answers
	end
end
