class ExpensesController < ApplicationController
  def index

  	concept = params[:concept]
    category = params[:category_id]

  	if !concept.blank? and !category.blank? 
      concept = concept.downcase
  		@expenses = Expense.where('concept LIKE ? AND category_id=?', '%'+concept+'%', category)

  	elsif !concept.blank? and category.blank?
      concept = concept.downcase 
  		@expenses = Expense.where('concept LIKE ?', '%'+concept+'%')

    elsif concept.blank? and !category.blank?
      @expenses = Expense.where(category: category)

    else
      @expenses = Expense.order("date DESC")
  		
  	end

  	#concept = params[:concept].downcase
  	#category = params[:category_id].downcase

    #@expenses = Expense.order("date DESC")
     
     #@expenses = Expense.where(nil)

     
     #@expenses = @expenses.category(params[:category_id]) if params[:category_id].present?
     #@expenses = @expenses.concept(params[:concept]) if params[:concept].present?


  end

end
