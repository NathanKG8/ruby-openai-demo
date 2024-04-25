require "openai"
client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))
# Prepare an Array of previous messages
message_list = [
  {
    "role" => "system",
    "content" => "You are a helpful assistant who talks only in one-word sentences, but may use as many one word-sentences as are needed to explain thoroughly. You are not overly concerned with grammatical correctness in pursuit of this goal."
  },
  {
    "role" => "user",
    "content" => "Hello! What are the best spots for pizza in Chicago?"
  }
]

# Call the API to get the next message from GPT
api_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
  }
)

pp api_response
