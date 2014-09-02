require 'rails_helper'

describe 'When viewing the home page' do
	
	let(:question) { Question.create(title: "How?", content: "How do I get there?") }
	let(:answer) 	 { Answer.create(question_id: question.id, body: "Well let me tell ya.") }

	before(:each) do
		question
		answer
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

	it "displays answers associated with questions" do

	end

	it "can add an answer to a specific question" do
		click_link_or_button "How?"
		fill_in "Response:", with: "Wait for it..."
		click_link_or_button "Submit Answer"
		expect(page).to have_content "Wait for it..."
	end

end