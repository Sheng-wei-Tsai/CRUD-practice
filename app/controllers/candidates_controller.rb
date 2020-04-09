class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
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
    @candidate = Candidate.find(params[:id])
  end

  def update
    @candidate = Candidate.find(params[:id])
    if @candidate.update(candidate_params)
      redirect_to candidates_path , notice: "資料更新成功!"
    else
      render :edit
    end
  end

  def vote
    @candidate = Candidate.find(params[:id])
    @candidate.increment(:votes)
    @candidate.save
    redirect_to candidates_path, notice: "完成投票!"
  end


  def destroy
    @candiate = Candidate.find(params[:id])
    @candiate.destroy if @candiate 
    redirect_to candidates_path, notice: "刪除成功!!"
  end

  private 
  def candidate_params
    params.require(:candidate).permit(:name, :age, :party, :politics)
  end
end
