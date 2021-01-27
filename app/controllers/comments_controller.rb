class CommentsController < ApplicationController
  before_action :set_note
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = current_user.comments.build(note: @note)
  end

  def create
    @comment = current_user.comments.build(note: @note)
    @comment.attributes = comment_params
    if @comment.save
      redirect_to note_path(@note), notice: 'コメントを作成しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to note_path(@note), notice: 'コメントを編集しました'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to note_path(@note), notice: 'コメントを削除しました'
  end

  private def set_note
    @note = Note.find(params[:note_id])
  end

  private def set_comment
    @comment = current_user.comments.find(params[:id])
  end

  private def comment_params
    params.require(:comment).permit(:content)
  end
end
