json.tasks @tasks do |task|
    json.extract! task, :id, :title, :complete
end    
json.list do 
    json.list_id @list.id
    json.list_title @list.title
end
