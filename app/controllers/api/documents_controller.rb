class Api::DocumentsController < Api::BaseController
  def index
    @documents = Document.get_all(current_user)
  end
end
