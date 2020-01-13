require "application_system_test_case"

class ContactDetailsTest < ApplicationSystemTestCase
  setup do
    @contact_detail = contact_details(:one)
  end

  test "visiting the index" do
    visit contact_details_url
    assert_selector "h1", text: "Contact Details"
  end

  test "creating a Contact detail" do
    visit contact_details_url
    click_on "New Contact Detail"

    fill_in "Description", with: @contact_detail.description
    fill_in "First name", with: @contact_detail.first_name
    fill_in "Last name", with: @contact_detail.last_name
    fill_in "Mobile", with: @contact_detail.mobile
    fill_in "Telephone", with: @contact_detail.telephone
    fill_in "User", with: @contact_detail.user_id
    click_on "Create Contact detail"

    assert_text "Contact detail was successfully created"
    click_on "Back"
  end

  test "updating a Contact detail" do
    visit contact_details_url
    click_on "Edit", match: :first

    fill_in "Description", with: @contact_detail.description
    fill_in "First name", with: @contact_detail.first_name
    fill_in "Last name", with: @contact_detail.last_name
    fill_in "Mobile", with: @contact_detail.mobile
    fill_in "Telephone", with: @contact_detail.telephone
    fill_in "User", with: @contact_detail.user_id
    click_on "Update Contact detail"

    assert_text "Contact detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Contact detail" do
    visit contact_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contact detail was successfully destroyed"
  end
end
