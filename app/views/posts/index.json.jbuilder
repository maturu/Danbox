if @new_post.present?
  json.array! @new_post
end

if @new_comment.present?
  json.set! :comment do
    json.array! @new_comment
  end

  json.set! :user do
    json.array! @comment_user
  end
end
