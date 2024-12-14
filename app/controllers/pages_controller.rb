class PagesController < ApplicationController

  def homepage
    @surveys = Survey.includes(:items) # Surveyと関連付けられたItemを取得
  end

  def result_homepage
    @surveys = Survey.includes(:items) # 結果表示用にSurveyとItemを取得          # アンケートに関連する項目を取得
  end

  def new
    @survey=Survey.new
    4.times {@survey.items.build}
  end

  def createPage
    @survey=Survey.new
    @count = params["item_count"].to_i
    @count = 4 if @count.zero?
    @count.times {@survey.items.build}
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
    @free_texts = @survey.free_texts
    @min_item_id = @items.minimum(:id)
  end


  def vote
    @survey = Survey.find(params[:survey_id]) 
    item = Item.find(params[:item_id]) 
    item.increment!(:votes) 

    if params[:free_text_content].present?
      FreeText.create!(
        survey_id: @survey.id,
        content: params[:free_text_content],
        item_id: params[:item_id]
      )
    end
         
    redirect_to root_path, notice: "投票が完了しました！"
  end

  private

  def survey_params
    params.require(:survey).permit(
      :title, 
      :free_text_title,
      items_attributes: [:item_name])  
  end
  

def vote_params
  params.permit(
    :item_id, 
    :free_text_content)
end

end
