require "application_system_test_case"

class AllergiesTest < ApplicationSystemTestCase
  setup do
    @allergy = allergies(:one)
  end

  test "visiting the index" do
    visit allergies_url
    assert_selector "h1", text: "Allergies"
  end

  test "creating a Allergy" do
    visit allergies_url
    click_on "New Allergy"

    fill_in "Allergy name", with: @allergy.allergy_name
    fill_in "Patient", with: @allergy.patient_id
    click_on "Create Allergy"

    assert_text "Allergy was successfully created"
    click_on "Back"
  end

  test "updating a Allergy" do
    visit allergies_url
    click_on "Edit", match: :first

    fill_in "Allergy name", with: @allergy.allergy_name
    fill_in "Patient", with: @allergy.patient_id
    click_on "Update Allergy"

    assert_text "Allergy was successfully updated"
    click_on "Back"
  end

  test "destroying a Allergy" do
    visit allergies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Allergy was successfully destroyed"
  end
end
