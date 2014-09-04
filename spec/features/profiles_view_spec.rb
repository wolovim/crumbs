require 'rails_helper'

describe "When looking at a user profile" do
	
	context "as a non-logged in user" do
		let(:joe) 		 { User.create(first_name: "Joe", last_name: "Shmoe", email: "joe@example.com", password: "omgomgomg", password_confirmation: "omgomgomg") }
		let(:question) { Question.create(title: "How?", content: "How do I get there?", user_id: joe.id) }
		let(:answer) 	 { Answer.create(question_id: question.id, body: "Well let me tell ya.", user_id: joe.id) }
		let(:job)			 { Position.create(title: "Senior Developer", company: "Lullaby", responsibilities: "I maked the facebooks and googles.", start_date: Time.now, end_date: Time.now, user_id: joe.id) }
		
		before(:each) do
			joe
			question
			answer
			login
			visit '/profiles/' + joe.id.to_s
		end

		it "can view previously asked questions" do
			expect(page).to have_content("How?")
		end

		it "can view previously answered questions" do
			expect(page).to have_content("Well let me tell ya.")
		end

		# it "displays previous positions held" do
		# 	job
		# 	expect(page).to have_content("Senior Developer")
		# 	expect(page).to have_content("Lullaby")
		# end

		# if a question is tagged with a word that is one of the jobs I've had, I want to receive it in my feed

	end
end