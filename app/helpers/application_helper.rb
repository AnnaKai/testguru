module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "#{author}".capitalize, "https://github.com/#{author}/#{repo}"
  end
end
