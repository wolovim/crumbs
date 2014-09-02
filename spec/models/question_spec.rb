require 'rails_helper'

describe 'The question model' do
	
	it "cannot be created without a title" do
		question = Question.create(title: "", content: "Here's some context")
		expect(question).not_to be_valid
	end

	it "cannot be created without content" do
		question = Question.create(title: "How?", content: "")
		expect(question).not_to be_valid
	end


	it "must have a title of at least three chars" do
		question = Question.create(title: "z?", content: "Here's some context")
		expect(question).not_to be_valid
	end

	it "must have a content of at least five chars" do
		question = Question.create(title: "How?", content: "what")
		expect(question).not_to be_valid
	end

end