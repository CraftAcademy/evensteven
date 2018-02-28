Given("the following user exists") do |table|
  table.hashes.each do |user|
   create(:user, user)
  end
end

Given("I am on the Landing page") do
  visit root_path
end

Then("I should be on the Landing page") do
  expect(page.current_path).to eq root_path
end

When("I click on {string}") do |link_name|
  click_link_or_button link_name
end

When("I fill in {string} with {string}") do |field, value|
  fill_in(field, with: value)
end

Then("I should see the text {string}") do |message|
  expect(page).to have_content message
end

Then("{string} should be saved in the database") do |email|
  user = User.find_by(email: email)
  expect(user.email).to eq email
end

Then("show me the page") do
  save_and_open_page
end
