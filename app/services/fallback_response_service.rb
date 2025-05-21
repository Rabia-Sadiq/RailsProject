class FallbackResponseService
  def self.color_advice(undertone, occasion = nil)
    case undertone.to_s.downcase
    when 'warm'
      "For your warm undertone, I recommend these flattering colors:\n\n" +
      "• Earthy tones like terracotta and olive green\n" +
      "• Warm reds and oranges\n" +
      "• Golden yellows\n" +
      "• Rich browns and camel tones\n\n" +
      (occasion ? "For #{occasion} events, consider #{occasion_specific_colors(undertone, occasion)}" : "")
    when 'cool'
      "With your cool undertone, these colors will enhance your natural complexion:\n\n" +
      "• Blue-reds like raspberry and burgundy\n" +
      "• Emerald and forest greens\n" +
      "• True blues and deep purples\n" +
      "• Silver and cool grays\n\n" +
      (occasion ? "For #{occasion} events, consider #{occasion_specific_colors(undertone, occasion)}" : "")
    else # neutral or unknown
      "Having a neutral undertone gives you versatility! These colors will look great on you:\n\n" +
      "• Teal and navy blue\n" +
      "• Medium purples and lavender\n" +
      "• Soft reds and corals\n" +
      "• Neutral greens like sage\n\n" +
      (occasion ? "For #{occasion} events, consider #{occasion_specific_colors(undertone, occasion)}" : "")
    end
  end
  
  def self.occasion_specific_colors(undertone, occasion)
    case occasion.to_s.downcase
    when 'wedding'
      if undertone == 'warm'
        "champagne, soft coral, or a rich gold accessorized with earth-toned jewelry."
      elsif undertone == 'cool'
        "lavender, dusty blue, or silver with platinum or white gold accessories."
      else
        "teal, soft mauve, or navy blue which work wonderfully for formal events."
      end
    when 'casual'
      if undertone == 'warm'
        "rust, mustard yellow, or olive green for everyday wear."
      elsif undertone == 'cool'
        "periwinkle blue, lavender, or cool mint for a fresh everyday look."
      else
        "medium blues, soft greens, or muted purples for versatile everyday style."
      end
    when 'formal', 'business'
      if undertone == 'warm'
        "chocolate brown, deep olive, or rich camel for a professional appearance."
      elsif undertone == 'cool'
        "navy blue, burgundy, or charcoal gray for a sharp, professional look."
      else
        "navy, medium gray, or forest green for a polished business appearance."
      end
    else
      "colors that align with both the occasion and your undertone."
    end
  end
   def self.size_recommendation(height, weight, gender)
    "Based on general sizing guidelines for #{gender || 'individuals'} with height around #{height}cm and weight around #{weight}kg:\n\n" +
    "- You likely wear a medium (M) in most brands\n" +
    "- For bottoms, likely size 8-10 (US) or 38-40 (EU)\n" +
    "- For tops, likely a medium (M)\n\n" +
    "This is a general estimate. I'm currently using pre-programmed guidelines as my AI service is unavailable."
  end
  
  def self.general_advice
    "I can help with size recommendations and color advice based on your body measurements and undertone.\n\n" +
    "Try asking me questions like:\n" +
    "- What colors work with my warm undertone?\n" +
    "- What size should I wear for a dress if I'm 165cm and 60kg?\n\n" +
    "I'm currently using pre-programmed responses as my AI service is temporarily unavailable."
  end
  # Other methods remain the same...
end