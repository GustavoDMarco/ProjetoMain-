class UploadsController < ApplicationController
    def create
        uploaded_file = params[:file]
        file_path = uploaded_file.path

        TxtUploadWorker.perform_async(file_path)

    
        redirect_to root_path, notice: 'Upload processado com sucesso.'
    end
end