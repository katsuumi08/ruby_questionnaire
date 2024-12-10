class PagesController < ApplicationController

  def homepage
    @surveys = Survey.includes(:items) # Surveyと関連付けられたItemを取得
  end

  def result_homepage
    @surveys = Survey.includes(:items) # 結果表示用にSurveyとItemを取得          # アンケートに関連する項目を取得
  end

  def new
    @survey=Survey.new
    3.times {@survey.items.build}
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to root_path, notice: 'アンケートが作成されました。'
    else
      render :new, alert: 'アンケートの作成に失敗しました。'
    end
  end

  def show
    @survey = Survey.find(params[:id])
    @items = @survey.items
  end 

  def result
    @survey = Survey.find(params[:id])
    @items = @survey.items
  end


  def vote
    item = Item.find(params[:item_id]) 
    item.increment!(:votes)          
    redirect_to root_path, notice: "投票が完了しました！"
  end

  private

  def survey_params
    params.require(:survey).permit(:title, items_attributes: [:item_name])
  end

  
end
