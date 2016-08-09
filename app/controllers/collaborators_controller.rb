class CollaboratorsController < ApplicationController

  def create

    @wiki = Wiki.find(params[:wiki_id])
    @user = User.where(username: params[:username]).take

    if @user == nil
      flash[:error] = "Collaborator could not be found."
      redirect_to wiki_path(@wiki)
    elsif @wiki.users.include?(@user)
      flash[:error] = "Collaborator already exists."
      redirect_to wiki_path(@wiki)
    else
      collaborator = @wiki.collaborators.build(user_id: @user.id)

      if collaborator.save
        flash[:notice] = "Your collaborator has been added to the wiki."
        redirect_to wiki_path(@wiki)
      else
        flash[:error] = "Collaborator could not be added. Check spelling!"
        redirect_to wiki_path(@wiki)
      end
    end
  end

  def destroy

    @collaborator = Collaborator.find(params[:id])
    @wiki = @collaborator.wiki

    if @collaborator.destroy
      flash[:notice] = "Collaborator removed from wiki."
      redirect_to wiki_path(@wiki)
    else
      flash[:error] = "Collaborator could not be removed."
      redirect_to wiki_path(@wiki)
    end
  end
end
