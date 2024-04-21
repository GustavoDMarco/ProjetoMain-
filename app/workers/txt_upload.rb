class TxtUploadWorker
    include Sidekiq::Worker
   
    def perform(file_path)
        File.open(file_path, 'r') do |file|
            file.each_line do |line|
              title, content = line.strip.split(',', 2)
              Post.create(title: title, content: content)
            end
         end
    end
   end