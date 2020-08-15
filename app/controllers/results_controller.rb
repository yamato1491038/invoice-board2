class ResultsController < ApplicationController
  

  def index
  end

  def new
    @result = Result.new
    @results = Result.where(user_id: current_user.id)
    @works = Work.all
  end

  def create
    @result = Result.new(result_params)
    if params[:result][:qty] == ""
      redirect_to new_result_path,alert: "数の入力がありません"
    elsif @result.save
      render :create
    else
      redirect_to new_result_path,alert: "契約の入力がありません"
    end
  end

  def show
    if current_user.admin?
      @result = Result.all
    else
      redirect_to root_path, alert: "確認の権限がありません"
    end
  end

  def search
    @results = Result.search(params)
    amounts = 0
    @results.each do |result|
      amounts += result.work.price * result.qty
    end
    @bill = amounts
  end

  def destroy
    result = Result.find(params[:id])
    result.destroy
    redirect_to root_path, notice: "契約を削除しました"
  end

  private

  def result_params
    params.require(:result).permit(:work_id,:qty).merge(user_id: current_user.id)
  end

end
