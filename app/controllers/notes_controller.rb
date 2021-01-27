class NotesController < ApplicationController
  def index
    @notes = Note.all.page(params[:page])
  end

  def show
    @note = Note.find(params[:id])
  end
end
