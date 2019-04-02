require "application_system_test_case"

class GreetingCardsTest < ApplicationSystemTestCase
  setup do
    @greeting_card = greeting_cards(:one)
  end

  test "visiting the index" do
    visit greeting_cards_url
    assert_selector "h1", text: "Greeting Cards"
  end

  test "creating a Greeting card" do
    visit greeting_cards_url
    click_on "New Greeting Card"

    fill_in "Message", with: @greeting_card.message
    fill_in "Recipient email", with: @greeting_card.recipient_email
    fill_in "Recipient name", with: @greeting_card.recipient_name
    fill_in "Sender email", with: @greeting_card.sender_email
    fill_in "Sender name", with: @greeting_card.sender_name
    fill_in "Status", with: @greeting_card.status
    fill_in "Title", with: @greeting_card.title
    click_on "Create Greeting card"

    assert_text "Greeting card was successfully created"
    click_on "Back"
  end

  test "updating a Greeting card" do
    visit greeting_cards_url
    click_on "Edit", match: :first

    fill_in "Message", with: @greeting_card.message
    fill_in "Recipient email", with: @greeting_card.recipient_email
    fill_in "Recipient name", with: @greeting_card.recipient_name
    fill_in "Sender email", with: @greeting_card.sender_email
    fill_in "Sender name", with: @greeting_card.sender_name
    fill_in "Status", with: @greeting_card.status
    fill_in "Title", with: @greeting_card.title
    click_on "Update Greeting card"

    assert_text "Greeting card was successfully updated"
    click_on "Back"
  end

  test "destroying a Greeting card" do
    visit greeting_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Greeting card was successfully destroyed"
  end
end
