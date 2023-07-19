class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to jobs_path, notice: 'Job added successfully!'
    else
      flash[:alert] = "Can't add Job. Refer to console for further information"
      puts @job.errors.full_messages
      redirect_to new_job_path
    end
  end

  def delete
    @job = Job.find(params[:id])
    # Check if the current user is authorized to delete the advertisement
    if current_user && @job.user == current_user
      @job.destroy
      redirect_to jobs_path, notice: "Job deleted successfully!"
    else
      redirect_to jobs_path, alert: "You are not authorized to delete this Job."
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path, notice: "Job updated successfully!"
    else
      render :edit
    end
  end

  def show
    @job = Job.find(params[:id])
    if !current_user || @job.user_id != current_user.id
      @job.increment!(:view_count)
    end
  end

  private

  def job_params
    params.require(:job).permit(:companyName, :jobType, :location, :remoteOK, :phoneNumber, :url)
  end
end
