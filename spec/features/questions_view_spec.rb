require 'rails_helper'

describe 'When viewing the home page' do
	let(:joe) 		 { User.create(first_name: "Joe", last_name: "Shmoe", email: "joe@example.com", password: "omgomgomg", password_confirmation: "omgomgomg") }
	let(:question) { Question.create(title: "How?", content: "How do I get there?", user_id: joe.id) }
	let(:answer) 	 { Answer.create(question_id: question.id, body: "Well let me tell ya.", user_id: joe.id) }

	before(:each) do
		question
		answer
		login
		visit questions_path
	end

	it "shows a list of questions" do
		expect(page).to have_content "How?"
	end

	it "can add a new question" do
		click_link_or_button "Ask a question"
		expect(current_path).to eq(new_question_path)
		fill_in "Title", with: "What should I do?"
		fill_in "Content", with: "I'm not sure how to get there."
		click_link_or_button "Submit Question"
		expect(current_path).to eq(questions_path)
		expect(page).to have_content "What should I do?"
	end

	it "can view the question show page" do
		click_link_or_button "How?"
		expect(current_path).to eq(question_path(question))
		expect(page).to have_content "How do I get there?"
	end

	it "can delete a question from the index page" do 
		expect(page).to have_content "How?"
		click_link_or_button "Delete"
		expect(page).not_to have_content "How?"
	end

	it "can delete a question from the show page" do
		click_link_or_button "How?"
		click_link_or_button "Delete"
		expect(page).not_to have_content "How?"
	end

	it "can edit a question from the show page" do
		click_link_or_button "How?"
		click_link_or_button "Edit"
		fill_in "Title", with: "Why not?"
		fill_in "Content", with: "This should work, right?"
		click_link_or_button "Submit Question"
		expect(page).to have_content "Why not?"
	end

	it "can add an answer to a specific question" do
		click_link_or_button "How?"
		fill_in "Response:", with: "Wait for it..."
		click_link_or_button "Submit Answer"
		expect(page).to have_content "Wait for it..."
	end

	it "displays a question score that can be manipulated" do
		expect(page).to have_content "0"
		click_link_or_button "+"
		expect(page).to have_content "1"
		click_link_or_button "-"
		expect(page).to have_content "0"
	end

end