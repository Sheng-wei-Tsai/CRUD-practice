class CandidatesController < ApplicationController
  # layout "backend"
  before_action :find_candidate, only: [:edit, :update, :vote, :destroy]
  def index
    @candidates = Candidate.all
    # render layout: "backend"
  end

  def new
    @candidate = Candidate.new
    # render layout: "backend"
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      redirect_to candidates_path, notice: "成功新增候選人!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @candidate.update(candidate_params)
      redirect_to candidates_path , notice: "資料更新成功!"
    else
      render :edit
    end
  end

  def vote
    @candidate.vote_logs.create(ip_address: request.remote_ip) if @candidate
    redirect_to candidates_path, notice: "完成投票!"
  end


  def destroy
    @candidate.destroy if @candidate 
    redirect_to candidates_path, notice: "刪除成功!!"
  end


  private 
  def candidate_params
    params.require(:candidate).permit(:name, :age, :party, :politics)
  end

  def find_candidate
    @candidate = Candidate.find(params[:id])
  end

end
