json.array!(@todos) do |todo|
  json.extract! todo, :id, :item, :completed, :user_id
  json.url todo_url(todo, format: :json)
end
