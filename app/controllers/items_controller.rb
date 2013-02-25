class ItemsController < ApplicationController

	before_filter :find_item,      only: [:show, :edit, :update, :destroy, :upvote]
	before_filter :check_if_admin, only: [:new, :create, :edit, :update, :destroy]

	def index
		@items = Item.all
	end

	# /items/{id}		GET
	def show
		unless @item
			render "public/404.html"
		end
	end

	# /items/new 		GET
	def new
		@item = Item.new
	end

	# /items  			POST
	def create
		@item = Item.create(params[:item])
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render "new"
		end
	end

	# /items/{id}/edit  GET
	def edit
	end

	# /items/{id}		PUT
	def update
		@item.update_attributes(params[:item])
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render "edit"
		end
	end

	# /items/{id}		DELETE
	def destroy
		@item.destroy
		redirect_to action: "index"
	end


	def upvote
		@item.increment!(:votes_count)
		redirect_to action: "index"
	end


	private

		def find_item
			@item = Item.where(id: params[:id]).first
			render_404 unless @item
		end

end
