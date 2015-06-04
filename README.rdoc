## About this projects

Web applikasi untuk membuat sebuah soal ujian online Backend dikembangkan menggunakan rubyonrails dan api menggunakan grape(rubygems) 
Simple RESTful API for Computer Assisted Test

## API Versioning

Setiap versi api umumnya akan diakses dengan cara seperti ini:

- /api/v1/questions
- /api/v2/questions


## Set gem Gemfile

Add gem to Gemfile

``` 
gem 'grape' 
```
Then run Bundle 

``` 
$bundle 
```

## Create API
Created by subclassing Grape::API

```
 $mkdir /api
 $touch /api/api.rb 
```


```
class API < Grape::API
	prefix 'api'
  	version 'v1', using: :path
  	format :json

  	# module and class
  	mount Resource::Questions
  	mount Resource::Exams
end
```


Create Api Controller

```
$mkdir /api/resource
$touch /api/resource/question.rb 
```

And then add this code

```
# /app/controllers/api/v1/question.rb
module Resource
	class Questions < Grape::API 
		resource :questions do 
			desc 'get all questions'
			# GET /api/v1/questions
			get do
				Question.all
			end
		end
	end
end
```
Set route.rb and add mount

```
# /config/route.rb
Rails.application.routes.draw do
  mount API => '/' 
end
```
Rails tahu adanya API folder, kita perlu menambahkan beberapa kode pada /config/application.rb

Rails expects a subdirectory that matches the name of the Ruby module and a file name that matches the name of the class.

```
config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]
```

Sekarang kita bisa akses pada browser atau menggunakan postman 
`http://localhost:3000/api/v1/questions`

akan tampil seperti berikut. 

```
[
	{
		id: 1,
		question: "This is a new questions",
		created_at: "2015-06-03T14:21:20.592Z",
		updated_at: "2015-06-03T14:21:20.592Z"
	}
]
```

## Response type
Ada beberapa response format standar yang biasa digunakan, salah satunya adalah jsend.

GET /api/v1/questions

```
{
    status : "success",
    data : {
        "questions" : [
            { "id" : 1, "question" : "What's is your name?" },
            { "id" : 2, "question" : "How old?"},
        ]
     }
}
```
GET /api/v1/questions

```
{
    "status" : "error",
    "message" : "Unable to communicate with database"
}
```

## Create a response layout


Add hashie on Gemfile

```
# Gemfile
gem 'hashie'
```
Add helper on api.rb  

```
# /api/api.rb
helpers do 
    def results params
      result  = Hashie::Mash.new
      result.status = "success"
      result.data = params[:data]
      result.message = params[:message].nil? || params[:message].blank ? "Congratulation" : params[:message]
	  result
    end
end
```


## Referense

1. Versioning Api
2. RESTful
3. [Jsend](http://labs.omniti.com/labs/jsend) Layouts


