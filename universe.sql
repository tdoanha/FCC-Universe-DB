--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_type character varying(30),
    light_years_away_from_earth integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    planet_id integer NOT NULL,
    light_years_away_from_earth integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_billions_of_years numeric(4,2),
    planet_type character varying(30),
    light_years_away_from_earth integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: random; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.random (
    random_id integer NOT NULL,
    name character varying NOT NULL,
    col1 character varying(10),
    col2 character varying(10),
    col3 character varying(10)
);


ALTER TABLE public.random OWNER TO freecodecamp;

--
-- Name: random_random_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.random_random_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.random_random_id_seq OWNER TO freecodecamp;

--
-- Name: random_random_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.random_random_id_seq OWNED BY public.random.random_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_billions_of_years numeric(4,2),
    galaxy_id integer NOT NULL,
    light_years_away_from_earth integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: random random_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.random ALTER COLUMN random_id SET DEFAULT nextval('public.random_random_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 'A galaxy home to where our Sun and Earth resides', 'Sprial galaxy', 0);
INSERT INTO public.galaxy VALUES (3, 'Canis Major Dwarf Galaxy', 'A disrupted dwarf irregular galaxy in the Local Group, located in the same part of the sky as the constellation Canis Major', 'Dwarf Irregular Galaxy', 25000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Also known as Messier 31 (M31). It is thought that the Milky Way and Andromeda will collid several billion years from now.', 'Spiral Galaxy', 2537000);
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Fireworks Galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel Galaxy', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (5, 'Moon', true, 3, NULL);
INSERT INTO public.moon VALUES (6, 'Phobos', true, 4, NULL);
INSERT INTO public.moon VALUES (7, 'Deimos', true, 4, NULL);
INSERT INTO public.moon VALUES (8, 'Metis', false, 5, NULL);
INSERT INTO public.moon VALUES (9, 'Adrastea', false, 5, NULL);
INSERT INTO public.moon VALUES (10, 'Amalthea', false, 5, NULL);
INSERT INTO public.moon VALUES (11, 'Thebe', false, 5, NULL);
INSERT INTO public.moon VALUES (12, 'IO', true, 5, NULL);
INSERT INTO public.moon VALUES (13, 'Europa', true, 5, NULL);
INSERT INTO public.moon VALUES (14, 'Ganymede', true, 5, NULL);
INSERT INTO public.moon VALUES (15, 'Callisto', true, 5, NULL);
INSERT INTO public.moon VALUES (16, 'Mimas', true, 6, NULL);
INSERT INTO public.moon VALUES (17, 'Enceladus', true, 6, NULL);
INSERT INTO public.moon VALUES (18, 'Tethys', true, 6, NULL);
INSERT INTO public.moon VALUES (19, 'Dione', true, 6, NULL);
INSERT INTO public.moon VALUES (20, 'Rhea', true, 6, NULL);
INSERT INTO public.moon VALUES (21, 'Titan', true, 6, NULL);
INSERT INTO public.moon VALUES (22, 'lapetus', true, 6, NULL);
INSERT INTO public.moon VALUES (23, 'Miranda', true, 7, NULL);
INSERT INTO public.moon VALUES (24, 'Ariel', true, 7, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, true, 4.50, 'Terrestrial', 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, true, 4.50, 'Terrestrial', 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, true, 4.54, 'Terrestrial', 0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, true, 4.60, 'Terrestrial', 0, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, true, 4.60, 'Gas Giant', 0, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, true, 4.50, 'Gas Giant', 0, 1);
INSERT INTO public.planet VALUES (7, 'Uruanus', false, true, 4.50, 'Ice Giant', 0, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, true, 4.50, 'Ice Giant', 0, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', false, true, 4.50, 'Dwarf Planet', 0, 1);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', NULL, NULL, NULL, NULL, 4, 3);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri c', NULL, NULL, NULL, NULL, 4, 3);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri d', NULL, NULL, NULL, NULL, 4, 3);


--
-- Data for Name: random; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.random VALUES (4, 'name1', NULL, NULL, NULL);
INSERT INTO public.random VALUES (5, 'name2', NULL, NULL, NULL);
INSERT INTO public.random VALUES (6, 'name3', NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4.60, 1, NULL);
INSERT INTO public.star VALUES (2, 'Mirach', NULL, 2, NULL);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 4.85, 1, NULL);
INSERT INTO public.star VALUES (4, 'Banards Star', NULL, 1, NULL);
INSERT INTO public.star VALUES (5, 'Wolf 359', NULL, 1, NULL);
INSERT INTO public.star VALUES (6, 'Lalande 211185', NULL, 1, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: random_random_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.random_random_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: random random_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.random
    ADD CONSTRAINT random_name_key UNIQUE (name);


--
-- Name: random random_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.random
    ADD CONSTRAINT random_pkey PRIMARY KEY (random_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

