require 'test_helper'

class GreetingCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @greeting_card = greeting_cards(:one)
  end

  test "should get index" do
    get greeting_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_greeting_card_url
    assert_response :success
  end

  test "should create greeting_card" do
    assert_difference('GreetingCard.count') do
      post greeting_cards_url, params: { greeting_card: { message: @greeting_card.message, recipient_email: @greeting_card.recipient_email, recipient_name: @greeting_card.recipient_name, sender_email: @greeting_card.sender_email, sender_name: @greeting_card.sender_name, status: @greeting_card.status, title: @greeting_card.title } }
    end

    assert_redirected_to greeting_card_url(GreetingCard.last)
  end

  test "should show greeting_card" do
    get greeting_card_url(@greeting_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_greeting_card_url(@greeting_card)
    assert_response :success
  end

  test "should update greeting_card" do
    patch greeting_card_url(@greeting_card), params: { greeting_card: { message: @greeting_card.message, recipient_email: @greeting_card.recipient_email, recipient_name: @greeting_card.recipient_name, sender_email: @greeting_card.sender_email, sender_name: @greeting_card.sender_name, status: @greeting_card.status, title: @greeting_card.title } }
    assert_redirected_to greeting_card_url(@greeting_card)
  end

  test "should destroy greeting_card" do
    assert_difference('GreetingCard.count', -1) do
      delete greeting_card_url(@greeting_card)
    end

    assert_redirected_to greeting_cards_url
  end
end
