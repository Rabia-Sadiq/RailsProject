class ChatBotController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @messages = current_user.chat_messages.order(created_at: :asc).last(10)
  end
  
  def create
    @user_message = params[:message]
    
    # Save user message
    current_user.chat_messages.create(content: @user_message, is_from_bot: false)
    
    # Process the message and generate a response
    @bot_response = process_user_message(@user_message)
    
    # Save bot response
    @bot_message = current_user.chat_messages.create(content: @bot_response, is_from_bot: true)
    
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to chat_bot_path }
      format.json { render json: { response: @bot_response } }
    end
  end
  
  private
  
  def process_user_message(message)
  # Basic intent detection
  message = message.downcase
  
  begin
    if message.include?('size') || message.match?(/fit|measurement/)
      # Extract height and weight if mentioned
      height = message.match(/(\d+)\s*(cm|centimeters?)/)&.captures&.first || 170
      weight = message.match(/(\d+)\s*(kg|kilograms?)/)&.captures&.first || 70
      gender = if message.include?('female') || message.include?('woman')
               'female'
              elsif message.include?('male') || message.include?('man')
               'male'
              else
               'unspecified'
              end
      
      preferences = {}
      preferences[:brand] = $1 if message =~ /brand\s+(?:is|:)?\s*([a-zA-Z\s]+)/
      preferences[:fit] = $1 if message =~ /fit\s+(?:is|:)?\s*([a-zA-Z\s]+)/
      
      response = OpenaiService.new.generate_size_recommendation(height, weight, gender, preferences)
      
      # Check if we got an error response
      if response.include?("I'm having trouble") || response.include?("Please try again")
        # Use fallback instead
        return FallbackResponseService.size_recommendation(height, weight, gender)
      end
      
      response 
    elsif message.include?('color') || message.match?(/tone|palette|match/)
      # Get user's undertone
      undertone = current_user.undertone || 'neutral'
      
      # Check if occasion is mentioned
      occasion = nil
      occasion = $1 if message =~ /(?:for|at)\s+(?:a|an)?\s+([a-zA-Z\s]+event)/
      occasion = 'wedding' if message.include?('wedding')
      occasion = 'casual' if message.include?('casual') || message.include?('everyday')
      occasion = 'formal' if message.include?('formal') || message.include?('business')
      
      response = OpenaiService.new.generate_color_advice(undertone, occasion)
      
      # Check if we got an error response
      if response.include?("I'm having trouble") || response.include?("Please try again")
        # Use fallback instead
        return FallbackResponseService.color_advice(undertone, occasion)
      end
      
      response
    else
      # General fashion advice response
      FallbackResponseService.general_advice
    end
  rescue => e
    Rails.logger.error("Error processing message: #{e.message}")
    "I'm experiencing some technical difficulties right now. Please try again later."
  end
end
end