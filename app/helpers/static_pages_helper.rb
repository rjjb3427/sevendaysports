module StaticPagesHelper
  def teams
    @teams = Team.all
  end

  def universities
    @universities = University.all
  end

  def events
    @events = @team.events
  end

  def find_team
    @find_team = Team.find(params[:id])
  end

  def find_university
    @find_university = University.find(params[:id])
  end

  def find_event
    @find_event = @team.events.find(params[:id])
  end
end
