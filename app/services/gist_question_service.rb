class GistQuestionService

  attr_accessor :gist

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(
        access_token: "#{ENV['GITHUB_TOKEN']}",
        api_endpoint: "https://api.github.com"
    )
  end

  def call
    @gist = @client.create_gist(gist_params)
    @client.last_response.status
  end

  private

  def gist_params
    {
        description: t('services.gist_question.description', title: @test.title),
        files: {
            'test-guru-question.text' => {
                content: gist_content
            }
        }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
