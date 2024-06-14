namespace :example_task do 
	desc 'Greeting Message Task'

	task greet: :environment do 
		puts "Scretch rake task is running"
	end

	task bye_greet: :environment do 
		puts "We can define N number of rake task in same file"
	end
end