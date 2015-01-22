class FaqController < ApplicationController

def faq
  one = CommonQuestions.new

  one.question = "What is gCamp?"
  one.answer = "gCamp is an awesome tool that is going to change your life. gCamp is your one stop shop to organize all your tasks. You'll also be able to track comments that you and others make. gCamp may eventually replace all need for paper and pens in the entire world. Well, maybe not, but it's going to be pretty cool."
  one.slug = "what-is-gcamp"

  two = CommonQuestions.new

  two.question = "How do I join gCamp?"
  two.answer = "As soon as it's ready for the public, you'll see a signup link in the upper right. Once that's there, just click it and fill in the form!"
  two.slug = "how-do-i-join-gcamp"

  three = CommonQuestions.new

  three.question = "When will gCamp be finished?"
  three.answer = "gCamp is a work in progress. That being said, it should be fully functional in the next few weeks. Functional. Check in daily for new features and awesome functionality. It's going to blow your mind. Organization is just a click away. Amazing!"
  three.slug = "when-will-gcamp-be-finished"

  @q_and_a = [one, two, three]



end

end
