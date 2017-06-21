u = User.create!(
  email: 'user@example.com', 
  nickname: 'UOne', 
  name: 'User One', 
  password: "12345678")
5.times do |n|
  title = Faker::Date.between(6.days.ago, Date.today)
  l = u.lists.create!(
    title: title
  )
  5.times do |m|
    title = Faker::Name.name
    complete = Faker::Boolean.boolean(0.3)
    l.tasks.create!(
        title: title,
        complete: complete    
        )
  end  
end

