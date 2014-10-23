desc "Deletes items form the db"
task delete_items: :environment do
  Todo.where("created_at <= ?", Time.now - 7.days).destroy_all
end