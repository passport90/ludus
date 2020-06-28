-- Finding genres --
select genres.name, count(*)
from games
join genres on games.genre_id = genres.id
where games.release_date < '1997-01-01'
and games.release_date >= '1996-01-01'
group by genres.name
order by genres.name;

-- 1996 Action Adventure Game of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date < '1997-01-01'
and games.release_date >= '1996-01-01'
and score >= '74'
and genres.path <@ 'action_adventure'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 1996 Fighting Game of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date < '1997-01-01'
and games.release_date >= '1996-01-01'
and score >= '74'
and genres.path <@ 'action.fighting'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 1996 Platformer of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date < '1997-01-01'
and games.release_date >= '1996-01-01'
and score >= '74'
and genres.path <@ 'action.platformer'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 1996 Shooter of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date < '1997-01-01'
and games.release_date >= '1996-01-01'
and score >= '74'
and genres.path <@ 'action.shooter'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 1996 Racing Game of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date < '1997-01-01'
and games.release_date >= '1996-01-01'
and score >= '74'
and genres.path <@ 'racing'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 1996 RPG of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date < '1997-01-01'
and games.release_date >= '1996-01-01'
and score >= '74'
and genres.path <@ 'role_playing'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 1996 Simulation Game of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date < '1997-01-01'
and games.release_date >= '1996-01-01'
and score >= '74'
and genres.path <@ 'simulation'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 1996 Sports Game of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date < '1997-01-01'
and games.release_date >= '1996-01-01'
and score >= '74'
and genres.path <@ 'sports'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 1996 Strategy Game of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date < '1997-01-01'
and games.release_date >= '1996-01-01'
and score >= '74'
and genres.path <@ 'strategy'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 1996 Miscellaneous Game of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date < '1997-01-01'
and games.release_date >= '1996-01-01'
and score >= '74'
and not genres.path <@ 'action_adventure'::ltree
and not genres.path <@ 'action.fighting'::ltree
and not genres.path <@ 'action.platformer'::ltree
and not genres.path <@ 'action.shooter'::ltree
and not genres.path <@ 'racing'::ltree
and not genres.path <@ 'role_playing'::ltree
and not genres.path <@ 'simulation'::ltree
and not genres.path <@ 'sports'::ltree
and not genres.path <@ 'strategy'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 1996 Sega Saturn Game of the Year --
select title, platforms.name as platform, score
from games
join platforms on games.platform_id = platforms.id
where games.release_date < '1997-01-01'
and games.release_date >= '1996-01-01'
and platforms.name = 'Sega Saturn'
and score >= '74'
order by score desc, title, platforms.release_date
limit 10;
-- 1996 PlayStation Game of the Year --
select title, platforms.name as platform, score
from games
join platforms on games.platform_id = platforms.id
where games.release_date < '1997-01-01'
and games.release_date >= '1996-01-01'
and platforms.name = 'PlayStation'
and score >= '74'
order by score desc, title, platforms.release_date
limit 10;
-- 1996 Nintendo 64 Game of the Year --
select title, platforms.name as platform, score
from games
join platforms on games.platform_id = platforms.id
where games.release_date < '1997-01-01'
and games.release_date >= '1996-01-01'
and platforms.name = 'Nintendo 64'
and score >= '74'
order by score desc, title, platforms.release_date
limit 10;

-- 1996 Game of the Year --
select title, platforms.name as platform, score
from games
join platforms on games.platform_id = platforms.id
where games.release_date < '1997-01-01'
and games.release_date >= '1996-01-01'
and score >= '74'
order by score desc, title, platforms.release_date
limit 10;