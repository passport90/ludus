-- Finding genres --
select genres.name, count(*)
from games
join genres on games.genre_id = genres.id
where games.release_date < '1998-01-01'
and games.release_date >= '1997-01-01'
and games.score >= '74'
group by genres.name
order by genres.name;

-- 1997 Fighting Game of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date < '1998-01-01'
and games.release_date >= '1997-01-01'
and score >= '74'
and genres.path <@ 'action.fighting'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 1997 Platformer of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date < '1998-01-01'
and games.release_date >= '1997-01-01'
and score >= '74'
and genres.path <@ 'action.platformer'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 1997 Shooter of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date < '1998-01-01'
and games.release_date >= '1997-01-01'
and score >= '74'
and genres.path <@ 'action.shooter'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 1997 Racing Game of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date < '1998-01-01'
and games.release_date >= '1997-01-01'
and score >= '74'
and genres.path <@ 'racing'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 1997 Simulation Game of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date < '1998-01-01'
and games.release_date >= '1997-01-01'
and score >= '74'
and genres.path <@ 'simulation'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 1997 Sports Game of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date < '1998-01-01'
and games.release_date >= '1997-01-01'
and score >= '74'
and genres.path <@ 'sports'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 1997 Strategy Game of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date < '1998-01-01'
and games.release_date >= '1997-01-01'
and score >= '74'
and genres.path <@ 'strategy'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 1997 Miscellaneous Game of the Year --
select title, platforms.name as platform, genres.name as genre, score
from games
join platforms on games.platform_id = platforms.id
join genres on games.genre_id = genres.id
where games.release_date < '1998-01-01'
and games.release_date >= '1997-01-01'
and score >= '74'
and not genres.path <@ 'action.fighting'::ltree
and not genres.path <@ 'action.platformer'::ltree
and not genres.path <@ 'action.shooter'::ltree
and not genres.path <@ 'racing'::ltree
and not genres.path <@ 'simulation'::ltree
and not genres.path <@ 'sports'::ltree
and not genres.path <@ 'strategy'::ltree
order by score desc, title, platforms.release_date
limit 10;

-- 1997 Sega Saturn Game of the Year --
select title, platforms.name as platform, score
from games
join platforms on games.platform_id = platforms.id
where games.release_date < '1998-01-01'
and games.release_date >= '1997-01-01'
and platforms.name = 'Sega Saturn'
and score >= '74'
order by score desc, title, platforms.release_date
limit 10;

-- 1997 PlayStation Game of the Year --
select title, platforms.name as platform, score
from games
join platforms on games.platform_id = platforms.id
where games.release_date < '1998-01-01'
and games.release_date >= '1997-01-01'
and platforms.name = 'PlayStation'
and score >= '74'
order by score desc, title, platforms.release_date
limit 10;

-- 1997 Nintendo 64 Game of the Year --
select title, platforms.name as platform, score
from games
join platforms on games.platform_id = platforms.id
where games.release_date < '1998-01-01'
and games.release_date >= '1997-01-01'
and platforms.name = 'Nintendo 64'
and score >= '74'
order by score desc, title, platforms.release_date
limit 10;

-- 1997 Game of the Year --
select title, platforms.name as platform, score
from games
join platforms on games.platform_id = platforms.id
where games.release_date < '1998-01-01'
and games.release_date >= '1997-01-01'
and score >= '74'
order by score desc, title, platforms.release_date
limit 10;
