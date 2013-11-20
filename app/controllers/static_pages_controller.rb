class StaticPagesController < ApplicationController
  def home
    @team
  end

  def contact
  end

  private
  def has_univeristy?
    @university.present?
  end

  def has_team?
    @university.teams.present?
  end

  def has_event?
    @team.events.present?
  end

  def has_media?
    @media.present?
  end
end
