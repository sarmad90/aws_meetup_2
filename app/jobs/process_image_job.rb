class ProcessImageJob < ApplicationJob
  queue_as :default

  def perform(greeting_card_id)
    sleep 5
    greeting_card = GreetingCard.find(greeting_card_id)
    greeting_card.update!(status: 'Completed')
  end
end
