class WorksController < ApplicationController

  def new
    if current_user.admin?
      @work = Work.new
      @works = Work.all
    else
      redirect_to root_path, alert: "業務登録の権限がありません"
    end
  end

  def create
    @work = Work.new(work_params)
    if params[:work][:price] == ""
      redirect_to new_work_path,alert: "金額の入力がありません"
    elsif params[:work][:name] == ""
      redirect_to new_work_path,alert: "契約の入力がありません"
    else
      @work.save
    end
  end

  #def destroy
  #  work = Work.find(params[:id])
  #  work.destroy
  #  redirect_to root_path, notice: "削除しました"
  #end

  private
  def work_params
    params.require(:work).permit(:name, :price)
  end

end
