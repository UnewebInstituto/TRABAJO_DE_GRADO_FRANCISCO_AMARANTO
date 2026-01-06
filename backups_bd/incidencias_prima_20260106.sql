--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    email text NOT NULL,
    name text
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."User_id_seq" OWNER TO postgres;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: areas_de_incidencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.areas_de_incidencia (
    id integer NOT NULL,
    nombre character varying(255),
    descripcion character varying(255),
    fecha_hora_creacion timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_hora_actualizacion timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.areas_de_incidencia OWNER TO postgres;

--
-- Name: areas_de_incidencia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.areas_de_incidencia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.areas_de_incidencia_id_seq OWNER TO postgres;

--
-- Name: areas_de_incidencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.areas_de_incidencia_id_seq OWNED BY public.areas_de_incidencia.id;


--
-- Name: cargos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cargos (
    id integer NOT NULL,
    nombre character varying(255),
    descripcion character varying(255),
    fecha_hora_creacion timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_hora_actualizacion time(6) without time zone
);


ALTER TABLE public.cargos OWNER TO postgres;

--
-- Name: cargos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cargos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cargos_id_seq OWNER TO postgres;

--
-- Name: cargos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cargos_id_seq OWNED BY public.cargos.id;


--
-- Name: estatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estatus (
    id integer NOT NULL,
    nombre character varying(255),
    descripcion character varying(255),
    fecha_hora_creacion timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_hora_actaulizacion timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.estatus OWNER TO postgres;

--
-- Name: estatus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estatus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estatus_id_seq OWNER TO postgres;

--
-- Name: estatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estatus_id_seq OWNED BY public.estatus.id;


--
-- Name: incidencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incidencias (
    id integer NOT NULL,
    tipo_id integer,
    usuario_id integer,
    fecha_hora_creacion timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_hora_actualizacion timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.incidencias OWNER TO postgres;

--
-- Name: incidencias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incidencias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incidencias_id_seq OWNER TO postgres;

--
-- Name: incidencias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incidencias_id_seq OWNED BY public.incidencias.id;


--
-- Name: tipos_de_incidencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipos_de_incidencia (
    id integer NOT NULL,
    area_id integer,
    nombre character varying(255),
    descripcion character varying(255),
    fecha_hora_creacion timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_hora_actualizacion timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tipos_de_incidencia OWNER TO postgres;

--
-- Name: tipos_de_incidencia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipos_de_incidencia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipos_de_incidencia_id_seq OWNER TO postgres;

--
-- Name: tipos_de_incidencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipos_de_incidencia_id_seq OWNED BY public.tipos_de_incidencia.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    cedula character varying(10),
    nombres character varying(255),
    apellidos character varying(255),
    correo_electronico character varying(255),
    telefono character varying(255),
    clave character varying(255),
    cargo_id integer,
    estatus_id integer,
    fecha_hora_creacion timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_hora_actualizacion timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Name: areas_de_incidencia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas_de_incidencia ALTER COLUMN id SET DEFAULT nextval('public.areas_de_incidencia_id_seq'::regclass);


--
-- Name: cargos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargos ALTER COLUMN id SET DEFAULT nextval('public.cargos_id_seq'::regclass);


--
-- Name: estatus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estatus ALTER COLUMN id SET DEFAULT nextval('public.estatus_id_seq'::regclass);


--
-- Name: incidencias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidencias ALTER COLUMN id SET DEFAULT nextval('public.incidencias_id_seq'::regclass);


--
-- Name: tipos_de_incidencia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_de_incidencia ALTER COLUMN id SET DEFAULT nextval('public.tipos_de_incidencia_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, email, name) FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
c6af3cf1-491a-4dcf-86d9-c724989c4fa1	9c5795694f19e662eca9d34524fc11b402a9d619494322ff38fcbdab9286499d	2025-12-25 21:36:13.121275-04	20251226013613_creacion_entidades_sistema	\N	\N	2025-12-25 21:36:13.029982-04	1
\.


--
-- Data for Name: areas_de_incidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.areas_de_incidencia (id, nombre, descripcion, fecha_hora_creacion, fecha_hora_actualizacion) FROM stdin;
\.


--
-- Data for Name: cargos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cargos (id, nombre, descripcion, fecha_hora_creacion, fecha_hora_actualizacion) FROM stdin;
1	Analista comercial de almacen I	Analista comercial de almacen I	2025-12-30 17:19:54.412-04	17:19:54.412
2	Supervisor de almacen	Supervisor de almacen	2025-12-30 17:19:54.412-04	17:19:54.412
\.


--
-- Data for Name: estatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estatus (id, nombre, descripcion, fecha_hora_creacion, fecha_hora_actaulizacion) FROM stdin;
\.


--
-- Data for Name: incidencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incidencias (id, tipo_id, usuario_id, fecha_hora_creacion, fecha_hora_actualizacion) FROM stdin;
\.


--
-- Data for Name: tipos_de_incidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipos_de_incidencia (id, area_id, nombre, descripcion, fecha_hora_creacion, fecha_hora_actualizacion) FROM stdin;
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, cedula, nombres, apellidos, correo_electronico, telefono, clave, cargo_id, estatus_id, fecha_hora_creacion, fecha_hora_actualizacion) FROM stdin;
\.


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, false);


--
-- Name: areas_de_incidencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.areas_de_incidencia_id_seq', 1, false);


--
-- Name: cargos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cargos_id_seq', 2, true);


--
-- Name: estatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estatus_id_seq', 1, false);


--
-- Name: incidencias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incidencias_id_seq', 1, false);


--
-- Name: tipos_de_incidencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipos_de_incidencia_id_seq', 1, false);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 1, false);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: areas_de_incidencia areas_de_incidencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas_de_incidencia
    ADD CONSTRAINT areas_de_incidencia_pkey PRIMARY KEY (id);


--
-- Name: cargos cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT cargos_pkey PRIMARY KEY (id);


--
-- Name: estatus estatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estatus
    ADD CONSTRAINT estatus_pkey PRIMARY KEY (id);


--
-- Name: incidencias incidencias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidencias
    ADD CONSTRAINT incidencias_pkey PRIMARY KEY (id);


--
-- Name: tipos_de_incidencia tipos_de_incidencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_de_incidencia
    ADD CONSTRAINT tipos_de_incidencia_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: incidencias incidencias_tipo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidencias
    ADD CONSTRAINT incidencias_tipo_id_fkey FOREIGN KEY (tipo_id) REFERENCES public.tipos_de_incidencia(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: incidencias incidencias_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidencias
    ADD CONSTRAINT incidencias_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: tipos_de_incidencia tipos_de_incidencia_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_de_incidencia
    ADD CONSTRAINT tipos_de_incidencia_area_id_fkey FOREIGN KEY (area_id) REFERENCES public.areas_de_incidencia(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: usuarios usuarios_cargo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_cargo_id_fkey FOREIGN KEY (cargo_id) REFERENCES public.cargos(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: usuarios usuarios_estatus_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_estatus_id_fkey FOREIGN KEY (estatus_id) REFERENCES public.estatus(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

