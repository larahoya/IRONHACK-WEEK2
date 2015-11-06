require 'RSpec'

#Esta clase tendria dependencia de terceros=> Fake
class EmailProviderFake

  def initialize(subjects)
    @subjects = subjects
  end

  def get_subjects
    @subjects
  end

end

#Este es el metodo que estamos probando
class WordCounter

  def initialize(subject_provider)
    @subject_provider = subject_provider
  end

  def check(words)
    result = true
    subjects = @subject_provider.get_subjects
    words.each do |word|
      word_result = subjects.find {|sub| sub.include?(word)}
      word_result == nil ? result= false : result=true
    end
    result
  end

end