--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    has_black_hole boolean DEFAULT true NOT NULL,
    spiral boolean,
    diameter_kly numeric(8,2),
    age_gyr integer
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
-- Name: mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mission (
    mission_id integer NOT NULL,
    name character varying(50) NOT NULL,
    launch_year integer NOT NULL,
    agency character varying(30) NOT NULL,
    crewed boolean NOT NULL,
    sample_returned boolean,
    duration_days numeric(8,1)
);


ALTER TABLE public.mission OWNER TO freecodecamp;

--
-- Name: mission_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.mission_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mission_mission_id_seq OWNER TO freecodecamp;

--
-- Name: mission_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.mission_mission_id_seq OWNED BY public.mission.mission_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    discovered_year integer,
    radius_km numeric(8,2),
    orbit_period_d numeric(8,3),
    is_geologically_active boolean,
    has_atmosphere boolean,
    planet_id integer NOT NULL
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
    planet_type character varying(20) NOT NULL,
    radius_km integer NOT NULL,
    orbital_period_d numeric(10,2),
    has_life boolean,
    has_rings boolean,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    spectral_class character(1) NOT NULL,
    temperature_k integer NOT NULL,
    mass_solar numeric(5,2),
    has_planets boolean DEFAULT true NOT NULL,
    visible_naked_eye boolean,
    galaxy_id integer NOT NULL
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
-- Name: mission mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission ALTER COLUMN mission_id SET DEFAULT nextval('public.mission_mission_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', true, true, 105.70, 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large neighbour', true, true, 220.00, 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral in Local Group', false, true, 50.00, 10000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Grand-design spiral', true, true, 100.00, 6000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Edge-on lenticular galaxy', true, false, 80.00, 11000);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Satellite dwarf', false, false, 14.00, 13000);


--
-- Data for Name: mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mission VALUES (1, 'Apollo 11', 1969, 'NASA', true, true, 8.1);
INSERT INTO public.mission VALUES (2, 'Voyager 1', 1977, 'NASA', false, false, 47000.0);
INSERT INTO public.mission VALUES (3, 'Cassini', 1997, 'NASA/ESA/ASI', false, false, 7200.0);
INSERT INTO public.mission VALUES (4, 'Hayabusa2', 2014, 'JAXA', false, true, 2160.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1609, 1737.40, 27.322, false, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, 11.27, 0.319, false, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1877, 6.20, 1.263, false, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1610, 1821.60, 1.769, true, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1610, 1560.80, 3.551, true, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1610, 2634.10, 7.155, false, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1610, 2410.30, 16.689, false, true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 1655, 2574.70, 15.945, true, true, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 1672, 763.80, 4.518, false, false, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 1671, 734.50, 79.322, false, false, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 1684, 561.40, 2.737, false, true, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 1684, 531.10, 1.888, false, false, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 1789, 252.10, 1.370, true, true, 6);
INSERT INTO public.moon VALUES (14, 'Miranda', 1948, 235.80, 1.413, true, false, 6);
INSERT INTO public.moon VALUES (15, 'Titania', 1787, 788.40, 8.706, false, true, 7);
INSERT INTO public.moon VALUES (16, 'Oberon', 1787, 761.40, 13.463, false, false, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', 1851, 578.90, 2.520, true, false, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', 1851, 584.70, 4.144, false, false, 7);
INSERT INTO public.moon VALUES (19, 'Triton', 1846, 1353.40, -5.877, true, true, 8);
INSERT INTO public.moon VALUES (20, 'Proteus', 1989, 210.00, 1.122, false, false, 8);
INSERT INTO public.moon VALUES (21, 'Charon', 1978, 606.00, 6.387, false, false, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 2440, 87.97, false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 6052, 224.70, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 6371, 365.25, true, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 3390, 686.98, false, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas giant', 69911, 4332.59, false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas giant', 58232, 10759.22, false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant', 25362, 30688.50, false, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice giant', 24622, 60182.00, false, true, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Terrestrial', 7160, 11.18, NULL, false, 2);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 'Terrestrial', 7360, 129.94, NULL, false, 3);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 'Terrestrial', 6371, 6.10, NULL, false, 4);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 'Gas giant', 71492, 3.52, false, false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G', 5778, 1.00, true, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'M', 3042, 0.12, true, false, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'A', 9940, 2.06, true, true, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'M', 3600, 16.50, true, true, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'A', 9602, 2.14, true, true, 1);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 'G', 5790, 1.08, true, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: mission_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.mission_mission_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


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
-- Name: mission mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_name_key UNIQUE (name);


--
-- Name: mission mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_pkey PRIMARY KEY (mission_id);


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

