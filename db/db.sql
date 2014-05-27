--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: points; Type: TABLE; Schema: public; Owner: dave; Tablespace: 
--

CREATE TABLE points (
    id integer NOT NULL,
    lat double precision,
    lon double precision,
    "timestamp" timestamp without time zone,
    hdop double precision,
    altitude double precision,
    speed double precision,
    bearing double precision,
    profile_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.points OWNER TO dave;

--
-- Name: points_id_seq; Type: SEQUENCE; Schema: public; Owner: dave
--

CREATE SEQUENCE points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.points_id_seq OWNER TO dave;

--
-- Name: points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dave
--

ALTER SEQUENCE points_id_seq OWNED BY points.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: dave; Tablespace: 
--

CREATE TABLE profiles (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.profiles OWNER TO dave;

--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: dave
--

CREATE SEQUENCE profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_id_seq OWNER TO dave;

--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dave
--

ALTER SEQUENCE profiles_id_seq OWNED BY profiles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: dave; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO dave;

--
-- Name: users; Type: TABLE; Schema: public; Owner: dave; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(255),
    password character varying(255),
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO dave;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: dave
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO dave;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dave
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dave
--

ALTER TABLE ONLY points ALTER COLUMN id SET DEFAULT nextval('points_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dave
--

ALTER TABLE ONLY profiles ALTER COLUMN id SET DEFAULT nextval('profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dave
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: points; Type: TABLE DATA; Schema: public; Owner: dave
--

COPY points (id, lat, lon, "timestamp", hdop, altitude, speed, bearing, profile_id, user_id, created_at, updated_at) FROM stdin;
247	40.33249	-111.685689999999994	2014-05-22 19:45:53	15	1502	0	0	1	1	2014-05-22 19:45:53.475558	2014-05-22 19:45:53.475558
248	40.3325400000000016	-111.685715000000002	2014-05-22 19:47:53	3	1508	0	0	1	1	2014-05-22 19:47:53.438668	2014-05-22 19:47:53.438668
249	40.3267170000000021	-111.686645999999996	2014-05-22 19:49:53	3	1466	0	0	1	1	2014-05-22 19:49:53.470973	2014-05-22 19:49:53.470973
250	40.3192000000000021	-111.676820000000006	2014-05-22 19:51:54	3	1455	9.76115300000000019	180.400000000000006	1	1	2014-05-22 19:51:56.358128	2014-05-22 19:51:56.358128
251	40.3121530000000021	-111.676734999999994	2014-05-22 19:53:54	3	1454	0	0	1	1	2014-05-22 19:53:54.475945	2014-05-22 19:53:54.475945
252	40.3114800000000031	-111.674660000000003	2014-05-22 19:55:55	3	1462	0	0	1	1	2014-05-22 19:55:55.449112	2014-05-22 19:55:55.449112
253	40.3114800000000031	-111.674670000000006	2014-05-22 19:57:56	3	1462	0	0	1	1	2014-05-22 19:57:56.396997	2014-05-22 19:57:56.396997
254	40.3118130000000008	-111.674359999999993	2014-05-22 19:59:57	3	1463	0	0	1	1	2014-05-22 19:59:57.801138	2014-05-22 19:59:57.801138
255	40.3151549999999972	-111.653390000000002	2014-05-22 20:01:58	3	1464	20.9132730000000002	56.7999999999999972	1	1	2014-05-22 20:01:58.409173	2014-05-22 20:01:58.409173
256	40.327773999999998	-111.630195999999998	2014-05-22 20:03:59	3	1499	24.1017459999999986	72.2000000000000028	1	1	2014-05-22 20:04:02.773017	2014-05-22 20:04:02.773017
257	40.3398699999999977	-111.607024999999993	2014-05-22 20:05:59	3	1543	17.4588010000000011	57.5	1	1	2014-05-22 20:06:00.986393	2014-05-22 20:06:00.986393
258	40.3480699999999999	-111.590149999999994	2014-05-22 20:08:00	3	1574	16.2011150000000015	58.7999999999999972	1	1	2014-05-22 20:08:01.281609	2014-05-22 20:08:01.281609
259	40.3602300000000014	-111.565340000000006	2014-05-22 20:10:01	3	1583	26.7209049999999984	57.1000000000000014	1	1	2014-05-22 20:10:02.393341	2014-05-22 20:10:02.393341
260	40.3722569999999976	-111.568725999999998	2014-05-22 20:12:02	4	1649	19.7917079999999999	339.800000000000011	1	1	2014-05-22 20:12:03.536006	2014-05-22 20:12:03.536006
261	40.3907999999999987	-111.576570000000004	2014-05-22 20:14:02	4	1834	13.6434750000000005	316.5	1	1	2014-05-22 20:14:03.491769	2014-05-22 20:14:03.491769
262	40.3968849999999975	-111.589299999999994	2014-05-22 20:16:03	3	1963	13.2242200000000008	313.199999999999989	1	1	2014-05-22 20:16:04.633264	2014-05-22 20:16:04.633264
263	40.4046969999999988	-111.601394999999997	2014-05-22 20:18:04	3	2073	9.97513400000000061	285.899999999999977	1	1	2014-05-22 20:18:05.257282	2014-05-22 20:18:05.257282
264	40.4050060000000002	-111.604349999999997	2014-05-22 20:20:05	3	2079	0	0	1	1	2014-05-22 20:20:06.237757	2014-05-22 20:20:06.237757
265	40.4050140000000013	-111.604370000000003	2014-05-22 20:22:07	3	2081	0	0	1	1	2014-05-22 20:22:08.561442	2014-05-22 20:22:08.561442
266	40.4050099999999972	-111.60436	2014-05-22 20:24:07	3	2081	0	0	1	1	2014-05-22 20:24:08.325777	2014-05-22 20:24:08.325777
267	40.4095840000000024	-111.602974000000003	2014-05-22 20:26:10	3	2174	3.98027629999999988	314.699999999999989	1	1	2014-05-22 20:26:10.747684	2014-05-22 20:26:10.747684
268	40.4086950000000016	-111.604060000000004	2014-05-22 20:28:10	3	2181	0	0	1	1	2014-05-22 20:28:11.29861	2014-05-22 20:28:11.29861
269	40.4100200000000029	-111.605155999999994	2014-05-22 20:30:11	3	2192	14.7765529999999998	29.5	1	1	2014-05-22 20:30:12.586109	2014-05-22 20:30:12.586109
270	40.4206429999999983	-111.605446000000001	2014-05-22 20:34:12	4	2343	9.24034600000000061	34.3999999999999986	1	1	2014-05-22 20:34:13.610604	2014-05-22 20:34:13.610604
271	40.4544330000000016	-111.574234000000004	2014-05-22 20:44:15	3	2212	14.7600440000000006	32.1000000000000014	1	1	2014-05-22 20:44:17.249708	2014-05-22 20:44:17.249708
272	40.4492699999999985	-111.562250000000006	2014-05-22 20:46:16	3	2094	3.19452669999999994	128.5	1	1	2014-05-22 20:46:18.350427	2014-05-22 20:46:18.350427
273	40.4566500000000033	-111.557980000000001	2014-05-22 20:52:18	3	1996	18.1249140000000004	151.900000000000006	1	1	2014-05-22 20:52:21.920013	2014-05-22 20:52:21.920013
274	40.449345000000001	-111.561869999999999	2014-05-22 20:54:18	3	2089	0	0	1	1	2014-05-22 20:54:19.377702	2014-05-22 20:54:19.377702
275	40.4553000000000011	-111.573769999999996	2014-05-22 20:56:18	3	2194	18.4579799999999992	210	1	1	2014-05-22 20:56:19.369972	2014-05-22 20:56:19.369972
276	40.4547460000000001	-111.582260000000005	2014-05-22 20:58:19	3	2235	6.89118999999999993	298.899999999999977	1	1	2014-05-22 20:58:20.603686	2014-05-22 20:58:20.603686
277	40.4592549999999989	-111.584334999999996	2014-05-22 21:00:20	3	2304	6.92104050000000015	279.800000000000011	1	1	2014-05-22 21:00:22.000978	2014-05-22 21:00:22.000978
278	40.4585399999999993	-111.581270000000004	2014-05-22 21:02:20	3	2333	0	0	1	1	2014-05-22 21:02:21.24745	2014-05-22 21:02:21.24745
279	40.4585399999999993	-111.581280000000007	2014-05-22 21:04:20	3	2334	0	0	1	1	2014-05-22 21:04:21.229735	2014-05-22 21:04:21.229735
280	40.458553000000002	-111.581276000000003	2014-05-22 21:06:20	3	2335	0	0	1	1	2014-05-22 21:06:21.435438	2014-05-22 21:06:21.435438
281	40.4585300000000032	-111.581270000000004	2014-05-22 21:08:21	3	2335	0	0	1	1	2014-05-22 21:08:22.683838	2014-05-22 21:08:22.683838
282	40.4616049999999987	-111.581370000000007	2014-05-22 21:10:21	3	2361	8.59635399999999983	346.399999999999977	1	1	2014-05-22 21:10:22.48231	2014-05-22 21:10:22.48231
283	40.4633200000000031	-111.583169999999996	2014-05-22 21:12:22	3	2375	0	0	1	1	2014-05-22 21:12:23.340872	2014-05-22 21:12:23.340872
284	40.4633260000000021	-111.583169999999996	2014-05-22 21:14:23	3	2376	0	0	1	1	2014-05-22 21:14:23.802308	2014-05-22 21:14:23.802308
285	40.464503999999998	-111.583539999999999	2014-05-22 21:16:23	4	2402	6.20532000000000039	84	1	1	2014-05-22 21:16:24.281623	2014-05-22 21:16:24.281623
286	40.4646839999999983	-111.581100000000006	2014-05-22 21:18:29	3	2417	0	0	1	1	2014-05-22 21:18:34.128448	2014-05-22 21:18:34.128448
287	40.4647099999999966	-111.581190000000007	2014-05-22 21:20:29	3	2416	2.39603849999999996	236.400000000000006	1	1	2014-05-22 21:20:30.665563	2014-05-22 21:20:30.665563
288	40.4635000000000034	-111.583330000000004	2014-05-22 21:22:29	3	2373	0.0100000000000000002	0	1	1	2014-05-22 21:22:30.405822	2014-05-22 21:22:30.405822
289	40.4591939999999965	-111.580924999999993	2014-05-22 21:24:31	3	2336	4.48264399999999963	180.699999999999989	1	1	2014-05-22 21:24:31.757985	2014-05-22 21:24:31.757985
290	40.4597660000000019	-111.584305000000001	2014-05-22 21:26:31	3	2312	3.81000000000000005	287.899999999999977	1	1	2014-05-22 21:26:32.623423	2014-05-22 21:26:32.623423
291	40.4569499999999991	-111.585350000000005	2014-05-22 21:28:32	3	2266	4.13937199999999983	144.599999999999994	1	1	2014-05-22 21:28:32.882817	2014-05-22 21:28:32.882817
292	40.4536930000000012	-111.580979999999997	2014-05-22 21:30:32	3	2213	3.66488740000000002	211	1	1	2014-05-22 21:30:33.717158	2014-05-22 21:30:33.717158
293	40.4361499999999978	-111.728386	2014-05-22 22:37:00	3	1590	19.9450779999999988	254	1	1	2014-05-22 22:37:23.425202	2014-05-22 22:37:23.425202
294	40.4324069999999978	-111.75076	2014-05-22 22:39:01	3	1521	14.3329339999999998	278.600000000000023	1	1	2014-05-22 22:39:03.589556	2014-05-22 22:39:03.589556
295	40.4130820000000028	-111.751890000000003	2014-05-22 22:41:02	3	1498	21.595559999999999	168.800000000000011	1	1	2014-05-22 22:41:03.936739	2014-05-22 22:41:03.936739
296	40.3909870000000026	-111.741079999999997	2014-05-22 22:43:02	3	1434	19.7804949999999984	129.199999999999989	1	1	2014-05-22 22:43:04.204093	2014-05-22 22:43:04.204093
297	40.3756979999999999	-111.739913999999999	2014-05-22 22:45:03	3	1395	0	0	1	1	2014-05-22 22:45:04.818503	2014-05-22 22:45:04.818503
298	40.3641050000000021	-111.738939999999999	2014-05-22 22:47:04	3	1387	0	0	1	1	2014-05-22 22:47:04.989679	2014-05-22 22:47:04.989679
299	40.3587899999999991	-111.738939999999999	2014-05-22 22:49:04	3	1377	0	0	1	1	2014-05-22 22:49:06.378899	2014-05-22 22:49:06.378899
300	40.3520469999999989	-111.731994999999998	2014-05-22 22:51:05	3	1377	0	0	1	1	2014-05-22 22:51:06.044372	2014-05-22 22:51:06.044372
301	40.3379940000000019	-111.717070000000007	2014-05-22 22:53:05	3	1414	21.2330509999999997	148	1	1	2014-05-22 22:53:06.429822	2014-05-22 22:53:06.429822
302	40.3337700000000012	-111.700419999999994	2014-05-22 22:55:06	3	1437	14.4906769999999998	89.7000000000000028	1	1	2014-05-22 22:55:07.156045	2014-05-22 22:55:07.156045
303	40.3325800000000001	-111.685760000000002	2014-05-22 22:57:07	3	1505	0	0	1	1	2014-05-22 22:57:08.0242	2014-05-22 22:57:08.0242
\.


--
-- Name: points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dave
--

SELECT pg_catalog.setval('points_id_seq', 303, true);


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: dave
--

COPY profiles (id, name, created_at, updated_at) FROM stdin;
1	car	2014-05-22 15:58:15.287026	2014-05-22 15:58:15.287026
2	cycle	2014-05-22 15:58:15.314313	2014-05-22 15:58:15.314313
3	pedestrian	2014-05-22 15:58:15.335785	2014-05-22 15:58:15.335785
\.


--
-- Name: profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dave
--

SELECT pg_catalog.setval('profiles_id_seq', 3, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: dave
--

COPY schema_migrations (version) FROM stdin;
20140522035726
20140522035951
20140522041310
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dave
--

COPY users (id, username, password, name, created_at, updated_at) FROM stdin;
1	dave	\N	Dave	2014-05-22 15:58:15.213475	2014-05-22 15:58:15.213475
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dave
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: points_pkey; Type: CONSTRAINT; Schema: public; Owner: dave; Tablespace: 
--

ALTER TABLE ONLY points
    ADD CONSTRAINT points_pkey PRIMARY KEY (id);


--
-- Name: profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: dave; Tablespace: 
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: dave; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: dave; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

