-- Finding genres --
select genres.name, count(*)
from games
join genres on games.genre_id = genres.id
where games.release_date < '2003-01-01'
and games.release_date >= '2002-01-01'
and games.score >= '74'
group by genres.name
order by genres.name;

-- 2002 Action Adventure Game of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date >= '2002-01-01'
and games.release_date < '2003-01-01'
and score >= '74'
and genres.path <@ 'action_adventure'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 2002 Fighting Game of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date >= '2002-01-01'
and games.release_date < '2003-01-01'
and score >= '74'
and genres.path <@ 'action.fighting'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 2002 Platformer of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date >= '2002-01-01'
and games.release_date < '2003-01-01'
and score >= '74'
and genres.path <@ 'action.platformer'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 2002 Shooter of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date >= '2002-01-01'
and games.release_date < '2003-01-01'
and score >= '74'
and genres.path <@ 'action.shooter'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 2002 Racing of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date >= '2002-01-01'
and games.release_date < '2003-01-01'
and score >= '74'
and genres.path <@ 'racing'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 2002 RPG of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date >= '2002-01-01'
and games.release_date < '2003-01-01'
and score >= '74'
and genres.path <@ 'role_playing'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 2002 Simulation Game of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date >= '2002-01-01'
and games.release_date < '2003-01-01'
and score >= '74'
and genres.path <@ 'simulation'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 2002 Sports Game of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date >= '2002-01-01'
and games.release_date < '2003-01-01'
and score >= '74'
and genres.path <@ 'sports'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 2002 Miscellaneous Game of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date >= '2002-01-01'
and games.release_date < '2003-01-01'
and score >= '74'
and not genres.path <@ 'action_adventure'::ltree
and not genres.path <@ 'action.fighting'::ltree
and not genres.path <@ 'action.platformer'::ltree
and not genres.path <@ 'action.shooter'::ltree
and not genres.path <@ 'racing'::ltree
and not genres.path <@ 'role_playing'::ltree
and not genres.path <@ 'simulation'::ltree
and not genres.path <@ 'sports'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 2002 PlayStation Game of the Year --
select title, platforms.name as platform, score
from games
join platforms on games.platform_id = platforms.id
where games.release_date >= '2002-01-01'
and games.release_date < '2003-01-01'
and platforms.name = 'PlayStation'
and score >= '74'
order by score desc, title, platforms.release_date
limit 10;

-- 2002 PlayStation 2 Game of the Year --
select title, platforms.name as platform, score
from games
join platforms on games.platform_id = platforms.id
where games.release_date >= '2002-01-01'
and games.release_date < '2003-01-01'
and platforms.name = 'PlayStation 2'
and score >= '74'
order by score desc, title, platforms.release_date
limit 10;

-- 2002 Xbox Game of the Year --
select title, platforms.name as platform, score
from games
join platforms on games.platform_id = platforms.id
where games.release_date >= '2002-01-01'
and games.release_date < '2003-01-01'
and platforms.name = 'Xbox'
and score >= '74'
order by score desc, title, platforms.release_date
limit 10;

-- 2002 Nintendo GameCube Game of the Year --
select title, platforms.name as platform, score
from games
join platforms on games.platform_id = platforms.id
where games.release_date >= '2002-01-01'
and games.release_date < '2003-01-01'
and platforms.name = 'Nintendo GameCube'
and score >= '74'
order by score desc, title, platforms.release_date
limit 10;

-- 2002 Game of the Year --
select title, platforms.name as platform, score
from games
join platforms on games.platform_id = platforms.id
where games.release_date >= '2002-01-01'
and games.release_date < '2003-01-01'
and score >= '74'
order by score desc, title, platforms.release_date
limit 10;