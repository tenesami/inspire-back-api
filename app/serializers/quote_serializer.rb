class QuoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :topic, :content, :user
end
