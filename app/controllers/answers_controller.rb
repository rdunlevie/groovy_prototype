class AnswersController < ApplicationController

  before_filter :get_answer, only: [:edit, :update, :destroy]
  
  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]
    @answer.user = current_user
    if @answer.save
      redirect_to question_path(params[:question_id])
    else
      redirect_to question_path(params[:question_id])
    end
  end
  
  def update
    if @answer.update_attributes(answer_params)
      redirect_to question_path(@answer.question.id)
    else
      redirect_to question_path(@answer.question.id)
    end
  end
  
  def destroy
    question_id = @answer.question.id
    @answer.destroy!
    redirect_to question_path(question_id)
  end
  
  private
  
    def answer_params
      params.require(:answer).permit(:content)
    end
  
end
