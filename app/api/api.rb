class API < Grape::API
    prefix 'api'
    version 'v1', using: :path
    format :json

    helpers do 
    def results params
	      result  = Hashie::Mash.new
	      result.status = "success"
	      result.data = params[:data]
	      result.message = params[:message].nil? || params[:message].blank ? "Congratulation" : params[:message]
	      result
	    end
	end

    # module and class
    mount Resource::Questions
    mount Resource::Exams
end