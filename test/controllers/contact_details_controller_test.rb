require 'test_helper'

class ContactDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_detail = contact_details(:one)
  end

  test "should get index" do
    get contact_details_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_detail_url
    assert_response :success
  end

  test "should create contact_detail" do
    assert_difference('ContactDetail.count') do
      post contact_details_url, params: { contact_detail: { description: @contact_detail.description, first_name: @contact_detail.first_name, last_name: @contact_detail.last_name, mobile: @contact_detail.mobile, telephone: @contact_detail.telephone, user_id: @contact_detail.user_id } }
    end

    assert_redirected_to contact_detail_url(ContactDetail.last)
  end

  test "should show contact_detail" do
    get contact_detail_url(@contact_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_detail_url(@contact_detail)
    assert_response :success
  end

  test "should update contact_detail" do
    patch contact_detail_url(@contact_detail), params: { contact_detail: { description: @contact_detail.description, first_name: @contact_detail.first_name, last_name: @contact_detail.last_name, mobile: @contact_detail.mobile, telephone: @contact_detail.telephone, user_id: @contact_detail.user_id } }
    assert_redirected_to contact_detail_url(@contact_detail)
  end

  test "should destroy contact_detail" do
    assert_difference('ContactDetail.count', -1) do
      delete contact_detail_url(@contact_detail)
    end

    assert_redirected_to contact_details_url
  end
end
