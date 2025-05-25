class UndertoneQuizController < ApplicationController
  before_action :authenticate_user!

  QUESTIONS = [
    {
      question: "What color are the veins on your wrist in natural light?",
      options: ["Blue or purple", "Green or olive", "Hard to tell / a mix of both", "I don't know"]
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
    question_number = params[:question_number].to_i
    session["q#{question_number}"] = params["q#{question_number}"]

    # Update quiz index (assuming you track it in session)
    session[:quiz_index] ||= 0
    session[:quiz_index] = question_number

    if session[:quiz_index] >= QUESTIONS.length
      # Analyze answers and set undertone
      # Collect all answers from session keys like "q1", "q2", ...
      answers = QUESTIONS.map.with_index(1) { |_, i| session["q#{i}"] }
      undertone = analyze_undertone(answers)
      current_user.update(undertone: undertone)

      # Reset quiz session data
      session[:quiz_index] = nil
      QUESTIONS.length.times { |i| session.delete("q#{i + 1}") }

      redirect_to palette_path, notice: "Quiz complete! Your undertone is #{undertone.capitalize}."
    else
      next_question_number = question_number + 1
      redirect_to "/undertone_quiz/q#{next_question_number}"
    end
  end

  private

  def analyze_undertone(answers)
    # Initialize counters for different undertones
    cool_score = 0
    warm_score = 0
    neutral_score = 0
    
    answers.each_with_index do |answer, index|
      next if answer.nil? || answer.empty?
      
      case index + 1 # Question number (1-7)
      when 1 # Vein color question
        case answer
        when "Blue or purple"
          cool_score += 2
        when "Green or olive"
          warm_score += 2
        when "Hard to tell / a mix of both"
          neutral_score += 2
        when "I don't know"
          neutral_score += 1
        end
        
      when 2 # Sun reaction question
        case answer
        when "Burns quickly, rarely tans"
          cool_score += 2
        when "Tans easily, rarely burns"
          warm_score += 2
        when "Sometimes burns, sometimes tans"
          neutral_score += 2
        when "Not sure"
          neutral_score += 1
        end
        
      when 3 # Jewelry question
        case answer
        when "Silver"
          cool_score += 2
        when "Gold"
          warm_score += 2
        when "Both look good"
          neutral_score += 2
        when "I don't wear jewelry"
          neutral_score += 1
        end
        
      when 4 # Color preference question
        case answer
        when "Cool colors"
          cool_score += 2
        when "Warm colors"
          warm_score += 2
        when "Both suit me well"
          neutral_score += 2
        when "Not sure"
          neutral_score += 1
        end
        
      when 5 # Eye color question
        case answer
        when "Blue, grey, or green"
          cool_score += 2
        when "Brown, amber, or hazel with golden flecks"
          warm_score += 2
        when "A mix or hard to tell"
          neutral_score += 2
        when "Other"
          neutral_score += 1
        end
        
      when 6 # Hair color question
        case answer
        when "Ashy tones"
          cool_score += 2
        when "Warm tones"
          warm_score += 2
        when "Neutral or hard to tell"
          neutral_score += 2
        when "Other"
          neutral_score += 1
        end
        
      when 7 # White clothing question
        case answer
        when "Pure white"
          cool_score += 2
        when "Cream or off-white"
          warm_score += 2
        when "Both look okay"
          neutral_score += 2
        when "Not sure"
          neutral_score += 1
        end
      end
    end
    
    # Determine the dominant undertone based on scores
    if warm_score > cool_score && warm_score > neutral_score
      'warm'
    elsif cool_score > warm_score && cool_score > neutral_score
      'cool'
    else
      # If neutral wins or there's a tie, return neutral
      'neutral'
    end
  end
end