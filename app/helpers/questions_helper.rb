module QuestionsHelper
  def question_header(q)
    q.new_record? ? "Create a new #{q.body} question" :  "Edit #{q.body} question"
  end
end
