class GamesController < ApplicationController

  def launcher
    @game=Game.find(params[:id])
  end

  def game_screen
    @game=Game.find(params[:id])
    @user=current_user
    @next_game=@game.project.games.where('sequence=?', @game.sequence+1).first unless @game.project.games.count==@game.sequence

    if %w(Campaign AntiCampaign).include? @game.game_type.name
      @title=@game.markup.split('||')[0]
      @catchphrase=@game.markup.split('||')[1]
      @body=@game.markup.split('||')[2]
      @answers=Array.new
      @game.gnodes.each_with_index do |gnode, index|
        if Answer.find_by_gnode_id_and_user_id(gnode.id, @user.id).blank?
          @answers[index]=Answer.create!(:gnode_id => gnode.id, :user_id => @user.id)
        else
          @answers[index]= Answer.find_by_gnode_id_and_user_id(gnode.id, @user.id)
        end
      end
    else
      @gnode=Gnode.find(params[:gnode_id])
    end

    @selection=Selection.new
  end

  def note_selection
    @gpath=Gpath.find_by_name(params[:selection])

    if @gpath.gnode.completions.where('user_id=?', current_user.id).blank? and @gpath.selections.where('user_id=?', current_user.id).blank?
      Selection.create!(:user_id => current_user.id, :gpath_id => @gpath.id)
      @score=Score.find_by_game_id_and_user_id(@gpath.gnode.game.id, current_user.id)
      @score.value+=@gpath.markup.to_i
      @score.save
    end
    if @gpath.gnode.gpaths.map { |gp| gp.selections.where('user_id=?', current_user.id).count }.sum==3 and @gpath.gnode.completions.where('user_id=?', current_user.id).blank?
      Completion.create!(:user_id => current_user.id, :gnode_id => @gpath.gnode.id)
    end
    if @gpath.gnode.completions.where('user_id=?', current_user.id).blank?
      render :text => "#{@gpath.next_id.to_s}|#{@gpath.markup}|#{@score.value}|0"
    elsif @gpath.gnode.markup.blank?
      @score=Score.find_by_game_id_and_user_id(@gpath.gnode.game.id, current_user.id)
      render :text => "#{@gpath.next_id.to_s}|#{@gpath.markup}|#{@score.value}|-1"
    else
      @gnext=@gpath.gnode.game.gnodes.where('name=?', @gpath.gnode.markup).first
      render :text => "#{@gpath.next_id.to_s}|#{@gpath.markup}|#{@score.value}|#{@gnext.id}"
    end
  end

  def comparison_selection
    @gnode=Gnode.find(params[:nodeadd][0])
    @gpath=@gnode.gpaths.where('name=?',params[:selection][0]).first

    if @gpath.gnode.completions.where('user_id=?', current_user.id).blank? and @gpath.selections.where('user_id=?', current_user.id).blank?
      Selection.create!(:user_id => current_user.id, :gpath_id => @gpath.id)
      @score=Score.find_by_game_id_and_user_id(@gpath.gnode.game.id, current_user.id)
      @score.value+=@gpath.markup.to_i
      @score.save
      Completion.create!(:user_id => current_user.id, :gnode_id => @gpath.gnode.id)
    end
    @totalscore=@gpath.gnode.game.project.games.map { |g| g.scores.where('user_id=?', current_user.id).first.value }.sum
    if @gpath.gnode.markup.blank?
      render :text => "#{@gpath.next_id.to_s}|#{@totalscore}|-1"
    else
      render :text => "#{@gnode.markup}|#{@totalscore}|0"
    end
  end

  def reset_game
    @game=Game.find(params[:id])
    @user=User.find(current_user.id)
    @score=Score.where('user_id=?', @user.id).where('game_id=?', @game.id).first
    @score.value=0
    @score.save
    Completion.where('user_id=?', @user.id).each do |completion|
      if @game.gnodes.include?(completion.gnode)
        completion.destroy
      end
    end
    @game.gnodes.each do |gnode|
      gnode.answers.where('user_id=?', @user.id).each do |answer|
        answer.destroy
      end
      gnode.gpaths.each do |gpath|
        gpath.selections.where('user_id=?', @user.id).each do |selection|
          selection.destroy
        end
      end
    end

  end

end
