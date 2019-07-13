class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @tet = @question.test
    @client = client || GitHubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
        description: "A question about #{@test.title} from Test Guru",
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
