class Mypage::NotesController < Mypage::ApplicationController
  def index
    @notes = current_user.notes.page(params[:page])
  end

  def new
    @note = current_user.notes.build
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to mypage_notes_path, notice: '記事を作成しました'
    else
      render :new
    end
  end

  def edit
    @note = current_user.notes.find(params[:id])
  end

  def update
    @note = current_user.notes.find(params[:id])
    if @note.update(note_params)
      redirect_to mypage_notes_path, notice: '記事を上書きしました'
    else
      render :edit
    end
  end

  def destroy
    note = current_user.notes.find(params[:id])
    note.destroy
    redirect_to mypage_notes_path, notice: '記事を削除しました'
  end

  private def note_params
    params.require(:note).permit(:title, :content)
  end
end
