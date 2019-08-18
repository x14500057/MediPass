require "rails_helper"

RSpec.feature "Visit single medical_record", :type => :feature do
  let(:user) { create(:user) }
  let(:patient) {create(:patient)}
  let(:medical_record) { create(:medical_record) }

  scenario "User goes to a single medical_record from the home page", js: true do
    medical_record
    visit root_path
    page.find(".showtest").click
    expect(page).to have_selector('.diagnostic', text: medical_record.diagnostic)
  end

end