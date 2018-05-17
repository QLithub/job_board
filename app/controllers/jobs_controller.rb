class JobsController < ApplicationController
  before_action :set_job, only: [:edit, :update, :destroy]

  def index
    @jobs = Job.page(params[:page])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    # @job.title = params[:job][:title]
    # @job.description = params[:job][:description]

    if @job.save
      redirect_to jobs_path
    else
      # debugger
      flash.now[:notice] = "There's problems with your new job form"
      render 'new'
    end
    # debugger # this is a breakpoint, the server will stop when it hits this, and let us debug
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render 'edit'
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private
    def job_params
      params.require(:job).permit(:title, :description)
    end

    def set_job
      @job = Job.find(params[:id])
    end
end
