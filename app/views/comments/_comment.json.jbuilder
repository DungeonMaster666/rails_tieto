json.extract! comment, :id, :plot_id, :user_id, :comment_text, :created_at, :updated_at
json.url comment_url(comment, format: :json)
