class QuoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :topic, :content
  belongs_to :user
end
