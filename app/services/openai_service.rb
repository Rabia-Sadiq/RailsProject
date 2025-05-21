class OpenaiService
  attr_reader :client
  
  def initialize
    @client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
  end
  
  def generate_size_recommendation(height, weight, gender, preferences = {})
    prompt = create_size_recommendation_prompt(height, weight, gender, preferences)
    generate_response(prompt)
  end
  
  def generate_color_advice(undertone, occasion = nil)
    prompt = create_color_advice_prompt(undertone, occasion)
    generate_response(prompt)
  end
  
  private
  
  def generate_response(prompt)
    begin
      response = client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: [{ role: "user", content: prompt }],
          temperature: 0.7,
          max_tokens: 500
        }
      )
      
      response.dig("choices", 0, "message", "content")
    rescue => e
      Rails.logger.error("OpenAI API error: #{e.message}")
      
      # Better error messaging based on error type
      if e.message.include?('429')
        return "I'm currently experiencing high traffic. Please try again in a few moments."
      elsif e.message.include?('401') || e.message.include?('403')
        return "There seems to be an authentication issue with my AI service. Please contact support."
      else
        return "I'm having trouble connecting to my brain right now. Please try again later."
      end
    end
  end
  
   def create_size_recommendation_prompt(height, weight, gender, preferences)
    <<~PROMPT
      You are a professional fashion stylist helping with clothing size recommendations.
      
      Customer details:
      - Height: #{height} cm
      - Weight: #{weight} kg
      - Gender: #{gender}
      #{preferences[:brand] ? "- Preferred brand: #{preferences[:brand]}" : ""}
      #{preferences[:fit] ? "- Preferred fit: #{preferences[:fit]}" : ""}
      
      Please recommend the appropriate dress size for this person. Include specific size recommendations 
      (S/M/L/XL or numeric sizes) across different common clothing brands if possible. Keep your response 
      concise and friendly, focusing just on size recommendations.
    PROMPT
  end
  
 def create_color_advice_prompt(undertone, occasion)
    <<~PROMPT
      You are a professional color consultant helping with clothing color recommendations.
      
      Customer has a #{undertone} skin undertone.
      #{occasion ? "They are looking for outfit colors for a #{occasion}." : ""}
      
      Please recommend 5-7 specific colors that would look best with their skin undertone.
      For each color, briefly explain why it works well with their undertone.
      Keep your response friendly and concise.
    PROMPT
  end
end

















