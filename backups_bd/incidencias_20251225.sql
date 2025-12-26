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
-- Name: areas_de_incidencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.areas_de_incidencia (
    id integer NOT NULL,
    nombre character varying(255),
    descripcion character varying(255),
    fecha_hora_creacion timestamp with time zone DEFAULT now(),
    fecha_hora_actualizacion timestamp with time zone DEFAULT now()
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
    fecha_hora_creacion timestamp with time zone DEFAULT now(),
    fecha_hora_actualizacion time with time zone DEFAULT now()
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
    fecha_hora_creacion timestamp with time zone DEFAULT now(),
    fecha_hora_actaulizacion timestamp with time zone DEFAULT now()
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
    fecha_hora_creacion timestamp with time zone DEFAULT now(),
    fecha_hora_actualizacion timestamp with time zone DEFAULT now()
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
    fecha_hora_creacion timestamp with time zone DEFAULT now(),
    fecha_hora_actualizacion timestamp with time zone DEFAULT now()
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
    fecha_hora_creacion timestamp with time zone DEFAULT now(),
    fecha_hora_actualizacion timestamp with time zone DEFAULT now()
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
-- Data for Name: areas_de_incidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.areas_de_incidencia (id, nombre, descripcion, fecha_hora_creacion, fecha_hora_actualizacion) FROM stdin;
1	Transporte primario	Zona de recepción de transporte primario	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
2	Pulmón	Zona de almacenamiento de productos terminados	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
3	Picking	Zona de armado de rutas	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
4	Patio	Zona de recepción de transporte secundario	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
5	Reempaque	Zona de recuperación de productos	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
6	Facturación	Zona de facturación de franquicias y ETS (Empresas de Transporte Secundario)	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
\.


--
-- Data for Name: cargos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cargos (id, nombre, descripcion, fecha_hora_creacion, fecha_hora_actualizacion) FROM stdin;
1	Analista comercial de almacen I	Analista comercial de almacen I	2025-12-18 09:18:00-04	09:18:00-04
2	Supervisor de almacen	Supervisor de almacen	2025-12-18 09:18:00-04	09:18:00-04
\.


--
-- Data for Name: estatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estatus (id, nombre, descripcion, fecha_hora_creacion, fecha_hora_actaulizacion) FROM stdin;
1	Activo	Activo en funciones	2025-12-18 09:18:00-04	2025-12-18 09:18:00-04
2	Inactivo	Inactivo motivado a permiso, reposo, vacaciones, desvinculación, otros	2025-12-18 09:18:00-04	2025-12-18 09:18:00-04
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
1	1	Productos con faltante	Faltantes de cajas o unidades	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
2	1	Productos con sobrante	Sobrantes de cajas	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
3	1	Productos en mal estado	Productos deteriorados	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
4	1	Productos con fecha próxima a vencerse	Productos no apto para consumo	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
5	1	Productos sin fecha de vencimiento	Productos con error en el fechado	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
6	1	Productos con error en la etiqueta	Productos mal identificados o sin identificación	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
7	1	Productos sin tapa	Productos sin sello o mal sellado	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
8	1	Paleta deteriorada	Paleta en riesgo	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
9	1	Gandola no correspondiente al centro logístico	Gandola con destino no correspondiente	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
10	1	Rotura de productos	Rotura o deterioro de productos por mala manipulación	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
11	2	Error de almacenaje	Incumplimiento del FIFO (primero en entrar primero en salir)	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
12	2	Productos con faltante	Faltantes de cajas o unidades	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
13	2	Productos con sobrante	Sobrantes de cajas	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
14	2	Rotura de productos	Rotura o deterioro de productos por mala manipulación	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
15	3	Inversión	Productos no correspondientes a la guía	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
16	3	Productos con fechas de consumo no correspondientes	Productos con fechas más nuevas que en el pulmón	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
17	3	Resto que supera altura límite	Productos con fechas más nuevas que en el pulmón	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
18	3	Transpaleta con falla	Transpaleta inoperativo	2025-12-18 08:19:00-04	2025-12-18 08:19:00-04
19	3	Montacarga con falla	Montacarga inoperativo	2025-12-18 08:19:00-04	2025-12-18 08:19:00-04
20	3	Productos con faltante	Faltantes de cajas o unidades	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
21	3	Productos con sobrante	Sobrantes de cajas	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
22	3	Rotura de productos	Rotura o deterioro de productos por mala manipulación	2025-12-17 22:07:00-04	2025-12-17 22:07:00-04
23	4	Mala recepción de vacíos	Error en conteo	2025-12-18 08:19:00-04	2025-12-18 08:19:00-04
24	4	Paleta deterioriada	Paleta no apta para traslado	2025-12-18 08:19:00-04	2025-12-18 08:19:00-04
25	4	Paleta con basura	Paleta con desechos incrustados	2025-12-18 08:19:00-04	2025-12-18 08:19:00-04
26	4	Devolución por productos vencidos	Productos no conforme	2025-12-18 08:19:00-04	2025-12-18 08:19:00-04
27	4	Productos con faltante	Faltantes de cajas o unidades	2025-12-18 08:19:00-04	2025-12-18 08:19:00-04
28	4	Productos con sobrante	Sobrantes de cajas	2025-12-18 08:19:00-04	2025-12-18 08:19:00-04
29	4	Rotura de productos	Rotura o deterioro de productos por mala manipulación	2025-12-18 08:19:00-04	2025-12-18 09:19:00-04
30	5	Productos vencidos	Productos no conforme	2025-12-18 08:19:00-04	2025-12-18 08:19:00-04
31	5	Productos con faltante	Faltantes de cajas o unidades	2025-12-18 08:19:00-04	2025-12-18 08:19:00-04
32	5	Productos con sobrante	Sobrantes de cajas	2025-12-18 08:19:00-04	2025-12-18 08:19:00-04
33	5	Rotura de productos	Rotura o deterioro de productos por mala manipulación	2025-12-18 08:19:00-04	2025-12-18 09:19:00-04
34	6	Saltos de correlativo	Fuera de secuencia número de factura	2025-12-18 08:19:00-04	2025-12-18 08:19:00-04
35	6	Error en placa vehículo ETS o Franquicia	Número de placa no correspondiente al vehículo	2025-12-18 08:19:00-04	2025-12-18 08:19:00-04
36	6	Error en pedido	Despacho no acorde al pedido del cliente	2025-12-18 08:19:00-04	2025-12-18 08:19:00-04
37	6	Obsequio sin presupuesto	Ausencia de fondos en cuenta de obsequios para ser facturado	2025-12-18 08:19:00-04	2025-12-18 08:19:00-04
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, cedula, nombres, apellidos, correo_electronico, telefono, clave, cargo_id, estatus_id, fecha_hora_creacion, fecha_hora_actualizacion) FROM stdin;
1	V12345678	ANA MARIA	VASQUEZ PEREZ	av@correo.com	+5841412345678	bb58fd8dcab41e78d93c98a3204d438c	1	1	2025-12-18 10:15:00-04	2025-12-18 10:15:00-04
2	V22345678	YOLANDA MARIA	TORTOZA DIAZ	yt@correo.com	+5841223456789	2590836a386aad4ed559702a45a9c663	2	1	2025-12-18 10:15:00-04	2025-12-18 10:15:00-04
\.


--
-- Name: areas_de_incidencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.areas_de_incidencia_id_seq', 6, true);


--
-- Name: cargos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cargos_id_seq', 2, true);


--
-- Name: estatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estatus_id_seq', 2, true);


--
-- Name: incidencias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incidencias_id_seq', 1, false);


--
-- Name: tipos_de_incidencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipos_de_incidencia_id_seq', 37, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 2, true);


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
-- Name: incidencias incidencias_tipo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidencias
    ADD CONSTRAINT incidencias_tipo_id_fkey FOREIGN KEY (tipo_id) REFERENCES public.tipos_de_incidencia(id) NOT VALID;


--
-- Name: tipos_de_incidencia tipos_de_incidencia_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_de_incidencia
    ADD CONSTRAINT tipos_de_incidencia_area_id_fkey FOREIGN KEY (area_id) REFERENCES public.areas_de_incidencia(id) NOT VALID;


--
-- Name: usuarios usuarios_cargo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_cargo_id_fkey FOREIGN KEY (cargo_id) REFERENCES public.cargos(id) NOT VALID;


--
-- Name: usuarios usuarios_estatus_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_estatus_id_fkey FOREIGN KEY (estatus_id) REFERENCES public.estatus(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

