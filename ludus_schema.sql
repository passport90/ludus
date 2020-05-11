--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: ltree; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ltree WITH SCHEMA public;


--
-- Name: EXTENSION ltree; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION ltree IS 'data type for hierarchical tree-like structures';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: marhadiasha
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO marhadiasha;

--
-- Name: badges; Type: TABLE; Schema: public; Owner: marhadiasha
--

CREATE TABLE public.badges (
    id bigint NOT NULL,
    name character varying NOT NULL,
    symbol character varying NOT NULL,
    award_date date NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.badges OWNER TO marhadiasha;

--
-- Name: badges_games; Type: TABLE; Schema: public; Owner: marhadiasha
--

CREATE TABLE public.badges_games (
    game_id bigint NOT NULL,
    badge_id bigint NOT NULL
);


ALTER TABLE public.badges_games OWNER TO marhadiasha;

--
-- Name: badges_id_seq; Type: SEQUENCE; Schema: public; Owner: marhadiasha
--

CREATE SEQUENCE public.badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.badges_id_seq OWNER TO marhadiasha;

--
-- Name: badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marhadiasha
--

ALTER SEQUENCE public.badges_id_seq OWNED BY public.badges.id;


--
-- Name: esrb_ratings; Type: TABLE; Schema: public; Owner: marhadiasha
--

CREATE TABLE public.esrb_ratings (
    id bigint NOT NULL,
    name character varying NOT NULL,
    symbol character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.esrb_ratings OWNER TO marhadiasha;

--
-- Name: esrb_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: marhadiasha
--

CREATE SEQUENCE public.esrb_ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.esrb_ratings_id_seq OWNER TO marhadiasha;

--
-- Name: esrb_ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marhadiasha
--

ALTER SEQUENCE public.esrb_ratings_id_seq OWNED BY public.esrb_ratings.id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: marhadiasha
--

CREATE TABLE public.games (
    id bigint NOT NULL,
    title character varying NOT NULL,
    platform_id bigint NOT NULL,
    release_date date NOT NULL,
    publisher_id bigint NOT NULL,
    genre_id bigint NOT NULL,
    esrb_rating_id bigint NOT NULL,
    score integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    remarks text,
    video_link character varying,
    is_date_confirmed boolean DEFAULT false NOT NULL
);


ALTER TABLE public.games OWNER TO marhadiasha;

--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: marhadiasha
--

CREATE SEQUENCE public.games_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_id_seq OWNER TO marhadiasha;

--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marhadiasha
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: marhadiasha
--

CREATE TABLE public.genres (
    id bigint NOT NULL,
    name character varying NOT NULL,
    path public.ltree NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.genres OWNER TO marhadiasha;

--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: marhadiasha
--

CREATE SEQUENCE public.genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_id_seq OWNER TO marhadiasha;

--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marhadiasha
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- Name: platforms; Type: TABLE; Schema: public; Owner: marhadiasha
--

CREATE TABLE public.platforms (
    id bigint NOT NULL,
    name character varying NOT NULL,
    release_date date NOT NULL,
    publisher_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.platforms OWNER TO marhadiasha;

--
-- Name: platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: marhadiasha
--

CREATE SEQUENCE public.platforms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.platforms_id_seq OWNER TO marhadiasha;

--
-- Name: platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marhadiasha
--

ALTER SEQUENCE public.platforms_id_seq OWNED BY public.platforms.id;


--
-- Name: publishers; Type: TABLE; Schema: public; Owner: marhadiasha
--

CREATE TABLE public.publishers (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.publishers OWNER TO marhadiasha;

--
-- Name: publishers_id_seq; Type: SEQUENCE; Schema: public; Owner: marhadiasha
--

CREATE SEQUENCE public.publishers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publishers_id_seq OWNER TO marhadiasha;

--
-- Name: publishers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marhadiasha
--

ALTER SEQUENCE public.publishers_id_seq OWNED BY public.publishers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: marhadiasha
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO marhadiasha;

--
-- Name: badges id; Type: DEFAULT; Schema: public; Owner: marhadiasha
--

ALTER TABLE ONLY public.badges ALTER COLUMN id SET DEFAULT nextval('public.badges_id_seq'::regclass);


--
-- Name: esrb_ratings id; Type: DEFAULT; Schema: public; Owner: marhadiasha
--

ALTER TABLE ONLY public.esrb_ratings ALTER COLUMN id SET DEFAULT nextval('public.esrb_ratings_id_seq'::regclass);


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: marhadiasha
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: marhadiasha
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- Name: platforms id; Type: DEFAULT; Schema: public; Owner: marhadiasha
--

ALTER TABLE ONLY public.platforms ALTER COLUMN id SET DEFAULT nextval('public.platforms_id_seq'::regclass);


--
-- Name: publishers id; Type: DEFAULT; Schema: public; Owner: marhadiasha
--

ALTER TABLE ONLY public.publishers ALTER COLUMN id SET DEFAULT nextval('public.publishers_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: marhadiasha
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: badges badges_pkey; Type: CONSTRAINT; Schema: public; Owner: marhadiasha
--

ALTER TABLE ONLY public.badges
    ADD CONSTRAINT badges_pkey PRIMARY KEY (id);


--
-- Name: esrb_ratings esrb_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: marhadiasha
--

ALTER TABLE ONLY public.esrb_ratings
    ADD CONSTRAINT esrb_ratings_pkey PRIMARY KEY (id);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: marhadiasha
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: marhadiasha
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: platforms platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: marhadiasha
--

ALTER TABLE ONLY public.platforms
    ADD CONSTRAINT platforms_pkey PRIMARY KEY (id);


--
-- Name: publishers publishers_pkey; Type: CONSTRAINT; Schema: public; Owner: marhadiasha
--

ALTER TABLE ONLY public.publishers
    ADD CONSTRAINT publishers_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: marhadiasha
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_badges_games_on_badge_id_and_game_id; Type: INDEX; Schema: public; Owner: marhadiasha
--

CREATE UNIQUE INDEX index_badges_games_on_badge_id_and_game_id ON public.badges_games USING btree (badge_id, game_id);


--
-- Name: index_badges_games_on_game_id_and_badge_id; Type: INDEX; Schema: public; Owner: marhadiasha
--

CREATE UNIQUE INDEX index_badges_games_on_game_id_and_badge_id ON public.badges_games USING btree (game_id, badge_id);


--
-- Name: index_badges_on_award_date_and_name; Type: INDEX; Schema: public; Owner: marhadiasha
--

CREATE INDEX index_badges_on_award_date_and_name ON public.badges USING btree (award_date, name);


--
-- Name: index_esrb_ratings_on_name; Type: INDEX; Schema: public; Owner: marhadiasha
--

CREATE INDEX index_esrb_ratings_on_name ON public.esrb_ratings USING btree (name);


--
-- Name: index_games_on_esrb_rating_id; Type: INDEX; Schema: public; Owner: marhadiasha
--

CREATE INDEX index_games_on_esrb_rating_id ON public.games USING btree (esrb_rating_id);


--
-- Name: index_games_on_genre_id; Type: INDEX; Schema: public; Owner: marhadiasha
--

CREATE INDEX index_games_on_genre_id ON public.games USING btree (genre_id);


--
-- Name: index_games_on_platform_id; Type: INDEX; Schema: public; Owner: marhadiasha
--

CREATE INDEX index_games_on_platform_id ON public.games USING btree (platform_id);


--
-- Name: index_games_on_publisher_id; Type: INDEX; Schema: public; Owner: marhadiasha
--

CREATE INDEX index_games_on_publisher_id ON public.games USING btree (publisher_id);


--
-- Name: index_games_on_release_date; Type: INDEX; Schema: public; Owner: marhadiasha
--

CREATE INDEX index_games_on_release_date ON public.games USING btree (release_date);


--
-- Name: index_genres_on_path; Type: INDEX; Schema: public; Owner: marhadiasha
--

CREATE INDEX index_genres_on_path ON public.genres USING gist (path);


--
-- Name: index_platforms_on_publisher_id; Type: INDEX; Schema: public; Owner: marhadiasha
--

CREATE INDEX index_platforms_on_publisher_id ON public.platforms USING btree (publisher_id);


--
-- Name: index_platforms_on_release_date; Type: INDEX; Schema: public; Owner: marhadiasha
--

CREATE INDEX index_platforms_on_release_date ON public.platforms USING btree (release_date);


--
-- Name: index_publishers_on_name; Type: INDEX; Schema: public; Owner: marhadiasha
--

CREATE INDEX index_publishers_on_name ON public.publishers USING btree (name);


--
-- Name: games fk_rails_28e79f0d94; Type: FK CONSTRAINT; Schema: public; Owner: marhadiasha
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_rails_28e79f0d94 FOREIGN KEY (genre_id) REFERENCES public.genres(id);


--
-- Name: platforms fk_rails_ab81f6b18a; Type: FK CONSTRAINT; Schema: public; Owner: marhadiasha
--

ALTER TABLE ONLY public.platforms
    ADD CONSTRAINT fk_rails_ab81f6b18a FOREIGN KEY (publisher_id) REFERENCES public.publishers(id);


--
-- Name: games fk_rails_d3edf22a52; Type: FK CONSTRAINT; Schema: public; Owner: marhadiasha
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_rails_d3edf22a52 FOREIGN KEY (publisher_id) REFERENCES public.publishers(id);


--
-- Name: games fk_rails_d6dc46fad0; Type: FK CONSTRAINT; Schema: public; Owner: marhadiasha
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_rails_d6dc46fad0 FOREIGN KEY (platform_id) REFERENCES public.platforms(id);


--
-- Name: games fk_rails_e739ef5c70; Type: FK CONSTRAINT; Schema: public; Owner: marhadiasha
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_rails_e739ef5c70 FOREIGN KEY (esrb_rating_id) REFERENCES public.esrb_ratings(id);


--
-- PostgreSQL database dump complete
--

