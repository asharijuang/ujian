# /app/controllers/api/v1/question.rb
module Resource
	class Questions < Grape::API 
		resource :questions do 
			desc 'get all questions'
            # GET /api/v1/questions
            get do
		    	raw = Array.new
	      		Question.all.each do |p|
		      		data = Hashie::Mash.new
		      		data.question  = p.question
		      		raw << data
	      		end
		      	results(data: {questions: raw})
			end

			desc 'Create an question'
			params do
				requires :question, type: String, desc: "Your status."
			end 
			# POST /api/v1/questions?question=hello
			post do
				Question.create!({question: params[:question]})
			end

			desc 'Delete questions'
			params do 
				requires :id, type: String, desc: "Questions id"
			end
			# DELETE /api/v1/questions?id=1
			delete do
				Question.find(params[:id]).destroy!
			end

			desc 'Update questions'
			params do
				requires :id, type: Integer, desc: "Questions id"
				requires :question, type: String, desc: "Your status."
			end
			# PUT /api/v1/questions?id=1&question=hello
			put do
				Question.find(params[:id]).update({
					question:params[:question]
					})
			end
		end
	end
end