class ClubsController < ApplicationController
  def index
    @clubs = Club.all

    render("club_templates/index.html.erb")
  end

  def show
    @club = Club.find(params.fetch("id_to_display"))

    render("club_templates/show.html.erb")
  end

  def new_form
    render("club_templates/new_form.html.erb")
  end

  def create_row
    @club = Club.new

    @club.name = params.fetch("name")
    @club.logo = params.fetch("logo")

    if @club.valid?
      @club.save

      redirect_to("/clubs", :notice => "Club created successfully.")
    else
      render("club_templates/new_form.html.erb")
    end
  end

  def edit_form
    @club = Club.find(params.fetch("prefill_with_id"))

    render("club_templates/edit_form.html.erb")
  end

  def update_row
    @club = Club.find(params.fetch("id_to_modify"))

    @club.name = params.fetch("name")
    @club.logo = params.fetch("logo")

    if @club.valid?
      @club.save

      redirect_to("/clubs/#{@club.id}", :notice => "Club updated successfully.")
    else
      render("club_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @club = Club.find(params.fetch("id_to_remove"))

    @club.destroy

    redirect_to("/clubs", :notice => "Club deleted successfully.")
  end
end
