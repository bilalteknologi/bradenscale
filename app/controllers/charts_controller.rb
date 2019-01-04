class ChartsController < ApplicationController

  def index

  end

  def decisions_chart_by_day
    if (params[:start_at].nil? || params[:end_at])
      @transaction = Transaction.left_outer_joins(:decision).group(:title).group_by_day(:created_at, last: 7).count.chart_json
    else
      start_at = params[:start_at].to_date
      end_at = params[:end_at].to_date

      @transaction = Transaction.left_outer_joins(:decision).group(:title).group_by_day(:created_at, last: 7, range: start_at..end_at).count.chart_json
    end
    puts '===='

    puts @transaction
    
    render json: @transaction


  end
  
  def decisions_chart_by_month
    if (params[:start_at].nil? || params[:end_at])
      @transaction = Transaction.left_outer_joins(:decision).group(:title).group_by_month(:created_at).count.chart_json
    else
      start_at = params[:start_at].to_date
      end_at = params[:end_at].to_date

      @transaction = Transaction.left_outer_joins(:decision).group(:title).group_by_month(:created_at, range: start_at..end_at).count.chart_json
    end
    render json: @transaction
  end
end
