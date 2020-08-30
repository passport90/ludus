task migrate_video_link: :environment do
  ActiveRecord::Base.logger = Logger.new STDOUT
  games = Game.unscoped.all
  games.each do |game|
    next unless game.video_link.present?

    if game.video_link[0] == '<'
      start_pos = '<iframe width="560" height="315" src="https://www.youtube.com/embed/'.size
      end_pos = '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'.size
      youtube_id = game.video_link[start_pos...-end_pos]
    elsif game.video_link[0] == 'h'
      start_pos = 'https://youtu.be/'.size
      youtube_id = game.video_link[start_pos..-1]
    end

    game.update!(video_youtube_id: youtube_id)
  end
end
