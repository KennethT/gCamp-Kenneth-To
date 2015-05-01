class WelcomeController < ApplicationController
  def index
    @quotes = Hash.new
    @quotes["Tasky is the greatest task management tool ever"] = "Ty H."
    @quotes["I love tasky"] = "Alexandra H."
  end
end
