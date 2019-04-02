json.extract! greeting_card, :id, :title, :message, :sender_name, :sender_email, :recipient_name, :recipient_email, :status, :created_at, :updated_at
json.url greeting_card_url(greeting_card, format: :json)
