class SpicesController < ApplicationController

    # rescue
rescue_from ActiveRecord::RecordNotFound, with: :response_not_found
    # GET /spices
    def index
        spices = Spice.all
        render json: spices
    end

    # POST /spices
    def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
    end

    # UPDATE /spices/:id
    def update
     spice = find_spice
     spice.update(spice_params)
     render json: spice
    end

    # DESTROY /spices/:id
    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end

    # private strong params
    private
    # find
    def find_spice
        Spice.find(params[:id])
    end
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
    def response_not_found
        render json: {error: "Spice not found"}, status: :not_found
    end
end
