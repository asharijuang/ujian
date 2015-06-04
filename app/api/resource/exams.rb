module Resource
	class Exams < Grape::API
		resource :exams do
			desc "Get all exams"
		    get do
		    	raw = Array.new
	      		Exam.all.each do |p|
		      		data = Hashie::Mash.new
		      		data.name  = p.name
		      		data.total_questions
		      		raw << data
	      		end
		      	results(data: {exams: raw})
			end
		end
	end
end