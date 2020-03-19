module ApplicationHelper
  def created_date(model)
    model.created_at.strftime('%b %d, %Y')
  end

  def time_elapsed(model)
    "#{time_ago_in_words(model.created_at)} ago"
  end
end
