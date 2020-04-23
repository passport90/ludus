select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
and games.release_date < '1996-01-01'
and score >= '75'
and genres.path <@ 'action.platformer'::ltree
order by score desc, title, platforms.release_date
limit 10;

select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
and games.release_date < '1996-01-01'
and score >= '75'
and genres.path <@ 'action'::ltree
and not genres.path <@ 'action.platformer'::ltree
order by score desc, title, platforms.release_date
limit 10;

select title, platforms.name as platform, score
from games
join platforms on games.platform_id = platforms.id
and games.release_date < '1996-01-01'
and score >= '75'
and platforms.name = 'Sega Saturn'
order by score desc, title, platforms.release_date
limit 10;

select title, platforms.name as platform, score
from games
join platforms on games.platform_id = platforms.id
and games.release_date < '1996-01-01'
and score >= '75'
order by score desc, title, platforms.release_date
limit 20;

Eligible Genres:
action.platformer
action.!platformer
sports
!action && !sports
