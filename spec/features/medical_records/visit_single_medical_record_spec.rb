require "rails_helper"

RSpec.feature "Visit single medical_record", :type => :feature do
  let(:user) { create(:user) }
  let(:patient) {create(:patient)}
  let(:medical_record) { create(:medical_record) }

  scenario "User goes to a single medical record dashboard", js: true do

    medical_record
    visit root_path
    page.find(".sign_in_btn").click
    expect(page).to have_selector('.view-emr-link')
    page.find(".view-emr-link").click
    expect(page).to have_selector('.emr-id-td', text: medical_record.id)
  end


  

end