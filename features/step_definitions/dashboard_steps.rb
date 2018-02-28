Given("I am on the Dashboard page") do
  expect(page.current_path).to eq dashboard_index_path
end

Then("I should be on the Sign in page") do
  expect(page.current_path).to eq new_user_session_path
end

Then("I should be on the Sign up page") do
  expect(page.current_path).to eq user_registration_path
end

Then("I should see {string} button") do |button_text|
  expect(page).to have_content button_text
end
