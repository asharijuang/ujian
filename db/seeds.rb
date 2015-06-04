Exam.delete_all
5.times do
	Exam.create!({name: Faker::Hacker.adjective})
end

Question.delete_all
20.times do
	Question.create!({question: Faker::Hacker.say_something_smart})
end