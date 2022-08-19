class BugsController < ApplicationController
  before_action :set_bug, only: %i[ show edit update destroy ]

  # GET /bugs or /bugs.json
  def index




    @bugs = policy_scope(Bug.all)
    authorize Bug

  end


  def show
    authorize Bug

  end


  def new
    @bug = Bug.new
    authorize Bug

  end


  def edit
    authorize @bug

  end


  def create
    authorize Bug

    @bug = Bug.new(bug_params)

    respond_to do |format|
      @bug.status = 'notsolved'
      if @bug.save
        format.html { redirect_to bug_url(@bug), notice: "Bug was successfully created." }
        format.json { render :show, status: :created, location: @bug }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    authorize @bug

    respond_to do |format|
      if @bug.update(bug_params)
        format.html { redirect_to bug_url(@bug), notice: "Bug was successfully updated." }
        format.json { render :show, status: :ok, location: @bug }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    authorize Bug

    @bug.destroy

    respond_to do |format|
      format.html { redirect_to bugs_url, notice: "Bug was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_bug
      @bug = Bug.find(params[:id])
    end

    def bug_params
      params.require(:bug).permit(:title, :description, :status, :image)
    end
end
