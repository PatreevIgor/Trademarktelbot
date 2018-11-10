# frozen_string_literal: true

class MainController < ApplicationController
  def index
    task_executer.find_new_cheap_items
  end

  private

  def information_provider
    @information_provider ||= InformationProvider.new
  end

  def task_executer
    @task_executer ||= TaskExecuter.new
  end
end
