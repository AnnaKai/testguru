class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test_passage, only: [:show, :update, :result, :gist]

  def show
  end

  def result
  end

  def gist
    @obj = GistQuestionService.new(@test_passage.current_question)
    @obj.call

    flash_options = if @obj.success?
                      { notice: t('.success', link: @obj.gist.html_url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options

  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.complete?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
