# frozen_string_literal: false

# Identify words within a phrase
class SubStrings
  def substrings(string = 'hello', dictionary = %w[words])
    string = string.split(/\W/).select { |e| e.match(/\w/) }
    results = {}

    dictionary.each do |e|
      reg_exp = Regexp.new(".*#{e}.*", /i/)

      string.each do |w|
        results[e] ||= 0
        results[e] += 1 if w.match?(reg_exp)
      end
    end
    results.select { |_k, v| v.positive? }
  end
end
