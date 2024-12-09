class PagesController < ApplicationController

  def homepage
    @surveys = Survey.includes(:items) # Surveyと関連付けられたItemを取得
  end

  def new
    @survey=Survey.new
    3.times {@survey.items.build}
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to survey_path(@survey), notice: 'アンケートが作成されました。'
    else
      render :new, alert: 'アンケートの作成に失敗しました。'
    end
  end

  def show
    @survey = Survey.find(params[:id])
    @items = @survey.items
  end

  private

  def survey_params
    params.require(:survey).permit(:title, items_attributes: [:item_name])
  end

  
end
