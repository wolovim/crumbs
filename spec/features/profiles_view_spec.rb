require 'rails_helper'

describe "When looking at a user profile" do
		
		let(:joe) 		 { User.create(first_name: "Joe", last_name: "Shmoe", email: "joe@example.com", password: "omgomgomg", password_confirmation: "omgomgomg") }
		let(:question) { Question.create(title: "How?", content: "How do I get there?", user_id: joe.id) }
		let(:answer) 	 { Answer.create(question_id: question.id, body: "Well let me tell ya.", user_id: joe.id) }
		let(:position) { Position.create(title: "Senior Developer", company: "Lullaby", responsibilities: "I maked the facebooks and googles.", start_date: Time.now, end_date: Time.now, user_id: joe.id) }
	
	context "as a logged in user" do
		
		before(:each) do
			joe
			question
			answer
			position
			login
			visit '/profiles/' + joe.id.to_s
		end

		it "can view previously asked questions" do
			expect(page).to have_content("How?")
		end

		it "can view previously answered questions" do
			expect(page).to have_content("Well let me tell ya.")
		end

		it "displays previous positions held" do
			expect(page).to have_content("Senior Developer")
			expect(page).to have_content("Lullaby")
		end

		it "can add a position" do
			click_link_or_button "Add position"
			fill_in "Title", with: "Junior Developer"
			fill_in "Company", with: "Rap Genius"
			fill_in "Responsibilities", with: "Who knows"

			# How do fill in a date select form?

			# fill_in "Start date", with:
			# fill_in "End date", with:

			# select "4", from: "start_date(3i)"
			# select "9", from: "start_date(2i)"
			# select "2013", from: "start_date(1i)"
			# select "4", from: "end_date(3i)"
			# select "9", from: "end_date(2i)"
			# select "2014", from: "end_date(1i)"

			click_link_or_button "Add position"
			expect(page).to have_content "Junior Developer"
			expect(page).to have_content "Rap Genius"
		end

		it "cannot add positions to another users profile" do
			#
		end

	end

	context "as a logged out user" do
		it "cannot see the form to add positions" do
			joe
			question
			answer
			position
			visit '/profiles/' + joe.id.to_s
			expect(page).not_to have_content "Add a Position:"
		end

	end

end