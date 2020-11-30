class QuoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :topic, :content, :user_id
  belongs_to :user
end
