class Admin::TestsController < Admin::BaseController

  before_action :find_tests, only: [:index, :update_inline]
  before_action :find_test, only: [:show, :edit, :update, :destroy, :update_inline]

  def index
  end

  def show
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = Test.create(test_params)
    @test.author = current_user

    if @test.save
      redirect_to admin_tests_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def find_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

end
