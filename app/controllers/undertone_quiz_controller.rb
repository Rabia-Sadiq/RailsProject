class UndertoneQuizController < ApplicationController
  before_action :authenticate_user!

  QUESTIONS = [
    {
      question: "What color are the veins on your wrist in natural light?",
      options: ["Blue or purple", "Green or olive", "Hard to tell / a mix of both", "I don’t know"]
    },
    {
      question: "How does your skin react to sun exposure?",
      options: ["Burns quickly, rarely tans", "Tans easily, rarely burns", "Sometimes burns, sometimes tans", "Not sure"]
    },
    {
      question: "Which jewelry looks better on you?",
      options: ["Silver", "Gold", "Both look good", "I don't wear jewelry"]
    },
    {
      question: "What colors make you look more vibrant?",
      options: ["Cool colors", "Warm colors", "Both suit me well", "Not sure"]
    },
    {
      question: "What is the natural color of your eyes?",
      options: ["Blue, grey, or green", "Brown, amber, or hazel with golden flecks", "A mix or hard to tell", "Other"]
    },
    {
      question: "What is your natural hair color?",
      options: ["Ashy tones", "Warm tones", "Neutral or hard to tell", "Other"]
    },
    {
      question: "Which type of white looks better on you?",
      options: ["Pure white", "Cream or off-white", "Both look okay", "Not sure"]
    }
  ]

  def show
    session[:quiz_index] ||= 0
    session[:answers] ||= []
    @current_index = session[:quiz_index]
    @question = QUESTIONS[@current_index]
  end

  def answer
    session[:answers] << params[:option]
    session[:quiz_index] += 1

    if session[:quiz_index] >= QUESTIONS.length
      # Analyze answers and set undertone
      undertone = analyze_undertone(session[:answers])
      current_user.update(undertone: undertone)

      # Reset quiz session data
      session[:quiz_index] = nil
      session[:answers] = nil

      redirect_to palette_path, notice: "Quiz complete! Your undertone is #{undertone.capitalize}."
    else
      redirect_to undertone_quiz_path
    end
  end

  private

  def analyze_undertone(answers)
    cool = 0
    warm = 0

    answers.each do |ans|
      ans = ans.downcase
      if ans.include?("blue") || ans.include?("silver") || ans.include?("burns") || ans.include?("cool")
        cool += 1
      elsif ans.include?("green") || ans.include?("gold") || ans.include?("tans") || ans.include?("warm")
        warm += 1
      end
    end

    return "cool" if cool > warm
    return "warm" if warm > cool
    "neutral"
  end
end
