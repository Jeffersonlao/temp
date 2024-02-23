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
    name character varying(50) NOT NULL,
    description text,
    number_of_system integer NOT NULL,
    galaxy_type character varying(50)
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
-- Name: galaxy_star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_star (
    galaxy_star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.galaxy_star OWNER TO freecodecamp;

--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_star_galaxy_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_star_galaxy_star_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_star_galaxy_star_id_seq OWNED BY public.galaxy_star.galaxy_star_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    distance_from_planet numeric(7,0),
    planet_id integer
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
    name character varying(50) NOT NULL,
    description text,
    planet_type character varying(50),
    number_of_moons integer,
    have_life boolean NOT NULL,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    number_of_planets integer NOT NULL,
    star_type character varying(50),
    galaxy_id integer
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
-- Name: galaxy_star galaxy_star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star ALTER COLUMN galaxy_star_id SET DEFAULT nextval('public.galaxy_star_galaxy_star_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 'diameter = 100000 ly, Distance = 0', 100, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'diameter = 220000 ly, Distance = 2M5', 200, 'Lenticular');
INSERT INTO public.galaxy VALUES (3, 'LMC', 'diameter = 14000 ly, Distance = 158k', 50, 'Seyfert');
INSERT INTO public.galaxy VALUES (4, 'Cigar', 'diameter = 37000 ly, Distance = 11M5', 50, 'Irregular');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'diameter = 170000 ly, Distance = 20M8', 150, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Hoags', 'diameter = 100000 ly, Distance = 600M', 75, 'Elliptical');


--
-- Data for Name: galaxy_star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_star VALUES (1, 1, 1);
INSERT INTO public.galaxy_star VALUES (2, 2, 2);
INSERT INTO public.galaxy_star VALUES (3, 3, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 'radius = 1.7km, Orbit = 384k KM', 1000, 1);
INSERT INTO public.moon VALUES (2, 'phobos', 'radius = 11.27km, Orbit = 9.38k KM', 10000, 2);
INSERT INTO public.moon VALUES (3, 'IO', 'radius = 1800km, Orbit = 421k KM', 30000, 3);
INSERT INTO public.moon VALUES (4, 'Europa', 'radius = 1560km, Orbit = 671k KM', 22000, 3);
INSERT INTO public.moon VALUES (5, 'Elara', 'radius = 43km, Orbit = 11000k KM', 30000, 4);
INSERT INTO public.moon VALUES (6, 'callisto', 'radius = 13km, Orbit = 1000k KM', 6000, 4);
INSERT INTO public.moon VALUES (7, 'Ganye', 'radius = 1.7km, Orbit = 384k KM', 1000, 5);
INSERT INTO public.moon VALUES (8, 'sophobs', 'radius = 11.27km, Orbit = 9.38k KM', 10000, 5);
INSERT INTO public.moon VALUES (9, 'EIOIU', 'radius = 1800km, Orbit = 421k KM', 30000, 6);
INSERT INTO public.moon VALUES (10, 'UK', 'radius = 1560km, Orbit = 671k KM', 22000, 6);
INSERT INTO public.moon VALUES (11, 'RALE', 'radius = 34km, Orbit = 11000k KM', 30000, 7);
INSERT INTO public.moon VALUES (12, 'calax', 'radius = 23km, Orbit = 1200k KM', 6000, 7);
INSERT INTO public.moon VALUES (13, 'Nomo', 'radius = 17km, Orbit = 38k KM', 10000, 8);
INSERT INTO public.moon VALUES (14, 'Boors', 'radius = 1.27km, Orbit = 9.8k KM', 2000, 8);
INSERT INTO public.moon VALUES (15, 'Koei', 'radius = 1800km, Orbit = 421k KM', 30000, 9);
INSERT INTO public.moon VALUES (16, 'rope', 'radius = 1560km, Orbit = 671k KM', 22000, 9);
INSERT INTO public.moon VALUES (17, 'lear', 'radius = 43km, Orbit = 11000k KM', 30000, 10);
INSERT INTO public.moon VALUES (18, 'soso', 'radius = 43km, Orbit = 11000k KM', 30000, 10);
INSERT INTO public.moon VALUES (19, 'relax', 'radius = 3km, Orbit = 1000k KM', 9000, 11);
INSERT INTO public.moon VALUES (20, 'nono', 'radius = 84km, Orbit = 21000k KM', 30000, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'spe', 'DY = 2008, Mass = 4.8MJ', 'M1', 1, true, 1);
INSERT INTO public.planet VALUES (2, 'arion', 'DY = 2008, Mass =10.3MJ', 'M2', 2, false, 1);
INSERT INTO public.planet VALUES (3, 'brahe', 'DY = 2004, Mass = 0.174MJ', 'N1', 1, true, 2);
INSERT INTO public.planet VALUES (4, 'Aegir', 'DY = 2000, Mass = 1.55MJ', 'O1', 0, false, 2);
INSERT INTO public.planet VALUES (5, 'Amateru', 'DY = 2006, Mass = 7.6MJ', 'Z1', 3, true, 3);
INSERT INTO public.planet VALUES (6, 'Draugr', 'DY = 1994, Mass = 629MJ', 'SZ1', 12, false, 3);
INSERT INTO public.planet VALUES (7, 'Puli', 'DY = 2009, Mass = 0.211MJ', 'M1', 1, false, 4);
INSERT INTO public.planet VALUES (8, 'Eiger', 'DY = 1999, Mass = 1.05MJ', 'M1', 1, true, 4);
INSERT INTO public.planet VALUES (9, 'Halla', 'DY = 2015, Mass = 1.5MJ', 'M2', 2, true, 5);
INSERT INTO public.planet VALUES (10, 'Dopere', 'DY = 2010, Mass = 2.54MJ', 'Z3', 3, false, 5);
INSERT INTO public.planet VALUES (11, 'Bagan', 'DY = 2011, Mass = 3.4MJ', 'M1', 2, true, 6);
INSERT INTO public.planet VALUES (12, 'Magor', 'DY = 2007, Mass = 8.74MJ', 'G1', 4, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'proxima', 'Mass = 0.122M, temp = 3042K', 2, 'M5.5Ve', 1);
INSERT INTO public.star VALUES (2, 'lalande', 'Mass = 0.392M, temp = 3601K', 2, 'M2Ve', 2);
INSERT INTO public.star VALUES (3, 'HD219134', 'Mass = 0.794M, temp = 4699K', 6, 'K3Vvar', 3);
INSERT INTO public.star VALUES (4, 'Trappist-1', 'Mass = 0.089M, temp = 2550K', 7, 'M8V', 4);
INSERT INTO public.star VALUES (5, 'HD101180', 'Mass = 1.055M, temp = 5911', 2, 'G1V', 5);
INSERT INTO public.star VALUES (6, 'Kepler-20', 'Mass = 0.912M, temp = 5466K', 6, 'G8Ve', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_star_galaxy_star_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


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
-- Name: galaxy_star galaxy_star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_pkey PRIMARY KEY (galaxy_id, star_id);


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

