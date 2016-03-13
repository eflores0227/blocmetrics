class RegisteredApplicationsController < ApplicationController

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new(registered_application_params)

    respond_to do |format|
      if @registered_application.save
        format.html { redirect_to @registered_application, notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @registered_application}
      else
        format.html { render :new }
        format.json { render json: @registered_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.all
  end

  def update
  respond_to do |format|
    if @registered_application.update(recipe_params)
      format.html { redirect_to @registered_application, notice: 'Application was successfully updated.' }
      format.json { render :show, status: :ok, location: @recipe }
    else
      format.html { render :edit }
      format.json { render json: @registered_application.errors, status: :unprocessable_entity }
    end
  end
end

  def destroy
    @registered_application.destroy
  end

  private
    def registered_application_params
      params.require(:registered_application).permit(:name, :url)
    end

    def registered_application_params
        params.require(:registered_application).permit(:name, :url)
      end
end
