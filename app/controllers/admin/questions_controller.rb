class Admin::QuestionsController < Admin::BaseController

  before_action :find_test, only: [:index, :create, :new]
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @questions = @test.questions
  end

  def show
  end

  def new
    @question = Question.new
    @path = [@test, @question]
  end

  def edit
    @test = Test.find(@question.test_id)
    @path = @question
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path
    else
      render :edit
    end
  end

  def destroy
    @test = Test.find(@question.test_id)
    @question.destroy
    redirect_to admin_test_path(@test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found', :status => 404

  end

end
