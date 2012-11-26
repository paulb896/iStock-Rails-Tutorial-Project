class CommentsController < ApplicationController
	def create
		article_id = params[:comment].delete(:article_id)

		@comment = Comment.new(params[:comment])
		@comment.article_id = article_id

		@comment.save

		redirect_to article_path(@comment.article)
	end

  def destroy
    @comment = Comment.find(params[:id])
    if logged_in? && current_user.admin
      @comment.destroy
    else
      flash[:notice] = 'Only admins can delete comments'
    end

    respond_to do |format|
      format.html { redirect_to article_path(@comment.article) }
      format.json { head :no_content }
    end
  end
end
