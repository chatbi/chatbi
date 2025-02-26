--
-- Name: assets; Type: TABLE; Schema: public; Owner: chatbi
--

CREATE TABLE public.assets (
    provider character varying(10),
    insighttype character varying(20),
    confidencelevel character varying(10),
    assetcqid character varying(10),
    account_id character varying(20),
    indicatorid character varying(30),
    indicatorruleid character varying(30),
    assetcategories character varying(20),
    synctimestamp timestamp without time zone,
    severity character varying(10)
);


ALTER TABLE public.assets OWNER TO chatbi;

--
-- Name: companies; Type: TABLE; Schema: public; Owner: chatbi
--

CREATE TABLE public.companies (
    id integer,
    name character varying(50),
    address text,
    email character varying(50),
    phone character varying(10)
);


ALTER TABLE public.companies OWNER TO chatbi;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: chatbi
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    number integer,
    status text,
    completed_at timestamp without time zone,
    created_at timestamp without time zone,
    product_id integer
);


ALTER TABLE public.orders OWNER TO chatbi;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: chatbi
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO chatbi;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chatbi
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: product_categories; Type: TABLE; Schema: public; Owner: chatbi
--

CREATE TABLE public.product_categories (
    id integer NOT NULL,
    created_at timestamp without time zone,
    name text
);


ALTER TABLE public.product_categories OWNER TO chatbi;

--
-- Name: product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: chatbi
--

CREATE SEQUENCE public.product_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_categories_id_seq OWNER TO chatbi;

--
-- Name: product_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chatbi
--

ALTER SEQUENCE public.product_categories_id_seq OWNED BY public.product_categories.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: chatbi
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name text,
    description text,
    created_at timestamp without time zone,
    supplier_id integer,
    product_category_id integer
);


ALTER TABLE public.products OWNER TO chatbi;

--
-- Name: products_clean; Type: TABLE; Schema: public; Owner: chatbi
--

CREATE TABLE public.products_clean (
    id integer,
    name text,
    description text,
    created_at timestamp without time zone,
    supplier_id integer,
    product_category_id integer,
    etl_build_ts date,
    etl_build_name text
);


ALTER TABLE public.products_clean OWNER TO chatbi;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: chatbi
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO chatbi;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chatbi
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: student_teacher; Type: TABLE; Schema: public; Owner: chatbi
--

CREATE TABLE public.student_teacher (
    student_id integer NOT NULL,
    teacher_id integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.student_teacher OWNER TO chatbi;

--
-- Name: student_teacher_id_seq; Type: SEQUENCE; Schema: public; Owner: chatbi
--

CREATE SEQUENCE public.student_teacher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_teacher_id_seq OWNER TO chatbi;

--
-- Name: student_teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chatbi
--

ALTER SEQUENCE public.student_teacher_id_seq OWNED BY public.student_teacher.id;


--
-- Name: student_teacher_student_id_seq; Type: SEQUENCE; Schema: public; Owner: chatbi
--

CREATE SEQUENCE public.student_teacher_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_teacher_student_id_seq OWNER TO chatbi;

--
-- Name: student_teacher_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chatbi
--

ALTER SEQUENCE public.student_teacher_student_id_seq OWNED BY public.student_teacher.student_id;


--
-- Name: student_teacher_teacher_id_seq; Type: SEQUENCE; Schema: public; Owner: chatbi
--

CREATE SEQUENCE public.student_teacher_teacher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_teacher_teacher_id_seq OWNER TO chatbi;

--
-- Name: student_teacher_teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chatbi
--

ALTER SEQUENCE public.student_teacher_teacher_id_seq OWNED BY public.student_teacher.teacher_id;


--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: chatbi
--

CREATE TABLE public.suppliers (
    id integer NOT NULL,
    address character varying(255) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    company character varying(255)
);


ALTER TABLE public.suppliers OWNER TO chatbi;

--
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: chatbi
--

CREATE SEQUENCE public.suppliers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.suppliers_id_seq OWNER TO chatbi;

--
-- Name: suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chatbi
--

ALTER SEQUENCE public.suppliers_id_seq OWNED BY public.suppliers.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: chatbi
--

CREATE TABLE public.teachers (
    id bigint NOT NULL,
    first_name character varying(25),
    last_name character varying(50),
    school character varying(50),
    hire_date date,
    salary numeric
);


ALTER TABLE public.teachers OWNER TO chatbi;

--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: chatbi
--

CREATE SEQUENCE public.teachers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teachers_id_seq OWNER TO chatbi;

--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chatbi
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: chatbi
--

CREATE TABLE public.users (
    id integer NOT NULL,
    city character varying(255),
    age integer,
    company character varying(255),
    gender text,
    created_at timestamp without time zone,
    first_name character varying(255),
    last_name character varying(255),
    state character varying(255)
);


ALTER TABLE public.users OWNER TO chatbi;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: chatbi
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO chatbi;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chatbi
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: chatbi
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: product_categories id; Type: DEFAULT; Schema: public; Owner: chatbi
--

ALTER TABLE ONLY public.product_categories ALTER COLUMN id SET DEFAULT nextval('public.product_categories_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: chatbi
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: student_teacher student_id; Type: DEFAULT; Schema: public; Owner: chatbi
--

ALTER TABLE ONLY public.student_teacher ALTER COLUMN student_id SET DEFAULT nextval('public.student_teacher_student_id_seq'::regclass);


--
-- Name: student_teacher teacher_id; Type: DEFAULT; Schema: public; Owner: chatbi
--

ALTER TABLE ONLY public.student_teacher ALTER COLUMN teacher_id SET DEFAULT nextval('public.student_teacher_teacher_id_seq'::regclass);


--
-- Name: student_teacher id; Type: DEFAULT; Schema: public; Owner: chatbi
--

ALTER TABLE ONLY public.student_teacher ALTER COLUMN id SET DEFAULT nextval('public.student_teacher_id_seq'::regclass);


--
-- Name: suppliers id; Type: DEFAULT; Schema: public; Owner: chatbi
--

ALTER TABLE ONLY public.suppliers ALTER COLUMN id SET DEFAULT nextval('public.suppliers_id_seq'::regclass);


--
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: chatbi
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: chatbi
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: chatbi
--

COPY public.assets (provider, insighttype, confidencelevel, assetcqid, account_id, indicatorid, indicatorruleid, assetcategories, synctimestamp, severity) FROM stdin;
AWS	ZombieAssets	High	id_001	3003557	UnusedPublicIP	UnattachedAzurePublicIP	Switch	2024-05-30 14:53:00	High
AWS	ZombieAssets	High	id_001	3003557	UnusedPublicIP	UnattachedAzurePublicIP	Infrastructure	2024-05-30 14:53:00	High
AWS	ZombieAssets	High	id_001	3003557	UnusedPublicIP	UnattachedAzurePublicIP	Gateway	2024-05-30 14:53:00	High
AWS	ZombieAssets	High	id_001	3003557	UnusedPublicIP	UnattachedAzurePublicIP	Network	2024-05-30 14:53:00	High
GCP	UnregisteredAssets	Medium	id_002	3003557	UnregisteredIPAM	UnregisteredIPAMARecord	Infrastructure	2024-05-30 15:00:00	Medium
GCP	UnregisteredAssets	Medium	id_002	3003557	UnregisteredIPAM	UnregisteredIPAMARecord	Gateway	2024-05-30 15:00:00	Medium
Azure	NoncompliantAssets	Low	id_003	3003557	UnregisteredDNS	UnregisteredDNSARecord	Gateway	2024-05-30 15:10:00	Low
Azure	NoncompliantAssets	Low	id_003	3003557	UnregisteredDNS	UnregisteredDNSARecord	Network	2024-05-30 15:10:00	Low
AWS	RegisteredAssets	Medium	id_004	3003557	UnattachedStorageVolume	UnattachedAWSLoadBalancerV1	Switch	2024-05-30 15:20:00	Clear
AWS	RegisteredAssets	Medium	id_004	3003557	UnattachedStorageVolume	UnattachedAWSLoadBalancerV1	Infrastructure	2024-05-30 15:20:00	Clear
GCP	UnregisteredAssets	High	id_005	3003557	UnusedPublicIP	UnattachedAWSLoadBalancerV2	Switch	2024-05-30 15:30:00	Info
GCP	UnregisteredAssets	High	id_005	3003557	UnusedPublicIP	UnattachedAWSLoadBalancerV2	Gateway	2024-05-30 15:30:00	Info
Azure	NoncompliantAssets	Medium	id_001	3003557	UnregisteredIPAM	UnregisteredIPAMPTRRecord	Infrastructure	2024-05-30 15:40:00	Clear
Azure	NoncompliantAssets	Medium	id_001	3003557	UnregisteredIPAM	UnregisteredIPAMPTRRecord	Network	2024-05-30 15:40:00	Clear
AWS	ZombieAssets	Low	id_002	3003557	UnregisteredDNS	UnregisteredDNSPTRRecord	Switch	2024-05-30 15:50:00	Low
AWS	ZombieAssets	Low	id_002	3003557	UnregisteredDNS	UnregisteredDNSPTRRecord	Network	2024-05-30 15:50:00	Low
GCP	RegisteredAssets	High	id_003	3003557	UnattachedStorageVolume	UnattachedAzurePublicIP	Switch	2024-05-30 16:00:00	High
GCP	RegisteredAssets	High	id_003	3003557	UnattachedStorageVolume	UnattachedAzurePublicIP	Infrastructure	2024-05-30 16:00:00	High
GCP	RegisteredAssets	High	id_003	3003557	UnattachedStorageVolume	UnattachedAzurePublicIP	Gateway	2024-05-30 16:00:00	High
Azure	NoncompliantAssets	Medium	id_004	3003557	UnusedPublicIP	UnattachedAzurePublicIP	Gateway	2024-05-30 16:10:00	Medium
AWS	ZombieAssets	Low	id_005	3003557	UnregisteredIPAM	UnregisteredDNSARecord	Switch	2024-05-30 16:20:00	Low
AWS	ZombieAssets	Low	id_005	3003557	UnregisteredIPAM	UnregisteredDNSARecord	Infrastructure	2024-05-30 16:20:00	Low
AWS	ZombieAssets	Low	id_005	3003557	UnregisteredIPAM	UnregisteredDNSARecord	Gateway	2024-05-30 16:20:00	Low
AWS	ZombieAssets	Low	id_005	3003557	UnregisteredIPAM	UnregisteredDNSARecord	Network	2024-05-30 16:20:00	Low
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: chatbi
--

COPY public.companies (id, name, address, email, phone) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: chatbi
--

COPY public.orders (id, user_id, number, status, completed_at, created_at, product_id) FROM stdin;
1	434	93	completed	2019-01-05 00:00:00	2019-01-02 00:00:00	3
2	554	38	shipped	2019-01-17 00:00:00	2019-01-02 00:00:00	78
3	41	38	completed	2019-01-27 00:00:00	2019-01-02 00:00:00	93
4	599	16	shipped	2019-01-09 00:00:00	2019-01-02 00:00:00	18
5	34	78	processing	2019-01-29 00:00:00	2019-01-02 00:00:00	93
6	327	10	completed	2019-01-27 00:00:00	2019-01-02 00:00:00	37
7	201	58	processing	2019-01-24 00:00:00	2019-01-02 00:00:00	18
8	590	18	shipped	2019-01-23 00:00:00	2019-01-03 00:00:00	69
9	449	62	completed	2019-01-26 00:00:00	2019-01-03 00:00:00	27
10	500	96	completed	2019-01-19 00:00:00	2019-01-03 00:00:00	12
11	478	45	processing	2019-01-23 00:00:00	2019-01-03 00:00:00	85
12	633	22	shipped	2019-01-04 00:00:00	2019-01-03 00:00:00	37
13	440	21	processing	2019-01-18 00:00:00	2019-01-03 00:00:00	60
14	178	95	completed	2019-01-15 00:00:00	2019-01-03 00:00:00	33
15	361	85	shipped	2019-01-27 00:00:00	2019-01-03 00:00:00	72
16	491	15	shipped	2019-01-26 00:00:00	2019-01-03 00:00:00	70
17	683	100	completed	2019-02-02 00:00:00	2019-01-04 00:00:00	33
18	377	14	completed	2019-02-03 00:00:00	2019-01-04 00:00:00	34
19	634	20	processing	2019-02-02 00:00:00	2019-01-04 00:00:00	41
20	309	99	processing	2019-01-14 00:00:00	2019-01-04 00:00:00	51
21	45	87	processing	2019-02-01 00:00:00	2019-01-04 00:00:00	50
22	654	72	shipped	2019-01-25 00:00:00	2019-01-05 00:00:00	39
23	519	7	processing	2019-01-11 00:00:00	2019-01-05 00:00:00	50
24	111	66	shipped	2019-01-11 00:00:00	2019-01-05 00:00:00	89
25	29	95	shipped	2019-01-30 00:00:00	2019-01-05 00:00:00	53
26	596	14	shipped	2019-02-02 00:00:00	2019-01-05 00:00:00	71
27	626	4	shipped	2019-01-30 00:00:00	2019-01-05 00:00:00	83
28	330	84	shipped	2019-01-28 00:00:00	2019-01-05 00:00:00	19
29	486	37	completed	2019-01-17 00:00:00	2019-01-05 00:00:00	88
30	278	100	completed	2019-01-31 00:00:00	2019-01-05 00:00:00	88
31	302	50	processing	2019-01-29 00:00:00	2019-01-06 00:00:00	10
32	413	70	processing	2019-01-10 00:00:00	2019-01-06 00:00:00	39
33	60	59	processing	2019-01-15 00:00:00	2019-01-06 00:00:00	44
34	277	80	completed	2019-02-03 00:00:00	2019-01-06 00:00:00	45
35	72	24	shipped	2019-01-31 00:00:00	2019-01-06 00:00:00	42
36	352	10	shipped	2019-01-07 00:00:00	2019-01-06 00:00:00	44
37	658	62	processing	2019-01-27 00:00:00	2019-01-07 00:00:00	82
38	197	100	shipped	2019-01-22 00:00:00	2019-01-07 00:00:00	29
39	663	52	processing	2019-01-26 00:00:00	2019-01-07 00:00:00	14
40	368	17	shipped	2019-02-03 00:00:00	2019-01-07 00:00:00	13
41	19	56	shipped	2019-01-25 00:00:00	2019-01-08 00:00:00	95
42	53	56	processing	2019-01-16 00:00:00	2019-01-08 00:00:00	76
43	243	97	shipped	2019-02-07 00:00:00	2019-01-08 00:00:00	75
44	231	68	shipped	2019-01-16 00:00:00	2019-01-08 00:00:00	57
45	587	9	completed	2019-01-17 00:00:00	2019-01-09 00:00:00	51
46	87	67	completed	2019-01-13 00:00:00	2019-01-09 00:00:00	53
47	193	4	processing	2019-01-12 00:00:00	2019-01-09 00:00:00	75
48	551	61	processing	2019-02-08 00:00:00	2019-01-09 00:00:00	50
49	199	94	processing	2019-01-11 00:00:00	2019-01-10 00:00:00	45
50	609	45	shipped	2019-02-08 00:00:00	2019-01-10 00:00:00	30
51	172	69	shipped	2019-01-13 00:00:00	2019-01-10 00:00:00	38
52	571	46	processing	2019-01-23 00:00:00	2019-01-10 00:00:00	16
53	471	40	shipped	2019-02-09 00:00:00	2019-01-11 00:00:00	75
54	75	98	shipped	2019-01-26 00:00:00	2019-01-11 00:00:00	52
55	46	16	completed	2019-02-09 00:00:00	2019-01-11 00:00:00	32
56	349	24	processing	2019-01-21 00:00:00	2019-01-11 00:00:00	67
57	108	40	completed	2019-01-14 00:00:00	2019-01-12 00:00:00	19
58	244	80	shipped	2019-01-13 00:00:00	2019-01-12 00:00:00	12
59	179	79	completed	2019-01-28 00:00:00	2019-01-12 00:00:00	68
60	413	98	shipped	2019-02-05 00:00:00	2019-01-12 00:00:00	27
61	488	85	completed	2019-02-11 00:00:00	2019-01-12 00:00:00	37
62	141	27	processing	2019-02-07 00:00:00	2019-01-12 00:00:00	5
63	533	66	completed	2019-02-10 00:00:00	2019-01-12 00:00:00	29
64	548	89	shipped	2019-01-29 00:00:00	2019-01-13 00:00:00	21
65	81	60	completed	2019-01-21 00:00:00	2019-01-14 00:00:00	60
66	264	98	completed	2019-01-26 00:00:00	2019-01-14 00:00:00	41
67	13	71	shipped	2019-01-21 00:00:00	2019-01-15 00:00:00	47
68	15	26	shipped	2019-02-08 00:00:00	2019-01-15 00:00:00	23
69	30	93	shipped	2019-02-06 00:00:00	2019-01-15 00:00:00	73
70	370	72	shipped	2019-01-18 00:00:00	2019-01-15 00:00:00	41
71	687	65	processing	2019-01-23 00:00:00	2019-01-15 00:00:00	8
72	390	60	processing	2019-01-26 00:00:00	2019-01-15 00:00:00	80
73	373	46	shipped	2019-01-19 00:00:00	2019-01-16 00:00:00	98
74	675	38	completed	2019-02-04 00:00:00	2019-01-16 00:00:00	27
75	524	27	completed	2019-02-11 00:00:00	2019-01-16 00:00:00	72
76	382	12	shipped	2019-02-14 00:00:00	2019-01-16 00:00:00	12
77	189	46	completed	2019-01-22 00:00:00	2019-01-16 00:00:00	3
78	80	32	processing	2019-01-27 00:00:00	2019-01-16 00:00:00	79
79	623	2	processing	2019-01-29 00:00:00	2019-01-16 00:00:00	50
80	468	93	completed	2019-01-22 00:00:00	2019-01-16 00:00:00	59
81	169	100	completed	2019-01-22 00:00:00	2019-01-17 00:00:00	83
82	446	82	processing	2019-02-10 00:00:00	2019-01-18 00:00:00	83
83	327	14	shipped	2019-02-11 00:00:00	2019-01-18 00:00:00	6
84	468	25	shipped	2019-02-06 00:00:00	2019-01-18 00:00:00	93
85	23	77	processing	2019-01-28 00:00:00	2019-01-18 00:00:00	3
86	253	27	shipped	2019-02-09 00:00:00	2019-01-18 00:00:00	47
87	319	98	completed	2019-01-19 00:00:00	2019-01-18 00:00:00	9
88	227	50	processing	2019-02-13 00:00:00	2019-01-18 00:00:00	53
89	410	99	shipped	2019-01-28 00:00:00	2019-01-19 00:00:00	8
90	672	57	shipped	2019-02-13 00:00:00	2019-01-19 00:00:00	80
91	59	85	shipped	2019-01-29 00:00:00	2019-01-19 00:00:00	1
92	490	91	completed	2019-01-21 00:00:00	2019-01-19 00:00:00	91
93	446	85	completed	2019-01-29 00:00:00	2019-01-20 00:00:00	49
94	406	30	processing	2019-02-06 00:00:00	2019-01-20 00:00:00	71
95	612	34	shipped	2019-02-19 00:00:00	2019-01-20 00:00:00	70
96	521	93	processing	2019-01-28 00:00:00	2019-01-20 00:00:00	93
97	598	71	shipped	2019-02-16 00:00:00	2019-01-20 00:00:00	44
98	264	27	processing	2019-01-28 00:00:00	2019-01-20 00:00:00	41
99	276	26	processing	2019-02-12 00:00:00	2019-01-20 00:00:00	50
100	261	21	completed	2019-02-11 00:00:00	2019-01-20 00:00:00	50
101	452	14	processing	2019-01-30 00:00:00	2019-01-20 00:00:00	37
102	163	63	shipped	2019-02-08 00:00:00	2019-01-20 00:00:00	3
103	389	83	shipped	2019-01-30 00:00:00	2019-01-20 00:00:00	43
104	600	77	completed	2019-01-22 00:00:00	2019-01-20 00:00:00	23
105	246	92	completed	2019-02-18 00:00:00	2019-01-20 00:00:00	30
106	13	35	completed	2019-02-12 00:00:00	2019-01-21 00:00:00	58
107	578	63	completed	2019-02-02 00:00:00	2019-01-21 00:00:00	93
108	525	92	processing	2019-01-31 00:00:00	2019-01-21 00:00:00	48
110	186	64	processing	2019-02-13 00:00:00	2019-01-21 00:00:00	15
112	423	92	processing	2019-02-06 00:00:00	2019-01-21 00:00:00	32
114	204	68	processing	2019-02-18 00:00:00	2019-01-21 00:00:00	15
115	229	35	shipped	2019-02-16 00:00:00	2019-01-22 00:00:00	92
116	307	94	completed	2019-02-12 00:00:00	2019-01-22 00:00:00	94
117	67	21	completed	2019-02-21 00:00:00	2019-01-22 00:00:00	79
118	67	31	shipped	2019-02-21 00:00:00	2019-01-22 00:00:00	4
119	555	100	completed	2019-02-06 00:00:00	2019-01-22 00:00:00	26
109	340	70	processing	2019-01-26 00:00:00	2019-01-21 00:00:00	15
111	164	1	shipped	2019-01-30 00:00:00	2019-01-21 00:00:00	88
113	639	54	shipped	2019-02-07 00:00:00	2019-01-21 00:00:00	10
120	14	64	shipped	2019-02-17 00:00:00	2019-01-22 00:00:00	43
121	494	85	shipped	2019-02-17 00:00:00	2019-01-23 00:00:00	17
122	36	21	processing	2019-01-25 00:00:00	2019-01-23 00:00:00	66
123	291	37	shipped	2019-02-18 00:00:00	2019-01-23 00:00:00	73
124	210	6	shipped	2019-02-09 00:00:00	2019-01-23 00:00:00	53
125	450	100	shipped	2019-02-05 00:00:00	2019-01-23 00:00:00	95
126	366	41	shipped	2019-01-27 00:00:00	2019-01-23 00:00:00	40
127	214	33	processing	2019-02-16 00:00:00	2019-01-23 00:00:00	17
128	263	87	processing	2019-02-04 00:00:00	2019-01-23 00:00:00	99
129	76	7	completed	2019-01-28 00:00:00	2019-01-24 00:00:00	93
130	235	29	processing	2019-01-25 00:00:00	2019-01-24 00:00:00	20
131	170	98	completed	2019-02-23 00:00:00	2019-01-24 00:00:00	47
132	508	31	processing	2019-02-02 00:00:00	2019-01-24 00:00:00	8
133	149	91	processing	2019-02-03 00:00:00	2019-01-25 00:00:00	91
134	651	90	completed	2019-02-21 00:00:00	2019-01-25 00:00:00	69
135	460	8	completed	2019-01-28 00:00:00	2019-01-25 00:00:00	77
136	375	27	processing	2019-02-11 00:00:00	2019-01-25 00:00:00	88
137	694	35	completed	2019-02-12 00:00:00	2019-01-25 00:00:00	1
138	267	21	shipped	2019-02-06 00:00:00	2019-01-25 00:00:00	33
139	49	51	processing	2019-02-24 00:00:00	2019-01-26 00:00:00	77
140	194	44	completed	2019-01-30 00:00:00	2019-01-26 00:00:00	32
141	290	1	processing	2019-01-31 00:00:00	2019-01-27 00:00:00	17
142	166	100	shipped	2019-02-15 00:00:00	2019-01-28 00:00:00	41
143	649	61	completed	2019-02-17 00:00:00	2019-01-28 00:00:00	95
144	140	83	shipped	2019-02-19 00:00:00	2019-01-28 00:00:00	65
145	396	11	shipped	2019-02-28 00:00:00	2019-01-29 00:00:00	99
146	500	71	processing	2019-02-02 00:00:00	2019-01-29 00:00:00	45
147	300	12	processing	2019-02-26 00:00:00	2019-01-29 00:00:00	74
148	18	2	completed	2019-02-12 00:00:00	2019-01-30 00:00:00	13
149	328	81	shipped	2019-02-17 00:00:00	2019-01-30 00:00:00	61
150	452	100	completed	2019-02-28 00:00:00	2019-01-30 00:00:00	45
151	241	9	completed	2019-02-25 00:00:00	2019-01-31 00:00:00	21
152	466	96	processing	2019-02-17 00:00:00	2019-01-31 00:00:00	47
153	287	51	completed	2019-02-05 00:00:00	2019-01-31 00:00:00	51
154	535	16	completed	2019-02-01 00:00:00	2019-01-31 00:00:00	17
155	117	79	processing	2019-02-19 00:00:00	2019-01-31 00:00:00	37
156	458	2	completed	2019-03-01 00:00:00	2019-02-01 00:00:00	10
157	486	32	shipped	2019-02-16 00:00:00	2019-02-01 00:00:00	26
158	304	78	completed	2019-02-18 00:00:00	2019-02-01 00:00:00	81
159	181	65	shipped	2019-02-21 00:00:00	2019-02-01 00:00:00	92
160	180	30	shipped	2019-02-07 00:00:00	2019-02-02 00:00:00	48
161	124	59	processing	2019-02-26 00:00:00	2019-02-03 00:00:00	67
162	175	87	completed	2019-02-18 00:00:00	2019-02-03 00:00:00	27
163	57	15	completed	2019-02-12 00:00:00	2019-02-04 00:00:00	70
164	314	93	processing	2019-02-24 00:00:00	2019-02-04 00:00:00	52
165	388	17	shipped	2019-02-17 00:00:00	2019-02-05 00:00:00	92
166	482	7	processing	2019-03-02 00:00:00	2019-02-05 00:00:00	66
167	661	24	completed	2019-02-18 00:00:00	2019-02-05 00:00:00	3
168	691	59	shipped	2019-02-14 00:00:00	2019-02-05 00:00:00	75
169	295	12	processing	2019-02-20 00:00:00	2019-02-06 00:00:00	79
170	481	100	shipped	2019-02-14 00:00:00	2019-02-06 00:00:00	97
171	537	44	shipped	2019-02-21 00:00:00	2019-02-07 00:00:00	48
172	316	86	completed	2019-03-06 00:00:00	2019-02-07 00:00:00	82
173	661	42	processing	2019-02-11 00:00:00	2019-02-07 00:00:00	42
174	355	55	shipped	2019-02-21 00:00:00	2019-02-07 00:00:00	47
175	251	57	shipped	2019-02-26 00:00:00	2019-02-07 00:00:00	92
176	177	53	completed	2019-02-24 00:00:00	2019-02-08 00:00:00	91
177	599	89	completed	2019-02-17 00:00:00	2019-02-08 00:00:00	84
178	82	47	processing	2019-02-11 00:00:00	2019-02-09 00:00:00	63
179	534	92	processing	2019-02-27 00:00:00	2019-02-09 00:00:00	55
180	630	61	completed	2019-02-22 00:00:00	2019-02-09 00:00:00	80
181	94	42	processing	2019-02-11 00:00:00	2019-02-10 00:00:00	67
182	517	47	completed	2019-03-01 00:00:00	2019-02-10 00:00:00	57
183	78	4	shipped	2019-02-19 00:00:00	2019-02-10 00:00:00	33
184	688	82	completed	2019-02-12 00:00:00	2019-02-10 00:00:00	73
185	286	97	completed	2019-03-05 00:00:00	2019-02-10 00:00:00	25
186	15	25	completed	2019-02-27 00:00:00	2019-02-11 00:00:00	16
187	451	58	processing	2019-03-01 00:00:00	2019-02-11 00:00:00	15
188	485	87	processing	2019-02-21 00:00:00	2019-02-11 00:00:00	62
189	699	38	processing	2019-03-06 00:00:00	2019-02-11 00:00:00	56
190	84	96	processing	2019-02-13 00:00:00	2019-02-11 00:00:00	26
191	473	52	completed	2019-03-03 00:00:00	2019-02-11 00:00:00	54
192	104	89	completed	2019-02-21 00:00:00	2019-02-11 00:00:00	63
193	80	44	completed	2019-02-20 00:00:00	2019-02-12 00:00:00	94
194	360	75	shipped	2019-02-15 00:00:00	2019-02-12 00:00:00	13
195	29	89	completed	2019-03-03 00:00:00	2019-02-12 00:00:00	67
196	557	92	shipped	2019-03-03 00:00:00	2019-02-13 00:00:00	52
197	228	9	completed	2019-02-28 00:00:00	2019-02-13 00:00:00	80
198	473	74	processing	2019-03-02 00:00:00	2019-02-13 00:00:00	64
199	296	52	completed	2019-02-26 00:00:00	2019-02-13 00:00:00	98
200	538	20	shipped	2019-02-24 00:00:00	2019-02-13 00:00:00	15
201	47	1	completed	2019-02-17 00:00:00	2019-02-13 00:00:00	66
202	44	8	shipped	2019-03-09 00:00:00	2019-02-13 00:00:00	41
203	58	20	completed	2019-03-13 00:00:00	2019-02-13 00:00:00	52
204	208	23	completed	2019-02-20 00:00:00	2019-02-13 00:00:00	42
205	660	34	completed	2019-03-07 00:00:00	2019-02-13 00:00:00	54
206	125	57	processing	2019-02-17 00:00:00	2019-02-13 00:00:00	29
207	43	3	completed	2019-03-06 00:00:00	2019-02-13 00:00:00	39
208	520	72	shipped	2019-03-15 00:00:00	2019-02-14 00:00:00	79
209	129	2	processing	2019-03-03 00:00:00	2019-02-15 00:00:00	4
210	435	10	processing	2019-03-03 00:00:00	2019-02-15 00:00:00	68
211	275	74	completed	2019-03-08 00:00:00	2019-02-15 00:00:00	89
212	325	67	shipped	2019-02-17 00:00:00	2019-02-15 00:00:00	56
213	132	53	completed	2019-03-17 00:00:00	2019-02-15 00:00:00	68
214	567	58	processing	2019-02-16 00:00:00	2019-02-15 00:00:00	34
215	324	13	shipped	2019-02-25 00:00:00	2019-02-15 00:00:00	21
216	388	94	completed	2019-02-17 00:00:00	2019-02-15 00:00:00	41
217	150	88	completed	2019-03-04 00:00:00	2019-02-16 00:00:00	8
218	513	30	shipped	2019-03-11 00:00:00	2019-02-16 00:00:00	100
219	358	74	processing	2019-02-22 00:00:00	2019-02-16 00:00:00	81
220	210	66	processing	2019-02-17 00:00:00	2019-02-16 00:00:00	41
221	299	87	completed	2019-02-26 00:00:00	2019-02-16 00:00:00	14
222	472	84	completed	2019-03-08 00:00:00	2019-02-16 00:00:00	35
223	410	42	completed	2019-02-20 00:00:00	2019-02-16 00:00:00	75
224	244	12	processing	2019-02-27 00:00:00	2019-02-16 00:00:00	63
225	353	71	completed	2019-03-05 00:00:00	2019-02-16 00:00:00	20
226	663	2	completed	2019-03-11 00:00:00	2019-02-16 00:00:00	67
227	439	47	processing	2019-03-17 00:00:00	2019-02-16 00:00:00	76
228	402	29	processing	2019-03-08 00:00:00	2019-02-16 00:00:00	53
229	665	34	completed	2019-02-18 00:00:00	2019-02-16 00:00:00	4
230	217	46	processing	2019-03-07 00:00:00	2019-02-16 00:00:00	36
231	31	63	completed	2019-02-28 00:00:00	2019-02-16 00:00:00	20
232	10	89	completed	2019-02-28 00:00:00	2019-02-16 00:00:00	7
233	569	70	shipped	2019-03-07 00:00:00	2019-02-17 00:00:00	41
234	582	96	completed	2019-03-14 00:00:00	2019-02-17 00:00:00	99
235	82	95	shipped	2019-03-17 00:00:00	2019-02-17 00:00:00	57
236	168	94	completed	2019-03-15 00:00:00	2019-02-17 00:00:00	78
237	343	53	completed	2019-03-04 00:00:00	2019-02-18 00:00:00	35
238	116	38	shipped	2019-03-07 00:00:00	2019-02-18 00:00:00	29
239	367	18	processing	2019-03-10 00:00:00	2019-02-19 00:00:00	80
240	104	17	processing	2019-02-26 00:00:00	2019-02-19 00:00:00	14
241	367	58	processing	2019-03-16 00:00:00	2019-02-20 00:00:00	92
242	87	16	completed	2019-03-10 00:00:00	2019-02-20 00:00:00	67
243	579	56	processing	2019-02-22 00:00:00	2019-02-20 00:00:00	98
244	481	79	shipped	2019-02-25 00:00:00	2019-02-20 00:00:00	21
245	195	80	completed	2019-03-16 00:00:00	2019-02-20 00:00:00	25
246	543	100	shipped	2019-03-09 00:00:00	2019-02-21 00:00:00	77
247	320	61	processing	2019-03-20 00:00:00	2019-02-22 00:00:00	48
248	292	57	completed	2019-02-23 00:00:00	2019-02-22 00:00:00	43
249	23	90	completed	2019-03-04 00:00:00	2019-02-23 00:00:00	16
250	695	78	processing	2019-03-06 00:00:00	2019-02-23 00:00:00	58
251	372	76	completed	2019-03-25 00:00:00	2019-02-23 00:00:00	93
252	506	3	shipped	2019-02-26 00:00:00	2019-02-23 00:00:00	99
253	549	63	completed	2019-03-05 00:00:00	2019-02-23 00:00:00	46
254	213	39	processing	2019-03-12 00:00:00	2019-02-23 00:00:00	55
255	330	44	shipped	2019-03-24 00:00:00	2019-02-23 00:00:00	56
256	57	31	processing	2019-03-22 00:00:00	2019-02-23 00:00:00	92
257	107	87	shipped	2019-03-02 00:00:00	2019-02-23 00:00:00	90
258	331	65	processing	2019-03-01 00:00:00	2019-02-23 00:00:00	11
259	60	40	processing	2019-03-15 00:00:00	2019-02-24 00:00:00	43
260	675	68	processing	2019-03-18 00:00:00	2019-02-24 00:00:00	11
261	199	73	shipped	2019-03-27 00:00:00	2019-02-25 00:00:00	28
262	63	60	processing	2019-03-25 00:00:00	2019-02-25 00:00:00	66
263	108	78	shipped	2019-03-05 00:00:00	2019-02-25 00:00:00	61
264	171	34	completed	2019-03-20 00:00:00	2019-02-25 00:00:00	4
265	573	36	processing	2019-03-22 00:00:00	2019-02-26 00:00:00	13
266	632	63	shipped	2019-03-05 00:00:00	2019-02-26 00:00:00	60
267	31	12	completed	2019-03-20 00:00:00	2019-02-26 00:00:00	92
268	91	24	shipped	2019-03-16 00:00:00	2019-02-26 00:00:00	77
269	577	55	shipped	2019-03-04 00:00:00	2019-02-26 00:00:00	44
270	282	87	shipped	2019-03-11 00:00:00	2019-02-26 00:00:00	38
271	594	4	shipped	2019-02-27 00:00:00	2019-02-26 00:00:00	66
272	209	62	completed	2019-03-07 00:00:00	2019-02-26 00:00:00	72
273	685	42	completed	2019-03-10 00:00:00	2019-02-26 00:00:00	49
274	459	65	completed	2019-03-23 00:00:00	2019-02-26 00:00:00	67
275	168	6	processing	2019-03-08 00:00:00	2019-02-26 00:00:00	61
276	461	62	processing	2019-03-27 00:00:00	2019-02-27 00:00:00	27
277	247	98	completed	2019-03-29 00:00:00	2019-02-27 00:00:00	31
278	445	72	processing	2019-03-19 00:00:00	2019-02-27 00:00:00	62
279	567	67	completed	2019-03-12 00:00:00	2019-02-27 00:00:00	100
280	651	22	completed	2019-03-06 00:00:00	2019-02-27 00:00:00	52
281	666	12	completed	2019-03-04 00:00:00	2019-02-28 00:00:00	17
282	26	80	shipped	2019-03-21 00:00:00	2019-02-28 00:00:00	27
283	477	50	shipped	2019-03-11 00:00:00	2019-03-01 00:00:00	84
284	92	88	shipped	2019-03-13 00:00:00	2019-03-01 00:00:00	68
285	58	35	processing	2019-03-28 00:00:00	2019-03-01 00:00:00	41
286	442	82	processing	2019-03-28 00:00:00	2019-03-01 00:00:00	75
287	449	90	processing	2019-03-25 00:00:00	2019-03-01 00:00:00	55
288	696	59	processing	2019-03-31 00:00:00	2019-03-01 00:00:00	74
289	166	68	shipped	2019-03-07 00:00:00	2019-03-01 00:00:00	29
290	561	42	shipped	2019-03-31 00:00:00	2019-03-01 00:00:00	84
291	380	96	completed	2019-03-12 00:00:00	2019-03-01 00:00:00	39
292	264	44	shipped	2019-03-17 00:00:00	2019-03-01 00:00:00	36
293	658	39	completed	2019-03-15 00:00:00	2019-03-01 00:00:00	69
294	167	87	processing	2019-03-21 00:00:00	2019-03-01 00:00:00	38
295	46	2	processing	2019-03-11 00:00:00	2019-03-02 00:00:00	71
296	517	67	processing	2019-03-14 00:00:00	2019-03-02 00:00:00	35
297	565	1	shipped	2019-03-15 00:00:00	2019-03-02 00:00:00	51
298	21	69	shipped	2019-03-29 00:00:00	2019-03-02 00:00:00	7
299	274	19	completed	2019-03-17 00:00:00	2019-03-02 00:00:00	84
300	606	18	shipped	2019-03-07 00:00:00	2019-03-02 00:00:00	17
301	498	49	processing	2019-03-26 00:00:00	2019-03-03 00:00:00	91
302	116	93	processing	2019-03-11 00:00:00	2019-03-03 00:00:00	25
303	636	8	completed	2019-03-28 00:00:00	2019-03-03 00:00:00	55
304	673	95	completed	2019-03-25 00:00:00	2019-03-03 00:00:00	36
305	280	51	shipped	2019-03-21 00:00:00	2019-03-04 00:00:00	47
306	557	84	processing	2019-03-30 00:00:00	2019-03-04 00:00:00	67
307	693	64	processing	2019-04-02 00:00:00	2019-03-04 00:00:00	32
308	598	15	completed	2019-03-07 00:00:00	2019-03-04 00:00:00	8
309	438	9	completed	2019-03-28 00:00:00	2019-03-04 00:00:00	89
310	600	59	shipped	2019-03-05 00:00:00	2019-03-04 00:00:00	92
311	27	63	completed	2019-03-12 00:00:00	2019-03-04 00:00:00	3
312	585	6	processing	2019-03-17 00:00:00	2019-03-04 00:00:00	65
313	402	12	shipped	2019-03-16 00:00:00	2019-03-05 00:00:00	98
314	537	98	processing	2019-03-13 00:00:00	2019-03-05 00:00:00	46
315	386	5	completed	2019-03-28 00:00:00	2019-03-05 00:00:00	80
316	514	38	completed	2019-03-14 00:00:00	2019-03-06 00:00:00	17
317	516	44	completed	2019-03-09 00:00:00	2019-03-06 00:00:00	5
318	66	69	shipped	2019-03-25 00:00:00	2019-03-06 00:00:00	80
319	226	77	processing	2019-03-17 00:00:00	2019-03-07 00:00:00	92
320	200	5	completed	2019-03-14 00:00:00	2019-03-07 00:00:00	5
321	533	47	processing	2019-04-05 00:00:00	2019-03-07 00:00:00	83
322	190	58	shipped	2019-04-04 00:00:00	2019-03-07 00:00:00	34
323	96	13	processing	2019-03-15 00:00:00	2019-03-07 00:00:00	30
324	639	34	shipped	2019-04-03 00:00:00	2019-03-07 00:00:00	99
325	683	50	shipped	2019-03-14 00:00:00	2019-03-08 00:00:00	80
326	14	80	processing	2019-03-31 00:00:00	2019-03-08 00:00:00	30
327	362	40	shipped	2019-03-21 00:00:00	2019-03-08 00:00:00	56
328	493	91	completed	2019-03-24 00:00:00	2019-03-08 00:00:00	52
329	630	10	completed	2019-04-03 00:00:00	2019-03-09 00:00:00	52
330	498	6	processing	2019-03-29 00:00:00	2019-03-09 00:00:00	37
331	376	16	processing	2019-03-27 00:00:00	2019-03-10 00:00:00	71
332	137	83	processing	2019-03-22 00:00:00	2019-03-10 00:00:00	100
333	29	34	completed	2019-03-30 00:00:00	2019-03-10 00:00:00	14
334	376	67	processing	2019-03-22 00:00:00	2019-03-10 00:00:00	90
335	457	49	completed	2019-03-18 00:00:00	2019-03-10 00:00:00	31
336	419	97	completed	2019-03-28 00:00:00	2019-03-10 00:00:00	5
337	295	48	shipped	2019-03-11 00:00:00	2019-03-10 00:00:00	88
338	487	39	processing	2019-03-17 00:00:00	2019-03-10 00:00:00	78
339	614	18	processing	2019-03-19 00:00:00	2019-03-10 00:00:00	52
340	634	99	processing	2019-03-13 00:00:00	2019-03-10 00:00:00	49
341	264	12	processing	2019-03-14 00:00:00	2019-03-10 00:00:00	22
342	106	47	processing	2019-03-20 00:00:00	2019-03-10 00:00:00	31
343	6	1	processing	2019-03-21 00:00:00	2019-03-11 00:00:00	72
344	157	79	processing	2019-03-18 00:00:00	2019-03-11 00:00:00	17
345	88	76	shipped	2019-03-14 00:00:00	2019-03-11 00:00:00	90
346	370	21	processing	2019-03-15 00:00:00	2019-03-11 00:00:00	19
347	220	40	shipped	2019-03-30 00:00:00	2019-03-11 00:00:00	50
348	539	39	shipped	2019-04-09 00:00:00	2019-03-11 00:00:00	24
349	478	46	shipped	2019-04-07 00:00:00	2019-03-11 00:00:00	74
350	609	78	shipped	2019-03-26 00:00:00	2019-03-11 00:00:00	83
351	444	74	shipped	2019-04-10 00:00:00	2019-03-11 00:00:00	45
352	539	61	processing	2019-03-16 00:00:00	2019-03-11 00:00:00	29
353	495	85	processing	2019-04-05 00:00:00	2019-03-11 00:00:00	47
354	531	37	processing	2019-03-15 00:00:00	2019-03-11 00:00:00	83
355	306	38	processing	2019-04-06 00:00:00	2019-03-11 00:00:00	44
356	286	48	processing	2019-04-10 00:00:00	2019-03-11 00:00:00	47
357	58	75	completed	2019-03-23 00:00:00	2019-03-11 00:00:00	36
358	529	38	completed	2019-04-09 00:00:00	2019-03-11 00:00:00	50
359	439	14	processing	2019-03-16 00:00:00	2019-03-11 00:00:00	54
360	549	8	shipped	2019-03-28 00:00:00	2019-03-11 00:00:00	14
361	407	12	completed	2019-04-09 00:00:00	2019-03-12 00:00:00	4
362	130	27	completed	2019-03-27 00:00:00	2019-03-12 00:00:00	39
363	368	67	completed	2019-04-09 00:00:00	2019-03-12 00:00:00	37
364	524	88	completed	2019-04-02 00:00:00	2019-03-12 00:00:00	75
365	481	58	processing	2019-03-21 00:00:00	2019-03-13 00:00:00	12
366	419	68	processing	2019-04-02 00:00:00	2019-03-13 00:00:00	60
367	129	15	processing	2019-03-19 00:00:00	2019-03-13 00:00:00	65
368	556	32	shipped	2019-03-25 00:00:00	2019-03-13 00:00:00	58
369	552	6	shipped	2019-04-12 00:00:00	2019-03-13 00:00:00	62
370	21	53	processing	2019-03-27 00:00:00	2019-03-14 00:00:00	1
371	322	48	completed	2019-04-12 00:00:00	2019-03-15 00:00:00	77
372	74	42	shipped	2019-04-01 00:00:00	2019-03-15 00:00:00	95
373	304	63	completed	2019-03-22 00:00:00	2019-03-15 00:00:00	74
374	255	64	completed	2019-04-10 00:00:00	2019-03-15 00:00:00	17
375	25	96	completed	2019-03-29 00:00:00	2019-03-15 00:00:00	45
376	139	21	shipped	2019-04-06 00:00:00	2019-03-16 00:00:00	73
377	370	98	completed	2019-04-14 00:00:00	2019-03-16 00:00:00	10
378	100	22	shipped	2019-04-03 00:00:00	2019-03-16 00:00:00	71
379	525	9	shipped	2019-03-27 00:00:00	2019-03-16 00:00:00	28
380	397	5	completed	2019-03-31 00:00:00	2019-03-16 00:00:00	74
381	302	40	shipped	2019-04-03 00:00:00	2019-03-16 00:00:00	79
382	89	10	shipped	2019-03-26 00:00:00	2019-03-16 00:00:00	17
383	487	19	completed	2019-03-29 00:00:00	2019-03-16 00:00:00	35
384	612	3	shipped	2019-03-20 00:00:00	2019-03-16 00:00:00	72
385	234	50	completed	2019-03-25 00:00:00	2019-03-17 00:00:00	5
386	546	7	processing	2019-03-30 00:00:00	2019-03-18 00:00:00	50
387	171	86	processing	2019-04-09 00:00:00	2019-03-18 00:00:00	21
388	468	73	completed	2019-04-04 00:00:00	2019-03-18 00:00:00	80
389	118	8	shipped	2019-03-24 00:00:00	2019-03-18 00:00:00	4
390	48	12	completed	2019-04-12 00:00:00	2019-03-18 00:00:00	47
391	327	55	completed	2019-04-14 00:00:00	2019-03-18 00:00:00	12
392	370	30	shipped	2019-03-22 00:00:00	2019-03-18 00:00:00	7
393	385	7	completed	2019-03-23 00:00:00	2019-03-18 00:00:00	67
394	508	64	completed	2019-04-16 00:00:00	2019-03-18 00:00:00	95
395	625	99	completed	2019-03-21 00:00:00	2019-03-18 00:00:00	78
396	329	98	processing	2019-03-24 00:00:00	2019-03-18 00:00:00	39
397	585	41	processing	2019-03-29 00:00:00	2019-03-18 00:00:00	4
398	2	92	shipped	2019-03-25 00:00:00	2019-03-18 00:00:00	29
399	341	20	processing	2019-04-05 00:00:00	2019-03-18 00:00:00	42
400	281	2	completed	2019-04-04 00:00:00	2019-03-18 00:00:00	83
401	31	5	shipped	2019-03-30 00:00:00	2019-03-18 00:00:00	40
402	527	57	processing	2019-04-15 00:00:00	2019-03-18 00:00:00	6
403	474	27	completed	2019-03-22 00:00:00	2019-03-18 00:00:00	71
404	479	27	processing	2019-04-09 00:00:00	2019-03-18 00:00:00	33
405	527	33	completed	2019-03-24 00:00:00	2019-03-18 00:00:00	67
406	345	76	processing	2019-04-03 00:00:00	2019-03-18 00:00:00	68
407	481	93	processing	2019-03-24 00:00:00	2019-03-18 00:00:00	55
408	681	45	completed	2019-04-06 00:00:00	2019-03-18 00:00:00	19
409	44	37	completed	2019-03-20 00:00:00	2019-03-18 00:00:00	33
410	165	85	completed	2019-04-10 00:00:00	2019-03-18 00:00:00	53
411	181	88	completed	2019-03-23 00:00:00	2019-03-18 00:00:00	36
412	242	88	processing	2019-03-27 00:00:00	2019-03-18 00:00:00	60
413	481	82	shipped	2019-04-10 00:00:00	2019-03-18 00:00:00	2
414	313	31	completed	2019-03-24 00:00:00	2019-03-18 00:00:00	88
415	152	26	completed	2019-03-29 00:00:00	2019-03-19 00:00:00	59
416	623	14	shipped	2019-04-07 00:00:00	2019-03-19 00:00:00	79
417	601	11	shipped	2019-03-26 00:00:00	2019-03-19 00:00:00	19
418	257	35	completed	2019-04-15 00:00:00	2019-03-19 00:00:00	42
419	105	19	completed	2019-03-29 00:00:00	2019-03-19 00:00:00	58
420	22	8	completed	2019-04-01 00:00:00	2019-03-19 00:00:00	99
421	697	78	processing	2019-03-31 00:00:00	2019-03-20 00:00:00	74
422	192	28	shipped	2019-04-19 00:00:00	2019-03-20 00:00:00	22
423	129	60	shipped	2019-04-14 00:00:00	2019-03-20 00:00:00	87
424	198	47	processing	2019-04-06 00:00:00	2019-03-20 00:00:00	3
425	642	13	shipped	2019-04-07 00:00:00	2019-03-20 00:00:00	41
426	542	8	processing	2019-03-24 00:00:00	2019-03-20 00:00:00	81
427	261	83	processing	2019-04-15 00:00:00	2019-03-20 00:00:00	94
428	346	87	shipped	2019-04-11 00:00:00	2019-03-20 00:00:00	52
429	274	86	completed	2019-04-02 00:00:00	2019-03-20 00:00:00	51
430	42	30	completed	2019-03-21 00:00:00	2019-03-20 00:00:00	80
431	638	39	completed	2019-03-29 00:00:00	2019-03-20 00:00:00	71
432	534	95	completed	2019-03-22 00:00:00	2019-03-20 00:00:00	42
433	328	73	processing	2019-04-20 00:00:00	2019-03-21 00:00:00	87
434	249	88	shipped	2019-03-28 00:00:00	2019-03-21 00:00:00	26
435	138	69	completed	2019-03-29 00:00:00	2019-03-21 00:00:00	46
436	206	60	processing	2019-04-07 00:00:00	2019-03-21 00:00:00	85
437	212	34	shipped	2019-04-02 00:00:00	2019-03-21 00:00:00	93
438	120	32	shipped	2019-03-24 00:00:00	2019-03-21 00:00:00	85
442	557	13	processing	2019-04-17 00:00:00	2019-03-22 00:00:00	65
444	514	50	completed	2019-03-31 00:00:00	2019-03-22 00:00:00	70
445	524	88	completed	2019-04-16 00:00:00	2019-03-22 00:00:00	16
446	204	73	processing	2019-04-07 00:00:00	2019-03-23 00:00:00	23
448	497	44	shipped	2019-03-24 00:00:00	2019-03-23 00:00:00	38
449	597	28	shipped	2019-03-24 00:00:00	2019-03-23 00:00:00	38
452	343	46	completed	2019-04-15 00:00:00	2019-03-23 00:00:00	87
455	86	20	completed	2019-03-27 00:00:00	2019-03-23 00:00:00	99
459	634	57	shipped	2019-03-30 00:00:00	2019-03-25 00:00:00	88
461	634	31	processing	2019-04-03 00:00:00	2019-03-25 00:00:00	7
463	462	26	completed	2019-04-23 00:00:00	2019-03-26 00:00:00	67
464	207	3	shipped	2019-04-23 00:00:00	2019-03-26 00:00:00	75
466	321	7	processing	2019-04-24 00:00:00	2019-03-26 00:00:00	96
468	429	14	shipped	2019-03-30 00:00:00	2019-03-26 00:00:00	29
470	616	31	processing	2019-04-07 00:00:00	2019-03-27 00:00:00	22
471	55	44	completed	2019-04-16 00:00:00	2019-03-27 00:00:00	46
475	55	76	processing	2019-03-28 00:00:00	2019-03-27 00:00:00	28
477	115	97	shipped	2019-04-18 00:00:00	2019-03-28 00:00:00	32
479	607	50	processing	2019-04-11 00:00:00	2019-03-29 00:00:00	59
480	442	45	processing	2019-04-07 00:00:00	2019-03-29 00:00:00	15
439	119	65	processing	2019-03-26 00:00:00	2019-03-21 00:00:00	81
440	91	95	processing	2019-03-29 00:00:00	2019-03-21 00:00:00	99
441	223	22	processing	2019-04-02 00:00:00	2019-03-22 00:00:00	7
443	38	91	completed	2019-04-14 00:00:00	2019-03-22 00:00:00	66
447	690	44	completed	2019-03-25 00:00:00	2019-03-23 00:00:00	86
450	508	72	processing	2019-04-05 00:00:00	2019-03-23 00:00:00	92
451	251	93	shipped	2019-04-02 00:00:00	2019-03-23 00:00:00	98
453	130	39	shipped	2019-04-22 00:00:00	2019-03-23 00:00:00	89
454	297	22	completed	2019-04-06 00:00:00	2019-03-23 00:00:00	87
456	570	97	processing	2019-03-26 00:00:00	2019-03-24 00:00:00	43
457	282	41	processing	2019-04-16 00:00:00	2019-03-25 00:00:00	15
458	299	57	shipped	2019-03-26 00:00:00	2019-03-25 00:00:00	92
460	598	99	processing	2019-04-10 00:00:00	2019-03-25 00:00:00	46
462	334	3	processing	2019-04-20 00:00:00	2019-03-25 00:00:00	31
465	121	62	completed	2019-04-01 00:00:00	2019-03-26 00:00:00	19
467	224	67	completed	2019-04-12 00:00:00	2019-03-26 00:00:00	56
469	79	56	shipped	2019-04-12 00:00:00	2019-03-27 00:00:00	10
472	697	89	completed	2019-03-31 00:00:00	2019-03-27 00:00:00	18
473	351	16	processing	2019-04-22 00:00:00	2019-03-27 00:00:00	42
474	307	45	processing	2019-04-24 00:00:00	2019-03-27 00:00:00	8
476	424	6	shipped	2019-04-02 00:00:00	2019-03-28 00:00:00	82
478	670	25	completed	2019-04-25 00:00:00	2019-03-29 00:00:00	32
481	140	35	processing	2019-04-25 00:00:00	2019-03-30 00:00:00	100
482	271	71	shipped	2019-04-27 00:00:00	2019-03-30 00:00:00	93
483	328	7	completed	2019-04-14 00:00:00	2019-03-30 00:00:00	48
484	291	14	completed	2019-04-04 00:00:00	2019-03-30 00:00:00	21
485	539	55	processing	2019-04-29 00:00:00	2019-03-30 00:00:00	56
486	506	68	completed	2019-04-07 00:00:00	2019-03-31 00:00:00	23
487	418	55	completed	2019-04-22 00:00:00	2019-03-31 00:00:00	50
488	285	8	completed	2019-04-10 00:00:00	2019-03-31 00:00:00	91
489	178	70	completed	2019-04-29 00:00:00	2019-03-31 00:00:00	50
490	107	23	completed	2019-04-07 00:00:00	2019-03-31 00:00:00	33
491	54	2	shipped	2019-04-24 00:00:00	2019-03-31 00:00:00	77
492	156	77	completed	2019-04-27 00:00:00	2019-03-31 00:00:00	90
493	220	14	shipped	2019-04-12 00:00:00	2019-03-31 00:00:00	9
494	281	1	shipped	2019-04-07 00:00:00	2019-03-31 00:00:00	87
495	82	74	completed	2019-04-09 00:00:00	2019-03-31 00:00:00	16
496	370	60	completed	2019-04-29 00:00:00	2019-03-31 00:00:00	1
497	534	11	completed	2019-04-18 00:00:00	2019-04-01 00:00:00	71
498	335	70	shipped	2019-04-05 00:00:00	2019-04-01 00:00:00	76
499	391	68	completed	2019-04-30 00:00:00	2019-04-02 00:00:00	80
500	508	81	completed	2019-04-11 00:00:00	2019-04-02 00:00:00	97
501	160	46	processing	2019-04-23 00:00:00	2019-04-02 00:00:00	56
502	395	66	shipped	2019-04-16 00:00:00	2019-04-02 00:00:00	95
503	488	59	shipped	2019-04-20 00:00:00	2019-04-02 00:00:00	38
504	622	90	completed	2019-04-24 00:00:00	2019-04-02 00:00:00	16
505	589	74	processing	2019-04-10 00:00:00	2019-04-03 00:00:00	85
506	466	53	processing	2019-05-03 00:00:00	2019-04-03 00:00:00	69
507	649	31	processing	2019-04-11 00:00:00	2019-04-03 00:00:00	15
508	348	62	completed	2019-04-16 00:00:00	2019-04-03 00:00:00	1
509	501	44	completed	2019-04-12 00:00:00	2019-04-04 00:00:00	49
510	77	3	shipped	2019-04-28 00:00:00	2019-04-04 00:00:00	25
511	502	19	completed	2019-04-29 00:00:00	2019-04-04 00:00:00	44
512	558	94	completed	2019-04-28 00:00:00	2019-04-04 00:00:00	9
513	621	80	shipped	2019-04-26 00:00:00	2019-04-05 00:00:00	53
514	493	93	shipped	2019-05-01 00:00:00	2019-04-05 00:00:00	59
515	219	22	shipped	2019-04-23 00:00:00	2019-04-05 00:00:00	100
516	469	25	completed	2019-04-15 00:00:00	2019-04-05 00:00:00	60
517	386	64	shipped	2019-04-15 00:00:00	2019-04-06 00:00:00	62
518	266	55	processing	2019-04-26 00:00:00	2019-04-06 00:00:00	68
519	130	24	shipped	2019-04-12 00:00:00	2019-04-06 00:00:00	93
520	491	14	shipped	2019-05-04 00:00:00	2019-04-06 00:00:00	60
521	442	65	completed	2019-04-21 00:00:00	2019-04-06 00:00:00	82
522	19	62	shipped	2019-05-02 00:00:00	2019-04-06 00:00:00	1
523	448	98	shipped	2019-04-16 00:00:00	2019-04-06 00:00:00	11
524	625	46	completed	2019-04-23 00:00:00	2019-04-06 00:00:00	18
525	584	34	processing	2019-05-02 00:00:00	2019-04-07 00:00:00	67
526	182	28	processing	2019-04-21 00:00:00	2019-04-07 00:00:00	34
527	610	16	shipped	2019-05-02 00:00:00	2019-04-07 00:00:00	67
528	223	40	shipped	2019-05-05 00:00:00	2019-04-07 00:00:00	42
529	463	50	processing	2019-05-01 00:00:00	2019-04-07 00:00:00	26
530	36	71	shipped	2019-04-20 00:00:00	2019-04-07 00:00:00	71
531	467	8	completed	2019-04-10 00:00:00	2019-04-07 00:00:00	74
532	2	29	processing	2019-04-23 00:00:00	2019-04-07 00:00:00	56
533	638	44	completed	2019-04-09 00:00:00	2019-04-07 00:00:00	29
534	298	2	completed	2019-05-05 00:00:00	2019-04-07 00:00:00	65
535	346	39	processing	2019-04-23 00:00:00	2019-04-07 00:00:00	49
536	331	15	completed	2019-05-07 00:00:00	2019-04-07 00:00:00	70
537	699	28	processing	2019-04-23 00:00:00	2019-04-07 00:00:00	6
538	648	78	shipped	2019-04-09 00:00:00	2019-04-07 00:00:00	76
539	416	69	shipped	2019-04-15 00:00:00	2019-04-07 00:00:00	99
540	405	55	completed	2019-04-25 00:00:00	2019-04-07 00:00:00	11
541	437	72	processing	2019-05-03 00:00:00	2019-04-08 00:00:00	80
542	316	67	processing	2019-05-07 00:00:00	2019-04-08 00:00:00	57
543	384	38	shipped	2019-04-09 00:00:00	2019-04-08 00:00:00	63
544	675	54	shipped	2019-04-15 00:00:00	2019-04-08 00:00:00	60
545	628	88	shipped	2019-04-17 00:00:00	2019-04-08 00:00:00	99
546	538	27	processing	2019-04-15 00:00:00	2019-04-08 00:00:00	82
547	672	74	shipped	2019-04-24 00:00:00	2019-04-08 00:00:00	94
548	270	34	shipped	2019-04-19 00:00:00	2019-04-08 00:00:00	23
549	477	83	completed	2019-04-23 00:00:00	2019-04-08 00:00:00	71
550	350	76	completed	2019-05-02 00:00:00	2019-04-09 00:00:00	8
551	95	7	completed	2019-05-02 00:00:00	2019-04-09 00:00:00	87
552	168	56	processing	2019-05-03 00:00:00	2019-04-09 00:00:00	12
553	193	96	shipped	2019-04-10 00:00:00	2019-04-09 00:00:00	85
554	696	24	completed	2019-05-06 00:00:00	2019-04-09 00:00:00	56
555	338	62	completed	2019-05-05 00:00:00	2019-04-09 00:00:00	91
556	261	24	completed	2019-05-03 00:00:00	2019-04-10 00:00:00	47
557	459	68	processing	2019-05-07 00:00:00	2019-04-11 00:00:00	14
558	103	94	shipped	2019-04-13 00:00:00	2019-04-11 00:00:00	73
559	200	35	completed	2019-04-22 00:00:00	2019-04-12 00:00:00	46
560	441	13	shipped	2019-05-02 00:00:00	2019-04-12 00:00:00	94
561	256	46	processing	2019-05-07 00:00:00	2019-04-12 00:00:00	73
562	636	2	completed	2019-04-26 00:00:00	2019-04-12 00:00:00	13
563	609	48	completed	2019-05-10 00:00:00	2019-04-12 00:00:00	52
564	401	18	shipped	2019-05-06 00:00:00	2019-04-12 00:00:00	97
565	279	30	processing	2019-05-02 00:00:00	2019-04-12 00:00:00	72
566	28	5	completed	2019-05-02 00:00:00	2019-04-12 00:00:00	39
567	544	29	processing	2019-04-15 00:00:00	2019-04-12 00:00:00	16
568	520	76	completed	2019-04-19 00:00:00	2019-04-12 00:00:00	41
569	63	78	shipped	2019-04-21 00:00:00	2019-04-13 00:00:00	89
570	681	99	completed	2019-05-01 00:00:00	2019-04-13 00:00:00	2
571	254	32	processing	2019-04-25 00:00:00	2019-04-13 00:00:00	35
572	456	44	processing	2019-05-04 00:00:00	2019-04-13 00:00:00	79
573	426	16	completed	2019-04-21 00:00:00	2019-04-14 00:00:00	35
574	228	80	processing	2019-04-22 00:00:00	2019-04-14 00:00:00	1
575	551	47	shipped	2019-04-16 00:00:00	2019-04-15 00:00:00	100
576	363	5	shipped	2019-05-01 00:00:00	2019-04-15 00:00:00	90
577	553	80	completed	2019-04-22 00:00:00	2019-04-15 00:00:00	90
578	691	47	processing	2019-04-25 00:00:00	2019-04-15 00:00:00	79
579	332	53	processing	2019-04-20 00:00:00	2019-04-15 00:00:00	45
580	10	83	processing	2019-04-26 00:00:00	2019-04-15 00:00:00	12
581	360	30	processing	2019-04-25 00:00:00	2019-04-16 00:00:00	12
582	256	45	completed	2019-04-21 00:00:00	2019-04-17 00:00:00	93
583	505	6	shipped	2019-04-25 00:00:00	2019-04-17 00:00:00	97
584	678	45	processing	2019-04-24 00:00:00	2019-04-17 00:00:00	13
585	353	97	processing	2019-04-27 00:00:00	2019-04-17 00:00:00	44
586	245	82	shipped	2019-04-19 00:00:00	2019-04-17 00:00:00	31
587	238	97	processing	2019-04-26 00:00:00	2019-04-17 00:00:00	31
588	32	10	shipped	2019-04-27 00:00:00	2019-04-17 00:00:00	43
589	83	9	completed	2019-04-24 00:00:00	2019-04-17 00:00:00	44
590	406	51	shipped	2019-05-02 00:00:00	2019-04-17 00:00:00	37
591	299	71	completed	2019-04-23 00:00:00	2019-04-17 00:00:00	24
592	573	49	processing	2019-04-30 00:00:00	2019-04-17 00:00:00	93
593	248	20	shipped	2019-05-04 00:00:00	2019-04-17 00:00:00	84
594	255	2	completed	2019-05-10 00:00:00	2019-04-17 00:00:00	78
595	591	32	processing	2019-04-25 00:00:00	2019-04-17 00:00:00	61
596	20	62	shipped	2019-05-13 00:00:00	2019-04-17 00:00:00	5
597	274	77	processing	2019-04-20 00:00:00	2019-04-17 00:00:00	99
598	525	81	completed	2019-05-09 00:00:00	2019-04-17 00:00:00	5
599	615	30	processing	2019-04-24 00:00:00	2019-04-17 00:00:00	8
600	50	41	shipped	2019-04-25 00:00:00	2019-04-17 00:00:00	71
601	588	89	completed	2019-05-13 00:00:00	2019-04-17 00:00:00	79
602	601	23	completed	2019-05-10 00:00:00	2019-04-17 00:00:00	71
603	228	65	completed	2019-04-20 00:00:00	2019-04-17 00:00:00	4
604	222	54	processing	2019-04-25 00:00:00	2019-04-17 00:00:00	46
605	664	74	shipped	2019-04-25 00:00:00	2019-04-17 00:00:00	24
606	311	22	processing	2019-04-21 00:00:00	2019-04-17 00:00:00	63
607	279	45	completed	2019-04-23 00:00:00	2019-04-17 00:00:00	64
608	53	62	processing	2019-05-15 00:00:00	2019-04-17 00:00:00	73
609	551	7	processing	2019-05-06 00:00:00	2019-04-18 00:00:00	6
610	451	36	shipped	2019-05-06 00:00:00	2019-04-18 00:00:00	40
611	174	57	shipped	2019-05-04 00:00:00	2019-04-18 00:00:00	5
612	139	97	completed	2019-05-01 00:00:00	2019-04-18 00:00:00	96
613	679	99	shipped	2019-05-02 00:00:00	2019-04-19 00:00:00	22
614	45	17	processing	2019-05-03 00:00:00	2019-04-19 00:00:00	67
615	326	3	processing	2019-04-29 00:00:00	2019-04-19 00:00:00	50
616	502	29	shipped	2019-04-24 00:00:00	2019-04-19 00:00:00	2
617	622	10	completed	2019-05-15 00:00:00	2019-04-19 00:00:00	79
618	120	6	shipped	2019-05-12 00:00:00	2019-04-19 00:00:00	35
619	266	22	shipped	2019-05-19 00:00:00	2019-04-20 00:00:00	45
620	244	41	completed	2019-05-04 00:00:00	2019-04-20 00:00:00	39
621	162	21	shipped	2019-05-19 00:00:00	2019-04-20 00:00:00	57
622	403	98	shipped	2019-05-20 00:00:00	2019-04-21 00:00:00	32
623	187	91	processing	2019-04-23 00:00:00	2019-04-21 00:00:00	56
624	598	51	processing	2019-05-06 00:00:00	2019-04-21 00:00:00	23
625	93	6	shipped	2019-05-03 00:00:00	2019-04-22 00:00:00	32
626	490	62	processing	2019-05-21 00:00:00	2019-04-22 00:00:00	70
627	115	41	completed	2019-05-11 00:00:00	2019-04-22 00:00:00	86
628	295	60	processing	2019-05-15 00:00:00	2019-04-23 00:00:00	91
629	449	97	shipped	2019-05-16 00:00:00	2019-04-23 00:00:00	13
630	21	28	processing	2019-05-21 00:00:00	2019-04-23 00:00:00	76
631	140	83	shipped	2019-04-27 00:00:00	2019-04-24 00:00:00	48
632	249	45	processing	2019-05-03 00:00:00	2019-04-24 00:00:00	29
633	50	76	completed	2019-05-19 00:00:00	2019-04-25 00:00:00	50
634	510	17	completed	2019-04-30 00:00:00	2019-04-26 00:00:00	82
635	277	60	shipped	2019-05-26 00:00:00	2019-04-26 00:00:00	55
636	449	11	shipped	2019-05-14 00:00:00	2019-04-26 00:00:00	24
637	470	35	processing	2019-05-23 00:00:00	2019-04-27 00:00:00	63
638	321	9	processing	2019-05-23 00:00:00	2019-04-27 00:00:00	71
639	17	61	processing	2019-05-14 00:00:00	2019-04-27 00:00:00	32
640	183	45	completed	2019-04-30 00:00:00	2019-04-27 00:00:00	75
641	467	52	shipped	2019-05-03 00:00:00	2019-04-28 00:00:00	89
642	30	29	completed	2019-05-04 00:00:00	2019-04-28 00:00:00	22
643	377	87	processing	2019-05-15 00:00:00	2019-04-28 00:00:00	85
644	121	13	completed	2019-05-07 00:00:00	2019-04-28 00:00:00	30
645	230	38	processing	2019-05-20 00:00:00	2019-04-28 00:00:00	94
646	498	49	completed	2019-05-05 00:00:00	2019-04-29 00:00:00	45
647	549	65	shipped	2019-05-10 00:00:00	2019-04-29 00:00:00	89
648	644	49	processing	2019-05-26 00:00:00	2019-04-29 00:00:00	59
649	593	25	shipped	2019-05-06 00:00:00	2019-04-29 00:00:00	11
650	58	83	processing	2019-05-29 00:00:00	2019-04-29 00:00:00	8
651	686	8	shipped	2019-05-21 00:00:00	2019-04-29 00:00:00	28
652	541	96	shipped	2019-05-22 00:00:00	2019-04-30 00:00:00	33
653	612	81	processing	2019-05-16 00:00:00	2019-04-30 00:00:00	22
654	631	29	completed	2019-05-21 00:00:00	2019-04-30 00:00:00	96
655	381	79	processing	2019-05-09 00:00:00	2019-04-30 00:00:00	57
656	294	85	processing	2019-05-14 00:00:00	2019-04-30 00:00:00	69
657	81	87	processing	2019-05-24 00:00:00	2019-04-30 00:00:00	13
658	602	73	completed	2019-05-12 00:00:00	2019-04-30 00:00:00	82
659	593	36	completed	2019-05-16 00:00:00	2019-04-30 00:00:00	36
660	430	63	shipped	2019-05-21 00:00:00	2019-04-30 00:00:00	36
661	330	81	completed	2019-05-04 00:00:00	2019-05-01 00:00:00	95
662	165	39	shipped	2019-05-23 00:00:00	2019-05-01 00:00:00	43
663	363	100	processing	2019-05-06 00:00:00	2019-05-01 00:00:00	86
664	272	65	completed	2019-05-06 00:00:00	2019-05-01 00:00:00	89
665	341	34	processing	2019-05-15 00:00:00	2019-05-01 00:00:00	40
666	121	92	shipped	2019-05-29 00:00:00	2019-05-02 00:00:00	61
667	212	59	processing	2019-05-24 00:00:00	2019-05-03 00:00:00	36
668	320	75	shipped	2019-05-31 00:00:00	2019-05-03 00:00:00	19
669	564	10	shipped	2019-05-06 00:00:00	2019-05-03 00:00:00	3
670	332	90	processing	2019-05-19 00:00:00	2019-05-03 00:00:00	70
671	336	32	shipped	2019-05-06 00:00:00	2019-05-03 00:00:00	75
672	602	19	processing	2019-05-04 00:00:00	2019-05-03 00:00:00	63
673	360	1	processing	2019-05-22 00:00:00	2019-05-04 00:00:00	4
674	561	35	shipped	2019-05-11 00:00:00	2019-05-04 00:00:00	7
675	592	60	completed	2019-05-16 00:00:00	2019-05-04 00:00:00	27
677	637	7	shipped	2019-05-22 00:00:00	2019-05-05 00:00:00	40
678	619	94	processing	2019-05-11 00:00:00	2019-05-05 00:00:00	26
679	567	25	completed	2019-05-17 00:00:00	2019-05-05 00:00:00	26
676	391	1	shipped	2019-06-04 00:00:00	2019-05-05 00:00:00	96
680	302	11	processing	2019-05-28 00:00:00	2019-05-05 00:00:00	20
681	133	79	processing	2019-05-11 00:00:00	2019-05-06 00:00:00	69
682	67	17	processing	2019-05-23 00:00:00	2019-05-06 00:00:00	34
683	101	69	shipped	2019-05-17 00:00:00	2019-05-06 00:00:00	23
684	515	34	completed	2019-05-15 00:00:00	2019-05-06 00:00:00	43
685	200	70	completed	2019-05-30 00:00:00	2019-05-07 00:00:00	95
686	182	12	shipped	2019-05-28 00:00:00	2019-05-07 00:00:00	41
687	153	84	processing	2019-05-17 00:00:00	2019-05-07 00:00:00	93
688	110	78	processing	2019-05-10 00:00:00	2019-05-07 00:00:00	22
689	352	20	completed	2019-05-29 00:00:00	2019-05-07 00:00:00	28
690	47	49	processing	2019-05-17 00:00:00	2019-05-07 00:00:00	73
691	22	44	processing	2019-06-03 00:00:00	2019-05-08 00:00:00	45
692	250	50	completed	2019-05-26 00:00:00	2019-05-08 00:00:00	76
693	52	40	shipped	2019-05-31 00:00:00	2019-05-08 00:00:00	90
694	534	15	shipped	2019-05-27 00:00:00	2019-05-09 00:00:00	34
695	291	34	processing	2019-05-31 00:00:00	2019-05-09 00:00:00	38
696	439	12	completed	2019-05-10 00:00:00	2019-05-09 00:00:00	8
697	346	77	shipped	2019-05-20 00:00:00	2019-05-10 00:00:00	33
698	40	81	processing	2019-05-15 00:00:00	2019-05-10 00:00:00	42
699	571	9	processing	2019-05-14 00:00:00	2019-05-10 00:00:00	27
700	53	20	processing	2019-05-11 00:00:00	2019-05-10 00:00:00	15
701	582	21	completed	2019-05-21 00:00:00	2019-05-10 00:00:00	86
702	692	51	processing	2019-05-18 00:00:00	2019-05-10 00:00:00	30
703	211	89	shipped	2019-06-01 00:00:00	2019-05-11 00:00:00	56
704	672	84	shipped	2019-05-16 00:00:00	2019-05-11 00:00:00	11
705	53	59	completed	2019-05-17 00:00:00	2019-05-11 00:00:00	34
706	248	62	processing	2019-05-22 00:00:00	2019-05-11 00:00:00	90
707	266	87	shipped	2019-05-25 00:00:00	2019-05-11 00:00:00	17
708	562	78	completed	2019-05-14 00:00:00	2019-05-12 00:00:00	36
709	354	99	processing	2019-05-26 00:00:00	2019-05-12 00:00:00	77
710	23	4	completed	2019-05-23 00:00:00	2019-05-12 00:00:00	69
711	188	27	completed	2019-06-03 00:00:00	2019-05-13 00:00:00	80
712	638	93	completed	2019-05-26 00:00:00	2019-05-13 00:00:00	31
713	180	81	shipped	2019-06-13 00:00:00	2019-05-14 00:00:00	96
714	106	34	completed	2019-05-27 00:00:00	2019-05-14 00:00:00	71
715	14	80	processing	2019-05-27 00:00:00	2019-05-14 00:00:00	94
716	18	64	processing	2019-06-09 00:00:00	2019-05-14 00:00:00	58
717	513	38	shipped	2019-06-13 00:00:00	2019-05-14 00:00:00	71
718	467	10	processing	2019-06-09 00:00:00	2019-05-14 00:00:00	98
719	607	61	completed	2019-05-18 00:00:00	2019-05-14 00:00:00	13
720	564	16	processing	2019-05-22 00:00:00	2019-05-14 00:00:00	13
721	392	6	completed	2019-06-02 00:00:00	2019-05-15 00:00:00	44
722	531	70	completed	2019-06-14 00:00:00	2019-05-15 00:00:00	53
723	259	94	completed	2019-05-28 00:00:00	2019-05-15 00:00:00	31
724	503	62	processing	2019-06-08 00:00:00	2019-05-15 00:00:00	54
725	168	55	shipped	2019-06-11 00:00:00	2019-05-15 00:00:00	27
726	96	89	shipped	2019-05-25 00:00:00	2019-05-15 00:00:00	23
727	185	93	shipped	2019-05-22 00:00:00	2019-05-15 00:00:00	78
728	337	19	processing	2019-06-14 00:00:00	2019-05-15 00:00:00	27
729	375	12	completed	2019-06-02 00:00:00	2019-05-15 00:00:00	25
730	492	73	completed	2019-06-12 00:00:00	2019-05-16 00:00:00	25
731	211	92	completed	2019-06-08 00:00:00	2019-05-16 00:00:00	71
732	698	51	shipped	2019-06-03 00:00:00	2019-05-16 00:00:00	90
733	388	76	processing	2019-05-19 00:00:00	2019-05-17 00:00:00	58
734	15	47	processing	2019-06-11 00:00:00	2019-05-17 00:00:00	91
735	493	36	completed	2019-05-25 00:00:00	2019-05-17 00:00:00	68
736	21	37	completed	2019-05-29 00:00:00	2019-05-17 00:00:00	41
737	119	35	processing	2019-06-08 00:00:00	2019-05-17 00:00:00	3
738	74	95	completed	2019-06-16 00:00:00	2019-05-17 00:00:00	67
739	368	50	shipped	2019-05-31 00:00:00	2019-05-17 00:00:00	87
740	569	48	completed	2019-05-24 00:00:00	2019-05-17 00:00:00	81
741	689	92	processing	2019-06-12 00:00:00	2019-05-18 00:00:00	45
742	684	63	completed	2019-05-25 00:00:00	2019-05-19 00:00:00	85
743	220	24	completed	2019-06-01 00:00:00	2019-05-19 00:00:00	16
744	108	7	completed	2019-06-14 00:00:00	2019-05-19 00:00:00	21
745	573	9	shipped	2019-06-02 00:00:00	2019-05-20 00:00:00	11
746	473	61	shipped	2019-06-12 00:00:00	2019-05-20 00:00:00	69
747	192	63	shipped	2019-06-03 00:00:00	2019-05-20 00:00:00	56
748	273	79	completed	2019-05-22 00:00:00	2019-05-20 00:00:00	9
749	373	11	completed	2019-06-13 00:00:00	2019-05-20 00:00:00	98
750	543	80	shipped	2019-05-23 00:00:00	2019-05-20 00:00:00	41
751	369	3	completed	2019-05-31 00:00:00	2019-05-20 00:00:00	12
752	303	76	shipped	2019-06-07 00:00:00	2019-05-20 00:00:00	33
753	541	34	shipped	2019-05-25 00:00:00	2019-05-20 00:00:00	8
754	59	46	shipped	2019-06-19 00:00:00	2019-05-20 00:00:00	39
755	654	24	shipped	2019-05-24 00:00:00	2019-05-20 00:00:00	48
756	668	91	shipped	2019-06-17 00:00:00	2019-05-21 00:00:00	96
757	207	78	shipped	2019-06-08 00:00:00	2019-05-21 00:00:00	62
758	683	8	shipped	2019-06-06 00:00:00	2019-05-21 00:00:00	78
759	159	85	shipped	2019-06-03 00:00:00	2019-05-21 00:00:00	25
760	66	16	shipped	2019-06-15 00:00:00	2019-05-22 00:00:00	43
761	663	2	processing	2019-06-08 00:00:00	2019-05-22 00:00:00	10
762	350	27	shipped	2019-06-10 00:00:00	2019-05-22 00:00:00	22
763	348	95	completed	2019-06-02 00:00:00	2019-05-22 00:00:00	7
764	432	35	completed	2019-05-26 00:00:00	2019-05-22 00:00:00	17
765	278	12	processing	2019-05-27 00:00:00	2019-05-22 00:00:00	74
766	64	86	completed	2019-06-14 00:00:00	2019-05-23 00:00:00	28
767	360	10	shipped	2019-06-01 00:00:00	2019-05-23 00:00:00	11
768	27	69	processing	2019-05-30 00:00:00	2019-05-23 00:00:00	65
769	518	14	shipped	2019-06-01 00:00:00	2019-05-24 00:00:00	11
770	193	39	completed	2019-06-16 00:00:00	2019-05-24 00:00:00	55
771	30	52	completed	2019-06-01 00:00:00	2019-05-24 00:00:00	19
772	638	89	processing	2019-06-11 00:00:00	2019-05-24 00:00:00	96
773	700	26	processing	2019-06-08 00:00:00	2019-05-24 00:00:00	47
774	142	96	processing	2019-05-25 00:00:00	2019-05-24 00:00:00	32
775	303	15	processing	2019-06-09 00:00:00	2019-05-24 00:00:00	29
776	417	11	processing	2019-06-11 00:00:00	2019-05-24 00:00:00	98
777	299	23	completed	2019-06-10 00:00:00	2019-05-24 00:00:00	52
778	444	55	completed	2019-05-29 00:00:00	2019-05-24 00:00:00	56
779	532	91	processing	2019-05-30 00:00:00	2019-05-24 00:00:00	70
780	333	81	shipped	2019-06-16 00:00:00	2019-05-24 00:00:00	17
781	121	97	shipped	2019-06-09 00:00:00	2019-05-24 00:00:00	76
782	69	96	shipped	2019-06-22 00:00:00	2019-05-24 00:00:00	58
783	283	3	processing	2019-06-14 00:00:00	2019-05-24 00:00:00	98
784	217	3	shipped	2019-06-13 00:00:00	2019-05-24 00:00:00	90
785	275	70	completed	2019-06-05 00:00:00	2019-05-25 00:00:00	10
786	372	6	completed	2019-06-11 00:00:00	2019-05-25 00:00:00	13
787	433	39	processing	2019-06-20 00:00:00	2019-05-26 00:00:00	95
788	327	72	processing	2019-05-27 00:00:00	2019-05-26 00:00:00	36
789	28	49	shipped	2019-06-15 00:00:00	2019-05-26 00:00:00	29
790	432	42	shipped	2019-06-07 00:00:00	2019-05-26 00:00:00	10
791	530	32	processing	2019-05-30 00:00:00	2019-05-26 00:00:00	85
792	668	1	shipped	2019-06-20 00:00:00	2019-05-26 00:00:00	44
793	509	49	processing	2019-06-17 00:00:00	2019-05-26 00:00:00	96
794	416	49	completed	2019-05-31 00:00:00	2019-05-26 00:00:00	87
795	103	14	completed	2019-06-08 00:00:00	2019-05-26 00:00:00	51
796	53	66	completed	2019-06-09 00:00:00	2019-05-26 00:00:00	38
797	498	42	shipped	2019-06-10 00:00:00	2019-05-26 00:00:00	58
798	686	46	processing	2019-06-12 00:00:00	2019-05-26 00:00:00	84
799	70	28	completed	2019-06-08 00:00:00	2019-05-26 00:00:00	15
800	206	38	processing	2019-06-08 00:00:00	2019-05-26 00:00:00	39
801	106	98	completed	2019-06-11 00:00:00	2019-05-26 00:00:00	100
802	38	64	processing	2019-06-01 00:00:00	2019-05-26 00:00:00	33
803	153	85	processing	2019-06-13 00:00:00	2019-05-26 00:00:00	80
804	664	25	shipped	2019-06-07 00:00:00	2019-05-26 00:00:00	79
805	683	49	shipped	2019-06-20 00:00:00	2019-05-26 00:00:00	27
806	98	82	completed	2019-06-26 00:00:00	2019-05-27 00:00:00	5
807	648	93	shipped	2019-06-09 00:00:00	2019-05-27 00:00:00	63
808	479	4	shipped	2019-06-15 00:00:00	2019-05-27 00:00:00	75
809	244	3	completed	2019-06-02 00:00:00	2019-05-27 00:00:00	67
810	242	56	shipped	2019-06-24 00:00:00	2019-05-27 00:00:00	3
811	483	28	shipped	2019-06-19 00:00:00	2019-05-27 00:00:00	36
812	697	27	completed	2019-06-26 00:00:00	2019-05-27 00:00:00	95
813	383	55	processing	2019-06-11 00:00:00	2019-05-27 00:00:00	22
814	30	57	processing	2019-06-26 00:00:00	2019-05-27 00:00:00	95
815	288	27	completed	2019-06-16 00:00:00	2019-05-27 00:00:00	55
816	106	35	completed	2019-06-17 00:00:00	2019-05-27 00:00:00	62
817	695	46	shipped	2019-05-28 00:00:00	2019-05-27 00:00:00	47
818	299	3	processing	2019-06-20 00:00:00	2019-05-27 00:00:00	20
819	133	39	completed	2019-06-19 00:00:00	2019-05-27 00:00:00	65
820	272	19	shipped	2019-06-07 00:00:00	2019-05-28 00:00:00	56
821	258	95	processing	2019-06-04 00:00:00	2019-05-29 00:00:00	64
822	119	86	processing	2019-06-02 00:00:00	2019-05-29 00:00:00	34
823	237	80	processing	2019-05-31 00:00:00	2019-05-29 00:00:00	60
824	573	74	completed	2019-06-16 00:00:00	2019-05-29 00:00:00	36
825	398	65	completed	2019-06-21 00:00:00	2019-05-29 00:00:00	77
826	105	97	shipped	2019-06-10 00:00:00	2019-05-29 00:00:00	66
827	615	93	completed	2019-06-02 00:00:00	2019-05-29 00:00:00	17
828	101	93	completed	2019-05-31 00:00:00	2019-05-29 00:00:00	70
829	410	2	completed	2019-06-08 00:00:00	2019-05-29 00:00:00	79
830	405	11	processing	2019-06-03 00:00:00	2019-05-29 00:00:00	39
831	289	49	processing	2019-06-29 00:00:00	2019-05-30 00:00:00	20
832	674	49	processing	2019-06-07 00:00:00	2019-05-30 00:00:00	1
833	378	59	processing	2019-06-30 00:00:00	2019-05-31 00:00:00	43
834	573	17	shipped	2019-06-10 00:00:00	2019-05-31 00:00:00	22
835	298	98	shipped	2019-06-07 00:00:00	2019-05-31 00:00:00	51
836	252	41	completed	2019-06-11 00:00:00	2019-05-31 00:00:00	70
837	346	27	shipped	2019-06-17 00:00:00	2019-05-31 00:00:00	70
838	361	56	completed	2019-06-02 00:00:00	2019-05-31 00:00:00	73
839	697	19	completed	2019-06-08 00:00:00	2019-05-31 00:00:00	12
840	235	43	processing	2019-06-10 00:00:00	2019-05-31 00:00:00	86
841	482	44	shipped	2019-07-01 00:00:00	2019-06-01 00:00:00	43
842	682	54	completed	2019-06-04 00:00:00	2019-06-01 00:00:00	83
843	223	84	processing	2019-06-12 00:00:00	2019-06-01 00:00:00	84
844	487	23	shipped	2019-06-12 00:00:00	2019-06-01 00:00:00	80
845	358	67	shipped	2019-06-04 00:00:00	2019-06-01 00:00:00	9
846	614	90	shipped	2019-06-06 00:00:00	2019-06-01 00:00:00	48
847	350	80	completed	2019-06-21 00:00:00	2019-06-01 00:00:00	68
848	623	24	completed	2019-06-27 00:00:00	2019-06-01 00:00:00	26
849	18	75	completed	2019-06-23 00:00:00	2019-06-01 00:00:00	25
850	427	89	completed	2019-06-21 00:00:00	2019-06-02 00:00:00	83
851	173	52	shipped	2019-06-26 00:00:00	2019-06-02 00:00:00	14
852	136	58	completed	2019-07-02 00:00:00	2019-06-02 00:00:00	50
853	674	94	shipped	2019-06-19 00:00:00	2019-06-02 00:00:00	81
854	527	67	completed	2019-06-10 00:00:00	2019-06-02 00:00:00	63
855	92	99	completed	2019-06-29 00:00:00	2019-06-02 00:00:00	60
856	67	3	completed	2019-06-21 00:00:00	2019-06-03 00:00:00	14
857	253	68	completed	2019-06-16 00:00:00	2019-06-03 00:00:00	24
858	608	17	completed	2019-07-02 00:00:00	2019-06-03 00:00:00	98
859	115	71	shipped	2019-06-09 00:00:00	2019-06-03 00:00:00	87
860	187	81	processing	2019-06-18 00:00:00	2019-06-03 00:00:00	15
861	388	9	processing	2019-06-12 00:00:00	2019-06-04 00:00:00	14
862	488	60	completed	2019-07-02 00:00:00	2019-06-05 00:00:00	10
863	480	25	processing	2019-06-06 00:00:00	2019-06-05 00:00:00	57
864	351	10	processing	2019-06-30 00:00:00	2019-06-05 00:00:00	44
865	660	91	shipped	2019-07-04 00:00:00	2019-06-05 00:00:00	1
866	680	83	processing	2019-06-24 00:00:00	2019-06-05 00:00:00	90
867	667	44	completed	2019-06-16 00:00:00	2019-06-05 00:00:00	78
868	202	80	completed	2019-06-08 00:00:00	2019-06-05 00:00:00	80
869	698	46	processing	2019-06-21 00:00:00	2019-06-05 00:00:00	28
870	260	40	processing	2019-06-15 00:00:00	2019-06-05 00:00:00	34
871	657	94	processing	2019-06-22 00:00:00	2019-06-05 00:00:00	40
872	226	59	processing	2019-06-29 00:00:00	2019-06-05 00:00:00	97
873	318	12	shipped	2019-06-23 00:00:00	2019-06-05 00:00:00	13
874	165	32	completed	2019-06-23 00:00:00	2019-06-05 00:00:00	69
875	108	33	shipped	2019-06-16 00:00:00	2019-06-05 00:00:00	100
876	20	5	processing	2019-06-30 00:00:00	2019-06-05 00:00:00	15
877	36	35	shipped	2019-06-21 00:00:00	2019-06-06 00:00:00	87
878	104	32	shipped	2019-06-22 00:00:00	2019-06-06 00:00:00	42
879	677	99	completed	2019-06-10 00:00:00	2019-06-06 00:00:00	4
880	538	82	processing	2019-06-15 00:00:00	2019-06-06 00:00:00	63
881	328	49	shipped	2019-07-05 00:00:00	2019-06-07 00:00:00	8
882	651	46	completed	2019-06-23 00:00:00	2019-06-07 00:00:00	31
883	305	2	shipped	2019-06-23 00:00:00	2019-06-07 00:00:00	98
884	378	19	completed	2019-06-15 00:00:00	2019-06-07 00:00:00	82
885	1	12	completed	2019-06-09 00:00:00	2019-06-08 00:00:00	55
886	77	26	shipped	2019-06-15 00:00:00	2019-06-08 00:00:00	1
887	421	62	completed	2019-07-03 00:00:00	2019-06-08 00:00:00	31
888	31	19	processing	2019-06-20 00:00:00	2019-06-08 00:00:00	37
889	306	25	shipped	2019-06-25 00:00:00	2019-06-08 00:00:00	77
890	187	68	processing	2019-06-17 00:00:00	2019-06-08 00:00:00	12
891	552	32	processing	2019-06-12 00:00:00	2019-06-08 00:00:00	73
892	257	97	shipped	2019-06-19 00:00:00	2019-06-08 00:00:00	89
893	395	9	processing	2019-07-09 00:00:00	2019-06-09 00:00:00	19
895	358	50	completed	2019-06-12 00:00:00	2019-06-09 00:00:00	65
897	661	36	processing	2019-06-25 00:00:00	2019-06-10 00:00:00	64
899	621	82	shipped	2019-07-08 00:00:00	2019-06-10 00:00:00	46
901	596	93	shipped	2019-06-11 00:00:00	2019-06-10 00:00:00	88
903	549	82	processing	2019-07-06 00:00:00	2019-06-10 00:00:00	85
907	137	80	shipped	2019-06-12 00:00:00	2019-06-11 00:00:00	24
909	537	93	completed	2019-06-16 00:00:00	2019-06-12 00:00:00	70
910	31	38	shipped	2019-06-18 00:00:00	2019-06-12 00:00:00	33
912	540	95	completed	2019-07-01 00:00:00	2019-06-13 00:00:00	33
913	590	27	processing	2019-06-23 00:00:00	2019-06-13 00:00:00	26
915	195	99	processing	2019-07-01 00:00:00	2019-06-13 00:00:00	94
916	247	89	shipped	2019-07-06 00:00:00	2019-06-14 00:00:00	42
918	650	70	completed	2019-06-17 00:00:00	2019-06-14 00:00:00	51
920	407	3	processing	2019-07-07 00:00:00	2019-06-14 00:00:00	53
923	631	98	shipped	2019-06-19 00:00:00	2019-06-15 00:00:00	3
924	167	13	shipped	2019-06-20 00:00:00	2019-06-15 00:00:00	25
926	267	67	processing	2019-06-20 00:00:00	2019-06-15 00:00:00	56
927	163	58	completed	2019-07-13 00:00:00	2019-06-15 00:00:00	84
930	438	15	processing	2019-06-24 00:00:00	2019-06-15 00:00:00	81
933	183	9	processing	2019-07-04 00:00:00	2019-06-15 00:00:00	88
935	293	65	completed	2019-07-07 00:00:00	2019-06-16 00:00:00	83
937	363	72	shipped	2019-06-26 00:00:00	2019-06-16 00:00:00	74
938	550	63	completed	2019-06-22 00:00:00	2019-06-16 00:00:00	62
939	301	32	shipped	2019-06-24 00:00:00	2019-06-16 00:00:00	93
941	622	80	shipped	2019-06-18 00:00:00	2019-06-16 00:00:00	61
945	371	58	completed	2019-06-20 00:00:00	2019-06-17 00:00:00	6
946	175	68	shipped	2019-06-25 00:00:00	2019-06-18 00:00:00	93
947	670	88	processing	2019-06-19 00:00:00	2019-06-18 00:00:00	20
948	517	75	completed	2019-07-09 00:00:00	2019-06-18 00:00:00	83
949	254	58	shipped	2019-07-02 00:00:00	2019-06-18 00:00:00	43
950	511	6	completed	2019-07-11 00:00:00	2019-06-18 00:00:00	48
951	624	58	shipped	2019-06-29 00:00:00	2019-06-18 00:00:00	46
952	7	10	processing	2019-06-22 00:00:00	2019-06-18 00:00:00	37
953	164	15	shipped	2019-07-15 00:00:00	2019-06-18 00:00:00	41
954	119	81	shipped	2019-07-09 00:00:00	2019-06-18 00:00:00	90
955	457	49	shipped	2019-07-02 00:00:00	2019-06-19 00:00:00	85
956	234	70	processing	2019-07-16 00:00:00	2019-06-19 00:00:00	20
957	602	54	processing	2019-07-10 00:00:00	2019-06-19 00:00:00	65
958	453	99	shipped	2019-07-19 00:00:00	2019-06-19 00:00:00	78
959	351	62	shipped	2019-07-14 00:00:00	2019-06-19 00:00:00	91
960	453	19	processing	2019-07-12 00:00:00	2019-06-19 00:00:00	76
961	578	5	processing	2019-06-28 00:00:00	2019-06-20 00:00:00	72
962	58	59	shipped	2019-06-30 00:00:00	2019-06-20 00:00:00	21
963	364	15	processing	2019-07-16 00:00:00	2019-06-20 00:00:00	60
964	48	48	shipped	2019-07-03 00:00:00	2019-06-20 00:00:00	76
965	326	10	processing	2019-06-22 00:00:00	2019-06-20 00:00:00	37
966	611	89	completed	2019-07-04 00:00:00	2019-06-20 00:00:00	19
967	181	67	shipped	2019-07-16 00:00:00	2019-06-21 00:00:00	55
968	562	51	completed	2019-07-10 00:00:00	2019-06-21 00:00:00	31
969	352	57	processing	2019-06-29 00:00:00	2019-06-21 00:00:00	6
970	102	30	processing	2019-07-14 00:00:00	2019-06-21 00:00:00	35
972	90	52	completed	2019-07-21 00:00:00	2019-06-22 00:00:00	65
974	249	79	completed	2019-07-17 00:00:00	2019-06-22 00:00:00	99
976	207	74	completed	2019-07-10 00:00:00	2019-06-22 00:00:00	37
977	175	83	processing	2019-06-27 00:00:00	2019-06-22 00:00:00	63
978	635	17	completed	2019-07-09 00:00:00	2019-06-22 00:00:00	20
980	267	8	processing	2019-07-02 00:00:00	2019-06-22 00:00:00	40
982	9	82	completed	2019-07-08 00:00:00	2019-06-22 00:00:00	25
983	696	26	processing	2019-07-11 00:00:00	2019-06-22 00:00:00	54
985	604	9	shipped	2019-06-30 00:00:00	2019-06-22 00:00:00	38
986	578	97	completed	2019-06-29 00:00:00	2019-06-22 00:00:00	60
988	165	96	completed	2019-07-08 00:00:00	2019-06-22 00:00:00	95
990	581	1	shipped	2019-07-19 00:00:00	2019-06-22 00:00:00	82
992	91	76	shipped	2019-06-24 00:00:00	2019-06-22 00:00:00	32
994	699	26	shipped	2019-07-15 00:00:00	2019-06-22 00:00:00	89
996	565	27	shipped	2019-06-27 00:00:00	2019-06-22 00:00:00	45
999	217	43	completed	2019-06-28 00:00:00	2019-06-22 00:00:00	46
1001	559	74	completed	2019-07-12 00:00:00	2019-06-22 00:00:00	62
1004	255	51	shipped	2019-07-08 00:00:00	2019-06-22 00:00:00	71
1005	559	99	processing	2019-07-12 00:00:00	2019-06-22 00:00:00	31
1007	99	62	completed	2019-07-17 00:00:00	2019-06-22 00:00:00	84
1009	86	42	shipped	2019-07-22 00:00:00	2019-06-22 00:00:00	77
1011	184	7	processing	2019-06-23 00:00:00	2019-06-22 00:00:00	11
1013	35	50	completed	2019-07-11 00:00:00	2019-06-22 00:00:00	98
1015	563	68	shipped	2019-07-11 00:00:00	2019-06-22 00:00:00	98
1017	29	8	processing	2019-07-18 00:00:00	2019-06-23 00:00:00	35
1019	86	88	shipped	2019-07-07 00:00:00	2019-06-23 00:00:00	51
1022	288	40	processing	2019-07-02 00:00:00	2019-06-24 00:00:00	84
1023	568	40	processing	2019-07-09 00:00:00	2019-06-24 00:00:00	60
1024	383	93	completed	2019-06-26 00:00:00	2019-06-24 00:00:00	81
1027	120	100	completed	2019-07-15 00:00:00	2019-06-24 00:00:00	93
1030	615	46	processing	2019-06-27 00:00:00	2019-06-24 00:00:00	83
1032	390	76	processing	2019-07-17 00:00:00	2019-06-24 00:00:00	44
1034	293	34	processing	2019-07-05 00:00:00	2019-06-24 00:00:00	44
1035	699	40	processing	2019-07-05 00:00:00	2019-06-24 00:00:00	89
1036	42	90	shipped	2019-07-20 00:00:00	2019-06-24 00:00:00	73
1038	572	88	completed	2019-07-21 00:00:00	2019-06-24 00:00:00	16
1040	551	91	processing	2019-07-23 00:00:00	2019-06-25 00:00:00	19
1042	636	35	completed	2019-07-15 00:00:00	2019-06-25 00:00:00	25
1044	596	43	completed	2019-07-17 00:00:00	2019-06-25 00:00:00	25
1045	439	53	completed	2019-07-01 00:00:00	2019-06-25 00:00:00	75
1046	538	40	processing	2019-07-13 00:00:00	2019-06-25 00:00:00	17
894	384	88	completed	2019-06-20 00:00:00	2019-06-09 00:00:00	26
896	418	33	processing	2019-06-13 00:00:00	2019-06-09 00:00:00	56
898	543	7	completed	2019-06-11 00:00:00	2019-06-10 00:00:00	55
900	261	70	completed	2019-06-16 00:00:00	2019-06-10 00:00:00	41
902	383	64	completed	2019-06-13 00:00:00	2019-06-10 00:00:00	67
904	646	84	processing	2019-06-28 00:00:00	2019-06-10 00:00:00	77
905	445	84	shipped	2019-07-11 00:00:00	2019-06-11 00:00:00	66
906	697	38	processing	2019-06-22 00:00:00	2019-06-11 00:00:00	13
908	615	19	shipped	2019-06-20 00:00:00	2019-06-11 00:00:00	14
911	598	30	processing	2019-06-24 00:00:00	2019-06-13 00:00:00	61
914	449	81	completed	2019-06-18 00:00:00	2019-06-13 00:00:00	67
917	307	65	shipped	2019-07-08 00:00:00	2019-06-14 00:00:00	43
919	661	76	completed	2019-06-23 00:00:00	2019-06-14 00:00:00	97
921	409	52	processing	2019-07-08 00:00:00	2019-06-15 00:00:00	40
922	358	87	shipped	2019-07-07 00:00:00	2019-06-15 00:00:00	72
925	141	100	processing	2019-07-04 00:00:00	2019-06-15 00:00:00	31
928	454	53	completed	2019-07-08 00:00:00	2019-06-15 00:00:00	23
929	489	18	completed	2019-07-04 00:00:00	2019-06-15 00:00:00	25
931	251	70	completed	2019-06-23 00:00:00	2019-06-15 00:00:00	74
932	652	9	shipped	2019-06-29 00:00:00	2019-06-15 00:00:00	83
934	194	9	shipped	2019-06-17 00:00:00	2019-06-16 00:00:00	41
936	101	31	shipped	2019-07-06 00:00:00	2019-06-16 00:00:00	12
940	80	31	completed	2019-07-08 00:00:00	2019-06-16 00:00:00	16
942	31	22	shipped	2019-07-02 00:00:00	2019-06-16 00:00:00	45
943	417	44	shipped	2019-07-01 00:00:00	2019-06-16 00:00:00	55
944	362	75	processing	2019-06-27 00:00:00	2019-06-16 00:00:00	49
971	284	91	shipped	2019-07-20 00:00:00	2019-06-22 00:00:00	73
973	232	12	processing	2019-07-07 00:00:00	2019-06-22 00:00:00	31
975	78	23	completed	2019-07-13 00:00:00	2019-06-22 00:00:00	53
979	672	87	processing	2019-07-11 00:00:00	2019-06-22 00:00:00	5
981	435	61	completed	2019-07-03 00:00:00	2019-06-22 00:00:00	2
984	89	19	processing	2019-07-08 00:00:00	2019-06-22 00:00:00	60
987	114	12	shipped	2019-07-12 00:00:00	2019-06-22 00:00:00	85
989	588	26	processing	2019-07-15 00:00:00	2019-06-22 00:00:00	6
991	381	65	processing	2019-07-18 00:00:00	2019-06-22 00:00:00	84
993	323	94	completed	2019-07-10 00:00:00	2019-06-22 00:00:00	49
995	241	24	shipped	2019-06-28 00:00:00	2019-06-22 00:00:00	45
997	677	22	completed	2019-07-11 00:00:00	2019-06-22 00:00:00	60
998	682	71	completed	2019-07-15 00:00:00	2019-06-22 00:00:00	86
1000	472	81	shipped	2019-07-17 00:00:00	2019-06-22 00:00:00	16
1002	548	25	shipped	2019-07-02 00:00:00	2019-06-22 00:00:00	62
1003	154	20	completed	2019-06-27 00:00:00	2019-06-22 00:00:00	91
1006	331	55	shipped	2019-07-01 00:00:00	2019-06-22 00:00:00	72
1008	637	94	shipped	2019-07-20 00:00:00	2019-06-22 00:00:00	46
1010	682	73	processing	2019-07-18 00:00:00	2019-06-22 00:00:00	24
1012	167	84	completed	2019-07-15 00:00:00	2019-06-22 00:00:00	71
1014	96	24	processing	2019-07-21 00:00:00	2019-06-22 00:00:00	97
1016	83	42	completed	2019-07-14 00:00:00	2019-06-23 00:00:00	41
1018	532	99	completed	2019-06-29 00:00:00	2019-06-23 00:00:00	41
1020	441	59	completed	2019-07-10 00:00:00	2019-06-23 00:00:00	49
1021	71	25	completed	2019-07-04 00:00:00	2019-06-24 00:00:00	60
1025	63	91	processing	2019-07-13 00:00:00	2019-06-24 00:00:00	51
1026	449	8	shipped	2019-06-27 00:00:00	2019-06-24 00:00:00	60
1028	695	5	completed	2019-07-06 00:00:00	2019-06-24 00:00:00	57
1029	416	2	processing	2019-07-09 00:00:00	2019-06-24 00:00:00	12
1031	111	83	shipped	2019-07-05 00:00:00	2019-06-24 00:00:00	22
1033	244	83	processing	2019-07-06 00:00:00	2019-06-24 00:00:00	56
1037	147	12	shipped	2019-07-15 00:00:00	2019-06-24 00:00:00	29
1039	342	34	completed	2019-07-21 00:00:00	2019-06-25 00:00:00	81
1041	593	63	processing	2019-07-19 00:00:00	2019-06-25 00:00:00	61
1043	4	14	shipped	2019-06-26 00:00:00	2019-06-25 00:00:00	7
1047	566	44	completed	2019-07-01 00:00:00	2019-06-25 00:00:00	88
1048	315	20	processing	2019-06-30 00:00:00	2019-06-25 00:00:00	80
1049	358	12	completed	2019-07-07 00:00:00	2019-06-26 00:00:00	13
1050	456	78	completed	2019-07-23 00:00:00	2019-06-26 00:00:00	18
1051	246	16	processing	2019-06-28 00:00:00	2019-06-27 00:00:00	24
1052	668	87	completed	2019-07-07 00:00:00	2019-06-27 00:00:00	39
1053	506	36	completed	2019-07-02 00:00:00	2019-06-27 00:00:00	99
1054	664	37	shipped	2019-07-18 00:00:00	2019-06-27 00:00:00	77
1055	262	27	completed	2019-07-21 00:00:00	2019-06-27 00:00:00	39
1056	219	15	processing	2019-07-17 00:00:00	2019-06-27 00:00:00	81
1057	400	29	completed	2019-07-23 00:00:00	2019-06-27 00:00:00	21
1058	490	43	completed	2019-07-12 00:00:00	2019-06-27 00:00:00	65
1059	212	17	shipped	2019-07-13 00:00:00	2019-06-27 00:00:00	52
1060	108	71	shipped	2019-07-01 00:00:00	2019-06-27 00:00:00	80
1061	250	91	processing	2019-07-22 00:00:00	2019-06-27 00:00:00	25
1062	232	28	processing	2019-06-29 00:00:00	2019-06-27 00:00:00	10
1063	580	43	completed	2019-07-12 00:00:00	2019-06-27 00:00:00	33
1064	12	15	completed	2019-07-07 00:00:00	2019-06-27 00:00:00	88
1065	324	37	completed	2019-07-13 00:00:00	2019-06-27 00:00:00	10
1066	136	26	completed	2019-06-30 00:00:00	2019-06-28 00:00:00	36
1067	478	59	shipped	2019-06-29 00:00:00	2019-06-28 00:00:00	21
1068	485	89	processing	2019-07-08 00:00:00	2019-06-28 00:00:00	9
1069	556	37	shipped	2019-07-09 00:00:00	2019-06-29 00:00:00	38
1070	71	77	processing	2019-07-17 00:00:00	2019-06-29 00:00:00	57
1071	247	73	completed	2019-07-10 00:00:00	2019-06-29 00:00:00	8
1072	643	15	processing	2019-07-12 00:00:00	2019-06-30 00:00:00	44
1073	168	68	completed	2019-07-12 00:00:00	2019-06-30 00:00:00	78
1074	577	20	shipped	2019-07-01 00:00:00	2019-06-30 00:00:00	52
1075	142	19	shipped	2019-07-14 00:00:00	2019-07-01 00:00:00	18
1076	322	57	shipped	2019-07-14 00:00:00	2019-07-01 00:00:00	79
1077	79	27	completed	2019-07-09 00:00:00	2019-07-01 00:00:00	81
1078	123	43	processing	2019-07-19 00:00:00	2019-07-01 00:00:00	93
1079	669	20	shipped	2019-07-30 00:00:00	2019-07-01 00:00:00	17
1080	109	11	completed	2019-07-31 00:00:00	2019-07-01 00:00:00	47
1081	490	42	processing	2019-07-15 00:00:00	2019-07-02 00:00:00	64
1082	414	12	completed	2019-07-13 00:00:00	2019-07-02 00:00:00	30
1083	139	36	completed	2019-07-30 00:00:00	2019-07-02 00:00:00	24
1084	216	19	processing	2019-07-28 00:00:00	2019-07-02 00:00:00	9
1085	342	84	processing	2019-07-06 00:00:00	2019-07-02 00:00:00	11
1086	218	56	processing	2019-07-21 00:00:00	2019-07-02 00:00:00	74
1087	674	61	completed	2019-07-18 00:00:00	2019-07-02 00:00:00	46
1088	473	28	completed	2019-07-25 00:00:00	2019-07-02 00:00:00	77
1089	468	21	completed	2019-07-31 00:00:00	2019-07-02 00:00:00	85
1090	101	12	completed	2019-08-01 00:00:00	2019-07-02 00:00:00	33
1091	98	16	shipped	2019-07-24 00:00:00	2019-07-03 00:00:00	36
1092	447	15	completed	2019-07-09 00:00:00	2019-07-03 00:00:00	18
1093	246	17	shipped	2019-07-15 00:00:00	2019-07-03 00:00:00	56
1094	24	62	completed	2019-07-27 00:00:00	2019-07-03 00:00:00	48
1096	67	79	completed	2019-07-25 00:00:00	2019-07-04 00:00:00	58
1098	438	64	processing	2019-07-24 00:00:00	2019-07-04 00:00:00	64
1100	390	44	processing	2019-07-27 00:00:00	2019-07-04 00:00:00	16
1101	577	10	shipped	2019-07-08 00:00:00	2019-07-04 00:00:00	100
1103	114	37	processing	2019-07-18 00:00:00	2019-07-04 00:00:00	76
1105	470	50	shipped	2019-07-12 00:00:00	2019-07-05 00:00:00	89
1108	227	94	shipped	2019-07-09 00:00:00	2019-07-07 00:00:00	75
1109	408	16	shipped	2019-07-20 00:00:00	2019-07-07 00:00:00	63
1095	560	33	processing	2019-07-15 00:00:00	2019-07-03 00:00:00	90
1097	96	79	processing	2019-08-03 00:00:00	2019-07-04 00:00:00	79
1099	339	87	processing	2019-07-15 00:00:00	2019-07-04 00:00:00	59
1102	421	20	processing	2019-07-28 00:00:00	2019-07-04 00:00:00	62
1104	418	88	completed	2019-07-21 00:00:00	2019-07-04 00:00:00	20
1106	69	61	processing	2019-07-21 00:00:00	2019-07-06 00:00:00	37
1107	337	88	shipped	2019-07-28 00:00:00	2019-07-07 00:00:00	19
1110	647	71	shipped	2019-07-24 00:00:00	2019-07-07 00:00:00	81
1111	242	88	shipped	2019-07-23 00:00:00	2019-07-08 00:00:00	50
1112	444	73	processing	2019-08-04 00:00:00	2019-07-08 00:00:00	83
1113	163	72	processing	2019-07-14 00:00:00	2019-07-08 00:00:00	19
1114	684	49	completed	2019-07-19 00:00:00	2019-07-08 00:00:00	100
1115	319	60	shipped	2019-07-26 00:00:00	2019-07-08 00:00:00	16
1116	563	8	completed	2019-08-07 00:00:00	2019-07-08 00:00:00	29
1117	180	48	shipped	2019-07-13 00:00:00	2019-07-08 00:00:00	24
1118	280	99	shipped	2019-07-14 00:00:00	2019-07-08 00:00:00	26
1119	30	52	shipped	2019-07-12 00:00:00	2019-07-08 00:00:00	1
1120	168	66	completed	2019-07-25 00:00:00	2019-07-08 00:00:00	79
1121	204	20	processing	2019-08-01 00:00:00	2019-07-08 00:00:00	81
1122	304	15	processing	2019-07-13 00:00:00	2019-07-08 00:00:00	88
1123	431	81	completed	2019-07-11 00:00:00	2019-07-08 00:00:00	51
1124	448	100	shipped	2019-07-29 00:00:00	2019-07-08 00:00:00	50
1125	194	98	completed	2019-07-16 00:00:00	2019-07-08 00:00:00	30
1126	31	1	completed	2019-07-31 00:00:00	2019-07-08 00:00:00	43
1127	110	21	shipped	2019-08-06 00:00:00	2019-07-08 00:00:00	51
1128	409	67	completed	2019-07-14 00:00:00	2019-07-08 00:00:00	70
1129	66	68	completed	2019-07-14 00:00:00	2019-07-08 00:00:00	51
1130	172	65	shipped	2019-07-19 00:00:00	2019-07-08 00:00:00	74
1131	414	67	shipped	2019-07-15 00:00:00	2019-07-09 00:00:00	32
1132	358	29	completed	2019-08-02 00:00:00	2019-07-09 00:00:00	38
1133	258	77	completed	2019-08-08 00:00:00	2019-07-09 00:00:00	32
1134	512	67	completed	2019-08-02 00:00:00	2019-07-09 00:00:00	85
1135	365	10	completed	2019-08-06 00:00:00	2019-07-09 00:00:00	69
1136	370	40	shipped	2019-08-07 00:00:00	2019-07-09 00:00:00	89
1137	602	95	processing	2019-07-26 00:00:00	2019-07-09 00:00:00	33
1138	426	12	processing	2019-07-10 00:00:00	2019-07-09 00:00:00	74
1139	179	52	shipped	2019-08-01 00:00:00	2019-07-09 00:00:00	88
1140	315	90	completed	2019-07-17 00:00:00	2019-07-09 00:00:00	78
1141	334	66	shipped	2019-07-14 00:00:00	2019-07-09 00:00:00	24
1142	663	68	processing	2019-07-21 00:00:00	2019-07-09 00:00:00	44
1143	266	72	completed	2019-07-13 00:00:00	2019-07-09 00:00:00	42
1144	240	21	completed	2019-08-04 00:00:00	2019-07-10 00:00:00	61
1145	362	51	completed	2019-07-29 00:00:00	2019-07-10 00:00:00	46
1146	92	97	completed	2019-08-06 00:00:00	2019-07-11 00:00:00	32
1147	429	67	shipped	2019-08-07 00:00:00	2019-07-11 00:00:00	21
1148	576	58	processing	2019-07-23 00:00:00	2019-07-11 00:00:00	94
1149	674	70	processing	2019-07-29 00:00:00	2019-07-11 00:00:00	39
1150	319	92	shipped	2019-07-24 00:00:00	2019-07-12 00:00:00	65
1151	410	4	processing	2019-07-19 00:00:00	2019-07-12 00:00:00	52
1152	152	62	completed	2019-07-23 00:00:00	2019-07-12 00:00:00	96
1153	447	90	processing	2019-07-18 00:00:00	2019-07-13 00:00:00	74
1154	679	65	shipped	2019-08-01 00:00:00	2019-07-13 00:00:00	33
1155	412	55	completed	2019-07-30 00:00:00	2019-07-13 00:00:00	76
1156	131	24	completed	2019-08-09 00:00:00	2019-07-14 00:00:00	30
1157	355	99	completed	2019-08-03 00:00:00	2019-07-14 00:00:00	51
1158	489	72	shipped	2019-07-24 00:00:00	2019-07-14 00:00:00	11
1159	10	99	completed	2019-07-31 00:00:00	2019-07-14 00:00:00	84
1160	425	45	shipped	2019-08-02 00:00:00	2019-07-14 00:00:00	49
1161	331	93	processing	2019-07-21 00:00:00	2019-07-14 00:00:00	46
1162	625	80	shipped	2019-08-07 00:00:00	2019-07-15 00:00:00	63
1163	633	46	completed	2019-07-18 00:00:00	2019-07-15 00:00:00	37
1164	293	34	completed	2019-07-18 00:00:00	2019-07-15 00:00:00	77
1165	468	65	shipped	2019-08-12 00:00:00	2019-07-15 00:00:00	80
1166	343	75	processing	2019-08-04 00:00:00	2019-07-15 00:00:00	83
1167	111	46	processing	2019-07-29 00:00:00	2019-07-15 00:00:00	3
1168	289	58	completed	2019-07-21 00:00:00	2019-07-15 00:00:00	95
1169	5	49	processing	2019-07-25 00:00:00	2019-07-15 00:00:00	32
1170	37	65	processing	2019-08-06 00:00:00	2019-07-15 00:00:00	39
1171	623	47	processing	2019-07-18 00:00:00	2019-07-15 00:00:00	77
1172	584	70	processing	2019-08-06 00:00:00	2019-07-15 00:00:00	21
1173	150	53	processing	2019-08-05 00:00:00	2019-07-15 00:00:00	19
1174	328	53	shipped	2019-07-27 00:00:00	2019-07-15 00:00:00	34
1175	299	50	shipped	2019-08-06 00:00:00	2019-07-15 00:00:00	42
1176	136	79	shipped	2019-08-11 00:00:00	2019-07-16 00:00:00	48
1177	225	83	shipped	2019-07-20 00:00:00	2019-07-17 00:00:00	69
1178	661	58	completed	2019-08-13 00:00:00	2019-07-17 00:00:00	18
1179	622	6	processing	2019-07-20 00:00:00	2019-07-17 00:00:00	98
1180	220	9	completed	2019-08-10 00:00:00	2019-07-18 00:00:00	83
1181	195	41	completed	2019-07-27 00:00:00	2019-07-18 00:00:00	29
1182	16	67	processing	2019-08-04 00:00:00	2019-07-18 00:00:00	72
1183	121	9	processing	2019-07-29 00:00:00	2019-07-18 00:00:00	34
1184	499	83	shipped	2019-07-27 00:00:00	2019-07-18 00:00:00	58
1185	645	63	completed	2019-08-02 00:00:00	2019-07-18 00:00:00	17
1186	550	19	processing	2019-08-17 00:00:00	2019-07-18 00:00:00	10
1187	585	81	processing	2019-07-19 00:00:00	2019-07-18 00:00:00	88
1188	524	56	processing	2019-07-24 00:00:00	2019-07-18 00:00:00	50
1189	407	41	completed	2019-07-25 00:00:00	2019-07-18 00:00:00	18
1190	453	3	shipped	2019-08-07 00:00:00	2019-07-18 00:00:00	95
1191	595	52	shipped	2019-07-22 00:00:00	2019-07-19 00:00:00	58
1192	585	23	completed	2019-08-13 00:00:00	2019-07-19 00:00:00	97
1193	288	15	processing	2019-08-15 00:00:00	2019-07-20 00:00:00	8
1194	53	95	completed	2019-08-05 00:00:00	2019-07-20 00:00:00	79
1195	325	72	processing	2019-08-04 00:00:00	2019-07-20 00:00:00	11
1196	615	1	shipped	2019-08-10 00:00:00	2019-07-20 00:00:00	43
1197	646	28	processing	2019-08-07 00:00:00	2019-07-20 00:00:00	4
1198	11	24	completed	2019-08-19 00:00:00	2019-07-21 00:00:00	22
1199	489	53	processing	2019-08-04 00:00:00	2019-07-21 00:00:00	61
1200	8	96	completed	2019-08-09 00:00:00	2019-07-21 00:00:00	65
1201	337	26	shipped	2019-07-24 00:00:00	2019-07-22 00:00:00	3
1202	243	76	shipped	2019-08-12 00:00:00	2019-07-22 00:00:00	8
1203	168	30	processing	2019-07-24 00:00:00	2019-07-22 00:00:00	44
1204	366	23	shipped	2019-08-18 00:00:00	2019-07-22 00:00:00	42
1205	247	11	completed	2019-08-21 00:00:00	2019-07-22 00:00:00	54
1206	176	44	processing	2019-08-16 00:00:00	2019-07-22 00:00:00	5
1207	208	98	processing	2019-08-09 00:00:00	2019-07-22 00:00:00	95
1208	430	23	completed	2019-08-17 00:00:00	2019-07-22 00:00:00	14
1209	587	59	shipped	2019-07-27 00:00:00	2019-07-22 00:00:00	64
1210	635	95	completed	2019-08-03 00:00:00	2019-07-23 00:00:00	86
1211	550	82	processing	2019-08-03 00:00:00	2019-07-23 00:00:00	47
1212	539	24	processing	2019-07-31 00:00:00	2019-07-23 00:00:00	76
1213	576	54	shipped	2019-07-27 00:00:00	2019-07-24 00:00:00	27
1214	121	72	processing	2019-08-05 00:00:00	2019-07-24 00:00:00	87
1215	653	88	completed	2019-08-23 00:00:00	2019-07-24 00:00:00	52
1216	354	92	completed	2019-08-11 00:00:00	2019-07-25 00:00:00	71
1217	664	64	shipped	2019-08-24 00:00:00	2019-07-25 00:00:00	64
1218	182	5	shipped	2019-08-20 00:00:00	2019-07-25 00:00:00	68
1219	478	93	shipped	2019-08-03 00:00:00	2019-07-25 00:00:00	61
1220	286	55	completed	2019-08-23 00:00:00	2019-07-25 00:00:00	78
1221	567	85	processing	2019-08-23 00:00:00	2019-07-26 00:00:00	1
1222	185	44	shipped	2019-08-23 00:00:00	2019-07-27 00:00:00	41
1223	585	97	completed	2019-08-18 00:00:00	2019-07-27 00:00:00	25
1224	233	10	completed	2019-08-23 00:00:00	2019-07-27 00:00:00	45
1225	82	6	shipped	2019-08-05 00:00:00	2019-07-28 00:00:00	18
1226	111	11	processing	2019-08-24 00:00:00	2019-07-28 00:00:00	53
1227	94	83	completed	2019-08-07 00:00:00	2019-07-28 00:00:00	57
1228	390	10	completed	2019-08-19 00:00:00	2019-07-28 00:00:00	20
1229	145	54	processing	2019-08-04 00:00:00	2019-07-28 00:00:00	81
1230	289	54	processing	2019-08-18 00:00:00	2019-07-28 00:00:00	72
1231	169	96	shipped	2019-08-01 00:00:00	2019-07-29 00:00:00	66
1232	564	27	completed	2019-08-04 00:00:00	2019-07-29 00:00:00	74
1233	606	57	shipped	2019-08-21 00:00:00	2019-07-29 00:00:00	15
1234	414	59	processing	2019-08-12 00:00:00	2019-07-29 00:00:00	49
1235	159	17	completed	2019-08-18 00:00:00	2019-07-29 00:00:00	55
1236	542	4	completed	2019-08-18 00:00:00	2019-07-29 00:00:00	14
1237	9	57	shipped	2019-08-07 00:00:00	2019-07-30 00:00:00	60
1238	125	75	processing	2019-08-08 00:00:00	2019-07-30 00:00:00	70
1239	605	39	completed	2019-08-18 00:00:00	2019-07-30 00:00:00	37
1240	125	52	shipped	2019-08-27 00:00:00	2019-07-30 00:00:00	4
1241	61	18	shipped	2019-08-11 00:00:00	2019-07-30 00:00:00	58
1242	265	39	completed	2019-08-23 00:00:00	2019-07-30 00:00:00	43
1243	445	66	completed	2019-08-12 00:00:00	2019-07-31 00:00:00	79
1244	103	73	shipped	2019-08-07 00:00:00	2019-07-31 00:00:00	84
1245	500	10	shipped	2019-08-02 00:00:00	2019-07-31 00:00:00	40
1246	257	44	processing	2019-08-05 00:00:00	2019-07-31 00:00:00	96
1247	65	75	shipped	2019-08-14 00:00:00	2019-07-31 00:00:00	40
1248	118	18	completed	2019-08-02 00:00:00	2019-07-31 00:00:00	50
1249	486	44	processing	2019-08-05 00:00:00	2019-07-31 00:00:00	87
1250	133	36	completed	2019-08-26 00:00:00	2019-07-31 00:00:00	83
1251	483	20	completed	2019-08-13 00:00:00	2019-07-31 00:00:00	78
1252	263	31	processing	2019-08-09 00:00:00	2019-07-31 00:00:00	50
1253	484	47	completed	2019-08-28 00:00:00	2019-07-31 00:00:00	77
1254	599	40	completed	2019-08-12 00:00:00	2019-07-31 00:00:00	70
1255	562	16	shipped	2019-08-07 00:00:00	2019-08-01 00:00:00	27
1256	73	45	completed	2019-08-07 00:00:00	2019-08-01 00:00:00	96
1257	252	78	completed	2019-08-13 00:00:00	2019-08-01 00:00:00	98
1258	591	1	shipped	2019-08-04 00:00:00	2019-08-01 00:00:00	27
1259	616	50	processing	2019-08-25 00:00:00	2019-08-01 00:00:00	53
1260	670	21	shipped	2019-08-26 00:00:00	2019-08-01 00:00:00	9
1261	294	85	processing	2019-08-22 00:00:00	2019-08-02 00:00:00	58
1262	402	98	shipped	2019-08-15 00:00:00	2019-08-02 00:00:00	37
1263	344	23	completed	2019-08-26 00:00:00	2019-08-02 00:00:00	5
1264	15	96	processing	2019-08-11 00:00:00	2019-08-02 00:00:00	97
1265	647	87	processing	2019-08-29 00:00:00	2019-08-02 00:00:00	20
1266	139	38	completed	2019-08-08 00:00:00	2019-08-02 00:00:00	89
1267	162	98	shipped	2019-08-13 00:00:00	2019-08-02 00:00:00	43
1268	51	41	shipped	2019-08-08 00:00:00	2019-08-02 00:00:00	23
1269	486	68	completed	2019-08-23 00:00:00	2019-08-02 00:00:00	94
1270	399	3	processing	2019-08-26 00:00:00	2019-08-03 00:00:00	76
1271	452	40	completed	2019-08-09 00:00:00	2019-08-03 00:00:00	47
1272	76	76	completed	2019-08-23 00:00:00	2019-08-03 00:00:00	32
1273	535	40	completed	2019-08-29 00:00:00	2019-08-03 00:00:00	100
1274	247	97	completed	2019-09-01 00:00:00	2019-08-03 00:00:00	33
1275	567	14	completed	2019-08-14 00:00:00	2019-08-03 00:00:00	37
1276	688	74	completed	2019-08-24 00:00:00	2019-08-03 00:00:00	72
1277	58	62	completed	2019-08-05 00:00:00	2019-08-03 00:00:00	16
1278	163	79	processing	2019-08-18 00:00:00	2019-08-03 00:00:00	62
1279	486	35	completed	2019-08-31 00:00:00	2019-08-03 00:00:00	64
1280	560	66	processing	2019-08-28 00:00:00	2019-08-03 00:00:00	66
1281	687	100	completed	2019-08-14 00:00:00	2019-08-04 00:00:00	60
1282	307	18	shipped	2019-08-21 00:00:00	2019-08-04 00:00:00	23
1283	452	40	shipped	2019-08-19 00:00:00	2019-08-04 00:00:00	33
1284	361	15	completed	2019-08-07 00:00:00	2019-08-04 00:00:00	55
1285	435	71	shipped	2019-08-07 00:00:00	2019-08-04 00:00:00	12
1286	586	74	completed	2019-08-26 00:00:00	2019-08-04 00:00:00	15
1287	165	49	processing	2019-08-12 00:00:00	2019-08-04 00:00:00	94
1288	637	35	completed	2019-08-30 00:00:00	2019-08-04 00:00:00	70
1289	667	7	processing	2019-08-31 00:00:00	2019-08-05 00:00:00	8
1290	407	77	completed	2019-08-21 00:00:00	2019-08-05 00:00:00	37
1291	466	21	processing	2019-08-27 00:00:00	2019-08-06 00:00:00	94
1292	114	82	completed	2019-08-28 00:00:00	2019-08-06 00:00:00	79
1293	327	50	processing	2019-08-15 00:00:00	2019-08-07 00:00:00	49
1294	178	33	processing	2019-08-11 00:00:00	2019-08-07 00:00:00	1
1295	435	58	shipped	2019-08-17 00:00:00	2019-08-07 00:00:00	86
1296	530	16	shipped	2019-08-12 00:00:00	2019-08-07 00:00:00	74
1297	559	93	completed	2019-08-14 00:00:00	2019-08-07 00:00:00	51
1298	129	63	processing	2019-08-10 00:00:00	2019-08-07 00:00:00	25
1299	397	73	shipped	2019-08-15 00:00:00	2019-08-07 00:00:00	94
1300	512	94	completed	2019-08-27 00:00:00	2019-08-07 00:00:00	49
1301	461	33	completed	2019-09-04 00:00:00	2019-08-08 00:00:00	1
1302	247	57	processing	2019-09-06 00:00:00	2019-08-08 00:00:00	34
1303	446	47	processing	2019-09-01 00:00:00	2019-08-08 00:00:00	60
1304	605	90	shipped	2019-08-19 00:00:00	2019-08-08 00:00:00	28
1305	626	16	shipped	2019-08-29 00:00:00	2019-08-08 00:00:00	97
1306	557	59	completed	2019-09-08 00:00:00	2019-08-09 00:00:00	89
1307	70	93	processing	2019-08-14 00:00:00	2019-08-09 00:00:00	76
1308	149	77	shipped	2019-09-01 00:00:00	2019-08-09 00:00:00	89
1309	485	88	processing	2019-09-06 00:00:00	2019-08-10 00:00:00	14
1310	681	31	processing	2019-09-02 00:00:00	2019-08-10 00:00:00	20
1311	365	53	completed	2019-09-05 00:00:00	2019-08-11 00:00:00	87
1312	179	32	completed	2019-08-31 00:00:00	2019-08-11 00:00:00	34
1313	404	71	shipped	2019-08-18 00:00:00	2019-08-12 00:00:00	10
1314	297	62	processing	2019-09-03 00:00:00	2019-08-12 00:00:00	100
1315	360	57	processing	2019-09-02 00:00:00	2019-08-12 00:00:00	98
1316	81	47	completed	2019-09-08 00:00:00	2019-08-12 00:00:00	22
1317	76	2	completed	2019-08-23 00:00:00	2019-08-12 00:00:00	86
1318	430	54	shipped	2019-08-16 00:00:00	2019-08-13 00:00:00	93
1319	234	92	shipped	2019-09-04 00:00:00	2019-08-13 00:00:00	53
1320	456	58	shipped	2019-09-10 00:00:00	2019-08-13 00:00:00	67
1321	20	66	completed	2019-08-21 00:00:00	2019-08-14 00:00:00	11
1322	686	1	processing	2019-08-17 00:00:00	2019-08-14 00:00:00	74
1323	548	98	completed	2019-08-22 00:00:00	2019-08-14 00:00:00	79
1324	125	77	processing	2019-09-12 00:00:00	2019-08-14 00:00:00	53
1325	41	5	processing	2019-09-07 00:00:00	2019-08-14 00:00:00	23
1326	574	36	completed	2019-09-09 00:00:00	2019-08-14 00:00:00	4
1327	348	45	processing	2019-08-27 00:00:00	2019-08-15 00:00:00	53
1328	134	57	shipped	2019-08-31 00:00:00	2019-08-15 00:00:00	96
1329	197	23	completed	2019-09-04 00:00:00	2019-08-15 00:00:00	1
1330	109	18	shipped	2019-08-29 00:00:00	2019-08-15 00:00:00	67
1331	226	14	processing	2019-08-31 00:00:00	2019-08-16 00:00:00	29
1332	617	43	processing	2019-09-03 00:00:00	2019-08-16 00:00:00	27
1333	38	39	completed	2019-09-04 00:00:00	2019-08-16 00:00:00	75
1334	404	33	completed	2019-08-24 00:00:00	2019-08-16 00:00:00	66
1335	304	71	shipped	2019-08-20 00:00:00	2019-08-16 00:00:00	88
1336	62	2	shipped	2019-09-14 00:00:00	2019-08-16 00:00:00	66
1337	286	36	processing	2019-09-14 00:00:00	2019-08-16 00:00:00	50
1338	565	41	shipped	2019-08-20 00:00:00	2019-08-17 00:00:00	39
1339	131	20	completed	2019-08-31 00:00:00	2019-08-17 00:00:00	20
1340	103	18	processing	2019-09-15 00:00:00	2019-08-17 00:00:00	25
1341	408	29	processing	2019-09-13 00:00:00	2019-08-18 00:00:00	41
1342	240	2	completed	2019-08-23 00:00:00	2019-08-18 00:00:00	64
1343	65	93	completed	2019-08-20 00:00:00	2019-08-18 00:00:00	14
1344	672	99	processing	2019-08-24 00:00:00	2019-08-18 00:00:00	10
1345	27	4	shipped	2019-09-18 00:00:00	2019-08-19 00:00:00	13
1346	29	95	shipped	2019-09-04 00:00:00	2019-08-19 00:00:00	42
1347	225	71	completed	2019-09-11 00:00:00	2019-08-19 00:00:00	13
1348	232	12	completed	2019-09-15 00:00:00	2019-08-19 00:00:00	65
1349	644	36	processing	2019-08-24 00:00:00	2019-08-20 00:00:00	38
1350	90	97	processing	2019-09-09 00:00:00	2019-08-20 00:00:00	19
1351	440	76	completed	2019-09-14 00:00:00	2019-08-20 00:00:00	42
1352	511	49	completed	2019-08-22 00:00:00	2019-08-20 00:00:00	81
1353	498	98	completed	2019-08-28 00:00:00	2019-08-20 00:00:00	58
1354	521	9	shipped	2019-09-17 00:00:00	2019-08-20 00:00:00	61
1355	135	69	shipped	2019-09-13 00:00:00	2019-08-20 00:00:00	40
1356	184	73	processing	2019-08-24 00:00:00	2019-08-20 00:00:00	98
1357	234	12	processing	2019-09-15 00:00:00	2019-08-21 00:00:00	2
1358	125	10	processing	2019-08-26 00:00:00	2019-08-21 00:00:00	27
1359	518	84	shipped	2019-08-22 00:00:00	2019-08-21 00:00:00	83
1360	127	61	completed	2019-09-13 00:00:00	2019-08-21 00:00:00	62
1361	385	66	completed	2019-09-05 00:00:00	2019-08-22 00:00:00	76
1362	473	22	completed	2019-09-20 00:00:00	2019-08-22 00:00:00	38
1363	163	15	completed	2019-09-14 00:00:00	2019-08-23 00:00:00	65
1366	73	60	completed	2019-08-28 00:00:00	2019-08-23 00:00:00	4
1367	672	74	processing	2019-09-17 00:00:00	2019-08-23 00:00:00	57
1369	142	29	processing	2019-09-22 00:00:00	2019-08-24 00:00:00	94
1370	355	61	processing	2019-08-27 00:00:00	2019-08-24 00:00:00	18
1372	378	99	shipped	2019-09-22 00:00:00	2019-08-24 00:00:00	23
1373	609	57	processing	2019-09-10 00:00:00	2019-08-24 00:00:00	87
1375	125	24	completed	2019-09-02 00:00:00	2019-08-24 00:00:00	29
1377	315	100	shipped	2019-08-26 00:00:00	2019-08-24 00:00:00	11
1381	206	78	processing	2019-09-10 00:00:00	2019-08-25 00:00:00	7
1383	224	37	shipped	2019-09-10 00:00:00	2019-08-25 00:00:00	42
1384	34	75	processing	2019-09-21 00:00:00	2019-08-25 00:00:00	76
1386	192	5	completed	2019-09-03 00:00:00	2019-08-26 00:00:00	35
1387	119	53	shipped	2019-09-24 00:00:00	2019-08-26 00:00:00	86
1389	535	54	shipped	2019-09-08 00:00:00	2019-08-26 00:00:00	86
1391	143	67	processing	2019-09-24 00:00:00	2019-08-26 00:00:00	50
1393	391	13	shipped	2019-09-06 00:00:00	2019-08-27 00:00:00	93
1395	147	18	completed	2019-09-22 00:00:00	2019-08-27 00:00:00	96
1398	482	41	processing	2019-09-20 00:00:00	2019-08-29 00:00:00	38
1400	427	48	shipped	2019-09-27 00:00:00	2019-08-29 00:00:00	33
1404	116	97	completed	2019-09-02 00:00:00	2019-08-29 00:00:00	59
1405	638	64	shipped	2019-09-19 00:00:00	2019-08-30 00:00:00	67
1406	40	39	completed	2019-09-29 00:00:00	2019-08-30 00:00:00	27
1364	51	99	shipped	2019-09-10 00:00:00	2019-08-23 00:00:00	58
1365	132	23	completed	2019-09-06 00:00:00	2019-08-23 00:00:00	47
1368	168	13	shipped	2019-09-08 00:00:00	2019-08-23 00:00:00	71
1371	250	43	completed	2019-09-16 00:00:00	2019-08-24 00:00:00	30
1374	363	24	processing	2019-09-12 00:00:00	2019-08-24 00:00:00	5
1376	454	69	processing	2019-08-26 00:00:00	2019-08-24 00:00:00	29
1378	573	49	shipped	2019-08-31 00:00:00	2019-08-24 00:00:00	88
1379	105	71	completed	2019-09-06 00:00:00	2019-08-24 00:00:00	63
1380	382	76	processing	2019-09-16 00:00:00	2019-08-24 00:00:00	63
1382	520	30	processing	2019-08-30 00:00:00	2019-08-25 00:00:00	18
1385	276	2	shipped	2019-09-21 00:00:00	2019-08-26 00:00:00	35
1388	464	100	shipped	2019-09-19 00:00:00	2019-08-26 00:00:00	14
1390	44	32	shipped	2019-09-03 00:00:00	2019-08-26 00:00:00	47
1392	265	2	shipped	2019-09-05 00:00:00	2019-08-26 00:00:00	83
1394	340	16	processing	2019-09-11 00:00:00	2019-08-27 00:00:00	96
1396	467	93	completed	2019-09-08 00:00:00	2019-08-28 00:00:00	58
1397	121	70	processing	2019-09-28 00:00:00	2019-08-29 00:00:00	9
1399	180	69	processing	2019-09-18 00:00:00	2019-08-29 00:00:00	73
1401	691	48	shipped	2019-09-28 00:00:00	2019-08-29 00:00:00	89
1402	126	56	shipped	2019-09-11 00:00:00	2019-08-29 00:00:00	95
1403	282	49	completed	2019-09-02 00:00:00	2019-08-29 00:00:00	94
1407	510	3	shipped	2019-09-09 00:00:00	2019-08-30 00:00:00	86
1408	642	79	completed	2019-09-07 00:00:00	2019-08-30 00:00:00	78
1409	224	43	shipped	2019-09-06 00:00:00	2019-08-31 00:00:00	71
1410	468	90	processing	2019-09-30 00:00:00	2019-08-31 00:00:00	92
1411	592	3	shipped	2019-09-26 00:00:00	2019-08-31 00:00:00	59
1412	186	14	processing	2019-09-11 00:00:00	2019-08-31 00:00:00	11
1413	534	14	completed	2019-09-24 00:00:00	2019-08-31 00:00:00	45
1414	620	18	completed	2019-09-24 00:00:00	2019-08-31 00:00:00	64
1415	425	46	processing	2019-09-30 00:00:00	2019-09-01 00:00:00	87
1416	3	31	completed	2019-09-14 00:00:00	2019-09-01 00:00:00	57
1417	669	78	shipped	2019-09-29 00:00:00	2019-09-01 00:00:00	100
1418	93	94	shipped	2019-09-17 00:00:00	2019-09-01 00:00:00	62
1419	551	68	shipped	2019-09-12 00:00:00	2019-09-01 00:00:00	4
1420	422	64	completed	2019-09-28 00:00:00	2019-09-01 00:00:00	12
1421	279	49	processing	2019-10-01 00:00:00	2019-09-02 00:00:00	100
1422	232	58	processing	2019-09-03 00:00:00	2019-09-02 00:00:00	72
1423	500	68	processing	2019-09-15 00:00:00	2019-09-03 00:00:00	89
1424	493	70	completed	2019-09-06 00:00:00	2019-09-03 00:00:00	78
1425	648	21	completed	2019-09-22 00:00:00	2019-09-03 00:00:00	55
1426	293	91	completed	2019-09-12 00:00:00	2019-09-04 00:00:00	100
1427	189	9	processing	2019-09-15 00:00:00	2019-09-04 00:00:00	4
1428	125	95	processing	2019-09-07 00:00:00	2019-09-04 00:00:00	58
1429	245	92	completed	2019-09-17 00:00:00	2019-09-04 00:00:00	85
1430	596	96	shipped	2019-09-24 00:00:00	2019-09-04 00:00:00	9
1431	542	70	processing	2019-09-24 00:00:00	2019-09-05 00:00:00	80
1432	180	86	completed	2019-09-11 00:00:00	2019-09-05 00:00:00	37
1433	142	49	processing	2019-10-02 00:00:00	2019-09-05 00:00:00	63
1434	346	57	completed	2019-09-29 00:00:00	2019-09-05 00:00:00	47
1435	102	24	shipped	2019-09-29 00:00:00	2019-09-05 00:00:00	36
1436	529	83	processing	2019-09-20 00:00:00	2019-09-05 00:00:00	17
1437	512	49	processing	2019-09-24 00:00:00	2019-09-05 00:00:00	59
1438	102	33	shipped	2019-09-29 00:00:00	2019-09-05 00:00:00	27
1439	297	93	shipped	2019-09-29 00:00:00	2019-09-05 00:00:00	7
1440	402	63	completed	2019-09-24 00:00:00	2019-09-05 00:00:00	67
1441	110	31	processing	2019-09-18 00:00:00	2019-09-06 00:00:00	87
1442	562	93	completed	2019-09-26 00:00:00	2019-09-06 00:00:00	86
1443	515	19	completed	2019-09-30 00:00:00	2019-09-06 00:00:00	54
1444	339	8	processing	2019-09-15 00:00:00	2019-09-07 00:00:00	84
1445	586	65	processing	2019-10-03 00:00:00	2019-09-07 00:00:00	63
1446	123	66	processing	2019-09-15 00:00:00	2019-09-07 00:00:00	51
1447	447	12	shipped	2019-09-18 00:00:00	2019-09-08 00:00:00	80
1448	570	28	completed	2019-09-26 00:00:00	2019-09-08 00:00:00	39
1449	659	21	completed	2019-09-14 00:00:00	2019-09-08 00:00:00	77
1450	350	97	shipped	2019-10-07 00:00:00	2019-09-08 00:00:00	69
1451	145	59	shipped	2019-10-05 00:00:00	2019-09-09 00:00:00	84
1452	389	11	shipped	2019-09-12 00:00:00	2019-09-09 00:00:00	24
1453	81	56	processing	2019-09-30 00:00:00	2019-09-10 00:00:00	43
1454	532	9	processing	2019-10-02 00:00:00	2019-09-10 00:00:00	71
1455	85	95	processing	2019-09-13 00:00:00	2019-09-10 00:00:00	67
1456	669	48	processing	2019-10-08 00:00:00	2019-09-11 00:00:00	20
1457	131	23	completed	2019-09-16 00:00:00	2019-09-11 00:00:00	5
1458	675	99	processing	2019-09-30 00:00:00	2019-09-11 00:00:00	56
1459	535	23	completed	2019-09-26 00:00:00	2019-09-11 00:00:00	16
1460	152	60	shipped	2019-10-11 00:00:00	2019-09-11 00:00:00	71
1461	201	50	shipped	2019-09-30 00:00:00	2019-09-11 00:00:00	37
1462	154	98	completed	2019-10-06 00:00:00	2019-09-11 00:00:00	99
1463	5	43	processing	2019-09-15 00:00:00	2019-09-11 00:00:00	10
1464	657	38	shipped	2019-10-06 00:00:00	2019-09-11 00:00:00	72
1465	374	4	shipped	2019-10-09 00:00:00	2019-09-12 00:00:00	4
1466	601	30	shipped	2019-09-20 00:00:00	2019-09-12 00:00:00	50
1467	309	88	completed	2019-09-29 00:00:00	2019-09-12 00:00:00	2
1468	546	19	processing	2019-10-07 00:00:00	2019-09-12 00:00:00	26
1469	374	10	shipped	2019-09-15 00:00:00	2019-09-12 00:00:00	12
1470	651	27	shipped	2019-10-01 00:00:00	2019-09-12 00:00:00	71
1471	326	83	shipped	2019-10-06 00:00:00	2019-09-12 00:00:00	98
1472	58	77	completed	2019-09-26 00:00:00	2019-09-12 00:00:00	22
1473	624	12	completed	2019-10-02 00:00:00	2019-09-12 00:00:00	15
1474	296	79	shipped	2019-09-23 00:00:00	2019-09-13 00:00:00	6
1475	435	14	processing	2019-09-24 00:00:00	2019-09-13 00:00:00	83
1476	668	23	processing	2019-09-24 00:00:00	2019-09-13 00:00:00	82
1477	173	94	shipped	2019-09-19 00:00:00	2019-09-13 00:00:00	38
1478	429	99	processing	2019-09-22 00:00:00	2019-09-14 00:00:00	22
1479	519	46	completed	2019-10-04 00:00:00	2019-09-14 00:00:00	39
1480	348	78	completed	2019-09-25 00:00:00	2019-09-14 00:00:00	77
1481	602	62	processing	2019-10-10 00:00:00	2019-09-15 00:00:00	6
1482	158	10	completed	2019-09-19 00:00:00	2019-09-15 00:00:00	82
1483	613	36	processing	2019-09-19 00:00:00	2019-09-15 00:00:00	40
1484	298	26	completed	2019-09-24 00:00:00	2019-09-15 00:00:00	87
1485	533	88	shipped	2019-09-28 00:00:00	2019-09-15 00:00:00	9
1486	38	2	completed	2019-09-29 00:00:00	2019-09-16 00:00:00	51
1487	582	32	completed	2019-09-19 00:00:00	2019-09-16 00:00:00	46
1488	575	2	processing	2019-10-08 00:00:00	2019-09-16 00:00:00	59
1489	480	77	shipped	2019-10-11 00:00:00	2019-09-16 00:00:00	68
1490	69	30	completed	2019-09-28 00:00:00	2019-09-16 00:00:00	99
1491	257	28	processing	2019-10-09 00:00:00	2019-09-16 00:00:00	26
1492	238	20	processing	2019-10-04 00:00:00	2019-09-17 00:00:00	68
1493	416	25	completed	2019-09-29 00:00:00	2019-09-17 00:00:00	37
1494	600	7	completed	2019-10-03 00:00:00	2019-09-17 00:00:00	23
1495	539	56	shipped	2019-10-15 00:00:00	2019-09-18 00:00:00	12
1496	393	85	processing	2019-09-25 00:00:00	2019-09-19 00:00:00	14
1497	273	81	shipped	2019-10-06 00:00:00	2019-09-19 00:00:00	83
1498	174	67	completed	2019-10-18 00:00:00	2019-09-19 00:00:00	25
1499	550	66	completed	2019-09-26 00:00:00	2019-09-19 00:00:00	85
1500	91	74	shipped	2019-10-14 00:00:00	2019-09-19 00:00:00	58
1501	320	4	shipped	2019-09-21 00:00:00	2019-09-20 00:00:00	51
1502	680	24	processing	2019-10-19 00:00:00	2019-09-20 00:00:00	77
1503	347	17	shipped	2019-09-22 00:00:00	2019-09-20 00:00:00	35
1504	118	56	processing	2019-09-27 00:00:00	2019-09-20 00:00:00	40
1505	156	90	shipped	2019-09-30 00:00:00	2019-09-20 00:00:00	6
1506	481	58	processing	2019-09-25 00:00:00	2019-09-20 00:00:00	5
1507	22	48	completed	2019-10-04 00:00:00	2019-09-20 00:00:00	60
1508	214	92	processing	2019-10-01 00:00:00	2019-09-20 00:00:00	62
1509	30	28	processing	2019-09-25 00:00:00	2019-09-20 00:00:00	77
1510	520	86	shipped	2019-10-20 00:00:00	2019-09-20 00:00:00	87
1511	640	69	processing	2019-10-07 00:00:00	2019-09-20 00:00:00	8
1512	532	70	completed	2019-10-08 00:00:00	2019-09-20 00:00:00	86
1513	118	69	completed	2019-09-24 00:00:00	2019-09-21 00:00:00	15
1514	111	93	shipped	2019-10-04 00:00:00	2019-09-21 00:00:00	30
1561	100	73	shipped	2019-10-24 00:00:00	2019-10-02 00:00:00	82
1564	675	31	completed	2019-10-27 00:00:00	2019-10-02 00:00:00	56
1565	284	68	shipped	2019-10-10 00:00:00	2019-10-02 00:00:00	94
1566	228	79	completed	2019-10-20 00:00:00	2019-10-02 00:00:00	65
1567	612	95	processing	2019-10-07 00:00:00	2019-10-02 00:00:00	24
1568	572	46	processing	2019-10-15 00:00:00	2019-10-02 00:00:00	85
1569	248	62	shipped	2019-10-18 00:00:00	2019-10-03 00:00:00	25
1570	187	78	processing	2019-10-24 00:00:00	2019-10-03 00:00:00	37
1571	530	36	shipped	2019-10-24 00:00:00	2019-10-04 00:00:00	80
1572	306	5	processing	2019-10-06 00:00:00	2019-10-04 00:00:00	14
1573	401	94	completed	2019-10-18 00:00:00	2019-10-05 00:00:00	34
1574	202	40	completed	2019-10-10 00:00:00	2019-10-05 00:00:00	24
1575	688	19	processing	2019-10-07 00:00:00	2019-10-05 00:00:00	32
1576	299	42	completed	2019-11-04 00:00:00	2019-10-05 00:00:00	44
1577	503	77	completed	2019-10-18 00:00:00	2019-10-05 00:00:00	84
1578	356	99	completed	2019-10-26 00:00:00	2019-10-05 00:00:00	39
1580	412	45	shipped	2019-10-14 00:00:00	2019-10-05 00:00:00	53
1582	569	44	completed	2019-10-20 00:00:00	2019-10-06 00:00:00	50
1584	383	91	shipped	2019-10-18 00:00:00	2019-10-06 00:00:00	19
1586	542	49	shipped	2019-10-27 00:00:00	2019-10-07 00:00:00	81
1587	351	33	processing	2019-10-21 00:00:00	2019-10-07 00:00:00	96
1588	184	82	completed	2019-10-17 00:00:00	2019-10-07 00:00:00	66
1591	198	18	shipped	2019-11-07 00:00:00	2019-10-08 00:00:00	8
1593	306	84	completed	2019-10-21 00:00:00	2019-10-09 00:00:00	71
1595	464	13	shipped	2019-10-12 00:00:00	2019-10-09 00:00:00	4
1597	327	11	shipped	2019-10-18 00:00:00	2019-10-09 00:00:00	42
1599	421	92	shipped	2019-11-01 00:00:00	2019-10-09 00:00:00	61
1601	42	36	completed	2019-10-20 00:00:00	2019-10-09 00:00:00	56
1603	436	66	shipped	2019-10-28 00:00:00	2019-10-10 00:00:00	10
1606	533	58	completed	2019-11-10 00:00:00	2019-10-12 00:00:00	94
1608	659	64	shipped	2019-10-25 00:00:00	2019-10-12 00:00:00	56
1609	510	31	completed	2019-11-10 00:00:00	2019-10-13 00:00:00	82
1611	506	82	processing	2019-11-05 00:00:00	2019-10-13 00:00:00	85
1613	498	95	shipped	2019-10-24 00:00:00	2019-10-13 00:00:00	57
1614	648	99	processing	2019-11-08 00:00:00	2019-10-13 00:00:00	93
1615	144	38	shipped	2019-10-24 00:00:00	2019-10-13 00:00:00	66
1617	346	79	shipped	2019-11-12 00:00:00	2019-10-13 00:00:00	43
1619	387	37	completed	2019-10-26 00:00:00	2019-10-13 00:00:00	3
1621	89	36	processing	2019-10-15 00:00:00	2019-10-14 00:00:00	16
1624	665	13	completed	2019-10-26 00:00:00	2019-10-14 00:00:00	30
1625	534	77	processing	2019-10-17 00:00:00	2019-10-14 00:00:00	15
1627	482	66	shipped	2019-10-17 00:00:00	2019-10-14 00:00:00	83
1629	532	16	completed	2019-11-10 00:00:00	2019-10-14 00:00:00	95
1631	651	9	completed	2019-10-21 00:00:00	2019-10-14 00:00:00	75
1633	141	50	completed	2019-11-13 00:00:00	2019-10-14 00:00:00	65
1634	517	26	shipped	2019-10-23 00:00:00	2019-10-14 00:00:00	34
1635	170	97	completed	2019-10-22 00:00:00	2019-10-14 00:00:00	2
1636	629	88	processing	2019-10-24 00:00:00	2019-10-14 00:00:00	76
1638	417	86	shipped	2019-10-18 00:00:00	2019-10-14 00:00:00	10
1642	44	51	shipped	2019-10-27 00:00:00	2019-10-16 00:00:00	82
1644	516	7	completed	2019-11-10 00:00:00	2019-10-16 00:00:00	61
1646	402	54	shipped	2019-11-04 00:00:00	2019-10-16 00:00:00	58
1647	46	56	processing	2019-10-17 00:00:00	2019-10-16 00:00:00	38
1649	201	90	processing	2019-11-08 00:00:00	2019-10-17 00:00:00	99
1651	79	17	completed	2019-10-29 00:00:00	2019-10-18 00:00:00	67
1653	617	3	shipped	2019-10-28 00:00:00	2019-10-18 00:00:00	22
1654	8	72	shipped	2019-11-07 00:00:00	2019-10-18 00:00:00	20
1657	338	12	shipped	2019-10-20 00:00:00	2019-10-18 00:00:00	83
1659	99	72	completed	2019-11-16 00:00:00	2019-10-18 00:00:00	82
1661	345	48	shipped	2019-11-13 00:00:00	2019-10-19 00:00:00	66
1662	141	85	completed	2019-10-27 00:00:00	2019-10-19 00:00:00	7
1664	157	19	completed	2019-11-14 00:00:00	2019-10-19 00:00:00	53
1666	209	12	shipped	2019-11-12 00:00:00	2019-10-20 00:00:00	76
1668	27	9	shipped	2019-10-28 00:00:00	2019-10-20 00:00:00	25
1670	644	15	completed	2019-10-28 00:00:00	2019-10-21 00:00:00	86
1515	227	57	shipped	2019-10-20 00:00:00	2019-09-21 00:00:00	52
1516	443	79	shipped	2019-09-23 00:00:00	2019-09-21 00:00:00	66
1517	165	78	shipped	2019-10-13 00:00:00	2019-09-21 00:00:00	66
1518	672	73	shipped	2019-09-29 00:00:00	2019-09-21 00:00:00	89
1519	205	89	shipped	2019-10-14 00:00:00	2019-09-21 00:00:00	90
1520	617	90	shipped	2019-10-15 00:00:00	2019-09-21 00:00:00	26
1521	159	82	shipped	2019-10-03 00:00:00	2019-09-21 00:00:00	88
1522	303	43	shipped	2019-10-01 00:00:00	2019-09-21 00:00:00	96
1523	376	49	processing	2019-09-29 00:00:00	2019-09-21 00:00:00	72
1524	513	48	processing	2019-10-14 00:00:00	2019-09-21 00:00:00	59
1525	111	57	processing	2019-10-21 00:00:00	2019-09-22 00:00:00	41
1526	490	46	processing	2019-10-10 00:00:00	2019-09-23 00:00:00	14
1527	304	49	shipped	2019-09-30 00:00:00	2019-09-24 00:00:00	94
1528	392	46	shipped	2019-09-27 00:00:00	2019-09-24 00:00:00	37
1529	7	42	shipped	2019-10-10 00:00:00	2019-09-25 00:00:00	73
1530	107	43	completed	2019-10-23 00:00:00	2019-09-25 00:00:00	88
1531	521	75	completed	2019-09-29 00:00:00	2019-09-26 00:00:00	70
1532	147	4	shipped	2019-10-01 00:00:00	2019-09-26 00:00:00	68
1533	654	60	processing	2019-10-24 00:00:00	2019-09-26 00:00:00	89
1534	264	26	completed	2019-10-26 00:00:00	2019-09-26 00:00:00	60
1535	459	31	processing	2019-10-19 00:00:00	2019-09-26 00:00:00	100
1536	63	51	completed	2019-10-18 00:00:00	2019-09-26 00:00:00	67
1537	194	50	processing	2019-10-11 00:00:00	2019-09-27 00:00:00	20
1538	445	28	shipped	2019-09-28 00:00:00	2019-09-27 00:00:00	37
1539	556	60	shipped	2019-10-23 00:00:00	2019-09-27 00:00:00	76
1540	331	82	shipped	2019-10-27 00:00:00	2019-09-28 00:00:00	3
1541	569	52	processing	2019-10-18 00:00:00	2019-09-28 00:00:00	46
1542	297	67	processing	2019-10-09 00:00:00	2019-09-28 00:00:00	95
1543	367	71	processing	2019-10-27 00:00:00	2019-09-28 00:00:00	95
1544	131	32	processing	2019-10-21 00:00:00	2019-09-28 00:00:00	62
1545	210	65	processing	2019-10-09 00:00:00	2019-09-29 00:00:00	71
1546	269	88	processing	2019-10-22 00:00:00	2019-09-29 00:00:00	38
1547	542	88	shipped	2019-10-12 00:00:00	2019-09-29 00:00:00	85
1548	403	73	shipped	2019-10-13 00:00:00	2019-09-30 00:00:00	56
1549	543	11	completed	2019-10-17 00:00:00	2019-09-30 00:00:00	15
1550	195	93	shipped	2019-10-12 00:00:00	2019-09-30 00:00:00	99
1551	618	95	processing	2019-10-05 00:00:00	2019-09-30 00:00:00	37
1552	255	35	completed	2019-10-09 00:00:00	2019-09-30 00:00:00	46
1553	275	41	processing	2019-10-10 00:00:00	2019-09-30 00:00:00	66
1554	97	49	completed	2019-10-16 00:00:00	2019-09-30 00:00:00	1
1555	263	52	shipped	2019-10-13 00:00:00	2019-09-30 00:00:00	15
1556	302	25	completed	2019-10-02 00:00:00	2019-09-30 00:00:00	61
1557	35	9	processing	2019-10-20 00:00:00	2019-09-30 00:00:00	65
1558	217	52	completed	2019-10-06 00:00:00	2019-10-01 00:00:00	87
1559	396	67	completed	2019-10-03 00:00:00	2019-10-01 00:00:00	33
1560	528	43	completed	2019-10-17 00:00:00	2019-10-01 00:00:00	92
1562	100	47	processing	2019-10-28 00:00:00	2019-10-02 00:00:00	99
1563	321	15	processing	2019-10-29 00:00:00	2019-10-02 00:00:00	78
1579	209	95	shipped	2019-11-01 00:00:00	2019-10-05 00:00:00	1
1581	667	9	completed	2019-10-09 00:00:00	2019-10-05 00:00:00	91
1583	60	83	completed	2019-10-23 00:00:00	2019-10-06 00:00:00	3
1585	42	99	completed	2019-10-31 00:00:00	2019-10-06 00:00:00	48
1589	548	40	shipped	2019-10-18 00:00:00	2019-10-07 00:00:00	34
1590	429	49	shipped	2019-11-03 00:00:00	2019-10-07 00:00:00	84
1592	403	59	processing	2019-10-16 00:00:00	2019-10-08 00:00:00	91
1594	404	67	completed	2019-10-15 00:00:00	2019-10-09 00:00:00	29
1596	201	8	shipped	2019-10-14 00:00:00	2019-10-09 00:00:00	62
1598	434	47	shipped	2019-10-12 00:00:00	2019-10-09 00:00:00	63
1600	223	49	processing	2019-11-06 00:00:00	2019-10-09 00:00:00	24
1602	62	91	completed	2019-10-19 00:00:00	2019-10-09 00:00:00	81
1604	171	96	shipped	2019-11-06 00:00:00	2019-10-10 00:00:00	27
1605	644	53	processing	2019-10-19 00:00:00	2019-10-11 00:00:00	98
1607	615	70	completed	2019-10-23 00:00:00	2019-10-12 00:00:00	30
1610	363	37	completed	2019-10-22 00:00:00	2019-10-13 00:00:00	66
1612	496	76	processing	2019-11-08 00:00:00	2019-10-13 00:00:00	96
1616	660	65	processing	2019-10-18 00:00:00	2019-10-13 00:00:00	70
1618	578	32	completed	2019-10-21 00:00:00	2019-10-13 00:00:00	14
1620	95	68	processing	2019-10-31 00:00:00	2019-10-13 00:00:00	52
1622	587	15	processing	2019-10-26 00:00:00	2019-10-14 00:00:00	38
1623	174	2	shipped	2019-10-31 00:00:00	2019-10-14 00:00:00	30
1626	173	100	shipped	2019-11-05 00:00:00	2019-10-14 00:00:00	76
1628	260	18	completed	2019-11-10 00:00:00	2019-10-14 00:00:00	91
1630	58	79	shipped	2019-10-19 00:00:00	2019-10-14 00:00:00	75
1632	693	74	shipped	2019-10-29 00:00:00	2019-10-14 00:00:00	47
1637	89	72	shipped	2019-11-04 00:00:00	2019-10-14 00:00:00	67
1639	460	28	completed	2019-11-04 00:00:00	2019-10-15 00:00:00	85
1640	6	28	shipped	2019-10-20 00:00:00	2019-10-15 00:00:00	81
1641	529	35	processing	2019-10-29 00:00:00	2019-10-16 00:00:00	48
1643	280	66	processing	2019-10-29 00:00:00	2019-10-16 00:00:00	27
1645	626	46	completed	2019-10-24 00:00:00	2019-10-16 00:00:00	11
1648	158	45	processing	2019-10-31 00:00:00	2019-10-17 00:00:00	92
1650	248	20	completed	2019-11-15 00:00:00	2019-10-17 00:00:00	38
1652	466	8	shipped	2019-11-02 00:00:00	2019-10-18 00:00:00	11
1655	273	35	shipped	2019-10-22 00:00:00	2019-10-18 00:00:00	50
1656	139	12	shipped	2019-11-13 00:00:00	2019-10-18 00:00:00	83
1658	247	50	completed	2019-11-17 00:00:00	2019-10-18 00:00:00	86
1660	355	29	shipped	2019-10-26 00:00:00	2019-10-18 00:00:00	4
1663	300	89	processing	2019-11-15 00:00:00	2019-10-19 00:00:00	21
1665	429	27	shipped	2019-11-12 00:00:00	2019-10-20 00:00:00	48
1667	678	48	shipped	2019-11-10 00:00:00	2019-10-20 00:00:00	55
1669	6	46	processing	2019-11-14 00:00:00	2019-10-21 00:00:00	78
1671	185	53	processing	2019-11-05 00:00:00	2019-10-21 00:00:00	59
1672	283	86	completed	2019-11-10 00:00:00	2019-10-21 00:00:00	5
1673	158	93	shipped	2019-11-15 00:00:00	2019-10-22 00:00:00	100
1674	108	28	processing	2019-11-18 00:00:00	2019-10-22 00:00:00	54
1675	287	21	processing	2019-11-05 00:00:00	2019-10-23 00:00:00	30
1676	38	66	completed	2019-11-08 00:00:00	2019-10-23 00:00:00	46
1677	305	82	processing	2019-11-10 00:00:00	2019-10-24 00:00:00	51
1678	691	45	shipped	2019-10-27 00:00:00	2019-10-24 00:00:00	81
1679	297	58	completed	2019-11-18 00:00:00	2019-10-24 00:00:00	16
1680	150	18	processing	2019-11-12 00:00:00	2019-10-24 00:00:00	12
1681	685	62	completed	2019-11-15 00:00:00	2019-10-25 00:00:00	93
1682	391	12	processing	2019-11-02 00:00:00	2019-10-25 00:00:00	53
1683	654	69	completed	2019-11-10 00:00:00	2019-10-25 00:00:00	75
1684	458	63	shipped	2019-11-03 00:00:00	2019-10-25 00:00:00	99
1685	557	51	shipped	2019-10-28 00:00:00	2019-10-25 00:00:00	65
1686	381	57	shipped	2019-10-27 00:00:00	2019-10-25 00:00:00	13
1687	562	97	completed	2019-11-07 00:00:00	2019-10-26 00:00:00	37
1689	373	52	processing	2019-11-10 00:00:00	2019-10-27 00:00:00	34
1691	462	96	shipped	2019-11-01 00:00:00	2019-10-27 00:00:00	53
1693	310	37	processing	2019-11-15 00:00:00	2019-10-28 00:00:00	53
1695	5	62	processing	2019-11-08 00:00:00	2019-10-29 00:00:00	31
1696	281	33	completed	2019-11-09 00:00:00	2019-10-29 00:00:00	17
1697	669	31	completed	2019-11-11 00:00:00	2019-10-29 00:00:00	30
1698	334	9	processing	2019-11-10 00:00:00	2019-10-29 00:00:00	80
1700	33	34	completed	2019-11-22 00:00:00	2019-10-29 00:00:00	34
1702	532	80	completed	2019-11-15 00:00:00	2019-10-29 00:00:00	30
1703	194	61	processing	2019-11-06 00:00:00	2019-10-29 00:00:00	49
1705	145	81	shipped	2019-11-17 00:00:00	2019-10-30 00:00:00	15
1707	405	52	shipped	2019-11-02 00:00:00	2019-10-31 00:00:00	80
1709	304	62	completed	2019-11-03 00:00:00	2019-10-31 00:00:00	99
1711	637	74	processing	2019-11-27 00:00:00	2019-11-01 00:00:00	7
1713	438	51	shipped	2019-11-04 00:00:00	2019-11-01 00:00:00	47
1715	543	28	shipped	2019-11-16 00:00:00	2019-11-01 00:00:00	48
1716	245	61	processing	2019-11-15 00:00:00	2019-11-01 00:00:00	90
1718	121	66	shipped	2019-11-22 00:00:00	2019-11-02 00:00:00	36
1720	641	38	processing	2019-11-29 00:00:00	2019-11-03 00:00:00	34
1722	674	46	shipped	2019-11-20 00:00:00	2019-11-03 00:00:00	93
1724	352	12	completed	2019-11-20 00:00:00	2019-11-04 00:00:00	69
1726	450	88	shipped	2019-11-07 00:00:00	2019-11-05 00:00:00	58
1728	153	46	processing	2019-11-24 00:00:00	2019-11-05 00:00:00	12
1730	562	94	shipped	2019-12-01 00:00:00	2019-11-05 00:00:00	83
1733	523	76	completed	2019-11-12 00:00:00	2019-11-05 00:00:00	94
1734	453	71	completed	2019-12-05 00:00:00	2019-11-05 00:00:00	94
1737	477	44	shipped	2019-11-08 00:00:00	2019-11-07 00:00:00	56
1738	484	17	shipped	2019-11-13 00:00:00	2019-11-07 00:00:00	96
1740	200	39	completed	2019-11-17 00:00:00	2019-11-07 00:00:00	1
1742	64	79	shipped	2019-11-08 00:00:00	2019-11-07 00:00:00	45
1744	676	69	shipped	2019-11-18 00:00:00	2019-11-07 00:00:00	47
1746	380	38	completed	2019-11-25 00:00:00	2019-11-08 00:00:00	54
1748	215	42	processing	2019-11-21 00:00:00	2019-11-08 00:00:00	30
1750	664	98	processing	2019-11-21 00:00:00	2019-11-09 00:00:00	50
1753	435	3	processing	2019-11-15 00:00:00	2019-11-10 00:00:00	4
1755	376	93	completed	2019-11-19 00:00:00	2019-11-10 00:00:00	14
1756	39	12	completed	2019-12-11 00:00:00	2019-11-11 00:00:00	8
1758	221	95	shipped	2019-11-15 00:00:00	2019-11-11 00:00:00	23
1760	647	52	completed	2019-11-25 00:00:00	2019-11-11 00:00:00	55
1762	205	92	processing	2019-11-23 00:00:00	2019-11-13 00:00:00	22
1765	157	72	shipped	2019-11-30 00:00:00	2019-11-14 00:00:00	68
1769	416	74	shipped	2019-12-02 00:00:00	2019-11-14 00:00:00	7
1770	166	42	processing	2019-12-11 00:00:00	2019-11-14 00:00:00	29
1772	151	38	processing	2019-11-24 00:00:00	2019-11-15 00:00:00	83
1773	419	98	completed	2019-11-19 00:00:00	2019-11-16 00:00:00	100
1775	225	40	shipped	2019-12-05 00:00:00	2019-11-16 00:00:00	52
1777	225	60	processing	2019-11-23 00:00:00	2019-11-16 00:00:00	39
1779	361	35	completed	2019-12-01 00:00:00	2019-11-16 00:00:00	77
1780	348	98	processing	2019-12-05 00:00:00	2019-11-16 00:00:00	13
1781	507	81	shipped	2019-11-25 00:00:00	2019-11-17 00:00:00	41
1783	31	65	shipped	2019-11-25 00:00:00	2019-11-18 00:00:00	86
1785	262	18	completed	2019-12-19 00:00:00	2019-11-19 00:00:00	54
1789	416	46	shipped	2019-11-28 00:00:00	2019-11-20 00:00:00	55
1791	166	90	shipped	2019-12-14 00:00:00	2019-11-20 00:00:00	17
1792	68	16	processing	2019-11-25 00:00:00	2019-11-21 00:00:00	42
1793	16	49	shipped	2019-12-02 00:00:00	2019-11-22 00:00:00	52
1794	106	49	completed	2019-12-20 00:00:00	2019-11-22 00:00:00	26
1795	66	66	processing	2019-12-22 00:00:00	2019-11-22 00:00:00	81
1796	566	92	processing	2019-12-09 00:00:00	2019-11-22 00:00:00	67
1797	65	32	processing	2019-12-07 00:00:00	2019-11-22 00:00:00	63
1798	641	96	completed	2019-12-20 00:00:00	2019-11-22 00:00:00	11
1799	666	75	processing	2019-11-23 00:00:00	2019-11-22 00:00:00	95
1800	529	52	shipped	2019-11-29 00:00:00	2019-11-22 00:00:00	9
1801	164	12	completed	2019-12-17 00:00:00	2019-11-23 00:00:00	61
1802	485	95	processing	2019-12-22 00:00:00	2019-11-23 00:00:00	88
1803	579	85	processing	2019-11-24 00:00:00	2019-11-23 00:00:00	19
1804	269	95	shipped	2019-11-30 00:00:00	2019-11-23 00:00:00	38
1805	48	46	completed	2019-12-06 00:00:00	2019-11-23 00:00:00	49
1806	507	58	shipped	2019-12-18 00:00:00	2019-11-23 00:00:00	28
1807	517	61	completed	2019-12-09 00:00:00	2019-11-24 00:00:00	96
1808	266	15	shipped	2019-12-07 00:00:00	2019-11-24 00:00:00	34
1809	268	12	shipped	2019-12-07 00:00:00	2019-11-24 00:00:00	22
1810	531	26	completed	2019-12-04 00:00:00	2019-11-24 00:00:00	58
1811	102	13	completed	2019-12-05 00:00:00	2019-11-24 00:00:00	76
1812	598	5	shipped	2019-12-11 00:00:00	2019-11-24 00:00:00	9
1813	292	70	processing	2019-12-19 00:00:00	2019-11-25 00:00:00	89
1814	184	78	processing	2019-12-02 00:00:00	2019-11-25 00:00:00	15
1815	199	9	completed	2019-12-17 00:00:00	2019-11-25 00:00:00	87
1816	205	31	processing	2019-11-26 00:00:00	2019-11-25 00:00:00	96
1817	628	65	completed	2019-12-13 00:00:00	2019-11-25 00:00:00	96
1818	36	58	processing	2019-11-27 00:00:00	2019-11-25 00:00:00	56
1819	678	3	shipped	2019-11-26 00:00:00	2019-11-25 00:00:00	6
1820	427	30	completed	2019-12-01 00:00:00	2019-11-25 00:00:00	55
1821	568	81	processing	2019-12-09 00:00:00	2019-11-26 00:00:00	68
1822	342	71	processing	2019-12-23 00:00:00	2019-11-26 00:00:00	87
1823	293	33	shipped	2019-12-06 00:00:00	2019-11-26 00:00:00	61
1824	486	88	completed	2019-12-24 00:00:00	2019-11-26 00:00:00	45
1825	653	17	shipped	2019-12-10 00:00:00	2019-11-26 00:00:00	78
1826	196	54	completed	2019-12-04 00:00:00	2019-11-26 00:00:00	34
1827	159	17	processing	2019-12-10 00:00:00	2019-11-26 00:00:00	90
1828	336	92	processing	2019-12-21 00:00:00	2019-11-27 00:00:00	71
1829	366	89	shipped	2019-12-14 00:00:00	2019-11-27 00:00:00	11
1830	1	58	completed	2019-12-14 00:00:00	2019-11-27 00:00:00	78
1831	506	40	completed	2019-12-18 00:00:00	2019-11-27 00:00:00	14
1832	359	41	processing	2019-12-17 00:00:00	2019-11-27 00:00:00	64
1833	378	41	processing	2019-12-08 00:00:00	2019-11-27 00:00:00	62
1834	686	23	shipped	2019-12-13 00:00:00	2019-11-27 00:00:00	59
1835	117	34	processing	2019-12-01 00:00:00	2019-11-27 00:00:00	31
1836	535	33	shipped	2019-12-27 00:00:00	2019-11-27 00:00:00	82
1837	491	50	processing	2019-12-27 00:00:00	2019-11-27 00:00:00	64
1838	239	69	processing	2019-12-07 00:00:00	2019-11-27 00:00:00	32
1839	262	79	processing	2019-12-24 00:00:00	2019-11-27 00:00:00	33
1840	491	43	completed	2019-12-02 00:00:00	2019-11-27 00:00:00	35
1841	222	72	shipped	2019-11-28 00:00:00	2019-11-27 00:00:00	6
1842	582	97	completed	2019-11-28 00:00:00	2019-11-27 00:00:00	10
1843	384	88	completed	2019-12-13 00:00:00	2019-11-27 00:00:00	79
1688	570	79	completed	2019-11-01 00:00:00	2019-10-26 00:00:00	69
1690	497	80	completed	2019-10-31 00:00:00	2019-10-27 00:00:00	65
1692	366	94	shipped	2019-11-06 00:00:00	2019-10-27 00:00:00	74
1694	690	90	completed	2019-11-21 00:00:00	2019-10-28 00:00:00	83
1699	418	98	shipped	2019-11-01 00:00:00	2019-10-29 00:00:00	76
1701	261	2	shipped	2019-11-17 00:00:00	2019-10-29 00:00:00	92
1704	697	26	completed	2019-11-16 00:00:00	2019-10-29 00:00:00	82
1706	616	34	completed	2019-11-26 00:00:00	2019-10-31 00:00:00	56
1708	223	22	shipped	2019-11-26 00:00:00	2019-10-31 00:00:00	20
1710	607	97	completed	2019-11-18 00:00:00	2019-10-31 00:00:00	74
1712	170	62	shipped	2019-11-18 00:00:00	2019-11-01 00:00:00	84
1714	247	42	processing	2019-11-29 00:00:00	2019-11-01 00:00:00	85
1717	653	64	processing	2019-11-14 00:00:00	2019-11-02 00:00:00	18
1719	452	93	processing	2019-11-30 00:00:00	2019-11-02 00:00:00	89
1721	336	30	shipped	2019-11-13 00:00:00	2019-11-03 00:00:00	86
1723	224	8	processing	2019-12-04 00:00:00	2019-11-04 00:00:00	29
1725	172	76	shipped	2019-11-10 00:00:00	2019-11-04 00:00:00	30
1727	112	52	shipped	2019-11-13 00:00:00	2019-11-05 00:00:00	53
1729	72	52	processing	2019-12-03 00:00:00	2019-11-05 00:00:00	88
1731	345	35	shipped	2019-11-29 00:00:00	2019-11-05 00:00:00	67
1732	83	76	completed	2019-11-07 00:00:00	2019-11-05 00:00:00	85
1735	143	59	shipped	2019-11-06 00:00:00	2019-11-05 00:00:00	20
1736	7	51	shipped	2019-12-05 00:00:00	2019-11-06 00:00:00	52
1739	598	46	completed	2019-11-30 00:00:00	2019-11-07 00:00:00	80
1741	285	45	processing	2019-11-26 00:00:00	2019-11-07 00:00:00	76
1743	116	2	processing	2019-11-28 00:00:00	2019-11-07 00:00:00	96
1745	659	68	completed	2019-11-09 00:00:00	2019-11-08 00:00:00	52
1747	45	15	completed	2019-11-11 00:00:00	2019-11-08 00:00:00	24
1749	363	95	shipped	2019-11-10 00:00:00	2019-11-09 00:00:00	10
1751	591	29	processing	2019-11-10 00:00:00	2019-11-09 00:00:00	53
1752	217	20	processing	2019-11-21 00:00:00	2019-11-09 00:00:00	42
1754	696	24	processing	2019-11-23 00:00:00	2019-11-10 00:00:00	43
1757	637	82	shipped	2019-11-15 00:00:00	2019-11-11 00:00:00	66
1759	398	40	shipped	2019-11-25 00:00:00	2019-11-11 00:00:00	63
1761	87	8	shipped	2019-12-01 00:00:00	2019-11-12 00:00:00	16
1763	50	58	processing	2019-11-27 00:00:00	2019-11-13 00:00:00	68
1764	658	2	shipped	2019-12-08 00:00:00	2019-11-13 00:00:00	3
1766	8	87	processing	2019-11-21 00:00:00	2019-11-14 00:00:00	40
1767	27	45	shipped	2019-12-04 00:00:00	2019-11-14 00:00:00	4
1768	280	15	processing	2019-12-05 00:00:00	2019-11-14 00:00:00	94
1771	379	37	completed	2019-12-01 00:00:00	2019-11-14 00:00:00	55
1774	573	13	shipped	2019-12-16 00:00:00	2019-11-16 00:00:00	21
1776	7	96	processing	2019-12-04 00:00:00	2019-11-16 00:00:00	21
1778	32	89	processing	2019-12-14 00:00:00	2019-11-16 00:00:00	39
1782	282	35	completed	2019-11-24 00:00:00	2019-11-17 00:00:00	42
1784	405	8	shipped	2019-12-11 00:00:00	2019-11-18 00:00:00	86
1786	127	28	processing	2019-12-10 00:00:00	2019-11-20 00:00:00	13
1787	417	39	processing	2019-12-11 00:00:00	2019-11-20 00:00:00	66
1788	214	72	shipped	2019-11-29 00:00:00	2019-11-20 00:00:00	91
1790	476	13	processing	2019-11-23 00:00:00	2019-11-20 00:00:00	49
1844	388	45	shipped	2019-12-10 00:00:00	2019-11-27 00:00:00	8
1845	515	75	shipped	2019-12-06 00:00:00	2019-11-27 00:00:00	2
1846	82	17	processing	2019-12-19 00:00:00	2019-11-28 00:00:00	30
1847	65	81	processing	2019-12-25 00:00:00	2019-11-28 00:00:00	57
1848	76	43	processing	2019-12-17 00:00:00	2019-11-28 00:00:00	100
1849	71	75	processing	2019-12-12 00:00:00	2019-11-29 00:00:00	3
1850	200	46	completed	2019-12-25 00:00:00	2019-11-29 00:00:00	39
1851	480	49	processing	2019-12-16 00:00:00	2019-11-29 00:00:00	46
1852	310	22	completed	2019-12-06 00:00:00	2019-11-29 00:00:00	10
1853	344	32	completed	2019-12-29 00:00:00	2019-11-29 00:00:00	25
1854	312	64	processing	2019-12-16 00:00:00	2019-11-29 00:00:00	19
1855	608	47	completed	2019-12-24 00:00:00	2019-11-29 00:00:00	42
1856	401	96	processing	2019-12-15 00:00:00	2019-11-30 00:00:00	88
1857	584	72	shipped	2019-12-26 00:00:00	2019-11-30 00:00:00	88
1858	674	15	shipped	2019-12-26 00:00:00	2019-11-30 00:00:00	46
1859	66	39	completed	2019-12-13 00:00:00	2019-11-30 00:00:00	96
1860	233	22	processing	2019-12-04 00:00:00	2019-11-30 00:00:00	58
1861	444	67	completed	2019-12-01 00:00:00	2019-11-30 00:00:00	99
1862	539	90	shipped	2019-12-22 00:00:00	2019-11-30 00:00:00	38
1863	146	87	shipped	2019-12-13 00:00:00	2019-11-30 00:00:00	73
1864	244	26	completed	2019-12-28 00:00:00	2019-12-01 00:00:00	45
1865	413	80	processing	2019-12-15 00:00:00	2019-12-01 00:00:00	17
1866	276	7	processing	2019-12-27 00:00:00	2019-12-01 00:00:00	28
1867	300	82	processing	2019-12-28 00:00:00	2019-12-01 00:00:00	2
1868	314	23	shipped	2019-12-21 00:00:00	2019-12-01 00:00:00	63
1869	275	57	processing	2019-12-19 00:00:00	2019-12-01 00:00:00	62
1870	662	68	completed	2019-12-22 00:00:00	2019-12-01 00:00:00	43
1871	276	91	shipped	2019-12-02 00:00:00	2019-12-01 00:00:00	63
1872	578	62	processing	2019-12-23 00:00:00	2019-12-01 00:00:00	59
1873	108	12	completed	2019-12-13 00:00:00	2019-12-02 00:00:00	1
1874	408	10	completed	2019-12-09 00:00:00	2019-12-02 00:00:00	36
1875	52	50	shipped	2019-12-03 00:00:00	2019-12-02 00:00:00	24
1876	553	59	completed	2019-12-10 00:00:00	2019-12-03 00:00:00	22
1877	673	94	processing	2019-12-05 00:00:00	2019-12-04 00:00:00	36
1878	588	51	shipped	2020-01-03 00:00:00	2019-12-04 00:00:00	61
1879	309	73	shipped	2019-12-06 00:00:00	2019-12-04 00:00:00	53
1880	462	39	completed	2019-12-13 00:00:00	2019-12-04 00:00:00	86
1881	142	93	processing	2020-01-03 00:00:00	2019-12-05 00:00:00	83
1882	100	51	processing	2019-12-22 00:00:00	2019-12-05 00:00:00	85
1883	636	20	shipped	2019-12-13 00:00:00	2019-12-05 00:00:00	1
1884	15	72	processing	2019-12-26 00:00:00	2019-12-05 00:00:00	60
1885	550	6	shipped	2019-12-30 00:00:00	2019-12-05 00:00:00	88
1886	569	17	processing	2020-01-02 00:00:00	2019-12-05 00:00:00	11
1887	692	62	processing	2019-12-09 00:00:00	2019-12-05 00:00:00	29
1888	107	58	shipped	2019-12-10 00:00:00	2019-12-05 00:00:00	18
1889	46	99	completed	2019-12-08 00:00:00	2019-12-05 00:00:00	34
1890	42	54	completed	2019-12-09 00:00:00	2019-12-05 00:00:00	18
1891	237	33	completed	2019-12-11 00:00:00	2019-12-05 00:00:00	5
1892	137	38	completed	2020-01-04 00:00:00	2019-12-05 00:00:00	24
1893	601	36	shipped	2019-12-06 00:00:00	2019-12-05 00:00:00	26
1894	426	39	shipped	2019-12-22 00:00:00	2019-12-05 00:00:00	19
1895	212	81	completed	2019-12-10 00:00:00	2019-12-05 00:00:00	23
1896	626	57	processing	2019-12-11 00:00:00	2019-12-05 00:00:00	47
1897	303	82	processing	2019-12-26 00:00:00	2019-12-05 00:00:00	65
1898	86	69	processing	2019-12-13 00:00:00	2019-12-05 00:00:00	96
1899	232	69	processing	2019-12-07 00:00:00	2019-12-05 00:00:00	29
1900	247	73	completed	2019-12-09 00:00:00	2019-12-05 00:00:00	100
1901	22	93	processing	2019-12-10 00:00:00	2019-12-06 00:00:00	23
1902	286	47	completed	2019-12-09 00:00:00	2019-12-06 00:00:00	13
1903	435	95	processing	2019-12-19 00:00:00	2019-12-07 00:00:00	53
1904	233	59	processing	2019-12-19 00:00:00	2019-12-07 00:00:00	3
1905	238	68	processing	2019-12-08 00:00:00	2019-12-07 00:00:00	65
1906	43	19	shipped	2019-12-14 00:00:00	2019-12-07 00:00:00	9
1907	298	9	processing	2019-12-12 00:00:00	2019-12-07 00:00:00	65
1908	526	42	shipped	2020-01-06 00:00:00	2019-12-07 00:00:00	59
1909	85	5	processing	2019-12-20 00:00:00	2019-12-07 00:00:00	27
1910	416	97	completed	2019-12-08 00:00:00	2019-12-07 00:00:00	16
1911	305	63	processing	2019-12-29 00:00:00	2019-12-08 00:00:00	49
1912	304	87	shipped	2020-01-01 00:00:00	2019-12-08 00:00:00	27
1913	477	79	completed	2019-12-24 00:00:00	2019-12-08 00:00:00	25
1914	176	96	completed	2020-01-04 00:00:00	2019-12-08 00:00:00	22
1915	691	59	processing	2020-01-02 00:00:00	2019-12-09 00:00:00	7
1916	322	69	completed	2019-12-13 00:00:00	2019-12-09 00:00:00	97
1917	195	27	completed	2019-12-22 00:00:00	2019-12-09 00:00:00	54
1918	287	2	processing	2020-01-05 00:00:00	2019-12-09 00:00:00	8
1919	618	91	shipped	2019-12-17 00:00:00	2019-12-09 00:00:00	76
1920	153	91	shipped	2019-12-12 00:00:00	2019-12-09 00:00:00	96
1921	675	46	shipped	2020-01-06 00:00:00	2019-12-10 00:00:00	29
1922	103	5	shipped	2020-01-01 00:00:00	2019-12-10 00:00:00	91
1923	393	26	completed	2019-12-12 00:00:00	2019-12-10 00:00:00	83
1924	198	72	processing	2019-12-27 00:00:00	2019-12-10 00:00:00	85
1925	405	55	completed	2019-12-12 00:00:00	2019-12-10 00:00:00	67
1926	8	92	shipped	2019-12-28 00:00:00	2019-12-11 00:00:00	48
1927	66	99	completed	2020-01-11 00:00:00	2019-12-12 00:00:00	43
1928	46	82	processing	2019-12-27 00:00:00	2019-12-12 00:00:00	12
1929	290	44	completed	2019-12-22 00:00:00	2019-12-12 00:00:00	49
1930	438	75	processing	2019-12-23 00:00:00	2019-12-12 00:00:00	9
1931	379	72	shipped	2020-01-06 00:00:00	2019-12-12 00:00:00	54
1932	207	49	shipped	2019-12-30 00:00:00	2019-12-12 00:00:00	92
1933	418	46	processing	2020-01-09 00:00:00	2019-12-12 00:00:00	3
1934	315	94	completed	2019-12-28 00:00:00	2019-12-12 00:00:00	17
1935	278	35	processing	2019-12-22 00:00:00	2019-12-12 00:00:00	33
1936	484	47	shipped	2019-12-29 00:00:00	2019-12-12 00:00:00	12
1937	473	43	shipped	2019-12-30 00:00:00	2019-12-12 00:00:00	61
1938	88	5	completed	2019-12-22 00:00:00	2019-12-12 00:00:00	32
1939	552	52	completed	2020-01-06 00:00:00	2019-12-13 00:00:00	9
1940	279	23	completed	2019-12-17 00:00:00	2019-12-14 00:00:00	71
1941	555	34	shipped	2020-01-06 00:00:00	2019-12-15 00:00:00	11
1942	629	38	shipped	2020-01-09 00:00:00	2019-12-15 00:00:00	70
1943	199	20	shipped	2020-01-01 00:00:00	2019-12-15 00:00:00	90
1944	298	4	shipped	2019-12-27 00:00:00	2019-12-15 00:00:00	13
1945	96	93	completed	2019-12-25 00:00:00	2019-12-16 00:00:00	81
1946	75	77	processing	2020-01-15 00:00:00	2019-12-16 00:00:00	83
1947	130	2	shipped	2020-01-04 00:00:00	2019-12-16 00:00:00	21
1948	3	76	shipped	2020-01-08 00:00:00	2019-12-16 00:00:00	26
1949	217	4	completed	2019-12-27 00:00:00	2019-12-16 00:00:00	54
1950	615	12	completed	2020-01-15 00:00:00	2019-12-16 00:00:00	9
1951	584	78	processing	2020-01-14 00:00:00	2019-12-16 00:00:00	8
1952	520	70	processing	2020-01-01 00:00:00	2019-12-16 00:00:00	73
1953	417	8	completed	2019-12-26 00:00:00	2019-12-17 00:00:00	92
1954	41	12	processing	2020-01-13 00:00:00	2019-12-18 00:00:00	75
1955	468	29	shipped	2020-01-02 00:00:00	2019-12-18 00:00:00	21
1956	105	18	processing	2019-12-25 00:00:00	2019-12-18 00:00:00	17
1957	354	100	completed	2020-01-15 00:00:00	2019-12-19 00:00:00	21
1958	657	16	completed	2020-01-18 00:00:00	2019-12-19 00:00:00	6
1959	256	40	processing	2020-01-05 00:00:00	2019-12-19 00:00:00	93
1960	494	17	completed	2020-01-02 00:00:00	2019-12-19 00:00:00	49
1961	481	86	completed	2019-12-30 00:00:00	2019-12-20 00:00:00	59
1962	87	10	completed	2019-12-29 00:00:00	2019-12-20 00:00:00	90
1963	164	58	processing	2020-01-09 00:00:00	2019-12-20 00:00:00	58
1964	352	75	completed	2020-01-07 00:00:00	2019-12-20 00:00:00	53
1965	471	51	processing	2020-01-05 00:00:00	2019-12-20 00:00:00	97
1966	427	4	processing	2019-12-31 00:00:00	2019-12-20 00:00:00	68
1967	219	97	processing	2020-01-14 00:00:00	2019-12-20 00:00:00	2
1968	449	34	shipped	2020-01-07 00:00:00	2019-12-20 00:00:00	11
1969	568	3	completed	2020-01-11 00:00:00	2019-12-20 00:00:00	100
1970	426	36	shipped	2020-01-07 00:00:00	2019-12-20 00:00:00	9
1971	113	69	processing	2020-01-02 00:00:00	2019-12-21 00:00:00	90
1972	455	39	completed	2019-12-22 00:00:00	2019-12-21 00:00:00	65
1973	659	92	completed	2020-01-11 00:00:00	2019-12-22 00:00:00	12
1974	314	58	completed	2020-01-05 00:00:00	2019-12-22 00:00:00	95
1975	415	85	processing	2020-01-11 00:00:00	2019-12-22 00:00:00	15
1976	265	93	processing	2020-01-01 00:00:00	2019-12-22 00:00:00	52
1977	560	95	processing	2020-01-05 00:00:00	2019-12-22 00:00:00	47
1978	331	35	completed	2020-01-12 00:00:00	2019-12-22 00:00:00	77
1979	25	34	completed	2019-12-23 00:00:00	2019-12-22 00:00:00	77
1980	478	99	completed	2020-01-21 00:00:00	2019-12-22 00:00:00	52
1981	583	68	completed	2020-01-20 00:00:00	2019-12-23 00:00:00	1
1982	543	8	processing	2020-01-15 00:00:00	2019-12-23 00:00:00	2
1983	59	86	completed	2020-01-16 00:00:00	2019-12-23 00:00:00	17
1984	327	3	completed	2020-01-04 00:00:00	2019-12-23 00:00:00	8
1985	516	88	processing	2020-01-04 00:00:00	2019-12-23 00:00:00	31
1986	311	48	processing	2020-01-20 00:00:00	2019-12-23 00:00:00	66
1987	164	52	completed	2020-01-11 00:00:00	2019-12-23 00:00:00	27
1988	132	4	shipped	2020-01-16 00:00:00	2019-12-23 00:00:00	85
1989	215	45	processing	2019-12-28 00:00:00	2019-12-23 00:00:00	85
1990	15	87	completed	2020-01-18 00:00:00	2019-12-23 00:00:00	45
1991	178	52	completed	2019-12-29 00:00:00	2019-12-23 00:00:00	46
1992	115	75	shipped	2019-12-31 00:00:00	2019-12-23 00:00:00	69
1993	446	20	completed	2019-12-25 00:00:00	2019-12-23 00:00:00	35
1994	2	50	shipped	2020-01-07 00:00:00	2019-12-23 00:00:00	89
1995	84	58	processing	2020-01-21 00:00:00	2019-12-23 00:00:00	87
1996	540	8	processing	2020-01-06 00:00:00	2019-12-24 00:00:00	56
1997	134	71	shipped	2020-01-19 00:00:00	2019-12-24 00:00:00	36
1998	672	29	completed	2020-01-15 00:00:00	2019-12-24 00:00:00	78
1999	241	21	processing	2019-12-25 00:00:00	2019-12-24 00:00:00	93
2000	460	31	completed	2020-01-19 00:00:00	2019-12-24 00:00:00	4
2001	670	94	processing	2020-01-13 00:00:00	2019-12-24 00:00:00	24
2002	316	57	shipped	2020-01-13 00:00:00	2019-12-24 00:00:00	53
2003	584	37	completed	2019-12-27 00:00:00	2019-12-24 00:00:00	3
2004	527	19	completed	2020-01-17 00:00:00	2019-12-24 00:00:00	94
2005	696	56	completed	2020-01-21 00:00:00	2019-12-25 00:00:00	40
2006	102	20	processing	2019-12-27 00:00:00	2019-12-25 00:00:00	56
2007	375	65	processing	2020-01-14 00:00:00	2019-12-25 00:00:00	79
2008	402	31	shipped	2020-01-01 00:00:00	2019-12-25 00:00:00	24
2009	357	7	completed	2020-01-23 00:00:00	2019-12-25 00:00:00	10
2010	463	1	processing	2020-01-18 00:00:00	2019-12-25 00:00:00	7
2011	243	48	shipped	2020-01-14 00:00:00	2019-12-25 00:00:00	67
2012	485	35	shipped	2020-01-13 00:00:00	2019-12-25 00:00:00	56
2013	460	7	completed	2019-12-30 00:00:00	2019-12-25 00:00:00	20
2014	14	44	processing	2020-01-09 00:00:00	2019-12-25 00:00:00	41
2015	613	87	shipped	2019-12-29 00:00:00	2019-12-25 00:00:00	92
2016	586	25	processing	2020-01-01 00:00:00	2019-12-25 00:00:00	41
2017	290	14	completed	2019-12-31 00:00:00	2019-12-26 00:00:00	30
2018	545	9	completed	2019-12-27 00:00:00	2019-12-26 00:00:00	70
2019	325	4	completed	2020-01-14 00:00:00	2019-12-26 00:00:00	35
2020	533	21	completed	2020-01-17 00:00:00	2019-12-26 00:00:00	39
2021	338	80	shipped	2019-12-28 00:00:00	2019-12-26 00:00:00	10
2022	139	89	shipped	2019-12-31 00:00:00	2019-12-26 00:00:00	50
2023	519	75	shipped	2020-01-23 00:00:00	2019-12-26 00:00:00	19
2024	151	92	processing	2020-01-05 00:00:00	2019-12-26 00:00:00	66
2025	606	5	shipped	2020-01-23 00:00:00	2019-12-26 00:00:00	71
2026	9	24	completed	2020-01-12 00:00:00	2019-12-27 00:00:00	16
2027	145	58	completed	2020-01-08 00:00:00	2019-12-27 00:00:00	19
2028	561	95	completed	2020-01-05 00:00:00	2019-12-27 00:00:00	82
2029	437	81	processing	2020-01-11 00:00:00	2019-12-28 00:00:00	41
2030	344	5	shipped	2019-12-31 00:00:00	2019-12-28 00:00:00	69
2031	458	71	processing	2019-12-29 00:00:00	2019-12-28 00:00:00	42
2032	532	33	shipped	2020-01-02 00:00:00	2019-12-28 00:00:00	77
2033	574	9	shipped	2020-01-20 00:00:00	2019-12-28 00:00:00	65
2034	644	34	shipped	2020-01-03 00:00:00	2019-12-28 00:00:00	94
2035	21	62	shipped	2020-01-18 00:00:00	2019-12-29 00:00:00	60
2036	578	82	processing	2020-01-01 00:00:00	2019-12-29 00:00:00	78
2037	274	85	shipped	2020-01-15 00:00:00	2019-12-29 00:00:00	22
2038	330	28	completed	2020-01-12 00:00:00	2019-12-29 00:00:00	93
2039	503	78	processing	2020-01-14 00:00:00	2019-12-29 00:00:00	31
2040	667	62	completed	2020-01-18 00:00:00	2019-12-29 00:00:00	86
2041	383	84	shipped	2020-01-12 00:00:00	2019-12-30 00:00:00	79
2042	111	14	processing	2020-01-07 00:00:00	2019-12-30 00:00:00	15
2043	152	25	completed	2020-01-04 00:00:00	2019-12-30 00:00:00	20
2044	602	20	completed	2020-01-11 00:00:00	2019-12-30 00:00:00	27
2045	606	32	processing	2020-01-01 00:00:00	2019-12-30 00:00:00	41
2046	575	1	processing	2020-01-20 00:00:00	2019-12-30 00:00:00	55
2047	381	2	processing	2020-01-09 00:00:00	2019-12-30 00:00:00	21
2048	664	49	completed	2020-01-21 00:00:00	2019-12-30 00:00:00	92
2049	271	44	processing	2020-01-13 00:00:00	2019-12-31 00:00:00	31
2050	474	57	shipped	2020-01-04 00:00:00	2019-12-31 00:00:00	2
2051	425	43	processing	2020-01-05 00:00:00	2019-12-31 00:00:00	39
2052	47	80	processing	2020-01-05 00:00:00	2019-12-31 00:00:00	65
2053	343	78	completed	2020-01-22 00:00:00	2020-01-01 00:00:00	64
2054	80	8	processing	2020-01-02 00:00:00	2020-01-01 00:00:00	28
2055	408	38	shipped	2020-01-12 00:00:00	2020-01-01 00:00:00	70
2056	69	72	shipped	2020-01-31 00:00:00	2020-01-02 00:00:00	39
2057	41	66	processing	2020-01-16 00:00:00	2020-01-02 00:00:00	7
2058	663	19	shipped	2020-01-14 00:00:00	2020-01-02 00:00:00	100
2061	201	63	processing	2020-01-04 00:00:00	2020-01-02 00:00:00	24
2063	75	15	shipped	2020-01-10 00:00:00	2020-01-02 00:00:00	44
2065	319	68	processing	2020-01-20 00:00:00	2020-01-03 00:00:00	84
2067	190	35	processing	2020-01-18 00:00:00	2020-01-04 00:00:00	79
2069	138	45	completed	2020-01-27 00:00:00	2020-01-04 00:00:00	89
2071	568	28	completed	2020-01-27 00:00:00	2020-01-05 00:00:00	49
2074	513	32	processing	2020-01-16 00:00:00	2020-01-05 00:00:00	15
2076	257	8	processing	2020-01-19 00:00:00	2020-01-05 00:00:00	13
2078	678	61	processing	2020-02-04 00:00:00	2020-01-05 00:00:00	88
2080	368	80	shipped	2020-01-11 00:00:00	2020-01-05 00:00:00	31
2081	33	66	processing	2020-01-14 00:00:00	2020-01-05 00:00:00	86
2082	566	98	processing	2020-01-08 00:00:00	2020-01-05 00:00:00	83
2083	602	1	completed	2020-01-23 00:00:00	2020-01-05 00:00:00	30
2085	606	68	processing	2020-01-30 00:00:00	2020-01-06 00:00:00	75
2087	64	97	processing	2020-01-26 00:00:00	2020-01-06 00:00:00	38
2088	550	28	shipped	2020-01-08 00:00:00	2020-01-06 00:00:00	73
2090	695	4	completed	2020-01-29 00:00:00	2020-01-06 00:00:00	47
2092	599	78	shipped	2020-01-25 00:00:00	2020-01-06 00:00:00	84
2094	197	16	processing	2020-01-23 00:00:00	2020-01-06 00:00:00	31
2097	270	9	processing	2020-01-27 00:00:00	2020-01-07 00:00:00	5
2099	165	43	shipped	2020-01-28 00:00:00	2020-01-07 00:00:00	51
2101	327	65	processing	2020-01-10 00:00:00	2020-01-07 00:00:00	35
2103	485	91	completed	2020-02-06 00:00:00	2020-01-07 00:00:00	33
2106	549	12	processing	2020-01-12 00:00:00	2020-01-07 00:00:00	39
2109	427	34	processing	2020-01-30 00:00:00	2020-01-07 00:00:00	32
2111	247	89	shipped	2020-01-10 00:00:00	2020-01-07 00:00:00	15
2112	151	77	processing	2020-01-28 00:00:00	2020-01-07 00:00:00	28
2113	169	62	shipped	2020-01-17 00:00:00	2020-01-08 00:00:00	93
2116	642	96	completed	2020-01-17 00:00:00	2020-01-08 00:00:00	60
2118	89	20	processing	2020-01-16 00:00:00	2020-01-08 00:00:00	78
2120	312	41	completed	2020-02-07 00:00:00	2020-01-08 00:00:00	22
2122	381	34	completed	2020-02-03 00:00:00	2020-01-09 00:00:00	17
2125	188	25	processing	2020-01-31 00:00:00	2020-01-10 00:00:00	85
2127	43	84	completed	2020-02-02 00:00:00	2020-01-10 00:00:00	18
2133	364	47	processing	2020-01-31 00:00:00	2020-01-11 00:00:00	81
2135	225	65	processing	2020-02-04 00:00:00	2020-01-11 00:00:00	85
2137	486	19	completed	2020-01-29 00:00:00	2020-01-13 00:00:00	14
2138	285	74	shipped	2020-02-07 00:00:00	2020-01-13 00:00:00	86
2139	38	72	shipped	2020-02-02 00:00:00	2020-01-13 00:00:00	53
2140	479	34	completed	2020-01-31 00:00:00	2020-01-13 00:00:00	99
2141	514	71	shipped	2020-01-18 00:00:00	2020-01-13 00:00:00	9
2142	245	19	processing	2020-02-06 00:00:00	2020-01-13 00:00:00	24
2143	360	47	completed	2020-02-05 00:00:00	2020-01-14 00:00:00	79
2144	172	70	shipped	2020-02-12 00:00:00	2020-01-14 00:00:00	23
2148	155	82	completed	2020-02-12 00:00:00	2020-01-15 00:00:00	52
2153	309	40	completed	2020-02-07 00:00:00	2020-01-16 00:00:00	83
2155	230	43	processing	2020-01-17 00:00:00	2020-01-16 00:00:00	32
2157	283	52	shipped	2020-02-02 00:00:00	2020-01-16 00:00:00	63
2159	147	16	completed	2020-01-30 00:00:00	2020-01-16 00:00:00	73
2163	208	82	processing	2020-02-01 00:00:00	2020-01-17 00:00:00	97
2165	28	91	processing	2020-01-29 00:00:00	2020-01-17 00:00:00	68
2167	457	8	processing	2020-02-09 00:00:00	2020-01-17 00:00:00	56
2170	654	11	completed	2020-01-24 00:00:00	2020-01-19 00:00:00	68
2172	369	32	completed	2020-02-01 00:00:00	2020-01-19 00:00:00	17
2174	363	66	shipped	2020-02-16 00:00:00	2020-01-19 00:00:00	38
2176	383	90	completed	2020-02-15 00:00:00	2020-01-19 00:00:00	63
2178	571	49	shipped	2020-02-08 00:00:00	2020-01-19 00:00:00	100
2181	311	81	processing	2020-02-13 00:00:00	2020-01-20 00:00:00	23
2183	96	88	completed	2020-02-05 00:00:00	2020-01-21 00:00:00	38
2185	509	88	shipped	2020-01-24 00:00:00	2020-01-22 00:00:00	8
2188	527	30	completed	2020-02-05 00:00:00	2020-01-22 00:00:00	16
2190	428	51	shipped	2020-02-04 00:00:00	2020-01-22 00:00:00	63
2192	524	95	shipped	2020-02-23 00:00:00	2020-01-24 00:00:00	28
2194	43	60	completed	2020-02-15 00:00:00	2020-01-25 00:00:00	22
2197	582	82	processing	2020-02-06 00:00:00	2020-01-26 00:00:00	99
2201	170	88	processing	2020-01-30 00:00:00	2020-01-26 00:00:00	18
2059	537	10	shipped	2020-01-08 00:00:00	2020-01-02 00:00:00	66
2060	457	73	shipped	2020-01-31 00:00:00	2020-01-02 00:00:00	3
2062	170	87	processing	2020-01-16 00:00:00	2020-01-02 00:00:00	4
2064	667	43	completed	2020-01-29 00:00:00	2020-01-02 00:00:00	20
2066	38	87	completed	2020-01-18 00:00:00	2020-01-04 00:00:00	36
2068	324	59	shipped	2020-01-26 00:00:00	2020-01-04 00:00:00	57
2070	294	43	processing	2020-01-26 00:00:00	2020-01-04 00:00:00	33
2072	550	21	completed	2020-01-25 00:00:00	2020-01-05 00:00:00	73
2073	576	39	completed	2020-01-09 00:00:00	2020-01-05 00:00:00	74
2075	376	57	shipped	2020-02-02 00:00:00	2020-01-05 00:00:00	38
2077	127	71	processing	2020-02-01 00:00:00	2020-01-05 00:00:00	36
2079	421	49	processing	2020-01-28 00:00:00	2020-01-05 00:00:00	78
2084	113	87	completed	2020-01-09 00:00:00	2020-01-05 00:00:00	54
2086	414	98	completed	2020-01-12 00:00:00	2020-01-06 00:00:00	24
2089	543	42	shipped	2020-01-24 00:00:00	2020-01-06 00:00:00	20
2091	272	37	shipped	2020-01-11 00:00:00	2020-01-06 00:00:00	80
2093	578	66	shipped	2020-01-17 00:00:00	2020-01-06 00:00:00	38
2095	547	45	completed	2020-01-29 00:00:00	2020-01-07 00:00:00	31
2096	93	28	shipped	2020-01-26 00:00:00	2020-01-07 00:00:00	27
2098	53	52	processing	2020-01-20 00:00:00	2020-01-07 00:00:00	87
2100	198	1	completed	2020-01-08 00:00:00	2020-01-07 00:00:00	18
2102	663	24	shipped	2020-01-26 00:00:00	2020-01-07 00:00:00	29
2104	142	23	processing	2020-01-20 00:00:00	2020-01-07 00:00:00	86
2105	536	9	processing	2020-01-28 00:00:00	2020-01-07 00:00:00	47
2107	474	60	processing	2020-01-16 00:00:00	2020-01-07 00:00:00	4
2108	391	73	shipped	2020-02-02 00:00:00	2020-01-07 00:00:00	34
2110	146	36	completed	2020-02-06 00:00:00	2020-01-07 00:00:00	77
2114	524	89	processing	2020-01-10 00:00:00	2020-01-08 00:00:00	21
2115	3	26	completed	2020-01-31 00:00:00	2020-01-08 00:00:00	22
2117	489	59	shipped	2020-02-03 00:00:00	2020-01-08 00:00:00	14
2119	182	4	processing	2020-02-03 00:00:00	2020-01-08 00:00:00	26
2121	14	30	shipped	2020-01-10 00:00:00	2020-01-09 00:00:00	5
2123	459	5	completed	2020-02-07 00:00:00	2020-01-09 00:00:00	81
2124	581	48	shipped	2020-01-15 00:00:00	2020-01-09 00:00:00	54
2126	448	29	completed	2020-01-19 00:00:00	2020-01-10 00:00:00	31
2128	204	92	shipped	2020-01-12 00:00:00	2020-01-10 00:00:00	79
2129	132	96	completed	2020-02-09 00:00:00	2020-01-10 00:00:00	29
2130	471	74	completed	2020-01-12 00:00:00	2020-01-10 00:00:00	69
2131	407	14	completed	2020-01-28 00:00:00	2020-01-11 00:00:00	93
2132	414	66	processing	2020-02-04 00:00:00	2020-01-11 00:00:00	77
2134	231	63	processing	2020-01-18 00:00:00	2020-01-11 00:00:00	35
2136	635	30	completed	2020-02-08 00:00:00	2020-01-12 00:00:00	62
2145	174	6	shipped	2020-02-08 00:00:00	2020-01-15 00:00:00	24
2146	267	42	processing	2020-01-16 00:00:00	2020-01-15 00:00:00	78
2147	669	75	processing	2020-01-25 00:00:00	2020-01-15 00:00:00	2
2149	598	84	completed	2020-01-23 00:00:00	2020-01-15 00:00:00	55
2150	616	51	shipped	2020-01-18 00:00:00	2020-01-16 00:00:00	80
2151	188	43	shipped	2020-02-15 00:00:00	2020-01-16 00:00:00	35
2152	694	88	processing	2020-01-24 00:00:00	2020-01-16 00:00:00	70
2154	426	97	completed	2020-01-30 00:00:00	2020-01-16 00:00:00	10
2156	679	97	processing	2020-02-10 00:00:00	2020-01-16 00:00:00	4
2158	227	53	completed	2020-01-18 00:00:00	2020-01-16 00:00:00	60
2160	16	66	completed	2020-02-09 00:00:00	2020-01-16 00:00:00	21
2161	164	2	shipped	2020-02-07 00:00:00	2020-01-17 00:00:00	88
2162	517	50	completed	2020-01-18 00:00:00	2020-01-17 00:00:00	87
2164	367	9	shipped	2020-01-22 00:00:00	2020-01-17 00:00:00	97
2166	358	43	processing	2020-01-20 00:00:00	2020-01-17 00:00:00	33
2168	362	75	shipped	2020-01-28 00:00:00	2020-01-17 00:00:00	22
2169	420	81	processing	2020-01-30 00:00:00	2020-01-18 00:00:00	29
2171	477	32	completed	2020-01-28 00:00:00	2020-01-19 00:00:00	24
2173	11	91	completed	2020-01-28 00:00:00	2020-01-19 00:00:00	50
2175	16	35	completed	2020-01-21 00:00:00	2020-01-19 00:00:00	84
2177	73	33	shipped	2020-02-14 00:00:00	2020-01-19 00:00:00	8
2179	461	98	shipped	2020-01-26 00:00:00	2020-01-20 00:00:00	82
2180	44	35	completed	2020-01-31 00:00:00	2020-01-20 00:00:00	25
2182	245	44	processing	2020-02-05 00:00:00	2020-01-21 00:00:00	61
2184	305	73	completed	2020-01-26 00:00:00	2020-01-21 00:00:00	78
2186	617	51	completed	2020-02-12 00:00:00	2020-01-22 00:00:00	17
2187	356	11	shipped	2020-02-06 00:00:00	2020-01-22 00:00:00	24
2189	688	21	completed	2020-02-12 00:00:00	2020-01-22 00:00:00	91
2191	229	43	completed	2020-01-30 00:00:00	2020-01-23 00:00:00	97
2193	526	83	processing	2020-01-28 00:00:00	2020-01-25 00:00:00	45
2195	199	74	shipped	2020-02-13 00:00:00	2020-01-25 00:00:00	32
2196	122	59	processing	2020-01-31 00:00:00	2020-01-25 00:00:00	28
2198	528	54	shipped	2020-02-08 00:00:00	2020-01-26 00:00:00	66
2199	165	8	shipped	2020-02-09 00:00:00	2020-01-26 00:00:00	45
2200	501	99	processing	2020-02-16 00:00:00	2020-01-26 00:00:00	82
2202	564	4	completed	2020-01-31 00:00:00	2020-01-26 00:00:00	4
2203	385	100	processing	2020-02-25 00:00:00	2020-01-26 00:00:00	33
2204	49	24	completed	2020-02-16 00:00:00	2020-01-26 00:00:00	51
2205	491	68	processing	2020-02-12 00:00:00	2020-01-26 00:00:00	41
2206	10	94	completed	2020-02-04 00:00:00	2020-01-26 00:00:00	79
2207	112	29	completed	2020-02-25 00:00:00	2020-01-26 00:00:00	78
2208	37	47	completed	2020-02-07 00:00:00	2020-01-26 00:00:00	50
2209	314	22	completed	2020-01-31 00:00:00	2020-01-26 00:00:00	51
2210	127	33	shipped	2020-02-15 00:00:00	2020-01-26 00:00:00	9
2211	496	1	processing	2020-02-04 00:00:00	2020-01-26 00:00:00	21
2212	666	65	completed	2020-02-05 00:00:00	2020-01-26 00:00:00	67
2213	173	55	completed	2020-02-01 00:00:00	2020-01-27 00:00:00	19
2214	283	45	completed	2020-02-23 00:00:00	2020-01-27 00:00:00	46
2215	450	1	completed	2020-02-22 00:00:00	2020-01-27 00:00:00	48
2216	8	36	shipped	2020-02-08 00:00:00	2020-01-27 00:00:00	28
2217	389	84	completed	2020-02-22 00:00:00	2020-01-27 00:00:00	97
2218	19	4	completed	2020-01-31 00:00:00	2020-01-27 00:00:00	77
2219	618	35	completed	2020-02-21 00:00:00	2020-01-27 00:00:00	55
2220	605	57	shipped	2020-02-13 00:00:00	2020-01-27 00:00:00	49
2221	450	71	processing	2020-02-07 00:00:00	2020-01-28 00:00:00	51
2222	14	5	completed	2020-02-16 00:00:00	2020-01-28 00:00:00	97
2223	544	41	completed	2020-02-18 00:00:00	2020-01-28 00:00:00	61
2224	635	100	processing	2020-02-18 00:00:00	2020-01-28 00:00:00	89
2225	24	51	shipped	2020-02-10 00:00:00	2020-01-29 00:00:00	88
2226	316	7	shipped	2020-02-12 00:00:00	2020-01-29 00:00:00	28
2227	545	70	completed	2020-02-10 00:00:00	2020-01-30 00:00:00	21
2228	95	49	completed	2020-02-01 00:00:00	2020-01-30 00:00:00	45
2229	314	92	processing	2020-02-11 00:00:00	2020-01-30 00:00:00	95
2230	44	82	shipped	2020-02-04 00:00:00	2020-01-30 00:00:00	72
2231	236	33	shipped	2020-02-10 00:00:00	2020-01-30 00:00:00	93
2232	592	88	shipped	2020-02-22 00:00:00	2020-01-30 00:00:00	68
2235	264	62	shipped	2020-02-27 00:00:00	2020-02-01 00:00:00	67
2237	330	26	completed	2020-02-22 00:00:00	2020-02-01 00:00:00	22
2239	329	77	shipped	2020-02-27 00:00:00	2020-02-02 00:00:00	25
2241	302	50	completed	2020-03-01 00:00:00	2020-02-03 00:00:00	68
2243	357	59	shipped	2020-02-12 00:00:00	2020-02-03 00:00:00	10
2245	448	62	processing	2020-02-08 00:00:00	2020-02-03 00:00:00	15
2247	132	10	shipped	2020-02-20 00:00:00	2020-02-03 00:00:00	94
2248	384	51	processing	2020-02-05 00:00:00	2020-02-04 00:00:00	42
2250	389	80	processing	2020-03-03 00:00:00	2020-02-04 00:00:00	23
2253	318	50	shipped	2020-02-15 00:00:00	2020-02-05 00:00:00	25
2256	183	1	completed	2020-02-15 00:00:00	2020-02-05 00:00:00	18
2257	608	15	shipped	2020-02-13 00:00:00	2020-02-05 00:00:00	18
2258	515	26	completed	2020-03-04 00:00:00	2020-02-05 00:00:00	16
2260	148	81	shipped	2020-02-21 00:00:00	2020-02-05 00:00:00	84
2261	32	33	processing	2020-02-20 00:00:00	2020-02-06 00:00:00	74
2267	563	46	shipped	2020-03-01 00:00:00	2020-02-08 00:00:00	32
2268	197	89	shipped	2020-02-20 00:00:00	2020-02-08 00:00:00	68
2270	217	100	completed	2020-02-10 00:00:00	2020-02-08 00:00:00	55
2271	581	34	processing	2020-03-02 00:00:00	2020-02-08 00:00:00	82
2272	519	53	shipped	2020-02-10 00:00:00	2020-02-08 00:00:00	60
2273	610	22	completed	2020-03-04 00:00:00	2020-02-08 00:00:00	20
2276	413	26	shipped	2020-02-09 00:00:00	2020-02-08 00:00:00	25
2277	84	18	processing	2020-03-09 00:00:00	2020-02-08 00:00:00	1
2279	535	47	processing	2020-02-18 00:00:00	2020-02-08 00:00:00	79
2281	455	71	shipped	2020-03-03 00:00:00	2020-02-09 00:00:00	96
2282	195	56	completed	2020-03-03 00:00:00	2020-02-09 00:00:00	56
2284	185	2	completed	2020-03-08 00:00:00	2020-02-09 00:00:00	82
2286	623	48	shipped	2020-03-06 00:00:00	2020-02-09 00:00:00	77
2288	259	98	shipped	2020-02-21 00:00:00	2020-02-09 00:00:00	34
2290	27	100	shipped	2020-03-12 00:00:00	2020-02-11 00:00:00	35
2292	231	91	processing	2020-02-25 00:00:00	2020-02-11 00:00:00	85
2293	239	45	completed	2020-03-05 00:00:00	2020-02-11 00:00:00	57
2294	151	84	completed	2020-02-25 00:00:00	2020-02-11 00:00:00	46
2296	655	8	completed	2020-02-12 00:00:00	2020-02-11 00:00:00	26
2298	77	86	shipped	2020-03-11 00:00:00	2020-02-11 00:00:00	88
2300	439	26	completed	2020-03-05 00:00:00	2020-02-12 00:00:00	56
2301	693	60	shipped	2020-02-29 00:00:00	2020-02-12 00:00:00	49
2302	98	4	processing	2020-03-09 00:00:00	2020-02-12 00:00:00	78
2306	619	94	processing	2020-03-11 00:00:00	2020-02-12 00:00:00	42
2307	555	64	shipped	2020-02-20 00:00:00	2020-02-12 00:00:00	94
2308	280	70	shipped	2020-03-13 00:00:00	2020-02-12 00:00:00	83
2310	493	17	completed	2020-02-15 00:00:00	2020-02-12 00:00:00	99
2311	307	78	completed	2020-03-01 00:00:00	2020-02-13 00:00:00	70
2312	338	16	completed	2020-03-13 00:00:00	2020-02-13 00:00:00	19
2314	601	13	shipped	2020-02-25 00:00:00	2020-02-13 00:00:00	97
2316	51	43	shipped	2020-03-06 00:00:00	2020-02-13 00:00:00	19
2318	577	94	shipped	2020-02-24 00:00:00	2020-02-13 00:00:00	36
2326	383	8	shipped	2020-03-14 00:00:00	2020-02-14 00:00:00	94
2328	163	80	processing	2020-02-21 00:00:00	2020-02-14 00:00:00	93
2330	606	61	completed	2020-02-19 00:00:00	2020-02-14 00:00:00	100
2332	459	23	completed	2020-02-18 00:00:00	2020-02-15 00:00:00	35
2334	503	85	completed	2020-02-27 00:00:00	2020-02-15 00:00:00	58
2337	209	17	shipped	2020-02-28 00:00:00	2020-02-16 00:00:00	10
2339	526	80	shipped	2020-03-03 00:00:00	2020-02-16 00:00:00	89
2340	410	93	processing	2020-02-27 00:00:00	2020-02-16 00:00:00	62
2343	639	56	completed	2020-02-17 00:00:00	2020-02-16 00:00:00	100
2344	580	4	processing	2020-02-27 00:00:00	2020-02-17 00:00:00	64
2346	444	53	shipped	2020-03-09 00:00:00	2020-02-17 00:00:00	32
2348	515	2	processing	2020-03-09 00:00:00	2020-02-17 00:00:00	7
2350	220	54	processing	2020-03-06 00:00:00	2020-02-17 00:00:00	71
2352	449	69	shipped	2020-02-18 00:00:00	2020-02-17 00:00:00	2
2353	15	41	completed	2020-03-02 00:00:00	2020-02-18 00:00:00	73
2355	607	59	shipped	2020-02-27 00:00:00	2020-02-18 00:00:00	83
2357	477	88	completed	2020-03-16 00:00:00	2020-02-18 00:00:00	76
2359	331	19	processing	2020-02-21 00:00:00	2020-02-18 00:00:00	15
2361	331	89	completed	2020-02-23 00:00:00	2020-02-18 00:00:00	62
2364	496	80	shipped	2020-03-05 00:00:00	2020-02-18 00:00:00	65
2366	372	42	completed	2020-03-06 00:00:00	2020-02-20 00:00:00	50
2368	220	63	processing	2020-02-27 00:00:00	2020-02-20 00:00:00	56
2370	481	96	processing	2020-02-24 00:00:00	2020-02-21 00:00:00	66
2372	67	43	completed	2020-03-14 00:00:00	2020-02-21 00:00:00	34
2374	663	50	processing	2020-02-27 00:00:00	2020-02-21 00:00:00	80
2375	149	50	processing	2020-03-21 00:00:00	2020-02-21 00:00:00	91
2379	693	35	processing	2020-03-12 00:00:00	2020-02-22 00:00:00	63
2380	542	2	processing	2020-02-25 00:00:00	2020-02-22 00:00:00	68
2382	587	41	completed	2020-03-03 00:00:00	2020-02-23 00:00:00	47
2383	375	20	completed	2020-03-07 00:00:00	2020-02-23 00:00:00	39
2385	310	5	shipped	2020-03-05 00:00:00	2020-02-23 00:00:00	66
2387	246	12	processing	2020-02-26 00:00:00	2020-02-23 00:00:00	92
2389	210	73	processing	2020-03-11 00:00:00	2020-02-23 00:00:00	93
2391	99	12	shipped	2020-03-15 00:00:00	2020-02-23 00:00:00	26
2393	169	34	processing	2020-03-24 00:00:00	2020-02-24 00:00:00	85
2396	14	28	shipped	2020-02-27 00:00:00	2020-02-24 00:00:00	38
2398	318	58	processing	2020-03-15 00:00:00	2020-02-24 00:00:00	40
2400	401	13	shipped	2020-03-06 00:00:00	2020-02-24 00:00:00	92
2402	176	11	processing	2020-03-06 00:00:00	2020-02-25 00:00:00	57
2403	541	85	processing	2020-03-15 00:00:00	2020-02-25 00:00:00	40
2404	292	86	processing	2020-03-15 00:00:00	2020-02-25 00:00:00	47
2406	460	17	completed	2020-03-04 00:00:00	2020-02-25 00:00:00	22
2407	30	95	shipped	2020-03-12 00:00:00	2020-02-25 00:00:00	86
2408	10	19	completed	2020-03-12 00:00:00	2020-02-25 00:00:00	24
2409	140	4	processing	2020-03-23 00:00:00	2020-02-26 00:00:00	5
2410	188	100	completed	2020-03-11 00:00:00	2020-02-26 00:00:00	6
2411	398	22	completed	2020-03-11 00:00:00	2020-02-26 00:00:00	25
2412	196	91	shipped	2020-03-03 00:00:00	2020-02-26 00:00:00	78
2413	135	45	completed	2020-03-27 00:00:00	2020-02-27 00:00:00	12
2414	684	90	processing	2020-03-06 00:00:00	2020-02-27 00:00:00	15
2415	179	41	shipped	2020-03-06 00:00:00	2020-02-27 00:00:00	79
2416	360	3	completed	2020-03-16 00:00:00	2020-02-27 00:00:00	30
2417	439	56	completed	2020-03-13 00:00:00	2020-02-27 00:00:00	28
2418	304	56	processing	2020-03-20 00:00:00	2020-02-27 00:00:00	15
2419	62	32	processing	2020-03-22 00:00:00	2020-02-28 00:00:00	75
2420	389	8	completed	2020-03-17 00:00:00	2020-02-28 00:00:00	33
2421	19	62	processing	2020-03-22 00:00:00	2020-02-28 00:00:00	27
2422	240	72	processing	2020-03-13 00:00:00	2020-02-28 00:00:00	71
2423	272	83	completed	2020-03-23 00:00:00	2020-02-28 00:00:00	16
2233	590	41	shipped	2020-02-25 00:00:00	2020-01-31 00:00:00	21
2234	123	29	shipped	2020-02-03 00:00:00	2020-02-01 00:00:00	41
2236	515	55	completed	2020-02-03 00:00:00	2020-02-01 00:00:00	72
2238	623	29	shipped	2020-02-03 00:00:00	2020-02-01 00:00:00	51
2240	616	93	shipped	2020-02-17 00:00:00	2020-02-02 00:00:00	47
2242	529	48	shipped	2020-02-29 00:00:00	2020-02-03 00:00:00	52
2244	315	100	processing	2020-02-06 00:00:00	2020-02-03 00:00:00	88
2246	582	21	shipped	2020-02-14 00:00:00	2020-02-03 00:00:00	99
2249	343	37	shipped	2020-02-13 00:00:00	2020-02-04 00:00:00	100
2251	590	86	shipped	2020-02-09 00:00:00	2020-02-05 00:00:00	26
2252	700	28	shipped	2020-02-08 00:00:00	2020-02-05 00:00:00	12
2254	573	7	processing	2020-02-28 00:00:00	2020-02-05 00:00:00	37
2255	376	92	shipped	2020-02-27 00:00:00	2020-02-05 00:00:00	46
2259	368	76	completed	2020-02-21 00:00:00	2020-02-05 00:00:00	57
2262	177	75	completed	2020-02-25 00:00:00	2020-02-07 00:00:00	8
2263	138	75	completed	2020-02-28 00:00:00	2020-02-08 00:00:00	63
2264	280	5	processing	2020-03-04 00:00:00	2020-02-08 00:00:00	59
2265	314	39	shipped	2020-02-14 00:00:00	2020-02-08 00:00:00	52
2266	128	81	completed	2020-02-25 00:00:00	2020-02-08 00:00:00	30
2269	286	72	shipped	2020-03-05 00:00:00	2020-02-08 00:00:00	8
2274	601	64	completed	2020-02-09 00:00:00	2020-02-08 00:00:00	57
2275	130	91	processing	2020-03-02 00:00:00	2020-02-08 00:00:00	40
2278	75	12	processing	2020-02-10 00:00:00	2020-02-08 00:00:00	96
2280	611	66	shipped	2020-02-11 00:00:00	2020-02-08 00:00:00	41
2283	504	79	completed	2020-02-24 00:00:00	2020-02-09 00:00:00	16
2285	305	64	shipped	2020-02-14 00:00:00	2020-02-09 00:00:00	51
2287	2	41	processing	2020-02-29 00:00:00	2020-02-09 00:00:00	57
2289	399	70	shipped	2020-03-01 00:00:00	2020-02-10 00:00:00	82
2291	342	67	shipped	2020-02-25 00:00:00	2020-02-11 00:00:00	21
2295	516	61	shipped	2020-02-13 00:00:00	2020-02-11 00:00:00	92
2297	622	27	shipped	2020-02-20 00:00:00	2020-02-11 00:00:00	67
2299	438	81	shipped	2020-02-17 00:00:00	2020-02-12 00:00:00	19
2303	399	21	processing	2020-03-08 00:00:00	2020-02-12 00:00:00	85
2304	562	75	completed	2020-02-27 00:00:00	2020-02-12 00:00:00	2
2305	689	96	completed	2020-03-08 00:00:00	2020-02-12 00:00:00	56
2309	351	19	completed	2020-03-06 00:00:00	2020-02-12 00:00:00	65
2313	415	76	shipped	2020-03-07 00:00:00	2020-02-13 00:00:00	96
2315	353	46	shipped	2020-02-16 00:00:00	2020-02-13 00:00:00	29
2317	237	25	completed	2020-02-24 00:00:00	2020-02-13 00:00:00	36
2319	25	22	shipped	2020-03-05 00:00:00	2020-02-13 00:00:00	85
2320	414	41	shipped	2020-02-29 00:00:00	2020-02-13 00:00:00	36
2321	628	93	processing	2020-02-15 00:00:00	2020-02-13 00:00:00	45
2322	170	6	completed	2020-02-16 00:00:00	2020-02-13 00:00:00	48
2323	299	69	processing	2020-02-23 00:00:00	2020-02-13 00:00:00	59
2324	121	23	completed	2020-03-01 00:00:00	2020-02-13 00:00:00	75
2325	407	75	completed	2020-03-14 00:00:00	2020-02-13 00:00:00	51
2327	68	62	shipped	2020-03-07 00:00:00	2020-02-14 00:00:00	83
2329	311	2	shipped	2020-03-05 00:00:00	2020-02-14 00:00:00	78
2331	402	63	shipped	2020-03-13 00:00:00	2020-02-15 00:00:00	32
2333	392	44	processing	2020-02-18 00:00:00	2020-02-15 00:00:00	65
2335	138	23	shipped	2020-02-16 00:00:00	2020-02-15 00:00:00	93
2336	101	10	shipped	2020-03-04 00:00:00	2020-02-15 00:00:00	30
2338	367	30	shipped	2020-03-05 00:00:00	2020-02-16 00:00:00	10
2341	91	12	processing	2020-02-29 00:00:00	2020-02-16 00:00:00	28
2342	391	73	completed	2020-02-24 00:00:00	2020-02-16 00:00:00	45
2345	633	28	completed	2020-02-25 00:00:00	2020-02-17 00:00:00	40
2347	194	28	processing	2020-03-11 00:00:00	2020-02-17 00:00:00	32
2349	413	97	processing	2020-03-15 00:00:00	2020-02-17 00:00:00	84
2351	452	30	processing	2020-03-07 00:00:00	2020-02-17 00:00:00	41
2354	240	12	processing	2020-03-19 00:00:00	2020-02-18 00:00:00	11
2356	446	57	shipped	2020-02-25 00:00:00	2020-02-18 00:00:00	50
2358	262	63	processing	2020-03-09 00:00:00	2020-02-18 00:00:00	99
2360	223	36	completed	2020-02-25 00:00:00	2020-02-18 00:00:00	55
2362	16	82	processing	2020-03-06 00:00:00	2020-02-18 00:00:00	100
2363	573	1	completed	2020-03-16 00:00:00	2020-02-18 00:00:00	4
2365	89	82	completed	2020-03-06 00:00:00	2020-02-19 00:00:00	70
2367	213	83	processing	2020-03-20 00:00:00	2020-02-20 00:00:00	33
2369	274	90	shipped	2020-03-10 00:00:00	2020-02-21 00:00:00	81
2371	69	98	shipped	2020-02-26 00:00:00	2020-02-21 00:00:00	75
2373	199	13	processing	2020-02-28 00:00:00	2020-02-21 00:00:00	64
2376	260	58	processing	2020-03-19 00:00:00	2020-02-21 00:00:00	86
2377	191	86	processing	2020-03-14 00:00:00	2020-02-22 00:00:00	11
2378	295	4	completed	2020-03-17 00:00:00	2020-02-22 00:00:00	87
2381	261	79	processing	2020-02-29 00:00:00	2020-02-23 00:00:00	21
2384	159	37	processing	2020-03-01 00:00:00	2020-02-23 00:00:00	25
2386	126	13	processing	2020-02-29 00:00:00	2020-02-23 00:00:00	94
2388	471	5	processing	2020-03-06 00:00:00	2020-02-23 00:00:00	94
2390	190	60	processing	2020-03-21 00:00:00	2020-02-23 00:00:00	94
2392	410	9	processing	2020-03-09 00:00:00	2020-02-23 00:00:00	93
2394	12	47	shipped	2020-03-14 00:00:00	2020-02-24 00:00:00	83
2395	341	59	shipped	2020-03-20 00:00:00	2020-02-24 00:00:00	90
2397	367	4	shipped	2020-03-09 00:00:00	2020-02-24 00:00:00	59
2399	114	68	completed	2020-03-13 00:00:00	2020-02-24 00:00:00	91
2401	180	31	processing	2020-02-27 00:00:00	2020-02-25 00:00:00	41
2405	526	81	processing	2020-02-27 00:00:00	2020-02-25 00:00:00	45
2456	326	85	shipped	2020-03-16 00:00:00	2020-03-05 00:00:00	9
2457	82	3	shipped	2020-03-16 00:00:00	2020-03-05 00:00:00	45
2460	637	83	completed	2020-03-20 00:00:00	2020-03-06 00:00:00	23
2461	385	63	processing	2020-03-11 00:00:00	2020-03-07 00:00:00	81
2463	210	47	shipped	2020-03-18 00:00:00	2020-03-07 00:00:00	15
2466	93	62	processing	2020-04-04 00:00:00	2020-03-07 00:00:00	19
2468	201	96	completed	2020-03-09 00:00:00	2020-03-08 00:00:00	19
2469	572	95	processing	2020-03-16 00:00:00	2020-03-08 00:00:00	59
2471	210	93	processing	2020-03-09 00:00:00	2020-03-08 00:00:00	20
2474	271	49	processing	2020-03-28 00:00:00	2020-03-09 00:00:00	75
2477	388	89	completed	2020-03-23 00:00:00	2020-03-11 00:00:00	41
2479	535	32	completed	2020-04-10 00:00:00	2020-03-12 00:00:00	45
2481	665	100	processing	2020-03-29 00:00:00	2020-03-12 00:00:00	10
2485	464	5	processing	2020-03-28 00:00:00	2020-03-12 00:00:00	34
2487	492	50	processing	2020-03-27 00:00:00	2020-03-12 00:00:00	56
2490	32	25	completed	2020-03-29 00:00:00	2020-03-13 00:00:00	98
2496	160	37	shipped	2020-04-04 00:00:00	2020-03-13 00:00:00	88
2499	126	66	completed	2020-03-31 00:00:00	2020-03-14 00:00:00	74
2501	313	99	processing	2020-03-18 00:00:00	2020-03-14 00:00:00	88
2502	15	76	shipped	2020-04-09 00:00:00	2020-03-14 00:00:00	38
2507	49	38	shipped	2020-03-23 00:00:00	2020-03-15 00:00:00	80
2509	371	55	processing	2020-03-20 00:00:00	2020-03-15 00:00:00	81
2424	657	100	completed	2020-03-13 00:00:00	2020-02-28 00:00:00	85
2425	98	84	shipped	2020-03-14 00:00:00	2020-02-28 00:00:00	1
2426	646	39	shipped	2020-03-08 00:00:00	2020-02-28 00:00:00	72
2427	561	66	shipped	2020-02-29 00:00:00	2020-02-28 00:00:00	32
2428	290	83	completed	2020-03-04 00:00:00	2020-02-28 00:00:00	45
2429	665	75	shipped	2020-03-02 00:00:00	2020-02-28 00:00:00	46
2430	599	80	completed	2020-03-08 00:00:00	2020-02-28 00:00:00	36
2431	664	46	completed	2020-03-16 00:00:00	2020-02-28 00:00:00	18
2432	278	11	shipped	2020-03-14 00:00:00	2020-02-28 00:00:00	69
2433	86	34	processing	2020-03-27 00:00:00	2020-02-28 00:00:00	61
2434	405	43	completed	2020-03-05 00:00:00	2020-02-29 00:00:00	16
2435	426	41	completed	2020-03-24 00:00:00	2020-02-29 00:00:00	40
2436	411	34	shipped	2020-03-18 00:00:00	2020-02-29 00:00:00	69
2437	537	6	completed	2020-03-04 00:00:00	2020-02-29 00:00:00	69
2438	355	39	shipped	2020-03-24 00:00:00	2020-02-29 00:00:00	35
2439	639	52	processing	2020-03-26 00:00:00	2020-02-29 00:00:00	99
2440	600	5	processing	2020-03-31 00:00:00	2020-03-01 00:00:00	82
2441	236	32	shipped	2020-03-19 00:00:00	2020-03-01 00:00:00	50
2442	115	91	processing	2020-03-19 00:00:00	2020-03-01 00:00:00	97
2443	528	48	shipped	2020-03-28 00:00:00	2020-03-02 00:00:00	10
2444	100	6	processing	2020-03-14 00:00:00	2020-03-02 00:00:00	79
2445	36	14	shipped	2020-03-12 00:00:00	2020-03-02 00:00:00	66
2446	64	11	completed	2020-03-26 00:00:00	2020-03-02 00:00:00	36
2447	20	47	processing	2020-03-14 00:00:00	2020-03-02 00:00:00	28
2448	215	34	shipped	2020-03-16 00:00:00	2020-03-02 00:00:00	77
2449	565	51	completed	2020-03-25 00:00:00	2020-03-03 00:00:00	94
2450	390	36	processing	2020-03-22 00:00:00	2020-03-03 00:00:00	37
2451	437	14	shipped	2020-04-02 00:00:00	2020-03-03 00:00:00	92
2452	301	8	processing	2020-03-16 00:00:00	2020-03-03 00:00:00	14
2453	518	80	completed	2020-03-30 00:00:00	2020-03-04 00:00:00	68
2454	349	43	processing	2020-03-31 00:00:00	2020-03-04 00:00:00	82
2455	475	12	shipped	2020-03-29 00:00:00	2020-03-05 00:00:00	40
2458	238	55	shipped	2020-03-28 00:00:00	2020-03-06 00:00:00	39
2459	280	68	shipped	2020-03-28 00:00:00	2020-03-06 00:00:00	17
2462	632	46	processing	2020-03-24 00:00:00	2020-03-07 00:00:00	97
2464	639	20	processing	2020-03-19 00:00:00	2020-03-07 00:00:00	2
2465	240	35	completed	2020-03-31 00:00:00	2020-03-07 00:00:00	64
2467	91	65	processing	2020-03-22 00:00:00	2020-03-08 00:00:00	88
2470	434	41	processing	2020-03-14 00:00:00	2020-03-08 00:00:00	25
2472	382	91	completed	2020-03-11 00:00:00	2020-03-09 00:00:00	2
2473	179	78	completed	2020-03-17 00:00:00	2020-03-09 00:00:00	18
2475	333	1	completed	2020-03-28 00:00:00	2020-03-09 00:00:00	78
2476	316	20	shipped	2020-03-23 00:00:00	2020-03-10 00:00:00	48
2478	105	67	completed	2020-04-06 00:00:00	2020-03-11 00:00:00	85
2480	687	51	processing	2020-04-01 00:00:00	2020-03-12 00:00:00	99
2482	154	43	completed	2020-03-27 00:00:00	2020-03-12 00:00:00	61
2483	38	30	processing	2020-03-28 00:00:00	2020-03-12 00:00:00	56
2484	306	96	completed	2020-03-21 00:00:00	2020-03-12 00:00:00	86
2486	154	51	shipped	2020-03-28 00:00:00	2020-03-12 00:00:00	78
2488	365	36	processing	2020-03-30 00:00:00	2020-03-12 00:00:00	52
2489	559	4	completed	2020-03-29 00:00:00	2020-03-13 00:00:00	96
2491	597	48	shipped	2020-04-01 00:00:00	2020-03-13 00:00:00	10
2492	553	99	shipped	2020-04-12 00:00:00	2020-03-13 00:00:00	38
2493	157	87	shipped	2020-03-23 00:00:00	2020-03-13 00:00:00	23
2494	287	73	processing	2020-03-30 00:00:00	2020-03-13 00:00:00	17
2495	454	83	shipped	2020-03-29 00:00:00	2020-03-13 00:00:00	4
2497	570	52	processing	2020-03-29 00:00:00	2020-03-14 00:00:00	45
2498	368	50	shipped	2020-04-05 00:00:00	2020-03-14 00:00:00	66
2500	359	56	shipped	2020-03-24 00:00:00	2020-03-14 00:00:00	89
2503	263	84	shipped	2020-04-10 00:00:00	2020-03-14 00:00:00	1
2504	460	27	processing	2020-04-02 00:00:00	2020-03-14 00:00:00	73
2505	206	50	completed	2020-04-05 00:00:00	2020-03-15 00:00:00	21
2506	234	7	processing	2020-04-01 00:00:00	2020-03-15 00:00:00	12
2508	345	44	completed	2020-04-06 00:00:00	2020-03-15 00:00:00	87
2510	45	58	processing	2020-03-20 00:00:00	2020-03-15 00:00:00	92
2511	250	27	shipped	2020-03-27 00:00:00	2020-03-16 00:00:00	16
2514	446	54	completed	2020-04-03 00:00:00	2020-03-16 00:00:00	66
2515	169	3	completed	2020-03-17 00:00:00	2020-03-16 00:00:00	71
2517	505	44	shipped	2020-03-29 00:00:00	2020-03-16 00:00:00	83
2518	27	36	processing	2020-04-01 00:00:00	2020-03-16 00:00:00	19
2519	343	78	completed	2020-03-26 00:00:00	2020-03-16 00:00:00	62
2521	143	12	completed	2020-03-18 00:00:00	2020-03-17 00:00:00	78
2522	678	70	completed	2020-04-02 00:00:00	2020-03-17 00:00:00	90
2523	452	37	completed	2020-04-10 00:00:00	2020-03-17 00:00:00	83
2525	110	14	processing	2020-04-01 00:00:00	2020-03-17 00:00:00	24
2529	519	86	shipped	2020-03-20 00:00:00	2020-03-19 00:00:00	40
2530	302	18	processing	2020-04-10 00:00:00	2020-03-20 00:00:00	94
2531	624	90	processing	2020-04-17 00:00:00	2020-03-20 00:00:00	77
2533	555	5	processing	2020-03-28 00:00:00	2020-03-21 00:00:00	37
2536	156	37	completed	2020-04-15 00:00:00	2020-03-22 00:00:00	4
2538	506	83	shipped	2020-04-16 00:00:00	2020-03-23 00:00:00	78
2540	266	3	completed	2020-04-14 00:00:00	2020-03-24 00:00:00	30
2543	239	12	shipped	2020-04-08 00:00:00	2020-03-25 00:00:00	13
2512	341	17	processing	2020-03-28 00:00:00	2020-03-16 00:00:00	17
2513	490	25	shipped	2020-03-22 00:00:00	2020-03-16 00:00:00	86
2516	470	32	processing	2020-03-21 00:00:00	2020-03-16 00:00:00	70
2520	419	59	processing	2020-04-09 00:00:00	2020-03-16 00:00:00	45
2524	337	12	completed	2020-04-02 00:00:00	2020-03-17 00:00:00	87
2526	224	97	shipped	2020-04-10 00:00:00	2020-03-18 00:00:00	52
2527	548	19	completed	2020-04-16 00:00:00	2020-03-18 00:00:00	38
2528	382	3	completed	2020-04-12 00:00:00	2020-03-18 00:00:00	92
2532	38	85	processing	2020-03-29 00:00:00	2020-03-20 00:00:00	90
2534	125	64	processing	2020-04-16 00:00:00	2020-03-21 00:00:00	54
2535	294	74	processing	2020-04-09 00:00:00	2020-03-21 00:00:00	95
2537	379	39	shipped	2020-04-11 00:00:00	2020-03-23 00:00:00	27
2539	96	63	shipped	2020-04-19 00:00:00	2020-03-24 00:00:00	90
2541	499	82	shipped	2020-04-02 00:00:00	2020-03-25 00:00:00	80
2542	333	26	processing	2020-04-02 00:00:00	2020-03-25 00:00:00	89
2544	403	12	processing	2020-03-27 00:00:00	2020-03-25 00:00:00	97
2545	86	78	shipped	2020-04-09 00:00:00	2020-03-26 00:00:00	93
2546	700	36	shipped	2020-03-29 00:00:00	2020-03-26 00:00:00	71
2547	132	11	shipped	2020-04-20 00:00:00	2020-03-26 00:00:00	52
2548	336	77	completed	2020-04-06 00:00:00	2020-03-27 00:00:00	4
2549	151	19	completed	2020-04-06 00:00:00	2020-03-27 00:00:00	37
2550	44	26	completed	2020-04-20 00:00:00	2020-03-27 00:00:00	29
2551	489	28	processing	2020-04-19 00:00:00	2020-03-28 00:00:00	75
2552	105	73	processing	2020-03-30 00:00:00	2020-03-28 00:00:00	44
2553	372	7	shipped	2020-04-13 00:00:00	2020-03-28 00:00:00	51
2554	497	91	shipped	2020-04-11 00:00:00	2020-03-29 00:00:00	9
2555	584	19	shipped	2020-04-17 00:00:00	2020-03-29 00:00:00	41
2556	181	19	processing	2020-04-10 00:00:00	2020-03-29 00:00:00	46
2557	559	32	completed	2020-04-16 00:00:00	2020-03-29 00:00:00	74
2558	507	27	processing	2020-04-28 00:00:00	2020-03-29 00:00:00	37
2559	214	92	completed	2020-04-10 00:00:00	2020-03-29 00:00:00	13
2560	665	61	processing	2020-04-09 00:00:00	2020-03-29 00:00:00	1
2561	23	79	processing	2020-04-08 00:00:00	2020-03-30 00:00:00	90
2562	21	72	shipped	2020-04-01 00:00:00	2020-03-30 00:00:00	21
2563	370	31	completed	2020-04-01 00:00:00	2020-03-31 00:00:00	23
2564	253	57	completed	2020-04-01 00:00:00	2020-03-31 00:00:00	86
2565	329	87	completed	2020-04-22 00:00:00	2020-03-31 00:00:00	77
2566	119	43	shipped	2020-04-21 00:00:00	2020-03-31 00:00:00	11
2567	422	100	completed	2020-04-20 00:00:00	2020-03-31 00:00:00	12
2568	671	100	completed	2020-04-09 00:00:00	2020-03-31 00:00:00	97
2569	102	15	shipped	2020-04-12 00:00:00	2020-03-31 00:00:00	77
2570	593	11	completed	2020-04-18 00:00:00	2020-03-31 00:00:00	98
2571	281	9	processing	2020-04-02 00:00:00	2020-03-31 00:00:00	7
2572	447	7	completed	2020-04-18 00:00:00	2020-03-31 00:00:00	8
2573	36	94	shipped	2020-04-15 00:00:00	2020-03-31 00:00:00	57
2574	528	29	completed	2020-04-21 00:00:00	2020-03-31 00:00:00	63
2575	692	43	shipped	2020-04-14 00:00:00	2020-03-31 00:00:00	84
2576	68	29	processing	2020-04-29 00:00:00	2020-03-31 00:00:00	54
2577	401	6	processing	2020-04-27 00:00:00	2020-04-01 00:00:00	18
2578	319	26	completed	2020-04-09 00:00:00	2020-04-01 00:00:00	73
2579	242	72	processing	2020-04-26 00:00:00	2020-04-01 00:00:00	99
2580	664	77	completed	2020-04-28 00:00:00	2020-04-01 00:00:00	21
2581	373	93	processing	2020-04-10 00:00:00	2020-04-01 00:00:00	4
2582	104	58	completed	2020-04-15 00:00:00	2020-04-01 00:00:00	75
2583	80	95	processing	2020-04-11 00:00:00	2020-04-01 00:00:00	33
2584	295	69	shipped	2020-04-13 00:00:00	2020-04-01 00:00:00	63
2585	331	34	processing	2020-04-02 00:00:00	2020-04-01 00:00:00	1
2586	10	2	completed	2020-04-25 00:00:00	2020-04-02 00:00:00	35
2587	238	63	shipped	2020-05-02 00:00:00	2020-04-02 00:00:00	52
2588	115	99	shipped	2020-05-01 00:00:00	2020-04-02 00:00:00	62
2589	394	43	processing	2020-04-11 00:00:00	2020-04-02 00:00:00	65
2590	452	55	shipped	2020-04-26 00:00:00	2020-04-03 00:00:00	85
2591	583	3	processing	2020-04-25 00:00:00	2020-04-04 00:00:00	87
2592	217	71	processing	2020-04-20 00:00:00	2020-04-04 00:00:00	79
2593	469	28	completed	2020-04-12 00:00:00	2020-04-05 00:00:00	94
2594	94	33	completed	2020-04-10 00:00:00	2020-04-05 00:00:00	69
2595	242	72	processing	2020-05-03 00:00:00	2020-04-05 00:00:00	33
2596	39	2	processing	2020-04-19 00:00:00	2020-04-06 00:00:00	3
2597	612	74	completed	2020-05-06 00:00:00	2020-04-06 00:00:00	43
2598	544	97	completed	2020-04-11 00:00:00	2020-04-07 00:00:00	1
2599	255	14	shipped	2020-05-01 00:00:00	2020-04-07 00:00:00	51
2600	601	55	shipped	2020-04-14 00:00:00	2020-04-07 00:00:00	67
2601	243	93	completed	2020-04-19 00:00:00	2020-04-07 00:00:00	89
2602	397	31	shipped	2020-04-16 00:00:00	2020-04-08 00:00:00	55
2603	528	57	processing	2020-04-10 00:00:00	2020-04-08 00:00:00	81
2604	414	53	completed	2020-05-05 00:00:00	2020-04-08 00:00:00	9
2605	419	82	shipped	2020-05-05 00:00:00	2020-04-08 00:00:00	60
2606	433	37	shipped	2020-04-15 00:00:00	2020-04-08 00:00:00	45
2607	50	78	completed	2020-04-10 00:00:00	2020-04-08 00:00:00	60
2608	204	18	processing	2020-05-08 00:00:00	2020-04-08 00:00:00	34
2609	261	69	processing	2020-05-02 00:00:00	2020-04-08 00:00:00	39
2610	443	22	completed	2020-05-07 00:00:00	2020-04-08 00:00:00	81
2611	53	43	processing	2020-05-01 00:00:00	2020-04-09 00:00:00	58
2612	190	63	shipped	2020-04-20 00:00:00	2020-04-09 00:00:00	32
2613	581	22	shipped	2020-05-09 00:00:00	2020-04-09 00:00:00	16
2614	675	18	processing	2020-05-08 00:00:00	2020-04-09 00:00:00	52
2615	83	31	shipped	2020-04-14 00:00:00	2020-04-09 00:00:00	59
2616	210	40	shipped	2020-04-26 00:00:00	2020-04-09 00:00:00	60
2617	541	7	completed	2020-05-05 00:00:00	2020-04-09 00:00:00	16
2618	316	62	processing	2020-04-12 00:00:00	2020-04-09 00:00:00	89
2619	132	91	shipped	2020-04-11 00:00:00	2020-04-09 00:00:00	16
2620	656	23	shipped	2020-04-14 00:00:00	2020-04-09 00:00:00	45
2621	553	62	completed	2020-04-27 00:00:00	2020-04-10 00:00:00	20
2622	627	57	shipped	2020-04-16 00:00:00	2020-04-10 00:00:00	17
2623	492	94	processing	2020-05-06 00:00:00	2020-04-10 00:00:00	29
2624	386	97	shipped	2020-04-17 00:00:00	2020-04-10 00:00:00	4
2625	625	51	completed	2020-05-08 00:00:00	2020-04-10 00:00:00	60
2626	536	83	completed	2020-04-29 00:00:00	2020-04-10 00:00:00	20
2627	151	23	completed	2020-04-15 00:00:00	2020-04-10 00:00:00	40
2628	257	13	shipped	2020-05-03 00:00:00	2020-04-10 00:00:00	93
2629	105	74	completed	2020-04-25 00:00:00	2020-04-10 00:00:00	57
2630	529	71	processing	2020-05-03 00:00:00	2020-04-10 00:00:00	93
2631	42	84	processing	2020-05-09 00:00:00	2020-04-11 00:00:00	50
2632	389	54	shipped	2020-04-27 00:00:00	2020-04-11 00:00:00	39
2633	69	14	processing	2020-05-04 00:00:00	2020-04-12 00:00:00	14
2634	686	99	processing	2020-04-28 00:00:00	2020-04-12 00:00:00	67
2635	8	47	processing	2020-05-10 00:00:00	2020-04-12 00:00:00	88
2636	369	98	completed	2020-05-02 00:00:00	2020-04-12 00:00:00	81
2637	617	67	processing	2020-04-18 00:00:00	2020-04-13 00:00:00	82
2638	150	30	processing	2020-04-21 00:00:00	2020-04-13 00:00:00	7
2639	245	55	processing	2020-04-28 00:00:00	2020-04-13 00:00:00	43
2640	468	59	processing	2020-04-27 00:00:00	2020-04-13 00:00:00	5
2641	431	43	completed	2020-04-18 00:00:00	2020-04-14 00:00:00	62
2642	539	71	shipped	2020-05-10 00:00:00	2020-04-14 00:00:00	81
2643	298	39	shipped	2020-05-03 00:00:00	2020-04-14 00:00:00	52
2644	391	21	completed	2020-04-23 00:00:00	2020-04-15 00:00:00	61
2645	300	91	completed	2020-05-03 00:00:00	2020-04-15 00:00:00	38
2646	119	32	processing	2020-04-30 00:00:00	2020-04-15 00:00:00	31
2647	103	15	processing	2020-04-25 00:00:00	2020-04-16 00:00:00	10
2648	547	36	completed	2020-04-29 00:00:00	2020-04-16 00:00:00	21
2649	481	2	processing	2020-04-26 00:00:00	2020-04-16 00:00:00	69
2650	528	56	processing	2020-05-13 00:00:00	2020-04-16 00:00:00	87
2651	400	61	completed	2020-04-21 00:00:00	2020-04-16 00:00:00	32
2652	413	62	shipped	2020-04-26 00:00:00	2020-04-16 00:00:00	18
2653	20	72	processing	2020-04-21 00:00:00	2020-04-16 00:00:00	7
2654	543	20	shipped	2020-04-29 00:00:00	2020-04-16 00:00:00	33
2655	273	2	shipped	2020-05-04 00:00:00	2020-04-16 00:00:00	33
2656	542	2	completed	2020-04-17 00:00:00	2020-04-16 00:00:00	1
2657	646	9	shipped	2020-04-25 00:00:00	2020-04-17 00:00:00	24
2658	281	77	completed	2020-05-17 00:00:00	2020-04-17 00:00:00	27
2659	579	52	completed	2020-04-22 00:00:00	2020-04-17 00:00:00	38
2660	72	47	shipped	2020-05-13 00:00:00	2020-04-17 00:00:00	37
2661	687	41	processing	2020-04-28 00:00:00	2020-04-17 00:00:00	15
2662	574	66	processing	2020-05-04 00:00:00	2020-04-17 00:00:00	13
2663	612	58	shipped	2020-05-11 00:00:00	2020-04-17 00:00:00	38
2664	211	58	processing	2020-05-06 00:00:00	2020-04-17 00:00:00	6
2665	317	12	shipped	2020-05-04 00:00:00	2020-04-18 00:00:00	86
2666	9	31	shipped	2020-04-22 00:00:00	2020-04-18 00:00:00	1
2667	428	84	shipped	2020-05-13 00:00:00	2020-04-18 00:00:00	91
2668	584	34	shipped	2020-05-06 00:00:00	2020-04-18 00:00:00	72
2669	126	72	completed	2020-05-07 00:00:00	2020-04-18 00:00:00	44
2670	357	11	completed	2020-05-03 00:00:00	2020-04-18 00:00:00	76
2671	679	89	processing	2020-05-13 00:00:00	2020-04-19 00:00:00	64
2672	82	60	processing	2020-05-06 00:00:00	2020-04-19 00:00:00	20
2673	383	14	completed	2020-04-27 00:00:00	2020-04-20 00:00:00	18
2674	333	4	completed	2020-04-28 00:00:00	2020-04-20 00:00:00	78
2675	114	46	shipped	2020-05-07 00:00:00	2020-04-20 00:00:00	66
2676	557	16	processing	2020-05-15 00:00:00	2020-04-20 00:00:00	43
2677	162	85	shipped	2020-05-12 00:00:00	2020-04-20 00:00:00	78
2678	289	74	completed	2020-04-30 00:00:00	2020-04-20 00:00:00	23
2679	432	37	shipped	2020-05-05 00:00:00	2020-04-20 00:00:00	11
2680	405	54	completed	2020-04-21 00:00:00	2020-04-20 00:00:00	46
2681	252	50	processing	2020-05-19 00:00:00	2020-04-21 00:00:00	42
2682	672	88	completed	2020-04-29 00:00:00	2020-04-21 00:00:00	96
2683	154	43	shipped	2020-04-23 00:00:00	2020-04-21 00:00:00	92
2684	272	27	completed	2020-05-09 00:00:00	2020-04-21 00:00:00	83
2685	332	99	completed	2020-04-28 00:00:00	2020-04-21 00:00:00	77
2686	176	94	completed	2020-04-30 00:00:00	2020-04-22 00:00:00	82
2687	410	24	processing	2020-05-01 00:00:00	2020-04-22 00:00:00	26
2688	399	23	shipped	2020-04-25 00:00:00	2020-04-22 00:00:00	98
2689	554	94	processing	2020-05-20 00:00:00	2020-04-23 00:00:00	3
2690	635	1	processing	2020-05-12 00:00:00	2020-04-23 00:00:00	89
2691	108	89	shipped	2020-05-16 00:00:00	2020-04-24 00:00:00	74
2692	70	20	completed	2020-05-15 00:00:00	2020-04-25 00:00:00	34
2693	233	68	shipped	2020-05-02 00:00:00	2020-04-25 00:00:00	54
2694	477	96	processing	2020-05-21 00:00:00	2020-04-25 00:00:00	25
2695	225	69	shipped	2020-05-25 00:00:00	2020-04-25 00:00:00	91
2696	568	83	processing	2020-05-02 00:00:00	2020-04-26 00:00:00	12
2697	107	53	shipped	2020-05-16 00:00:00	2020-04-27 00:00:00	19
2698	383	1	processing	2020-04-30 00:00:00	2020-04-27 00:00:00	8
2699	271	2	processing	2020-05-19 00:00:00	2020-04-27 00:00:00	49
2700	463	75	completed	2020-05-27 00:00:00	2020-04-27 00:00:00	49
2701	94	12	completed	2020-05-20 00:00:00	2020-04-28 00:00:00	74
2702	12	39	shipped	2020-04-30 00:00:00	2020-04-28 00:00:00	97
2703	199	62	completed	2020-05-13 00:00:00	2020-04-28 00:00:00	28
2704	545	46	completed	2020-05-19 00:00:00	2020-04-28 00:00:00	70
2705	663	96	processing	2020-05-19 00:00:00	2020-04-29 00:00:00	55
2706	583	90	completed	2020-05-21 00:00:00	2020-04-29 00:00:00	88
2707	77	54	processing	2020-05-02 00:00:00	2020-04-29 00:00:00	74
2708	574	93	processing	2020-05-18 00:00:00	2020-04-29 00:00:00	22
2709	527	41	completed	2020-05-07 00:00:00	2020-04-30 00:00:00	40
2710	692	59	shipped	2020-05-18 00:00:00	2020-05-01 00:00:00	77
2711	50	42	completed	2020-05-24 00:00:00	2020-05-01 00:00:00	45
2712	107	96	shipped	2020-05-13 00:00:00	2020-05-01 00:00:00	26
2713	113	99	completed	2020-05-24 00:00:00	2020-05-01 00:00:00	55
2714	467	95	processing	2020-05-21 00:00:00	2020-05-01 00:00:00	28
2715	480	36	processing	2020-05-08 00:00:00	2020-05-01 00:00:00	99
2716	340	59	processing	2020-05-11 00:00:00	2020-05-02 00:00:00	92
2717	691	83	shipped	2020-05-28 00:00:00	2020-05-02 00:00:00	67
2718	34	92	completed	2020-05-03 00:00:00	2020-05-02 00:00:00	2
2719	690	56	shipped	2020-05-13 00:00:00	2020-05-02 00:00:00	41
2720	137	29	shipped	2020-05-08 00:00:00	2020-05-02 00:00:00	6
2721	102	89	processing	2020-05-29 00:00:00	2020-05-03 00:00:00	23
2722	330	82	processing	2020-05-06 00:00:00	2020-05-03 00:00:00	58
2723	556	57	shipped	2020-05-10 00:00:00	2020-05-03 00:00:00	35
2724	107	83	completed	2020-05-27 00:00:00	2020-05-03 00:00:00	76
2725	92	11	processing	2020-05-13 00:00:00	2020-05-03 00:00:00	24
2726	105	12	processing	2020-05-13 00:00:00	2020-05-03 00:00:00	50
2727	403	24	completed	2020-05-13 00:00:00	2020-05-03 00:00:00	2
2728	417	6	processing	2020-05-16 00:00:00	2020-05-03 00:00:00	79
2729	693	63	processing	2020-05-06 00:00:00	2020-05-03 00:00:00	88
2730	440	10	processing	2020-05-30 00:00:00	2020-05-03 00:00:00	38
2731	395	76	shipped	2020-05-07 00:00:00	2020-05-04 00:00:00	22
2732	77	39	completed	2020-05-11 00:00:00	2020-05-04 00:00:00	92
2733	220	78	shipped	2020-05-20 00:00:00	2020-05-04 00:00:00	18
2734	111	78	shipped	2020-06-03 00:00:00	2020-05-04 00:00:00	7
2735	261	11	shipped	2020-05-16 00:00:00	2020-05-04 00:00:00	86
2736	155	54	processing	2020-05-23 00:00:00	2020-05-04 00:00:00	72
2737	694	91	processing	2020-05-16 00:00:00	2020-05-05 00:00:00	98
2738	509	31	shipped	2020-05-27 00:00:00	2020-05-06 00:00:00	73
2739	316	87	shipped	2020-05-18 00:00:00	2020-05-06 00:00:00	12
2740	610	85	completed	2020-05-18 00:00:00	2020-05-06 00:00:00	83
2741	271	11	completed	2020-05-17 00:00:00	2020-05-06 00:00:00	7
2742	222	72	shipped	2020-05-23 00:00:00	2020-05-06 00:00:00	41
2743	148	29	processing	2020-05-26 00:00:00	2020-05-06 00:00:00	32
2744	517	35	shipped	2020-05-11 00:00:00	2020-05-06 00:00:00	15
2745	207	70	completed	2020-05-23 00:00:00	2020-05-06 00:00:00	99
2746	48	34	processing	2020-06-05 00:00:00	2020-05-06 00:00:00	71
2747	285	59	completed	2020-05-25 00:00:00	2020-05-06 00:00:00	69
2748	221	65	completed	2020-05-14 00:00:00	2020-05-06 00:00:00	48
2749	352	96	completed	2020-05-18 00:00:00	2020-05-06 00:00:00	45
2750	323	33	processing	2020-05-19 00:00:00	2020-05-06 00:00:00	89
2751	146	24	shipped	2020-05-29 00:00:00	2020-05-06 00:00:00	88
2753	50	9	completed	2020-05-12 00:00:00	2020-05-08 00:00:00	2
2754	288	64	processing	2020-06-02 00:00:00	2020-05-08 00:00:00	39
2756	627	19	completed	2020-06-04 00:00:00	2020-05-09 00:00:00	60
2757	235	86	shipped	2020-06-01 00:00:00	2020-05-09 00:00:00	71
2758	24	5	processing	2020-05-29 00:00:00	2020-05-09 00:00:00	34
2759	136	39	completed	2020-05-18 00:00:00	2020-05-10 00:00:00	34
2760	682	86	processing	2020-05-22 00:00:00	2020-05-10 00:00:00	97
2761	144	2	processing	2020-05-27 00:00:00	2020-05-11 00:00:00	2
2762	328	27	completed	2020-05-24 00:00:00	2020-05-11 00:00:00	4
2763	103	37	processing	2020-06-04 00:00:00	2020-05-11 00:00:00	87
2764	586	63	completed	2020-05-17 00:00:00	2020-05-11 00:00:00	62
2765	617	99	shipped	2020-05-30 00:00:00	2020-05-11 00:00:00	78
2767	158	27	completed	2020-05-14 00:00:00	2020-05-11 00:00:00	90
2770	469	80	shipped	2020-05-15 00:00:00	2020-05-12 00:00:00	58
2885	157	31	shipped	2020-06-16 00:00:00	2020-06-05 00:00:00	37
2886	108	79	shipped	2020-06-26 00:00:00	2020-06-05 00:00:00	33
2887	683	79	shipped	2020-06-12 00:00:00	2020-06-05 00:00:00	46
2888	370	54	processing	2020-06-26 00:00:00	2020-06-05 00:00:00	54
2890	108	97	processing	2020-06-21 00:00:00	2020-06-06 00:00:00	1
2891	332	99	completed	2020-07-06 00:00:00	2020-06-07 00:00:00	89
2893	367	40	shipped	2020-07-02 00:00:00	2020-06-07 00:00:00	98
2895	167	12	shipped	2020-06-18 00:00:00	2020-06-07 00:00:00	62
2896	202	88	shipped	2020-06-09 00:00:00	2020-06-07 00:00:00	99
2897	331	83	completed	2020-07-02 00:00:00	2020-06-07 00:00:00	66
2898	149	93	completed	2020-06-08 00:00:00	2020-06-07 00:00:00	47
2899	296	28	shipped	2020-07-03 00:00:00	2020-06-08 00:00:00	59
2900	164	76	completed	2020-06-12 00:00:00	2020-06-08 00:00:00	75
2752	566	66	completed	2020-06-06 00:00:00	2020-05-07 00:00:00	62
2755	388	42	shipped	2020-05-21 00:00:00	2020-05-08 00:00:00	41
2766	455	8	completed	2020-05-27 00:00:00	2020-05-11 00:00:00	56
2768	536	54	completed	2020-06-01 00:00:00	2020-05-11 00:00:00	68
2769	557	47	completed	2020-06-05 00:00:00	2020-05-12 00:00:00	90
2771	502	11	processing	2020-06-11 00:00:00	2020-05-12 00:00:00	80
2772	14	94	completed	2020-06-01 00:00:00	2020-05-12 00:00:00	94
2773	463	17	shipped	2020-05-21 00:00:00	2020-05-12 00:00:00	33
2774	471	49	completed	2020-06-09 00:00:00	2020-05-12 00:00:00	66
2775	672	23	shipped	2020-05-26 00:00:00	2020-05-12 00:00:00	92
2776	29	16	completed	2020-05-27 00:00:00	2020-05-12 00:00:00	41
2777	416	16	completed	2020-05-20 00:00:00	2020-05-12 00:00:00	3
2778	318	33	completed	2020-05-31 00:00:00	2020-05-12 00:00:00	74
2779	235	84	shipped	2020-05-21 00:00:00	2020-05-12 00:00:00	28
2780	39	61	shipped	2020-05-15 00:00:00	2020-05-12 00:00:00	40
2781	155	99	completed	2020-05-31 00:00:00	2020-05-12 00:00:00	3
2782	182	81	processing	2020-05-31 00:00:00	2020-05-12 00:00:00	45
2783	83	53	processing	2020-06-10 00:00:00	2020-05-12 00:00:00	6
2784	467	14	processing	2020-05-16 00:00:00	2020-05-12 00:00:00	56
2785	630	99	shipped	2020-05-21 00:00:00	2020-05-13 00:00:00	73
2786	268	14	completed	2020-06-02 00:00:00	2020-05-13 00:00:00	3
2787	646	2	completed	2020-06-05 00:00:00	2020-05-13 00:00:00	38
2788	399	89	processing	2020-06-13 00:00:00	2020-05-14 00:00:00	28
2789	640	70	processing	2020-05-30 00:00:00	2020-05-15 00:00:00	52
2790	588	8	processing	2020-06-11 00:00:00	2020-05-15 00:00:00	69
2791	651	60	processing	2020-06-13 00:00:00	2020-05-15 00:00:00	55
2792	338	37	shipped	2020-06-09 00:00:00	2020-05-15 00:00:00	16
2793	11	78	shipped	2020-05-31 00:00:00	2020-05-15 00:00:00	31
2794	101	29	shipped	2020-05-21 00:00:00	2020-05-15 00:00:00	9
2795	40	27	completed	2020-05-22 00:00:00	2020-05-15 00:00:00	13
2796	163	65	shipped	2020-05-18 00:00:00	2020-05-15 00:00:00	22
2797	56	32	completed	2020-06-12 00:00:00	2020-05-16 00:00:00	100
2798	531	13	shipped	2020-05-28 00:00:00	2020-05-16 00:00:00	9
2799	406	56	completed	2020-05-19 00:00:00	2020-05-16 00:00:00	2
2800	448	73	processing	2020-05-26 00:00:00	2020-05-16 00:00:00	44
2801	248	53	shipped	2020-06-03 00:00:00	2020-05-17 00:00:00	19
2802	191	72	completed	2020-06-08 00:00:00	2020-05-17 00:00:00	92
2803	471	12	processing	2020-05-25 00:00:00	2020-05-17 00:00:00	92
2804	298	38	processing	2020-06-16 00:00:00	2020-05-17 00:00:00	10
2805	481	64	shipped	2020-06-15 00:00:00	2020-05-17 00:00:00	76
2806	438	25	completed	2020-05-26 00:00:00	2020-05-18 00:00:00	37
2807	573	15	completed	2020-06-03 00:00:00	2020-05-18 00:00:00	19
2808	323	62	shipped	2020-05-24 00:00:00	2020-05-18 00:00:00	59
2809	691	88	shipped	2020-06-14 00:00:00	2020-05-18 00:00:00	82
2810	456	70	processing	2020-06-16 00:00:00	2020-05-18 00:00:00	29
2811	489	74	shipped	2020-05-26 00:00:00	2020-05-18 00:00:00	86
2812	46	65	shipped	2020-05-19 00:00:00	2020-05-18 00:00:00	22
2813	94	60	processing	2020-05-24 00:00:00	2020-05-18 00:00:00	30
2814	508	61	processing	2020-05-27 00:00:00	2020-05-18 00:00:00	13
2815	311	93	processing	2020-05-24 00:00:00	2020-05-18 00:00:00	33
2816	72	75	completed	2020-06-13 00:00:00	2020-05-18 00:00:00	68
2817	91	40	completed	2020-05-29 00:00:00	2020-05-18 00:00:00	16
2818	238	61	processing	2020-05-28 00:00:00	2020-05-18 00:00:00	32
2819	476	16	shipped	2020-05-29 00:00:00	2020-05-18 00:00:00	36
2820	20	19	processing	2020-06-13 00:00:00	2020-05-18 00:00:00	28
2821	267	78	completed	2020-06-08 00:00:00	2020-05-19 00:00:00	41
2822	265	86	completed	2020-06-08 00:00:00	2020-05-20 00:00:00	91
2823	346	95	completed	2020-05-21 00:00:00	2020-05-20 00:00:00	82
2824	97	52	processing	2020-06-01 00:00:00	2020-05-20 00:00:00	75
2825	375	20	processing	2020-06-10 00:00:00	2020-05-20 00:00:00	48
2826	557	94	processing	2020-05-25 00:00:00	2020-05-20 00:00:00	24
2827	139	68	processing	2020-05-27 00:00:00	2020-05-21 00:00:00	65
2828	451	65	completed	2020-06-20 00:00:00	2020-05-21 00:00:00	61
2829	359	72	shipped	2020-06-04 00:00:00	2020-05-21 00:00:00	71
2830	356	50	processing	2020-05-30 00:00:00	2020-05-21 00:00:00	4
2831	234	63	processing	2020-06-11 00:00:00	2020-05-21 00:00:00	11
2832	369	5	processing	2020-06-19 00:00:00	2020-05-21 00:00:00	40
2833	523	45	completed	2020-06-08 00:00:00	2020-05-22 00:00:00	74
2834	681	43	shipped	2020-06-08 00:00:00	2020-05-22 00:00:00	6
2835	85	88	shipped	2020-05-29 00:00:00	2020-05-22 00:00:00	39
2836	422	5	processing	2020-05-25 00:00:00	2020-05-23 00:00:00	14
2837	557	94	processing	2020-06-01 00:00:00	2020-05-23 00:00:00	95
2838	494	49	processing	2020-06-17 00:00:00	2020-05-23 00:00:00	38
2839	327	87	processing	2020-06-21 00:00:00	2020-05-23 00:00:00	87
2840	39	74	processing	2020-05-25 00:00:00	2020-05-23 00:00:00	96
2841	198	21	shipped	2020-06-18 00:00:00	2020-05-24 00:00:00	32
2842	41	17	completed	2020-06-21 00:00:00	2020-05-24 00:00:00	96
2843	219	4	shipped	2020-06-10 00:00:00	2020-05-24 00:00:00	96
2844	122	21	shipped	2020-06-02 00:00:00	2020-05-24 00:00:00	8
2845	595	89	shipped	2020-06-20 00:00:00	2020-05-25 00:00:00	3
2846	591	79	shipped	2020-06-14 00:00:00	2020-05-25 00:00:00	15
2847	230	67	completed	2020-05-28 00:00:00	2020-05-25 00:00:00	40
2848	339	27	completed	2020-05-26 00:00:00	2020-05-25 00:00:00	43
2849	364	66	completed	2020-06-19 00:00:00	2020-05-25 00:00:00	33
2850	513	32	completed	2020-06-03 00:00:00	2020-05-26 00:00:00	100
2851	464	70	processing	2020-06-07 00:00:00	2020-05-26 00:00:00	1
2852	378	41	shipped	2020-06-05 00:00:00	2020-05-26 00:00:00	58
2853	646	11	shipped	2020-06-03 00:00:00	2020-05-26 00:00:00	72
2854	540	21	processing	2020-06-09 00:00:00	2020-05-26 00:00:00	55
2855	273	52	processing	2020-06-24 00:00:00	2020-05-26 00:00:00	23
2856	205	70	shipped	2020-06-18 00:00:00	2020-05-26 00:00:00	67
2857	649	68	completed	2020-05-28 00:00:00	2020-05-27 00:00:00	76
2858	634	9	processing	2020-06-20 00:00:00	2020-05-27 00:00:00	72
2859	18	30	shipped	2020-06-06 00:00:00	2020-05-27 00:00:00	40
2860	268	4	shipped	2020-06-24 00:00:00	2020-05-28 00:00:00	80
2861	392	12	shipped	2020-06-03 00:00:00	2020-05-29 00:00:00	23
2862	276	2	completed	2020-06-06 00:00:00	2020-05-29 00:00:00	86
2863	622	47	shipped	2020-06-23 00:00:00	2020-05-30 00:00:00	76
2864	182	28	processing	2020-06-13 00:00:00	2020-05-30 00:00:00	46
2865	664	75	completed	2020-06-13 00:00:00	2020-05-31 00:00:00	41
2866	40	53	processing	2020-06-10 00:00:00	2020-05-31 00:00:00	64
2867	224	56	shipped	2020-06-07 00:00:00	2020-05-31 00:00:00	68
2868	528	61	processing	2020-06-13 00:00:00	2020-05-31 00:00:00	10
2869	22	50	shipped	2020-06-06 00:00:00	2020-06-01 00:00:00	93
2870	600	46	shipped	2020-06-30 00:00:00	2020-06-01 00:00:00	50
2871	170	5	completed	2020-06-16 00:00:00	2020-06-02 00:00:00	15
2872	185	62	processing	2020-06-30 00:00:00	2020-06-03 00:00:00	67
2873	136	20	completed	2020-06-13 00:00:00	2020-06-03 00:00:00	53
2874	167	13	shipped	2020-07-02 00:00:00	2020-06-03 00:00:00	76
2875	136	96	shipped	2020-06-18 00:00:00	2020-06-03 00:00:00	54
2876	339	84	completed	2020-06-26 00:00:00	2020-06-03 00:00:00	86
2877	618	10	shipped	2020-06-21 00:00:00	2020-06-03 00:00:00	57
2878	401	20	completed	2020-06-06 00:00:00	2020-06-04 00:00:00	6
2879	255	82	completed	2020-06-19 00:00:00	2020-06-04 00:00:00	97
2880	86	33	completed	2020-06-21 00:00:00	2020-06-04 00:00:00	25
2881	499	57	completed	2020-06-25 00:00:00	2020-06-05 00:00:00	65
2882	53	77	shipped	2020-06-18 00:00:00	2020-06-05 00:00:00	90
2883	211	42	processing	2020-06-23 00:00:00	2020-06-05 00:00:00	76
2884	362	18	shipped	2020-06-16 00:00:00	2020-06-05 00:00:00	43
2889	10	45	processing	2020-06-28 00:00:00	2020-06-06 00:00:00	84
2892	253	43	completed	2020-06-24 00:00:00	2020-06-07 00:00:00	27
2894	660	89	completed	2020-06-27 00:00:00	2020-06-07 00:00:00	71
2901	514	98	completed	2020-07-06 00:00:00	2020-06-08 00:00:00	8
2902	222	67	shipped	2020-06-22 00:00:00	2020-06-08 00:00:00	32
2903	620	59	processing	2020-06-11 00:00:00	2020-06-08 00:00:00	78
2904	428	50	completed	2020-06-14 00:00:00	2020-06-08 00:00:00	100
2905	210	26	shipped	2020-06-25 00:00:00	2020-06-09 00:00:00	49
2906	2	62	shipped	2020-06-16 00:00:00	2020-06-10 00:00:00	42
2907	502	59	completed	2020-06-17 00:00:00	2020-06-10 00:00:00	94
2908	175	59	completed	2020-06-21 00:00:00	2020-06-10 00:00:00	77
2909	676	23	completed	2020-06-18 00:00:00	2020-06-10 00:00:00	97
2910	680	23	completed	2020-07-03 00:00:00	2020-06-10 00:00:00	85
2911	440	74	shipped	2020-06-26 00:00:00	2020-06-10 00:00:00	13
2912	91	28	shipped	2020-07-05 00:00:00	2020-06-10 00:00:00	63
2913	379	49	completed	2020-06-21 00:00:00	2020-06-11 00:00:00	20
2914	308	1	processing	2020-06-18 00:00:00	2020-06-11 00:00:00	46
2915	489	58	shipped	2020-07-03 00:00:00	2020-06-11 00:00:00	40
2916	271	94	shipped	2020-06-13 00:00:00	2020-06-11 00:00:00	61
2917	592	41	completed	2020-06-19 00:00:00	2020-06-11 00:00:00	100
2918	380	90	shipped	2020-06-23 00:00:00	2020-06-11 00:00:00	22
2919	163	46	shipped	2020-07-09 00:00:00	2020-06-11 00:00:00	64
2920	308	69	shipped	2020-07-05 00:00:00	2020-06-11 00:00:00	12
2921	626	70	processing	2020-07-04 00:00:00	2020-06-12 00:00:00	38
2922	583	43	shipped	2020-07-12 00:00:00	2020-06-12 00:00:00	33
2923	375	24	shipped	2020-06-14 00:00:00	2020-06-12 00:00:00	17
2924	192	47	completed	2020-06-25 00:00:00	2020-06-12 00:00:00	41
2925	148	82	processing	2020-06-22 00:00:00	2020-06-13 00:00:00	31
2926	121	42	completed	2020-06-14 00:00:00	2020-06-13 00:00:00	24
2927	396	76	completed	2020-06-17 00:00:00	2020-06-13 00:00:00	8
2928	677	60	shipped	2020-07-12 00:00:00	2020-06-13 00:00:00	83
2929	18	11	shipped	2020-06-23 00:00:00	2020-06-14 00:00:00	80
2930	82	81	processing	2020-07-07 00:00:00	2020-06-14 00:00:00	20
2931	573	28	shipped	2020-07-07 00:00:00	2020-06-14 00:00:00	23
2932	590	19	processing	2020-07-14 00:00:00	2020-06-14 00:00:00	27
2933	160	51	shipped	2020-07-13 00:00:00	2020-06-14 00:00:00	24
2934	536	85	processing	2020-06-26 00:00:00	2020-06-14 00:00:00	93
2935	252	85	shipped	2020-07-11 00:00:00	2020-06-15 00:00:00	30
2936	404	91	shipped	2020-07-13 00:00:00	2020-06-15 00:00:00	99
2937	163	90	completed	2020-06-20 00:00:00	2020-06-15 00:00:00	53
2938	34	20	shipped	2020-07-12 00:00:00	2020-06-15 00:00:00	8
2939	115	2	shipped	2020-06-29 00:00:00	2020-06-15 00:00:00	75
2940	408	52	shipped	2020-07-08 00:00:00	2020-06-15 00:00:00	66
2941	178	50	processing	2020-06-25 00:00:00	2020-06-16 00:00:00	62
2942	270	37	completed	2020-07-04 00:00:00	2020-06-16 00:00:00	11
2943	489	39	completed	2020-07-05 00:00:00	2020-06-16 00:00:00	61
2944	105	19	shipped	2020-07-03 00:00:00	2020-06-16 00:00:00	66
2945	197	57	completed	2020-06-25 00:00:00	2020-06-16 00:00:00	15
2946	600	14	completed	2020-07-16 00:00:00	2020-06-16 00:00:00	37
2947	33	32	completed	2020-07-06 00:00:00	2020-06-16 00:00:00	68
2948	504	97	shipped	2020-06-17 00:00:00	2020-06-16 00:00:00	36
2949	389	83	shipped	2020-07-08 00:00:00	2020-06-16 00:00:00	57
2950	663	17	processing	2020-07-03 00:00:00	2020-06-16 00:00:00	16
2951	517	53	shipped	2020-07-08 00:00:00	2020-06-16 00:00:00	85
2952	131	66	completed	2020-06-21 00:00:00	2020-06-16 00:00:00	56
2953	115	23	shipped	2020-07-12 00:00:00	2020-06-17 00:00:00	100
2954	636	29	processing	2020-07-13 00:00:00	2020-06-17 00:00:00	62
2955	65	28	shipped	2020-07-02 00:00:00	2020-06-17 00:00:00	83
2956	453	14	shipped	2020-07-13 00:00:00	2020-06-17 00:00:00	40
2957	511	50	completed	2020-07-13 00:00:00	2020-06-17 00:00:00	70
2958	95	49	processing	2020-06-26 00:00:00	2020-06-17 00:00:00	94
2959	171	28	completed	2020-07-02 00:00:00	2020-06-17 00:00:00	65
2960	339	33	processing	2020-07-14 00:00:00	2020-06-17 00:00:00	49
2961	455	13	shipped	2020-07-07 00:00:00	2020-06-18 00:00:00	40
2962	689	46	processing	2020-07-14 00:00:00	2020-06-18 00:00:00	81
2963	46	52	shipped	2020-07-16 00:00:00	2020-06-18 00:00:00	11
2964	646	3	completed	2020-07-04 00:00:00	2020-06-18 00:00:00	97
2965	310	92	shipped	2020-06-24 00:00:00	2020-06-19 00:00:00	12
2966	205	60	processing	2020-07-02 00:00:00	2020-06-19 00:00:00	55
2967	9	80	completed	2020-06-24 00:00:00	2020-06-19 00:00:00	64
2968	516	88	processing	2020-06-21 00:00:00	2020-06-19 00:00:00	10
2969	92	72	completed	2020-07-11 00:00:00	2020-06-19 00:00:00	88
2970	12	79	processing	2020-07-03 00:00:00	2020-06-19 00:00:00	83
2971	648	48	processing	2020-07-01 00:00:00	2020-06-20 00:00:00	39
2972	476	75	processing	2020-06-28 00:00:00	2020-06-20 00:00:00	13
2973	322	66	completed	2020-07-15 00:00:00	2020-06-20 00:00:00	63
2974	298	5	completed	2020-06-30 00:00:00	2020-06-20 00:00:00	83
2975	643	76	completed	2020-07-12 00:00:00	2020-06-20 00:00:00	62
2976	543	23	completed	2020-07-20 00:00:00	2020-06-20 00:00:00	41
2977	274	48	processing	2020-07-08 00:00:00	2020-06-21 00:00:00	49
2978	560	74	completed	2020-07-03 00:00:00	2020-06-21 00:00:00	29
2979	671	30	completed	2020-06-28 00:00:00	2020-06-21 00:00:00	83
2980	79	83	completed	2020-07-09 00:00:00	2020-06-21 00:00:00	82
2981	364	49	shipped	2020-07-09 00:00:00	2020-06-21 00:00:00	6
2982	518	85	shipped	2020-07-14 00:00:00	2020-06-21 00:00:00	11
2983	594	85	processing	2020-07-22 00:00:00	2020-06-22 00:00:00	74
2984	293	26	shipped	2020-07-05 00:00:00	2020-06-22 00:00:00	68
2985	615	20	processing	2020-07-22 00:00:00	2020-06-22 00:00:00	34
2986	260	35	completed	2020-07-04 00:00:00	2020-06-22 00:00:00	23
2987	689	29	processing	2020-07-17 00:00:00	2020-06-22 00:00:00	87
2988	159	46	processing	2020-07-12 00:00:00	2020-06-22 00:00:00	22
2989	380	95	processing	2020-07-10 00:00:00	2020-06-23 00:00:00	34
2990	266	40	processing	2020-06-27 00:00:00	2020-06-23 00:00:00	28
2991	295	24	processing	2020-07-04 00:00:00	2020-06-23 00:00:00	2
2992	482	19	processing	2020-06-28 00:00:00	2020-06-23 00:00:00	64
2993	203	42	shipped	2020-07-20 00:00:00	2020-06-23 00:00:00	34
2994	321	20	completed	2020-07-15 00:00:00	2020-06-23 00:00:00	77
2995	442	35	completed	2020-07-01 00:00:00	2020-06-23 00:00:00	87
2996	627	8	processing	2020-07-20 00:00:00	2020-06-23 00:00:00	86
2997	42	97	shipped	2020-07-04 00:00:00	2020-06-23 00:00:00	12
2998	339	4	processing	2020-07-12 00:00:00	2020-06-24 00:00:00	15
2999	665	2	completed	2020-07-18 00:00:00	2020-06-24 00:00:00	85
3000	653	92	processing	2020-07-21 00:00:00	2020-06-24 00:00:00	7
3001	189	27	processing	2020-07-14 00:00:00	2020-06-25 00:00:00	42
3002	315	66	processing	2020-06-30 00:00:00	2020-06-25 00:00:00	85
3003	60	27	completed	2020-07-09 00:00:00	2020-06-25 00:00:00	60
3004	447	96	shipped	2020-07-19 00:00:00	2020-06-25 00:00:00	13
3005	699	32	processing	2020-06-27 00:00:00	2020-06-25 00:00:00	88
3006	16	47	processing	2020-07-17 00:00:00	2020-06-25 00:00:00	92
3007	169	46	shipped	2020-07-13 00:00:00	2020-06-26 00:00:00	93
3008	253	66	shipped	2020-07-10 00:00:00	2020-06-26 00:00:00	67
3009	522	20	processing	2020-07-02 00:00:00	2020-06-26 00:00:00	59
3010	106	55	shipped	2020-07-27 00:00:00	2020-06-27 00:00:00	100
3011	334	33	processing	2020-07-22 00:00:00	2020-06-27 00:00:00	100
3012	613	28	processing	2020-06-28 00:00:00	2020-06-27 00:00:00	38
3013	668	14	processing	2020-07-14 00:00:00	2020-06-27 00:00:00	3
3014	692	6	processing	2020-07-10 00:00:00	2020-06-27 00:00:00	50
3015	57	3	processing	2020-07-02 00:00:00	2020-06-27 00:00:00	47
3016	330	81	processing	2020-07-06 00:00:00	2020-06-27 00:00:00	25
3017	667	31	completed	2020-07-02 00:00:00	2020-06-27 00:00:00	41
3018	182	15	shipped	2020-07-01 00:00:00	2020-06-28 00:00:00	69
3019	676	54	completed	2020-07-11 00:00:00	2020-06-28 00:00:00	38
3020	226	69	processing	2020-07-25 00:00:00	2020-06-28 00:00:00	88
3021	488	19	processing	2020-07-18 00:00:00	2020-06-28 00:00:00	60
3022	128	43	completed	2020-07-07 00:00:00	2020-06-28 00:00:00	86
3023	282	16	shipped	2020-07-25 00:00:00	2020-06-28 00:00:00	70
3024	662	84	processing	2020-06-29 00:00:00	2020-06-28 00:00:00	18
3025	264	41	shipped	2020-07-16 00:00:00	2020-06-29 00:00:00	84
3026	430	48	shipped	2020-07-27 00:00:00	2020-06-29 00:00:00	28
3027	373	29	processing	2020-07-06 00:00:00	2020-06-29 00:00:00	94
3028	417	33	shipped	2020-07-10 00:00:00	2020-06-29 00:00:00	83
3029	411	9	completed	2020-07-22 00:00:00	2020-06-29 00:00:00	10
3030	156	2	processing	2020-07-15 00:00:00	2020-06-29 00:00:00	16
3031	419	46	completed	2020-07-14 00:00:00	2020-06-30 00:00:00	19
3032	456	47	processing	2020-07-16 00:00:00	2020-06-30 00:00:00	97
3033	574	98	completed	2020-07-17 00:00:00	2020-07-01 00:00:00	58
3034	617	85	processing	2020-07-14 00:00:00	2020-07-01 00:00:00	73
3035	648	85	shipped	2020-07-05 00:00:00	2020-07-01 00:00:00	100
3036	1	41	processing	2020-07-13 00:00:00	2020-07-01 00:00:00	57
3037	321	69	processing	2020-07-21 00:00:00	2020-07-01 00:00:00	60
3038	97	80	processing	2020-07-07 00:00:00	2020-07-01 00:00:00	83
3039	139	34	processing	2020-07-14 00:00:00	2020-07-01 00:00:00	95
3040	339	41	shipped	2020-07-23 00:00:00	2020-07-01 00:00:00	8
3041	367	13	completed	2020-07-27 00:00:00	2020-07-01 00:00:00	86
3042	397	36	shipped	2020-07-17 00:00:00	2020-07-01 00:00:00	72
3043	209	27	completed	2020-07-24 00:00:00	2020-07-01 00:00:00	73
3044	35	91	shipped	2020-07-02 00:00:00	2020-07-01 00:00:00	1
3045	365	82	completed	2020-07-25 00:00:00	2020-07-01 00:00:00	28
3046	295	21	completed	2020-07-17 00:00:00	2020-07-01 00:00:00	69
3047	227	75	completed	2020-07-24 00:00:00	2020-07-01 00:00:00	53
3048	192	81	shipped	2020-07-09 00:00:00	2020-07-01 00:00:00	100
3049	95	71	shipped	2020-07-23 00:00:00	2020-07-02 00:00:00	38
3050	52	57	shipped	2020-07-25 00:00:00	2020-07-02 00:00:00	75
3051	612	60	processing	2020-07-21 00:00:00	2020-07-02 00:00:00	53
3052	165	93	shipped	2020-07-24 00:00:00	2020-07-02 00:00:00	18
3053	383	14	processing	2020-07-23 00:00:00	2020-07-03 00:00:00	85
3054	647	81	shipped	2020-07-21 00:00:00	2020-07-03 00:00:00	48
3055	364	33	shipped	2020-07-29 00:00:00	2020-07-03 00:00:00	36
3056	677	80	processing	2020-07-08 00:00:00	2020-07-03 00:00:00	7
3057	514	25	processing	2020-07-21 00:00:00	2020-07-03 00:00:00	30
3058	533	67	shipped	2020-07-25 00:00:00	2020-07-03 00:00:00	39
3059	477	58	shipped	2020-07-15 00:00:00	2020-07-03 00:00:00	25
3060	518	1	shipped	2020-07-15 00:00:00	2020-07-03 00:00:00	61
3061	17	69	processing	2020-07-11 00:00:00	2020-07-04 00:00:00	93
3062	494	69	processing	2020-08-03 00:00:00	2020-07-04 00:00:00	58
3063	691	56	shipped	2020-07-22 00:00:00	2020-07-04 00:00:00	15
3064	76	49	completed	2020-07-27 00:00:00	2020-07-04 00:00:00	45
3065	368	5	shipped	2020-08-03 00:00:00	2020-07-04 00:00:00	62
3066	321	42	shipped	2020-07-14 00:00:00	2020-07-04 00:00:00	31
3067	430	65	completed	2020-07-08 00:00:00	2020-07-04 00:00:00	77
3068	84	22	completed	2020-07-07 00:00:00	2020-07-04 00:00:00	42
3069	147	43	shipped	2020-07-26 00:00:00	2020-07-04 00:00:00	99
3070	501	95	completed	2020-07-16 00:00:00	2020-07-05 00:00:00	12
3071	627	66	completed	2020-07-10 00:00:00	2020-07-06 00:00:00	86
3072	395	69	shipped	2020-07-11 00:00:00	2020-07-06 00:00:00	30
3073	70	5	processing	2020-08-04 00:00:00	2020-07-06 00:00:00	96
3074	400	15	processing	2020-07-11 00:00:00	2020-07-06 00:00:00	56
3075	671	60	shipped	2020-07-27 00:00:00	2020-07-06 00:00:00	36
3076	108	11	completed	2020-07-29 00:00:00	2020-07-06 00:00:00	71
3077	462	46	completed	2020-07-10 00:00:00	2020-07-06 00:00:00	42
3078	400	22	completed	2020-07-22 00:00:00	2020-07-06 00:00:00	22
3079	459	41	shipped	2020-07-30 00:00:00	2020-07-07 00:00:00	42
3080	263	82	completed	2020-07-22 00:00:00	2020-07-07 00:00:00	92
3081	508	33	processing	2020-07-27 00:00:00	2020-07-07 00:00:00	48
3082	623	15	shipped	2020-07-08 00:00:00	2020-07-07 00:00:00	2
3083	642	50	processing	2020-07-12 00:00:00	2020-07-07 00:00:00	31
3084	682	78	completed	2020-07-27 00:00:00	2020-07-07 00:00:00	62
3085	425	48	shipped	2020-07-25 00:00:00	2020-07-08 00:00:00	72
3086	176	44	processing	2020-08-02 00:00:00	2020-07-08 00:00:00	80
3087	132	78	processing	2020-07-17 00:00:00	2020-07-08 00:00:00	73
3088	45	65	shipped	2020-07-20 00:00:00	2020-07-09 00:00:00	49
3089	592	92	completed	2020-07-22 00:00:00	2020-07-09 00:00:00	14
3090	222	55	shipped	2020-07-10 00:00:00	2020-07-09 00:00:00	93
3091	236	94	shipped	2020-07-10 00:00:00	2020-07-09 00:00:00	55
3092	329	76	completed	2020-07-24 00:00:00	2020-07-09 00:00:00	68
3093	9	99	processing	2020-07-20 00:00:00	2020-07-09 00:00:00	99
3094	170	4	shipped	2020-07-14 00:00:00	2020-07-10 00:00:00	59
3095	2	42	processing	2020-07-18 00:00:00	2020-07-10 00:00:00	96
3096	81	32	completed	2020-07-31 00:00:00	2020-07-10 00:00:00	63
3097	609	100	processing	2020-08-09 00:00:00	2020-07-10 00:00:00	43
3098	62	65	shipped	2020-07-13 00:00:00	2020-07-10 00:00:00	71
3099	300	52	completed	2020-08-06 00:00:00	2020-07-10 00:00:00	12
3100	203	8	processing	2020-08-05 00:00:00	2020-07-10 00:00:00	91
3101	167	97	completed	2020-07-18 00:00:00	2020-07-10 00:00:00	88
3102	154	82	shipped	2020-08-04 00:00:00	2020-07-10 00:00:00	85
3103	228	84	completed	2020-07-23 00:00:00	2020-07-10 00:00:00	20
3105	472	97	processing	2020-07-24 00:00:00	2020-07-10 00:00:00	24
3107	475	35	processing	2020-07-29 00:00:00	2020-07-10 00:00:00	71
3110	370	39	completed	2020-08-06 00:00:00	2020-07-11 00:00:00	40
3111	504	42	shipped	2020-08-10 00:00:00	2020-07-11 00:00:00	88
3112	202	60	processing	2020-08-02 00:00:00	2020-07-11 00:00:00	62
3113	552	41	shipped	2020-08-02 00:00:00	2020-07-11 00:00:00	85
3115	450	19	completed	2020-08-05 00:00:00	2020-07-12 00:00:00	67
3120	405	32	shipped	2020-07-13 00:00:00	2020-07-12 00:00:00	97
3104	184	22	completed	2020-07-31 00:00:00	2020-07-10 00:00:00	62
3106	576	11	completed	2020-07-24 00:00:00	2020-07-10 00:00:00	17
3108	567	14	completed	2020-07-26 00:00:00	2020-07-10 00:00:00	78
3109	443	92	shipped	2020-07-19 00:00:00	2020-07-11 00:00:00	10
3114	309	71	completed	2020-07-29 00:00:00	2020-07-11 00:00:00	2
3116	396	92	completed	2020-07-14 00:00:00	2020-07-12 00:00:00	86
3117	181	7	completed	2020-08-05 00:00:00	2020-07-12 00:00:00	23
3118	323	64	completed	2020-07-25 00:00:00	2020-07-12 00:00:00	85
3119	21	98	processing	2020-07-20 00:00:00	2020-07-12 00:00:00	20
3121	242	16	completed	2020-07-27 00:00:00	2020-07-13 00:00:00	28
3122	590	34	completed	2020-08-07 00:00:00	2020-07-13 00:00:00	34
3123	441	14	completed	2020-08-02 00:00:00	2020-07-13 00:00:00	47
3124	534	44	completed	2020-07-27 00:00:00	2020-07-13 00:00:00	15
3125	361	70	shipped	2020-07-14 00:00:00	2020-07-13 00:00:00	32
3126	105	15	processing	2020-08-08 00:00:00	2020-07-13 00:00:00	38
3127	595	27	processing	2020-08-01 00:00:00	2020-07-14 00:00:00	11
3128	23	48	processing	2020-07-31 00:00:00	2020-07-14 00:00:00	70
3129	625	41	shipped	2020-07-21 00:00:00	2020-07-15 00:00:00	29
3130	450	48	completed	2020-07-21 00:00:00	2020-07-16 00:00:00	45
3131	454	51	shipped	2020-08-09 00:00:00	2020-07-16 00:00:00	7
3132	11	94	shipped	2020-08-13 00:00:00	2020-07-16 00:00:00	67
3133	639	64	shipped	2020-07-21 00:00:00	2020-07-16 00:00:00	66
3134	3	97	shipped	2020-07-25 00:00:00	2020-07-16 00:00:00	62
3135	649	96	shipped	2020-07-17 00:00:00	2020-07-16 00:00:00	94
3136	58	33	shipped	2020-07-20 00:00:00	2020-07-17 00:00:00	33
3137	362	84	processing	2020-08-07 00:00:00	2020-07-18 00:00:00	98
3138	221	17	shipped	2020-07-24 00:00:00	2020-07-18 00:00:00	92
3139	469	60	completed	2020-08-07 00:00:00	2020-07-19 00:00:00	10
3140	519	100	processing	2020-08-02 00:00:00	2020-07-19 00:00:00	36
3141	226	51	shipped	2020-08-07 00:00:00	2020-07-19 00:00:00	74
3142	66	73	completed	2020-08-06 00:00:00	2020-07-20 00:00:00	28
3143	378	7	shipped	2020-08-03 00:00:00	2020-07-20 00:00:00	17
3144	198	92	shipped	2020-08-01 00:00:00	2020-07-21 00:00:00	85
3145	454	42	completed	2020-08-08 00:00:00	2020-07-22 00:00:00	20
3146	202	100	completed	2020-07-31 00:00:00	2020-07-22 00:00:00	59
3147	51	7	completed	2020-08-12 00:00:00	2020-07-22 00:00:00	90
3148	618	5	processing	2020-08-18 00:00:00	2020-07-22 00:00:00	21
3149	19	38	completed	2020-08-10 00:00:00	2020-07-22 00:00:00	7
3150	522	16	completed	2020-08-21 00:00:00	2020-07-22 00:00:00	79
3151	278	59	processing	2020-08-15 00:00:00	2020-07-23 00:00:00	66
3152	656	80	completed	2020-07-29 00:00:00	2020-07-23 00:00:00	64
3153	612	96	completed	2020-08-19 00:00:00	2020-07-23 00:00:00	64
3154	686	35	processing	2020-08-18 00:00:00	2020-07-24 00:00:00	75
3155	512	86	shipped	2020-08-13 00:00:00	2020-07-24 00:00:00	58
3156	475	97	shipped	2020-08-02 00:00:00	2020-07-24 00:00:00	57
3157	327	26	processing	2020-08-16 00:00:00	2020-07-24 00:00:00	72
3158	425	5	shipped	2020-07-25 00:00:00	2020-07-24 00:00:00	86
3159	513	82	completed	2020-07-25 00:00:00	2020-07-24 00:00:00	20
3160	387	33	processing	2020-08-15 00:00:00	2020-07-25 00:00:00	96
3161	557	63	completed	2020-08-10 00:00:00	2020-07-26 00:00:00	93
3162	541	36	shipped	2020-08-02 00:00:00	2020-07-26 00:00:00	67
3163	527	37	processing	2020-08-14 00:00:00	2020-07-26 00:00:00	3
3164	425	1	completed	2020-08-14 00:00:00	2020-07-26 00:00:00	66
3165	297	60	processing	2020-08-03 00:00:00	2020-07-26 00:00:00	75
3166	181	88	completed	2020-08-07 00:00:00	2020-07-26 00:00:00	47
3167	479	27	shipped	2020-08-06 00:00:00	2020-07-26 00:00:00	7
3168	667	76	processing	2020-08-25 00:00:00	2020-07-26 00:00:00	69
3169	342	25	completed	2020-08-03 00:00:00	2020-07-26 00:00:00	85
3170	478	100	processing	2020-08-22 00:00:00	2020-07-26 00:00:00	78
3171	180	27	shipped	2020-08-08 00:00:00	2020-07-26 00:00:00	1
3172	591	11	processing	2020-07-31 00:00:00	2020-07-26 00:00:00	40
3173	35	57	processing	2020-08-23 00:00:00	2020-07-26 00:00:00	29
3174	498	66	completed	2020-08-22 00:00:00	2020-07-26 00:00:00	51
3175	357	66	processing	2020-08-02 00:00:00	2020-07-26 00:00:00	72
3176	424	11	completed	2020-07-27 00:00:00	2020-07-26 00:00:00	18
3177	455	98	completed	2020-08-12 00:00:00	2020-07-26 00:00:00	3
3178	549	41	processing	2020-08-22 00:00:00	2020-07-27 00:00:00	50
3179	86	90	completed	2020-08-19 00:00:00	2020-07-27 00:00:00	15
3180	638	66	processing	2020-08-21 00:00:00	2020-07-27 00:00:00	13
3181	436	69	completed	2020-08-23 00:00:00	2020-07-28 00:00:00	29
3182	47	98	processing	2020-08-01 00:00:00	2020-07-28 00:00:00	99
3183	528	24	completed	2020-08-18 00:00:00	2020-07-28 00:00:00	32
3184	515	94	processing	2020-08-26 00:00:00	2020-07-28 00:00:00	83
3185	82	10	completed	2020-08-22 00:00:00	2020-07-28 00:00:00	33
3186	95	34	shipped	2020-08-07 00:00:00	2020-07-28 00:00:00	24
3187	239	74	processing	2020-08-24 00:00:00	2020-07-28 00:00:00	79
3188	148	53	shipped	2020-08-16 00:00:00	2020-07-28 00:00:00	22
3189	156	64	shipped	2020-08-08 00:00:00	2020-07-28 00:00:00	25
3190	556	9	shipped	2020-08-06 00:00:00	2020-07-28 00:00:00	91
3191	335	19	completed	2020-08-19 00:00:00	2020-07-28 00:00:00	7
3192	176	87	completed	2020-08-12 00:00:00	2020-07-28 00:00:00	67
3193	346	19	completed	2020-08-22 00:00:00	2020-07-28 00:00:00	57
3194	286	57	shipped	2020-08-24 00:00:00	2020-07-28 00:00:00	28
3195	694	12	shipped	2020-08-01 00:00:00	2020-07-28 00:00:00	91
3196	410	71	processing	2020-08-15 00:00:00	2020-07-29 00:00:00	90
3197	424	92	shipped	2020-08-11 00:00:00	2020-07-29 00:00:00	65
3198	40	37	completed	2020-08-18 00:00:00	2020-07-29 00:00:00	34
3199	498	50	shipped	2020-08-02 00:00:00	2020-07-30 00:00:00	7
3200	181	19	processing	2020-08-22 00:00:00	2020-07-31 00:00:00	65
3201	657	4	completed	2020-08-19 00:00:00	2020-07-31 00:00:00	18
3202	630	75	completed	2020-08-20 00:00:00	2020-07-31 00:00:00	9
3203	177	29	shipped	2020-08-09 00:00:00	2020-07-31 00:00:00	55
3204	52	38	shipped	2020-08-04 00:00:00	2020-07-31 00:00:00	7
3205	507	82	processing	2020-08-29 00:00:00	2020-08-01 00:00:00	2
3206	130	66	processing	2020-08-30 00:00:00	2020-08-01 00:00:00	51
3207	684	56	shipped	2020-08-16 00:00:00	2020-08-02 00:00:00	49
3208	378	96	processing	2020-08-24 00:00:00	2020-08-03 00:00:00	29
3209	271	33	processing	2020-08-28 00:00:00	2020-08-03 00:00:00	54
3210	255	54	completed	2020-08-04 00:00:00	2020-08-03 00:00:00	42
3211	308	32	completed	2020-08-08 00:00:00	2020-08-03 00:00:00	36
3212	334	72	completed	2020-08-08 00:00:00	2020-08-03 00:00:00	42
3213	194	91	completed	2020-08-27 00:00:00	2020-08-03 00:00:00	69
3214	381	76	completed	2020-08-28 00:00:00	2020-08-04 00:00:00	9
3215	567	94	processing	2020-08-18 00:00:00	2020-08-04 00:00:00	92
3216	645	42	shipped	2020-08-30 00:00:00	2020-08-04 00:00:00	51
3217	332	30	processing	2020-08-22 00:00:00	2020-08-05 00:00:00	31
3218	451	73	completed	2020-08-22 00:00:00	2020-08-05 00:00:00	98
3219	357	73	shipped	2020-08-20 00:00:00	2020-08-05 00:00:00	51
3220	461	45	processing	2020-08-26 00:00:00	2020-08-05 00:00:00	77
3221	109	48	shipped	2020-08-26 00:00:00	2020-08-05 00:00:00	36
3222	290	62	shipped	2020-08-06 00:00:00	2020-08-05 00:00:00	14
3223	78	36	completed	2020-09-01 00:00:00	2020-08-06 00:00:00	80
3224	410	2	shipped	2020-08-28 00:00:00	2020-08-06 00:00:00	37
3225	546	100	shipped	2020-08-21 00:00:00	2020-08-06 00:00:00	8
3226	220	81	shipped	2020-09-03 00:00:00	2020-08-06 00:00:00	22
3227	442	18	processing	2020-08-20 00:00:00	2020-08-06 00:00:00	17
3228	85	95	completed	2020-08-09 00:00:00	2020-08-06 00:00:00	1
3229	641	54	shipped	2020-08-17 00:00:00	2020-08-06 00:00:00	72
3230	71	77	completed	2020-08-22 00:00:00	2020-08-06 00:00:00	19
3231	451	91	completed	2020-08-12 00:00:00	2020-08-07 00:00:00	10
3232	499	34	processing	2020-09-02 00:00:00	2020-08-07 00:00:00	25
3233	5	48	processing	2020-08-09 00:00:00	2020-08-07 00:00:00	49
3234	82	44	completed	2020-08-08 00:00:00	2020-08-07 00:00:00	58
3235	409	21	shipped	2020-08-16 00:00:00	2020-08-08 00:00:00	87
3236	597	36	processing	2020-08-23 00:00:00	2020-08-08 00:00:00	21
3237	162	75	shipped	2020-08-22 00:00:00	2020-08-08 00:00:00	92
3238	424	67	processing	2020-09-06 00:00:00	2020-08-08 00:00:00	34
3239	665	92	shipped	2020-08-13 00:00:00	2020-08-08 00:00:00	26
3240	509	67	completed	2020-08-18 00:00:00	2020-08-08 00:00:00	15
3241	531	80	completed	2020-09-03 00:00:00	2020-08-09 00:00:00	5
3242	279	37	completed	2020-08-30 00:00:00	2020-08-10 00:00:00	88
3243	470	86	shipped	2020-08-24 00:00:00	2020-08-10 00:00:00	7
3244	617	89	shipped	2020-09-01 00:00:00	2020-08-10 00:00:00	91
3245	213	3	shipped	2020-09-03 00:00:00	2020-08-10 00:00:00	14
3246	565	8	completed	2020-08-17 00:00:00	2020-08-10 00:00:00	52
3247	202	14	processing	2020-08-22 00:00:00	2020-08-11 00:00:00	90
3248	334	53	processing	2020-09-05 00:00:00	2020-08-11 00:00:00	39
3249	192	21	shipped	2020-09-09 00:00:00	2020-08-11 00:00:00	2
3250	480	56	shipped	2020-08-20 00:00:00	2020-08-12 00:00:00	25
3251	228	87	shipped	2020-09-08 00:00:00	2020-08-12 00:00:00	39
3252	93	38	processing	2020-08-25 00:00:00	2020-08-12 00:00:00	21
3253	219	25	processing	2020-08-15 00:00:00	2020-08-12 00:00:00	78
3254	277	37	processing	2020-08-27 00:00:00	2020-08-12 00:00:00	88
3255	25	30	completed	2020-08-20 00:00:00	2020-08-12 00:00:00	25
3256	113	37	shipped	2020-09-04 00:00:00	2020-08-13 00:00:00	45
3257	260	88	shipped	2020-08-24 00:00:00	2020-08-13 00:00:00	58
3258	582	63	processing	2020-08-15 00:00:00	2020-08-13 00:00:00	69
3259	295	14	processing	2020-08-30 00:00:00	2020-08-13 00:00:00	93
3260	112	30	shipped	2020-08-23 00:00:00	2020-08-13 00:00:00	5
3261	276	81	completed	2020-09-04 00:00:00	2020-08-13 00:00:00	19
3262	560	84	shipped	2020-08-18 00:00:00	2020-08-13 00:00:00	91
3263	684	3	completed	2020-09-03 00:00:00	2020-08-13 00:00:00	68
3264	437	13	shipped	2020-08-14 00:00:00	2020-08-13 00:00:00	99
3265	105	45	completed	2020-08-20 00:00:00	2020-08-13 00:00:00	37
3266	394	94	completed	2020-09-01 00:00:00	2020-08-13 00:00:00	16
3267	183	67	processing	2020-08-16 00:00:00	2020-08-13 00:00:00	6
3268	172	90	processing	2020-09-06 00:00:00	2020-08-13 00:00:00	35
3269	229	100	completed	2020-08-20 00:00:00	2020-08-13 00:00:00	34
3270	353	30	completed	2020-08-17 00:00:00	2020-08-13 00:00:00	25
3271	379	80	processing	2020-08-18 00:00:00	2020-08-14 00:00:00	56
3272	664	41	shipped	2020-09-13 00:00:00	2020-08-14 00:00:00	75
3273	627	34	shipped	2020-08-23 00:00:00	2020-08-14 00:00:00	7
3274	394	94	shipped	2020-08-20 00:00:00	2020-08-15 00:00:00	21
3275	478	13	processing	2020-09-02 00:00:00	2020-08-15 00:00:00	22
3276	336	10	shipped	2020-09-09 00:00:00	2020-08-15 00:00:00	61
3277	21	42	completed	2020-09-12 00:00:00	2020-08-16 00:00:00	42
3278	384	22	processing	2020-09-03 00:00:00	2020-08-16 00:00:00	44
3279	571	81	shipped	2020-08-17 00:00:00	2020-08-16 00:00:00	7
3280	300	66	processing	2020-08-19 00:00:00	2020-08-16 00:00:00	5
3281	375	80	completed	2020-08-26 00:00:00	2020-08-17 00:00:00	12
3282	639	29	shipped	2020-09-05 00:00:00	2020-08-17 00:00:00	79
3283	434	28	processing	2020-08-28 00:00:00	2020-08-17 00:00:00	6
3284	580	75	shipped	2020-09-09 00:00:00	2020-08-17 00:00:00	64
3285	623	92	completed	2020-08-19 00:00:00	2020-08-18 00:00:00	94
3286	100	18	shipped	2020-09-02 00:00:00	2020-08-18 00:00:00	59
3287	601	52	shipped	2020-08-26 00:00:00	2020-08-18 00:00:00	17
3288	163	92	completed	2020-08-29 00:00:00	2020-08-18 00:00:00	24
3289	670	33	shipped	2020-09-14 00:00:00	2020-08-18 00:00:00	74
3290	501	63	shipped	2020-08-29 00:00:00	2020-08-18 00:00:00	52
3291	335	55	completed	2020-09-16 00:00:00	2020-08-19 00:00:00	47
3292	132	86	processing	2020-09-15 00:00:00	2020-08-19 00:00:00	89
3293	661	39	completed	2020-09-16 00:00:00	2020-08-19 00:00:00	49
3294	237	55	shipped	2020-09-03 00:00:00	2020-08-19 00:00:00	21
3295	74	49	shipped	2020-08-24 00:00:00	2020-08-19 00:00:00	25
3296	453	74	completed	2020-08-23 00:00:00	2020-08-19 00:00:00	22
3297	24	86	shipped	2020-09-06 00:00:00	2020-08-19 00:00:00	96
3298	333	47	shipped	2020-08-30 00:00:00	2020-08-19 00:00:00	88
3299	421	68	shipped	2020-09-12 00:00:00	2020-08-19 00:00:00	26
3300	209	83	processing	2020-09-13 00:00:00	2020-08-19 00:00:00	14
3301	479	95	shipped	2020-08-29 00:00:00	2020-08-20 00:00:00	2
3302	497	94	completed	2020-09-07 00:00:00	2020-08-20 00:00:00	54
3303	375	67	processing	2020-09-15 00:00:00	2020-08-20 00:00:00	11
3304	93	78	shipped	2020-08-22 00:00:00	2020-08-20 00:00:00	52
3305	113	30	shipped	2020-09-18 00:00:00	2020-08-21 00:00:00	88
3306	309	16	completed	2020-08-27 00:00:00	2020-08-21 00:00:00	18
3307	127	61	completed	2020-08-31 00:00:00	2020-08-21 00:00:00	98
3308	409	87	completed	2020-09-19 00:00:00	2020-08-21 00:00:00	82
3309	97	41	completed	2020-09-17 00:00:00	2020-08-21 00:00:00	78
3310	133	69	completed	2020-08-31 00:00:00	2020-08-21 00:00:00	27
3311	438	81	shipped	2020-09-01 00:00:00	2020-08-21 00:00:00	61
3312	180	7	processing	2020-09-19 00:00:00	2020-08-21 00:00:00	94
3313	75	59	shipped	2020-09-16 00:00:00	2020-08-22 00:00:00	41
3314	166	83	shipped	2020-09-06 00:00:00	2020-08-22 00:00:00	48
3315	618	30	shipped	2020-09-15 00:00:00	2020-08-22 00:00:00	36
3316	365	31	processing	2020-08-26 00:00:00	2020-08-22 00:00:00	19
3317	114	71	completed	2020-08-30 00:00:00	2020-08-22 00:00:00	56
3318	311	45	processing	2020-08-23 00:00:00	2020-08-22 00:00:00	91
3319	271	99	completed	2020-09-13 00:00:00	2020-08-22 00:00:00	17
3320	119	81	shipped	2020-09-06 00:00:00	2020-08-22 00:00:00	50
3321	581	69	processing	2020-09-01 00:00:00	2020-08-22 00:00:00	7
3322	166	77	completed	2020-09-10 00:00:00	2020-08-23 00:00:00	20
3323	554	35	completed	2020-09-09 00:00:00	2020-08-23 00:00:00	22
3324	105	36	completed	2020-09-04 00:00:00	2020-08-23 00:00:00	44
3325	683	47	shipped	2020-09-17 00:00:00	2020-08-23 00:00:00	47
3326	572	39	shipped	2020-09-14 00:00:00	2020-08-23 00:00:00	21
3327	183	71	shipped	2020-09-22 00:00:00	2020-08-23 00:00:00	58
3328	222	32	processing	2020-09-01 00:00:00	2020-08-23 00:00:00	100
3329	373	2	completed	2020-08-28 00:00:00	2020-08-23 00:00:00	35
3330	643	61	completed	2020-09-19 00:00:00	2020-08-23 00:00:00	53
3331	48	67	completed	2020-08-26 00:00:00	2020-08-23 00:00:00	84
3332	593	23	completed	2020-09-22 00:00:00	2020-08-23 00:00:00	57
3333	540	76	completed	2020-08-26 00:00:00	2020-08-23 00:00:00	69
3334	376	57	shipped	2020-08-26 00:00:00	2020-08-23 00:00:00	35
3335	668	97	shipped	2020-09-21 00:00:00	2020-08-23 00:00:00	70
3336	256	41	processing	2020-09-02 00:00:00	2020-08-23 00:00:00	56
3337	353	92	completed	2020-09-19 00:00:00	2020-08-24 00:00:00	50
3338	404	55	completed	2020-08-28 00:00:00	2020-08-24 00:00:00	29
3339	529	49	processing	2020-08-28 00:00:00	2020-08-24 00:00:00	70
3340	215	13	shipped	2020-09-10 00:00:00	2020-08-25 00:00:00	36
3341	176	61	shipped	2020-09-06 00:00:00	2020-08-25 00:00:00	54
3342	537	96	completed	2020-09-22 00:00:00	2020-08-25 00:00:00	43
3343	451	51	processing	2020-09-20 00:00:00	2020-08-25 00:00:00	21
3344	531	55	processing	2020-09-11 00:00:00	2020-08-25 00:00:00	9
3345	517	83	processing	2020-09-23 00:00:00	2020-08-26 00:00:00	68
3346	167	90	processing	2020-09-09 00:00:00	2020-08-26 00:00:00	20
3347	325	41	shipped	2020-08-28 00:00:00	2020-08-26 00:00:00	26
3348	148	47	completed	2020-09-07 00:00:00	2020-08-26 00:00:00	34
3349	123	61	processing	2020-09-05 00:00:00	2020-08-26 00:00:00	58
3350	345	31	processing	2020-08-31 00:00:00	2020-08-26 00:00:00	86
3351	32	59	processing	2020-09-13 00:00:00	2020-08-26 00:00:00	46
3352	466	57	processing	2020-09-17 00:00:00	2020-08-26 00:00:00	35
3353	287	32	completed	2020-09-08 00:00:00	2020-08-26 00:00:00	44
3354	97	83	completed	2020-08-28 00:00:00	2020-08-26 00:00:00	68
3355	5	80	shipped	2020-09-06 00:00:00	2020-08-26 00:00:00	57
3356	326	43	processing	2020-09-22 00:00:00	2020-08-26 00:00:00	5
3357	106	92	completed	2020-09-18 00:00:00	2020-08-26 00:00:00	36
3358	133	98	shipped	2020-09-16 00:00:00	2020-08-26 00:00:00	19
3359	337	89	processing	2020-08-31 00:00:00	2020-08-26 00:00:00	78
3360	478	35	processing	2020-09-10 00:00:00	2020-08-26 00:00:00	49
3361	45	35	completed	2020-09-02 00:00:00	2020-08-27 00:00:00	3
3362	493	88	processing	2020-09-14 00:00:00	2020-08-27 00:00:00	37
3363	555	99	processing	2020-09-08 00:00:00	2020-08-27 00:00:00	62
3364	426	64	shipped	2020-09-18 00:00:00	2020-08-27 00:00:00	18
3365	391	74	processing	2020-09-09 00:00:00	2020-08-27 00:00:00	24
3366	69	59	completed	2020-09-05 00:00:00	2020-08-27 00:00:00	1
3367	178	90	processing	2020-09-05 00:00:00	2020-08-28 00:00:00	76
3368	649	12	processing	2020-09-07 00:00:00	2020-08-28 00:00:00	65
3369	685	93	processing	2020-09-21 00:00:00	2020-08-28 00:00:00	49
3370	691	94	completed	2020-09-04 00:00:00	2020-08-28 00:00:00	82
3371	301	79	completed	2020-09-24 00:00:00	2020-08-28 00:00:00	43
3372	683	3	shipped	2020-08-29 00:00:00	2020-08-28 00:00:00	81
3373	175	63	completed	2020-09-01 00:00:00	2020-08-28 00:00:00	70
3374	241	72	shipped	2020-09-20 00:00:00	2020-08-28 00:00:00	85
3375	560	42	processing	2020-09-14 00:00:00	2020-08-28 00:00:00	64
3376	147	20	completed	2020-09-19 00:00:00	2020-08-28 00:00:00	34
3377	430	98	shipped	2020-09-02 00:00:00	2020-08-28 00:00:00	35
3378	237	14	processing	2020-09-18 00:00:00	2020-08-28 00:00:00	21
3379	321	79	shipped	2020-09-18 00:00:00	2020-08-28 00:00:00	88
3380	525	82	shipped	2020-09-22 00:00:00	2020-08-28 00:00:00	12
3381	56	73	completed	2020-09-02 00:00:00	2020-08-29 00:00:00	79
3382	562	97	shipped	2020-09-10 00:00:00	2020-08-29 00:00:00	73
3383	295	80	completed	2020-09-15 00:00:00	2020-08-29 00:00:00	61
3384	294	70	completed	2020-09-13 00:00:00	2020-08-29 00:00:00	83
3385	51	74	processing	2020-09-25 00:00:00	2020-08-30 00:00:00	80
3386	304	67	shipped	2020-09-23 00:00:00	2020-08-30 00:00:00	42
3387	432	19	shipped	2020-09-21 00:00:00	2020-08-30 00:00:00	69
3388	293	63	processing	2020-09-25 00:00:00	2020-08-30 00:00:00	74
3389	597	69	shipped	2020-09-09 00:00:00	2020-08-30 00:00:00	20
3390	371	92	processing	2020-09-10 00:00:00	2020-08-30 00:00:00	63
3391	363	67	processing	2020-09-16 00:00:00	2020-08-30 00:00:00	99
3392	25	65	processing	2020-09-23 00:00:00	2020-08-30 00:00:00	38
3393	644	13	completed	2020-09-10 00:00:00	2020-08-30 00:00:00	8
3394	302	40	processing	2020-09-25 00:00:00	2020-08-30 00:00:00	8
3395	360	75	shipped	2020-09-29 00:00:00	2020-08-30 00:00:00	54
3396	514	14	shipped	2020-09-01 00:00:00	2020-08-30 00:00:00	65
3397	439	50	completed	2020-09-01 00:00:00	2020-08-30 00:00:00	5
3398	141	1	processing	2020-09-24 00:00:00	2020-08-30 00:00:00	19
3399	123	51	completed	2020-09-29 00:00:00	2020-08-30 00:00:00	2
3400	672	86	shipped	2020-09-04 00:00:00	2020-08-30 00:00:00	10
3401	357	44	processing	2020-09-08 00:00:00	2020-08-31 00:00:00	17
3402	562	59	shipped	2020-09-29 00:00:00	2020-08-31 00:00:00	45
3403	344	95	shipped	2020-09-16 00:00:00	2020-08-31 00:00:00	58
3404	647	54	processing	2020-09-19 00:00:00	2020-08-31 00:00:00	14
3405	86	37	processing	2020-09-01 00:00:00	2020-08-31 00:00:00	68
3406	254	18	completed	2020-09-19 00:00:00	2020-08-31 00:00:00	80
3407	268	54	shipped	2020-09-16 00:00:00	2020-08-31 00:00:00	15
3408	666	42	processing	2020-09-13 00:00:00	2020-08-31 00:00:00	57
3409	158	37	shipped	2020-09-02 00:00:00	2020-09-01 00:00:00	57
3410	70	43	shipped	2020-09-04 00:00:00	2020-09-01 00:00:00	62
3411	123	98	processing	2020-09-28 00:00:00	2020-09-01 00:00:00	29
3412	44	2	completed	2020-09-12 00:00:00	2020-09-01 00:00:00	87
3413	368	49	shipped	2020-09-14 00:00:00	2020-09-01 00:00:00	48
3414	176	15	shipped	2020-09-19 00:00:00	2020-09-01 00:00:00	12
3415	385	1	processing	2020-09-05 00:00:00	2020-09-02 00:00:00	99
3416	207	76	processing	2020-09-21 00:00:00	2020-09-03 00:00:00	37
3417	649	53	processing	2020-09-16 00:00:00	2020-09-03 00:00:00	94
3418	226	28	shipped	2020-09-11 00:00:00	2020-09-03 00:00:00	36
3419	89	58	completed	2020-09-07 00:00:00	2020-09-03 00:00:00	61
3420	593	76	completed	2020-09-17 00:00:00	2020-09-03 00:00:00	82
3421	384	20	processing	2020-10-03 00:00:00	2020-09-04 00:00:00	17
3422	20	94	shipped	2020-10-02 00:00:00	2020-09-04 00:00:00	63
3423	648	11	shipped	2020-09-16 00:00:00	2020-09-04 00:00:00	87
3424	671	56	completed	2020-10-03 00:00:00	2020-09-05 00:00:00	100
3425	160	56	shipped	2020-09-27 00:00:00	2020-09-05 00:00:00	63
3426	423	43	completed	2020-09-22 00:00:00	2020-09-05 00:00:00	91
3427	564	26	completed	2020-10-04 00:00:00	2020-09-05 00:00:00	54
3428	12	78	processing	2020-09-22 00:00:00	2020-09-05 00:00:00	25
3429	199	70	processing	2020-10-05 00:00:00	2020-09-06 00:00:00	26
3430	367	51	shipped	2020-09-28 00:00:00	2020-09-07 00:00:00	96
3431	289	100	completed	2020-10-05 00:00:00	2020-09-08 00:00:00	9
3432	218	94	shipped	2020-09-17 00:00:00	2020-09-08 00:00:00	10
3433	65	35	completed	2020-09-21 00:00:00	2020-09-08 00:00:00	53
3435	643	60	processing	2020-09-13 00:00:00	2020-09-08 00:00:00	42
3436	399	7	shipped	2020-10-04 00:00:00	2020-09-09 00:00:00	95
3437	502	14	processing	2020-09-15 00:00:00	2020-09-10 00:00:00	68
3438	99	1	completed	2020-09-14 00:00:00	2020-09-10 00:00:00	41
3441	84	82	processing	2020-10-10 00:00:00	2020-09-12 00:00:00	36
3444	354	1	processing	2020-10-08 00:00:00	2020-09-12 00:00:00	18
3445	97	28	shipped	2020-09-14 00:00:00	2020-09-12 00:00:00	79
3449	271	38	shipped	2020-10-06 00:00:00	2020-09-12 00:00:00	89
3452	578	86	completed	2020-09-14 00:00:00	2020-09-13 00:00:00	15
3453	29	76	processing	2020-10-13 00:00:00	2020-09-13 00:00:00	84
3454	37	66	shipped	2020-10-02 00:00:00	2020-09-13 00:00:00	15
3456	541	11	processing	2020-09-18 00:00:00	2020-09-13 00:00:00	71
3458	542	32	completed	2020-09-30 00:00:00	2020-09-13 00:00:00	73
3459	80	80	processing	2020-10-10 00:00:00	2020-09-13 00:00:00	76
3460	423	11	shipped	2020-10-05 00:00:00	2020-09-13 00:00:00	76
3463	462	46	completed	2020-09-18 00:00:00	2020-09-14 00:00:00	88
3464	69	69	processing	2020-09-23 00:00:00	2020-09-14 00:00:00	100
3467	138	4	shipped	2020-10-14 00:00:00	2020-09-14 00:00:00	100
3468	221	23	processing	2020-10-14 00:00:00	2020-09-14 00:00:00	40
3469	453	48	completed	2020-10-11 00:00:00	2020-09-14 00:00:00	18
3471	664	71	processing	2020-09-27 00:00:00	2020-09-15 00:00:00	91
3472	437	64	completed	2020-10-09 00:00:00	2020-09-15 00:00:00	34
3476	593	60	shipped	2020-10-02 00:00:00	2020-09-16 00:00:00	22
3477	131	12	completed	2020-09-26 00:00:00	2020-09-16 00:00:00	39
3478	443	47	processing	2020-09-28 00:00:00	2020-09-16 00:00:00	52
3479	620	21	shipped	2020-10-14 00:00:00	2020-09-16 00:00:00	17
3480	452	86	completed	2020-10-07 00:00:00	2020-09-16 00:00:00	67
3481	85	6	completed	2020-09-30 00:00:00	2020-09-17 00:00:00	35
3482	456	66	processing	2020-10-13 00:00:00	2020-09-17 00:00:00	66
3483	98	10	completed	2020-09-27 00:00:00	2020-09-17 00:00:00	22
3484	258	95	shipped	2020-10-10 00:00:00	2020-09-17 00:00:00	50
3485	624	23	processing	2020-10-07 00:00:00	2020-09-17 00:00:00	64
3486	93	76	completed	2020-10-14 00:00:00	2020-09-17 00:00:00	47
3487	184	26	processing	2020-09-27 00:00:00	2020-09-18 00:00:00	75
3488	212	37	processing	2020-10-14 00:00:00	2020-09-18 00:00:00	89
3489	9	92	shipped	2020-10-10 00:00:00	2020-09-19 00:00:00	13
3490	176	86	processing	2020-10-07 00:00:00	2020-09-19 00:00:00	100
3491	136	31	processing	2020-09-25 00:00:00	2020-09-19 00:00:00	91
3492	189	46	shipped	2020-10-19 00:00:00	2020-09-19 00:00:00	35
3493	694	12	completed	2020-10-13 00:00:00	2020-09-19 00:00:00	34
3494	424	48	processing	2020-10-19 00:00:00	2020-09-19 00:00:00	68
3495	410	7	completed	2020-09-30 00:00:00	2020-09-19 00:00:00	91
3496	76	32	processing	2020-10-03 00:00:00	2020-09-19 00:00:00	78
3497	345	99	shipped	2020-10-10 00:00:00	2020-09-20 00:00:00	16
3498	100	36	processing	2020-10-11 00:00:00	2020-09-20 00:00:00	37
3499	591	29	shipped	2020-10-14 00:00:00	2020-09-21 00:00:00	92
3500	211	95	completed	2020-09-23 00:00:00	2020-09-21 00:00:00	12
3501	108	25	shipped	2020-10-04 00:00:00	2020-09-21 00:00:00	25
3502	229	33	processing	2020-10-01 00:00:00	2020-09-21 00:00:00	87
3503	622	86	completed	2020-09-28 00:00:00	2020-09-21 00:00:00	16
3504	17	71	processing	2020-10-15 00:00:00	2020-09-21 00:00:00	19
3505	669	10	shipped	2020-10-15 00:00:00	2020-09-22 00:00:00	14
3506	654	84	completed	2020-10-19 00:00:00	2020-09-22 00:00:00	40
3510	663	36	completed	2020-10-02 00:00:00	2020-09-24 00:00:00	73
3511	462	59	completed	2020-09-28 00:00:00	2020-09-24 00:00:00	89
3512	559	20	shipped	2020-10-19 00:00:00	2020-09-24 00:00:00	47
3514	514	51	processing	2020-10-23 00:00:00	2020-09-25 00:00:00	71
3515	255	7	completed	2020-09-28 00:00:00	2020-09-26 00:00:00	51
3516	146	82	completed	2020-10-11 00:00:00	2020-09-26 00:00:00	57
3521	568	84	shipped	2020-10-27 00:00:00	2020-09-27 00:00:00	48
3526	566	13	processing	2020-10-05 00:00:00	2020-09-28 00:00:00	87
3527	163	19	processing	2020-10-21 00:00:00	2020-09-28 00:00:00	22
3528	150	66	processing	2020-10-09 00:00:00	2020-09-28 00:00:00	39
3530	173	23	processing	2020-10-05 00:00:00	2020-09-28 00:00:00	38
3532	473	14	completed	2020-10-12 00:00:00	2020-09-28 00:00:00	86
3534	36	44	shipped	2020-10-19 00:00:00	2020-09-28 00:00:00	47
3535	118	45	processing	2020-10-11 00:00:00	2020-09-28 00:00:00	90
3538	204	49	shipped	2020-10-01 00:00:00	2020-09-29 00:00:00	8
3540	575	34	shipped	2020-10-27 00:00:00	2020-09-29 00:00:00	84
3541	119	24	shipped	2020-10-06 00:00:00	2020-09-29 00:00:00	99
3542	246	60	shipped	2020-10-07 00:00:00	2020-09-29 00:00:00	24
3543	636	18	shipped	2020-10-05 00:00:00	2020-09-29 00:00:00	33
3544	616	39	shipped	2020-10-23 00:00:00	2020-09-29 00:00:00	62
3549	349	100	processing	2020-10-16 00:00:00	2020-09-29 00:00:00	55
3551	339	74	completed	2020-10-17 00:00:00	2020-09-29 00:00:00	4
3555	268	66	processing	2020-10-18 00:00:00	2020-09-29 00:00:00	10
3556	548	57	shipped	2020-10-08 00:00:00	2020-09-29 00:00:00	57
3557	344	61	processing	2020-10-12 00:00:00	2020-09-29 00:00:00	79
3558	198	43	shipped	2020-10-05 00:00:00	2020-09-29 00:00:00	38
3562	432	58	shipped	2020-10-08 00:00:00	2020-09-29 00:00:00	84
3563	316	14	shipped	2020-10-16 00:00:00	2020-09-29 00:00:00	92
3564	312	95	processing	2020-10-05 00:00:00	2020-09-29 00:00:00	33
3565	534	90	completed	2020-10-15 00:00:00	2020-09-29 00:00:00	92
3568	425	58	processing	2020-10-26 00:00:00	2020-09-29 00:00:00	69
3570	315	54	processing	2020-10-17 00:00:00	2020-09-29 00:00:00	87
3571	146	54	completed	2020-10-26 00:00:00	2020-09-30 00:00:00	83
3572	41	94	shipped	2020-10-04 00:00:00	2020-09-30 00:00:00	74
3573	94	26	shipped	2020-10-20 00:00:00	2020-10-01 00:00:00	42
3574	426	21	shipped	2020-10-27 00:00:00	2020-10-01 00:00:00	19
3575	363	73	processing	2020-10-30 00:00:00	2020-10-01 00:00:00	98
3576	378	60	completed	2020-10-06 00:00:00	2020-10-01 00:00:00	14
3577	351	42	shipped	2020-10-20 00:00:00	2020-10-01 00:00:00	43
3578	35	55	processing	2020-10-19 00:00:00	2020-10-01 00:00:00	40
3579	186	26	processing	2020-10-24 00:00:00	2020-10-01 00:00:00	39
3580	86	69	processing	2020-10-17 00:00:00	2020-10-01 00:00:00	13
3581	334	9	processing	2020-10-07 00:00:00	2020-10-01 00:00:00	80
3582	65	63	shipped	2020-10-20 00:00:00	2020-10-01 00:00:00	24
3583	179	12	processing	2020-10-26 00:00:00	2020-10-01 00:00:00	11
3584	388	79	shipped	2020-10-03 00:00:00	2020-10-01 00:00:00	35
3585	428	42	processing	2020-10-07 00:00:00	2020-10-01 00:00:00	74
3586	340	100	shipped	2020-10-19 00:00:00	2020-10-01 00:00:00	9
3587	505	8	shipped	2020-10-08 00:00:00	2020-10-01 00:00:00	63
3589	203	43	completed	2020-10-19 00:00:00	2020-10-01 00:00:00	20
3591	208	10	completed	2020-10-26 00:00:00	2020-10-02 00:00:00	10
3592	647	65	shipped	2020-10-28 00:00:00	2020-10-02 00:00:00	79
3593	546	44	processing	2020-10-16 00:00:00	2020-10-02 00:00:00	47
3434	387	80	shipped	2020-09-11 00:00:00	2020-09-08 00:00:00	8
3439	560	45	processing	2020-09-29 00:00:00	2020-09-11 00:00:00	45
3440	438	67	shipped	2020-09-12 00:00:00	2020-09-11 00:00:00	81
3442	185	16	processing	2020-09-17 00:00:00	2020-09-12 00:00:00	20
3443	652	26	shipped	2020-10-02 00:00:00	2020-09-12 00:00:00	98
3446	383	11	processing	2020-10-09 00:00:00	2020-09-12 00:00:00	6
3447	257	84	shipped	2020-09-26 00:00:00	2020-09-12 00:00:00	18
3448	490	19	completed	2020-09-21 00:00:00	2020-09-12 00:00:00	12
3450	302	92	completed	2020-09-29 00:00:00	2020-09-12 00:00:00	10
3451	502	35	processing	2020-10-05 00:00:00	2020-09-13 00:00:00	83
3455	684	80	processing	2020-09-16 00:00:00	2020-09-13 00:00:00	80
3457	569	85	processing	2020-10-13 00:00:00	2020-09-13 00:00:00	53
3461	464	77	processing	2020-09-18 00:00:00	2020-09-14 00:00:00	86
3462	505	66	completed	2020-10-10 00:00:00	2020-09-14 00:00:00	88
3465	152	41	processing	2020-09-29 00:00:00	2020-09-14 00:00:00	1
3466	580	22	shipped	2020-10-04 00:00:00	2020-09-14 00:00:00	10
3470	326	34	processing	2020-09-15 00:00:00	2020-09-14 00:00:00	76
3473	519	35	shipped	2020-09-29 00:00:00	2020-09-16 00:00:00	64
3474	556	14	completed	2020-09-27 00:00:00	2020-09-16 00:00:00	1
3475	28	24	processing	2020-10-05 00:00:00	2020-09-16 00:00:00	42
3507	332	26	processing	2020-10-14 00:00:00	2020-09-22 00:00:00	97
3508	10	26	processing	2020-09-25 00:00:00	2020-09-23 00:00:00	33
3509	272	33	processing	2020-10-18 00:00:00	2020-09-24 00:00:00	46
3513	404	2	processing	2020-10-23 00:00:00	2020-09-25 00:00:00	40
3517	91	59	completed	2020-10-26 00:00:00	2020-09-26 00:00:00	78
3518	250	89	completed	2020-10-03 00:00:00	2020-09-26 00:00:00	62
3519	124	94	processing	2020-10-05 00:00:00	2020-09-26 00:00:00	63
3520	434	96	shipped	2020-10-22 00:00:00	2020-09-27 00:00:00	51
3522	491	5	completed	2020-10-21 00:00:00	2020-09-27 00:00:00	72
3523	456	19	processing	2020-10-08 00:00:00	2020-09-27 00:00:00	27
3524	482	59	completed	2020-10-03 00:00:00	2020-09-27 00:00:00	58
3525	618	52	processing	2020-10-27 00:00:00	2020-09-28 00:00:00	47
3529	165	2	completed	2020-10-07 00:00:00	2020-09-28 00:00:00	60
3531	72	9	shipped	2020-10-26 00:00:00	2020-09-28 00:00:00	29
3533	155	100	completed	2020-10-16 00:00:00	2020-09-28 00:00:00	64
3536	689	55	shipped	2020-10-20 00:00:00	2020-09-28 00:00:00	91
3537	572	41	completed	2020-10-06 00:00:00	2020-09-28 00:00:00	10
3539	64	19	completed	2020-10-06 00:00:00	2020-09-29 00:00:00	68
3545	116	2	processing	2020-10-16 00:00:00	2020-09-29 00:00:00	85
3546	398	65	completed	2020-10-14 00:00:00	2020-09-29 00:00:00	67
3547	629	27	completed	2020-10-26 00:00:00	2020-09-29 00:00:00	44
3548	393	41	processing	2020-10-18 00:00:00	2020-09-29 00:00:00	72
3550	549	10	processing	2020-09-30 00:00:00	2020-09-29 00:00:00	16
3552	523	84	shipped	2020-10-29 00:00:00	2020-09-29 00:00:00	13
3553	526	85	processing	2020-10-24 00:00:00	2020-09-29 00:00:00	50
3554	19	5	completed	2020-10-02 00:00:00	2020-09-29 00:00:00	44
3559	86	62	shipped	2020-10-20 00:00:00	2020-09-29 00:00:00	60
3560	656	27	shipped	2020-10-05 00:00:00	2020-09-29 00:00:00	29
3561	101	55	shipped	2020-10-25 00:00:00	2020-09-29 00:00:00	89
3566	492	46	shipped	2020-10-21 00:00:00	2020-09-29 00:00:00	45
3567	377	55	processing	2020-10-04 00:00:00	2020-09-29 00:00:00	64
3569	583	11	shipped	2020-10-02 00:00:00	2020-09-29 00:00:00	86
3588	392	23	completed	2020-10-24 00:00:00	2020-10-01 00:00:00	86
3590	691	23	shipped	2020-10-03 00:00:00	2020-10-01 00:00:00	58
3594	164	35	completed	2020-10-04 00:00:00	2020-10-02 00:00:00	19
3595	604	36	processing	2020-10-24 00:00:00	2020-10-02 00:00:00	3
3596	541	16	shipped	2020-10-18 00:00:00	2020-10-02 00:00:00	17
3600	397	78	processing	2020-11-01 00:00:00	2020-10-02 00:00:00	36
3601	343	12	processing	2020-10-06 00:00:00	2020-10-02 00:00:00	22
3602	307	26	completed	2020-10-29 00:00:00	2020-10-02 00:00:00	83
3603	191	54	processing	2020-10-26 00:00:00	2020-10-02 00:00:00	63
3604	72	46	completed	2020-10-31 00:00:00	2020-10-03 00:00:00	63
3606	510	2	completed	2020-11-03 00:00:00	2020-10-04 00:00:00	24
3609	458	22	shipped	2020-10-16 00:00:00	2020-10-04 00:00:00	49
3610	298	66	shipped	2020-11-01 00:00:00	2020-10-04 00:00:00	52
3611	687	38	shipped	2020-10-30 00:00:00	2020-10-04 00:00:00	42
3613	63	99	shipped	2020-10-23 00:00:00	2020-10-04 00:00:00	47
3616	606	86	processing	2020-10-07 00:00:00	2020-10-04 00:00:00	17
3618	241	26	completed	2020-10-09 00:00:00	2020-10-04 00:00:00	95
3622	448	82	shipped	2020-10-31 00:00:00	2020-10-06 00:00:00	80
3626	488	73	processing	2020-11-02 00:00:00	2020-10-07 00:00:00	74
3628	646	75	shipped	2020-10-15 00:00:00	2020-10-07 00:00:00	49
3629	26	3	processing	2020-10-27 00:00:00	2020-10-07 00:00:00	72
3630	664	3	shipped	2020-10-26 00:00:00	2020-10-07 00:00:00	21
3631	265	75	completed	2020-10-09 00:00:00	2020-10-07 00:00:00	66
3632	233	52	completed	2020-11-01 00:00:00	2020-10-07 00:00:00	20
3633	230	57	shipped	2020-10-21 00:00:00	2020-10-07 00:00:00	48
3635	396	97	completed	2020-10-16 00:00:00	2020-10-08 00:00:00	13
3636	353	41	completed	2020-11-04 00:00:00	2020-10-08 00:00:00	100
3639	272	36	completed	2020-10-29 00:00:00	2020-10-08 00:00:00	63
3641	193	44	shipped	2020-10-29 00:00:00	2020-10-08 00:00:00	19
3643	258	22	shipped	2020-11-02 00:00:00	2020-10-08 00:00:00	100
3646	395	91	processing	2020-10-18 00:00:00	2020-10-08 00:00:00	4
3648	381	68	completed	2020-10-12 00:00:00	2020-10-09 00:00:00	68
3649	231	60	completed	2020-10-14 00:00:00	2020-10-10 00:00:00	29
3652	529	12	completed	2020-10-27 00:00:00	2020-10-11 00:00:00	54
3653	351	62	shipped	2020-10-13 00:00:00	2020-10-11 00:00:00	22
3655	572	7	completed	2020-11-03 00:00:00	2020-10-12 00:00:00	10
3656	341	18	completed	2020-11-10 00:00:00	2020-10-12 00:00:00	22
3657	634	84	shipped	2020-10-19 00:00:00	2020-10-12 00:00:00	75
3659	201	5	processing	2020-10-31 00:00:00	2020-10-12 00:00:00	83
3666	647	100	completed	2020-11-05 00:00:00	2020-10-13 00:00:00	41
3667	264	94	processing	2020-10-26 00:00:00	2020-10-13 00:00:00	34
3672	174	99	completed	2020-11-03 00:00:00	2020-10-14 00:00:00	19
3679	346	45	shipped	2020-10-27 00:00:00	2020-10-16 00:00:00	68
3683	480	47	processing	2020-10-29 00:00:00	2020-10-17 00:00:00	28
3686	375	56	processing	2020-10-30 00:00:00	2020-10-19 00:00:00	22
3687	421	74	shipped	2020-10-31 00:00:00	2020-10-19 00:00:00	97
3689	460	60	processing	2020-10-23 00:00:00	2020-10-20 00:00:00	49
3690	78	11	completed	2020-11-19 00:00:00	2020-10-20 00:00:00	71
3691	315	18	shipped	2020-10-25 00:00:00	2020-10-20 00:00:00	89
3597	176	25	shipped	2020-10-05 00:00:00	2020-10-02 00:00:00	82
3598	247	76	completed	2020-10-06 00:00:00	2020-10-02 00:00:00	75
3599	140	74	processing	2020-10-06 00:00:00	2020-10-02 00:00:00	84
3605	650	37	completed	2020-10-27 00:00:00	2020-10-03 00:00:00	5
3607	584	18	completed	2020-10-05 00:00:00	2020-10-04 00:00:00	18
3608	155	41	completed	2020-10-25 00:00:00	2020-10-04 00:00:00	99
3612	551	12	completed	2020-10-17 00:00:00	2020-10-04 00:00:00	61
3614	310	15	processing	2020-11-02 00:00:00	2020-10-04 00:00:00	9
3615	677	20	completed	2020-10-30 00:00:00	2020-10-04 00:00:00	100
3617	232	14	completed	2020-10-30 00:00:00	2020-10-04 00:00:00	36
3619	664	6	processing	2020-10-31 00:00:00	2020-10-04 00:00:00	35
3620	291	40	completed	2020-10-28 00:00:00	2020-10-05 00:00:00	77
3621	618	19	processing	2020-10-15 00:00:00	2020-10-06 00:00:00	73
3623	7	99	processing	2020-10-25 00:00:00	2020-10-06 00:00:00	33
3624	248	63	completed	2020-10-25 00:00:00	2020-10-06 00:00:00	9
3625	314	77	shipped	2020-11-05 00:00:00	2020-10-07 00:00:00	84
3627	575	7	processing	2020-10-20 00:00:00	2020-10-07 00:00:00	17
3634	650	18	completed	2020-11-07 00:00:00	2020-10-08 00:00:00	22
3637	259	50	processing	2020-10-19 00:00:00	2020-10-08 00:00:00	16
3638	396	52	processing	2020-10-09 00:00:00	2020-10-08 00:00:00	6
3640	92	84	shipped	2020-11-03 00:00:00	2020-10-08 00:00:00	59
3642	116	85	completed	2020-10-28 00:00:00	2020-10-08 00:00:00	16
3644	39	56	completed	2020-10-13 00:00:00	2020-10-08 00:00:00	62
3645	588	35	processing	2020-10-25 00:00:00	2020-10-08 00:00:00	6
3647	143	82	completed	2020-10-24 00:00:00	2020-10-08 00:00:00	22
3650	675	6	completed	2020-10-20 00:00:00	2020-10-10 00:00:00	38
3651	375	40	shipped	2020-11-05 00:00:00	2020-10-11 00:00:00	62
3654	636	32	shipped	2020-10-29 00:00:00	2020-10-11 00:00:00	30
3658	680	22	shipped	2020-10-16 00:00:00	2020-10-12 00:00:00	96
3660	19	32	processing	2020-11-02 00:00:00	2020-10-12 00:00:00	96
3661	16	73	shipped	2020-11-09 00:00:00	2020-10-13 00:00:00	15
3662	199	77	completed	2020-11-05 00:00:00	2020-10-13 00:00:00	72
3663	149	36	shipped	2020-11-04 00:00:00	2020-10-13 00:00:00	14
3664	43	75	shipped	2020-11-03 00:00:00	2020-10-13 00:00:00	82
3665	629	77	completed	2020-10-29 00:00:00	2020-10-13 00:00:00	53
3668	471	75	completed	2020-10-25 00:00:00	2020-10-13 00:00:00	6
3669	194	9	completed	2020-10-30 00:00:00	2020-10-14 00:00:00	63
3670	342	45	processing	2020-10-20 00:00:00	2020-10-14 00:00:00	81
3671	159	11	shipped	2020-11-09 00:00:00	2020-10-14 00:00:00	19
3673	441	48	processing	2020-11-03 00:00:00	2020-10-15 00:00:00	59
3674	369	70	shipped	2020-11-05 00:00:00	2020-10-15 00:00:00	74
3675	399	92	completed	2020-11-01 00:00:00	2020-10-15 00:00:00	39
3676	303	63	processing	2020-10-27 00:00:00	2020-10-16 00:00:00	92
3677	604	94	completed	2020-11-14 00:00:00	2020-10-16 00:00:00	34
3678	552	13	completed	2020-11-07 00:00:00	2020-10-16 00:00:00	25
3680	266	52	processing	2020-10-27 00:00:00	2020-10-16 00:00:00	66
3681	282	30	completed	2020-11-13 00:00:00	2020-10-17 00:00:00	36
3682	52	3	processing	2020-11-16 00:00:00	2020-10-17 00:00:00	54
3684	308	20	processing	2020-11-02 00:00:00	2020-10-17 00:00:00	14
3685	670	90	shipped	2020-11-05 00:00:00	2020-10-18 00:00:00	66
3688	202	7	shipped	2020-11-04 00:00:00	2020-10-20 00:00:00	56
3692	402	38	shipped	2020-10-25 00:00:00	2020-10-20 00:00:00	7
3693	323	5	shipped	2020-11-06 00:00:00	2020-10-20 00:00:00	94
3694	274	35	processing	2020-10-30 00:00:00	2020-10-20 00:00:00	31
3695	355	59	processing	2020-10-29 00:00:00	2020-10-20 00:00:00	61
3696	260	56	processing	2020-11-08 00:00:00	2020-10-20 00:00:00	98
3697	478	19	processing	2020-11-20 00:00:00	2020-10-21 00:00:00	37
3698	555	15	shipped	2020-11-20 00:00:00	2020-10-21 00:00:00	55
3699	200	65	completed	2020-11-04 00:00:00	2020-10-21 00:00:00	19
3700	456	86	completed	2020-10-30 00:00:00	2020-10-22 00:00:00	34
3701	277	43	shipped	2020-11-13 00:00:00	2020-10-22 00:00:00	64
3702	662	21	completed	2020-11-05 00:00:00	2020-10-22 00:00:00	46
3703	113	93	shipped	2020-10-28 00:00:00	2020-10-23 00:00:00	10
3704	301	71	processing	2020-11-02 00:00:00	2020-10-23 00:00:00	33
3705	162	4	processing	2020-10-25 00:00:00	2020-10-24 00:00:00	29
3706	455	11	shipped	2020-11-07 00:00:00	2020-10-24 00:00:00	15
3707	681	25	completed	2020-11-18 00:00:00	2020-10-24 00:00:00	42
3708	69	40	shipped	2020-10-25 00:00:00	2020-10-24 00:00:00	36
3709	24	61	completed	2020-11-17 00:00:00	2020-10-24 00:00:00	93
3710	194	31	processing	2020-11-16 00:00:00	2020-10-24 00:00:00	78
3711	33	5	completed	2020-10-29 00:00:00	2020-10-25 00:00:00	24
3712	222	15	completed	2020-11-18 00:00:00	2020-10-25 00:00:00	33
3713	61	41	completed	2020-11-15 00:00:00	2020-10-25 00:00:00	44
3714	644	61	completed	2020-11-09 00:00:00	2020-10-25 00:00:00	52
3715	261	33	processing	2020-11-16 00:00:00	2020-10-25 00:00:00	74
3716	397	4	processing	2020-11-24 00:00:00	2020-10-25 00:00:00	31
3717	410	80	processing	2020-11-11 00:00:00	2020-10-25 00:00:00	16
3718	566	81	completed	2020-10-30 00:00:00	2020-10-25 00:00:00	58
3719	340	6	shipped	2020-11-06 00:00:00	2020-10-25 00:00:00	6
3720	123	92	shipped	2020-11-08 00:00:00	2020-10-25 00:00:00	70
3721	85	17	completed	2020-11-05 00:00:00	2020-10-26 00:00:00	67
3722	250	52	completed	2020-11-18 00:00:00	2020-10-26 00:00:00	36
3723	119	40	completed	2020-11-07 00:00:00	2020-10-26 00:00:00	95
3724	448	23	shipped	2020-11-20 00:00:00	2020-10-26 00:00:00	3
3725	251	52	shipped	2020-11-01 00:00:00	2020-10-26 00:00:00	55
3726	157	75	shipped	2020-11-23 00:00:00	2020-10-26 00:00:00	45
3727	571	9	processing	2020-11-02 00:00:00	2020-10-26 00:00:00	60
3728	595	57	shipped	2020-11-23 00:00:00	2020-10-26 00:00:00	33
3729	483	89	shipped	2020-10-28 00:00:00	2020-10-27 00:00:00	100
3730	178	60	completed	2020-11-18 00:00:00	2020-10-27 00:00:00	47
3731	105	89	shipped	2020-11-23 00:00:00	2020-10-27 00:00:00	85
3732	662	41	processing	2020-10-29 00:00:00	2020-10-27 00:00:00	46
3733	138	41	completed	2020-11-23 00:00:00	2020-10-27 00:00:00	65
3734	541	78	shipped	2020-11-15 00:00:00	2020-10-27 00:00:00	84
3735	262	72	processing	2020-10-29 00:00:00	2020-10-27 00:00:00	63
3736	371	36	shipped	2020-11-18 00:00:00	2020-10-28 00:00:00	45
3737	88	19	shipped	2020-10-29 00:00:00	2020-10-28 00:00:00	47
3738	599	51	processing	2020-11-02 00:00:00	2020-10-28 00:00:00	69
3739	422	86	processing	2020-10-29 00:00:00	2020-10-28 00:00:00	76
3740	120	78	shipped	2020-11-25 00:00:00	2020-10-28 00:00:00	73
3741	653	48	completed	2020-11-06 00:00:00	2020-10-28 00:00:00	36
3742	332	27	processing	2020-11-01 00:00:00	2020-10-28 00:00:00	80
3743	291	94	shipped	2020-11-21 00:00:00	2020-10-28 00:00:00	60
3744	203	6	shipped	2020-11-09 00:00:00	2020-10-28 00:00:00	28
3745	148	29	processing	2020-11-20 00:00:00	2020-10-28 00:00:00	54
3746	72	61	processing	2020-11-07 00:00:00	2020-10-28 00:00:00	39
3747	131	10	shipped	2020-11-17 00:00:00	2020-10-28 00:00:00	85
3748	640	96	completed	2020-10-31 00:00:00	2020-10-29 00:00:00	43
3749	662	92	completed	2020-11-05 00:00:00	2020-10-29 00:00:00	62
3751	363	92	processing	2020-11-08 00:00:00	2020-10-30 00:00:00	26
3752	284	38	processing	2020-11-10 00:00:00	2020-10-30 00:00:00	5
3757	63	41	completed	2020-11-28 00:00:00	2020-10-30 00:00:00	55
3759	167	63	shipped	2020-11-22 00:00:00	2020-10-30 00:00:00	3
3761	623	66	processing	2020-11-28 00:00:00	2020-10-30 00:00:00	38
3762	231	71	completed	2020-11-29 00:00:00	2020-10-30 00:00:00	16
3764	146	55	processing	2020-11-05 00:00:00	2020-10-30 00:00:00	60
3767	378	89	shipped	2020-11-04 00:00:00	2020-10-30 00:00:00	1
3772	137	60	processing	2020-11-06 00:00:00	2020-11-01 00:00:00	3
3773	46	45	processing	2020-11-02 00:00:00	2020-11-01 00:00:00	28
3777	537	28	completed	2020-11-16 00:00:00	2020-11-01 00:00:00	16
3778	543	64	completed	2020-11-20 00:00:00	2020-11-01 00:00:00	45
3779	635	52	processing	2020-11-10 00:00:00	2020-11-01 00:00:00	82
3880	383	18	completed	2020-11-27 00:00:00	2020-11-18 00:00:00	65
3881	319	71	processing	2020-12-16 00:00:00	2020-11-18 00:00:00	14
3882	681	38	completed	2020-12-17 00:00:00	2020-11-18 00:00:00	66
3883	238	38	completed	2020-11-28 00:00:00	2020-11-18 00:00:00	11
3885	56	77	shipped	2020-12-12 00:00:00	2020-11-18 00:00:00	44
3887	688	15	completed	2020-12-16 00:00:00	2020-11-18 00:00:00	88
3888	339	32	completed	2020-11-24 00:00:00	2020-11-18 00:00:00	84
3890	258	94	processing	2020-12-17 00:00:00	2020-11-19 00:00:00	31
3893	581	12	completed	2020-12-16 00:00:00	2020-11-19 00:00:00	98
3901	689	98	shipped	2020-12-19 00:00:00	2020-11-22 00:00:00	41
3902	44	6	processing	2020-12-17 00:00:00	2020-11-22 00:00:00	88
3903	340	63	processing	2020-12-11 00:00:00	2020-11-22 00:00:00	35
3906	115	90	shipped	2020-12-14 00:00:00	2020-11-22 00:00:00	41
3919	365	98	shipped	2020-12-20 00:00:00	2020-11-25 00:00:00	24
3920	21	41	shipped	2020-11-29 00:00:00	2020-11-25 00:00:00	81
3921	182	70	processing	2020-12-17 00:00:00	2020-11-25 00:00:00	95
3923	197	72	completed	2020-12-21 00:00:00	2020-11-25 00:00:00	36
3925	625	31	completed	2020-11-29 00:00:00	2020-11-26 00:00:00	41
3926	358	63	shipped	2020-12-25 00:00:00	2020-11-26 00:00:00	19
3928	165	79	processing	2020-12-21 00:00:00	2020-11-27 00:00:00	87
3929	290	20	shipped	2020-11-29 00:00:00	2020-11-28 00:00:00	92
3930	616	61	shipped	2020-12-21 00:00:00	2020-11-28 00:00:00	61
3931	371	49	processing	2020-12-01 00:00:00	2020-11-29 00:00:00	99
3932	642	82	completed	2020-12-19 00:00:00	2020-11-29 00:00:00	45
3934	111	30	completed	2020-12-12 00:00:00	2020-11-29 00:00:00	46
3935	427	61	shipped	2020-11-30 00:00:00	2020-11-29 00:00:00	8
3937	579	45	processing	2020-12-30 00:00:00	2020-11-30 00:00:00	86
3938	167	1	completed	2020-12-27 00:00:00	2020-11-30 00:00:00	8
3939	406	95	processing	2020-12-13 00:00:00	2020-11-30 00:00:00	59
3940	2	74	processing	2020-12-26 00:00:00	2020-11-30 00:00:00	87
3946	104	77	completed	2020-12-05 00:00:00	2020-12-01 00:00:00	76
3948	496	79	completed	2020-12-12 00:00:00	2020-12-01 00:00:00	78
3949	660	56	processing	2020-12-03 00:00:00	2020-12-02 00:00:00	53
3950	447	21	shipped	2020-12-23 00:00:00	2020-12-02 00:00:00	58
3952	578	83	completed	2020-12-13 00:00:00	2020-12-04 00:00:00	85
3956	418	57	processing	2020-12-07 00:00:00	2020-12-05 00:00:00	56
3957	460	21	completed	2021-01-04 00:00:00	2020-12-06 00:00:00	40
3958	133	80	completed	2020-12-09 00:00:00	2020-12-06 00:00:00	88
3959	183	26	completed	2020-12-14 00:00:00	2020-12-06 00:00:00	8
3962	367	89	completed	2020-12-23 00:00:00	2020-12-07 00:00:00	67
3964	66	22	completed	2020-12-31 00:00:00	2020-12-07 00:00:00	15
3966	528	51	processing	2020-12-28 00:00:00	2020-12-07 00:00:00	11
3968	526	38	processing	2020-12-31 00:00:00	2020-12-08 00:00:00	13
3970	98	52	processing	2020-12-19 00:00:00	2020-12-09 00:00:00	71
3973	391	88	completed	2020-12-25 00:00:00	2020-12-10 00:00:00	54
3982	121	81	completed	2021-01-06 00:00:00	2020-12-12 00:00:00	85
3984	338	98	completed	2020-12-21 00:00:00	2020-12-12 00:00:00	52
3986	253	68	shipped	2020-12-16 00:00:00	2020-12-13 00:00:00	29
3988	30	93	completed	2020-12-18 00:00:00	2020-12-13 00:00:00	23
3992	682	54	processing	2020-12-19 00:00:00	2020-12-14 00:00:00	67
3993	327	96	shipped	2021-01-12 00:00:00	2020-12-15 00:00:00	71
3995	695	40	completed	2021-01-04 00:00:00	2020-12-15 00:00:00	61
3996	698	84	shipped	2020-12-26 00:00:00	2020-12-15 00:00:00	74
3997	226	14	shipped	2021-01-10 00:00:00	2020-12-15 00:00:00	12
4000	52	6	processing	2021-01-06 00:00:00	2020-12-15 00:00:00	85
4001	177	47	shipped	2020-12-16 00:00:00	2020-12-15 00:00:00	69
4005	22	39	shipped	2020-12-24 00:00:00	2020-12-15 00:00:00	15
4006	700	28	processing	2020-12-26 00:00:00	2020-12-16 00:00:00	55
4007	368	100	shipped	2020-12-30 00:00:00	2020-12-16 00:00:00	93
4008	235	77	processing	2020-12-26 00:00:00	2020-12-16 00:00:00	30
4009	660	56	completed	2021-01-15 00:00:00	2020-12-17 00:00:00	97
4010	688	81	shipped	2020-12-20 00:00:00	2020-12-17 00:00:00	31
4011	112	98	shipped	2020-12-27 00:00:00	2020-12-17 00:00:00	81
4012	585	79	processing	2020-12-24 00:00:00	2020-12-17 00:00:00	37
4013	323	47	shipped	2021-01-09 00:00:00	2020-12-17 00:00:00	51
4014	327	33	processing	2020-12-29 00:00:00	2020-12-17 00:00:00	75
4015	201	97	completed	2021-01-08 00:00:00	2020-12-18 00:00:00	8
4016	178	2	completed	2021-01-03 00:00:00	2020-12-18 00:00:00	10
4017	637	50	completed	2021-01-13 00:00:00	2020-12-18 00:00:00	50
4018	259	52	processing	2020-12-28 00:00:00	2020-12-18 00:00:00	15
4019	520	10	shipped	2021-01-01 00:00:00	2020-12-18 00:00:00	67
4020	73	13	completed	2021-01-06 00:00:00	2020-12-18 00:00:00	3
4021	361	52	processing	2020-12-31 00:00:00	2020-12-19 00:00:00	25
4022	118	98	completed	2021-01-08 00:00:00	2020-12-19 00:00:00	11
4023	161	57	completed	2021-01-11 00:00:00	2020-12-19 00:00:00	88
4024	340	50	shipped	2021-01-18 00:00:00	2020-12-20 00:00:00	61
4025	195	86	shipped	2021-01-10 00:00:00	2020-12-21 00:00:00	62
4026	684	33	processing	2021-01-17 00:00:00	2020-12-22 00:00:00	92
4027	110	40	completed	2021-01-14 00:00:00	2020-12-22 00:00:00	65
4028	16	21	shipped	2020-12-27 00:00:00	2020-12-22 00:00:00	5
4029	667	100	shipped	2021-01-09 00:00:00	2020-12-22 00:00:00	94
4030	88	39	shipped	2021-01-21 00:00:00	2020-12-22 00:00:00	31
4031	57	23	completed	2021-01-19 00:00:00	2020-12-22 00:00:00	55
4032	400	99	shipped	2021-01-03 00:00:00	2020-12-22 00:00:00	42
4033	27	76	completed	2021-01-05 00:00:00	2020-12-23 00:00:00	75
4034	680	97	shipped	2021-01-11 00:00:00	2020-12-23 00:00:00	80
4035	349	89	processing	2021-01-19 00:00:00	2020-12-23 00:00:00	84
4036	10	8	completed	2021-01-03 00:00:00	2020-12-23 00:00:00	63
4037	449	98	processing	2021-01-13 00:00:00	2020-12-23 00:00:00	72
4038	220	93	completed	2021-01-21 00:00:00	2020-12-23 00:00:00	36
4039	237	10	shipped	2021-01-11 00:00:00	2020-12-23 00:00:00	11
4040	286	100	completed	2020-12-24 00:00:00	2020-12-23 00:00:00	59
3750	144	28	shipped	2020-11-06 00:00:00	2020-10-29 00:00:00	61
3753	117	24	shipped	2020-11-11 00:00:00	2020-10-30 00:00:00	40
3754	529	33	processing	2020-11-19 00:00:00	2020-10-30 00:00:00	95
3755	555	81	shipped	2020-11-28 00:00:00	2020-10-30 00:00:00	90
3756	382	17	shipped	2020-11-28 00:00:00	2020-10-30 00:00:00	41
3758	670	12	completed	2020-11-18 00:00:00	2020-10-30 00:00:00	8
3760	564	12	completed	2020-11-03 00:00:00	2020-10-30 00:00:00	67
3763	360	94	shipped	2020-11-24 00:00:00	2020-10-30 00:00:00	46
3765	365	44	completed	2020-11-05 00:00:00	2020-10-30 00:00:00	68
3766	34	5	shipped	2020-11-24 00:00:00	2020-10-30 00:00:00	15
3768	348	57	completed	2020-11-20 00:00:00	2020-10-30 00:00:00	93
3769	408	88	processing	2020-11-09 00:00:00	2020-10-31 00:00:00	9
3770	556	22	completed	2020-11-07 00:00:00	2020-10-31 00:00:00	86
3771	413	96	completed	2020-11-11 00:00:00	2020-10-31 00:00:00	6
3774	464	67	completed	2020-11-18 00:00:00	2020-11-01 00:00:00	87
3775	215	85	shipped	2020-11-24 00:00:00	2020-11-01 00:00:00	71
3776	576	87	shipped	2020-11-02 00:00:00	2020-11-01 00:00:00	85
3780	318	65	completed	2020-11-12 00:00:00	2020-11-01 00:00:00	41
3781	530	47	processing	2020-11-07 00:00:00	2020-11-02 00:00:00	10
3782	88	26	processing	2020-11-05 00:00:00	2020-11-02 00:00:00	35
3783	301	20	shipped	2020-11-18 00:00:00	2020-11-02 00:00:00	89
3784	492	89	shipped	2020-11-16 00:00:00	2020-11-03 00:00:00	68
3785	586	52	processing	2020-11-19 00:00:00	2020-11-03 00:00:00	42
3786	318	48	completed	2020-11-19 00:00:00	2020-11-04 00:00:00	59
3787	454	27	shipped	2020-11-13 00:00:00	2020-11-04 00:00:00	45
3788	313	9	shipped	2020-12-03 00:00:00	2020-11-04 00:00:00	43
3789	620	73	shipped	2020-11-24 00:00:00	2020-11-04 00:00:00	71
3790	404	64	completed	2020-11-13 00:00:00	2020-11-05 00:00:00	89
3791	274	54	completed	2020-11-12 00:00:00	2020-11-05 00:00:00	64
3792	353	18	processing	2020-11-30 00:00:00	2020-11-05 00:00:00	42
3793	639	55	shipped	2020-11-07 00:00:00	2020-11-06 00:00:00	93
3794	38	61	shipped	2020-11-22 00:00:00	2020-11-06 00:00:00	4
3795	174	54	completed	2020-12-06 00:00:00	2020-11-06 00:00:00	87
3796	36	91	completed	2020-11-09 00:00:00	2020-11-06 00:00:00	36
3797	505	85	shipped	2020-12-04 00:00:00	2020-11-06 00:00:00	21
3798	356	21	shipped	2020-11-11 00:00:00	2020-11-06 00:00:00	70
3799	515	79	shipped	2020-11-16 00:00:00	2020-11-06 00:00:00	43
3800	516	47	processing	2020-12-04 00:00:00	2020-11-06 00:00:00	12
3801	310	77	shipped	2020-11-17 00:00:00	2020-11-07 00:00:00	55
3802	283	55	completed	2020-12-01 00:00:00	2020-11-07 00:00:00	68
3803	76	100	shipped	2020-11-10 00:00:00	2020-11-07 00:00:00	64
3804	672	96	shipped	2020-11-19 00:00:00	2020-11-07 00:00:00	66
3805	442	62	completed	2020-11-24 00:00:00	2020-11-08 00:00:00	37
3806	131	23	shipped	2020-11-18 00:00:00	2020-11-08 00:00:00	87
3807	698	62	completed	2020-12-07 00:00:00	2020-11-08 00:00:00	42
3808	160	28	processing	2020-12-08 00:00:00	2020-11-08 00:00:00	96
3809	208	91	processing	2020-11-17 00:00:00	2020-11-09 00:00:00	68
3810	365	79	completed	2020-11-25 00:00:00	2020-11-09 00:00:00	53
3811	508	77	completed	2020-11-12 00:00:00	2020-11-09 00:00:00	57
3812	641	13	completed	2020-12-03 00:00:00	2020-11-09 00:00:00	54
3813	552	78	shipped	2020-12-06 00:00:00	2020-11-09 00:00:00	48
3814	376	92	completed	2020-11-24 00:00:00	2020-11-09 00:00:00	45
3815	302	81	completed	2020-11-21 00:00:00	2020-11-09 00:00:00	21
3816	187	63	shipped	2020-11-21 00:00:00	2020-11-09 00:00:00	36
3817	32	8	completed	2020-11-19 00:00:00	2020-11-09 00:00:00	25
3818	244	51	processing	2020-12-05 00:00:00	2020-11-09 00:00:00	17
3819	217	36	processing	2020-12-05 00:00:00	2020-11-09 00:00:00	61
3820	8	38	processing	2020-11-14 00:00:00	2020-11-09 00:00:00	92
3821	184	28	completed	2020-11-16 00:00:00	2020-11-09 00:00:00	10
3822	84	93	processing	2020-11-21 00:00:00	2020-11-09 00:00:00	33
3823	151	86	processing	2020-11-25 00:00:00	2020-11-10 00:00:00	18
3824	116	53	completed	2020-11-19 00:00:00	2020-11-10 00:00:00	46
3825	216	94	processing	2020-11-18 00:00:00	2020-11-10 00:00:00	89
3826	118	27	shipped	2020-11-28 00:00:00	2020-11-11 00:00:00	10
3827	221	7	completed	2020-11-24 00:00:00	2020-11-11 00:00:00	14
3828	634	58	completed	2020-11-14 00:00:00	2020-11-11 00:00:00	49
3829	242	10	shipped	2020-11-22 00:00:00	2020-11-12 00:00:00	64
3830	202	52	processing	2020-11-28 00:00:00	2020-11-12 00:00:00	73
3831	528	7	completed	2020-12-07 00:00:00	2020-11-12 00:00:00	87
3832	275	63	completed	2020-12-08 00:00:00	2020-11-12 00:00:00	18
3833	266	84	shipped	2020-12-12 00:00:00	2020-11-12 00:00:00	85
3834	52	34	completed	2020-12-11 00:00:00	2020-11-12 00:00:00	92
3835	311	66	completed	2020-12-08 00:00:00	2020-11-12 00:00:00	100
3836	446	79	completed	2020-11-18 00:00:00	2020-11-12 00:00:00	24
3837	626	10	completed	2020-11-18 00:00:00	2020-11-12 00:00:00	62
3838	228	31	completed	2020-11-30 00:00:00	2020-11-12 00:00:00	24
3839	368	17	shipped	2020-12-01 00:00:00	2020-11-12 00:00:00	49
3840	232	5	shipped	2020-11-21 00:00:00	2020-11-12 00:00:00	14
3841	36	27	completed	2020-11-28 00:00:00	2020-11-13 00:00:00	9
3842	590	88	completed	2020-12-07 00:00:00	2020-11-13 00:00:00	25
3843	343	92	completed	2020-12-05 00:00:00	2020-11-13 00:00:00	91
3844	331	10	processing	2020-12-04 00:00:00	2020-11-13 00:00:00	8
3845	248	98	processing	2020-12-01 00:00:00	2020-11-13 00:00:00	39
3846	91	41	shipped	2020-11-16 00:00:00	2020-11-13 00:00:00	1
3847	440	12	processing	2020-11-25 00:00:00	2020-11-13 00:00:00	60
3848	584	27	completed	2020-11-24 00:00:00	2020-11-13 00:00:00	84
3849	78	63	shipped	2020-11-14 00:00:00	2020-11-13 00:00:00	30
3850	392	36	completed	2020-11-25 00:00:00	2020-11-13 00:00:00	89
3851	279	31	completed	2020-11-30 00:00:00	2020-11-13 00:00:00	43
3852	548	71	completed	2020-11-16 00:00:00	2020-11-13 00:00:00	7
3853	695	35	completed	2020-11-26 00:00:00	2020-11-13 00:00:00	38
3854	321	71	completed	2020-11-19 00:00:00	2020-11-13 00:00:00	32
3855	77	33	completed	2020-11-19 00:00:00	2020-11-13 00:00:00	36
3856	339	100	processing	2020-11-17 00:00:00	2020-11-13 00:00:00	76
3857	364	6	completed	2020-12-12 00:00:00	2020-11-13 00:00:00	45
3858	245	71	processing	2020-11-16 00:00:00	2020-11-13 00:00:00	75
3859	126	41	shipped	2020-12-10 00:00:00	2020-11-13 00:00:00	58
3860	243	18	completed	2020-11-16 00:00:00	2020-11-13 00:00:00	71
3861	3	38	processing	2020-12-13 00:00:00	2020-11-14 00:00:00	48
3862	56	66	shipped	2020-12-06 00:00:00	2020-11-15 00:00:00	92
3863	253	11	completed	2020-11-17 00:00:00	2020-11-15 00:00:00	80
3864	34	27	processing	2020-12-01 00:00:00	2020-11-15 00:00:00	36
3865	186	2	processing	2020-11-21 00:00:00	2020-11-15 00:00:00	5
3866	409	6	processing	2020-12-04 00:00:00	2020-11-15 00:00:00	2
3867	550	51	completed	2020-12-13 00:00:00	2020-11-15 00:00:00	42
3868	682	26	shipped	2020-11-17 00:00:00	2020-11-16 00:00:00	22
3869	519	36	shipped	2020-11-28 00:00:00	2020-11-16 00:00:00	71
3870	601	46	shipped	2020-12-14 00:00:00	2020-11-16 00:00:00	59
3871	41	50	shipped	2020-12-10 00:00:00	2020-11-16 00:00:00	11
3872	131	72	shipped	2020-11-26 00:00:00	2020-11-16 00:00:00	88
3873	367	11	shipped	2020-12-16 00:00:00	2020-11-17 00:00:00	96
3874	165	84	processing	2020-11-22 00:00:00	2020-11-17 00:00:00	9
3875	563	40	processing	2020-12-15 00:00:00	2020-11-17 00:00:00	47
3876	111	25	processing	2020-11-23 00:00:00	2020-11-17 00:00:00	13
3877	19	97	completed	2020-11-21 00:00:00	2020-11-17 00:00:00	98
3878	432	41	shipped	2020-12-07 00:00:00	2020-11-17 00:00:00	94
3879	148	42	completed	2020-12-13 00:00:00	2020-11-17 00:00:00	20
3884	467	98	completed	2020-12-02 00:00:00	2020-11-18 00:00:00	62
3886	404	26	shipped	2020-11-20 00:00:00	2020-11-18 00:00:00	55
3889	284	90	completed	2020-12-13 00:00:00	2020-11-19 00:00:00	28
3891	222	82	completed	2020-11-30 00:00:00	2020-11-19 00:00:00	56
3892	72	83	completed	2020-12-18 00:00:00	2020-11-19 00:00:00	100
3894	278	20	shipped	2020-11-24 00:00:00	2020-11-19 00:00:00	20
3895	215	86	processing	2020-12-01 00:00:00	2020-11-20 00:00:00	25
3896	579	45	shipped	2020-11-26 00:00:00	2020-11-20 00:00:00	99
3897	83	48	completed	2020-11-27 00:00:00	2020-11-21 00:00:00	69
3898	201	59	completed	2020-11-22 00:00:00	2020-11-21 00:00:00	78
3899	631	73	shipped	2020-12-12 00:00:00	2020-11-21 00:00:00	21
3900	171	39	shipped	2020-12-05 00:00:00	2020-11-21 00:00:00	65
3904	62	64	shipped	2020-12-22 00:00:00	2020-11-22 00:00:00	4
3905	563	70	completed	2020-12-08 00:00:00	2020-11-22 00:00:00	16
3907	215	30	processing	2020-12-04 00:00:00	2020-11-23 00:00:00	42
3908	478	27	shipped	2020-12-10 00:00:00	2020-11-23 00:00:00	73
3909	158	54	shipped	2020-11-26 00:00:00	2020-11-23 00:00:00	11
3910	312	20	processing	2020-12-13 00:00:00	2020-11-23 00:00:00	85
3911	303	15	processing	2020-12-10 00:00:00	2020-11-23 00:00:00	65
3912	550	81	shipped	2020-12-19 00:00:00	2020-11-23 00:00:00	10
3913	683	45	completed	2020-12-11 00:00:00	2020-11-24 00:00:00	81
3914	517	66	completed	2020-12-07 00:00:00	2020-11-24 00:00:00	20
3915	104	91	shipped	2020-12-11 00:00:00	2020-11-24 00:00:00	29
3916	157	9	processing	2020-12-04 00:00:00	2020-11-24 00:00:00	68
3917	99	17	completed	2020-12-01 00:00:00	2020-11-24 00:00:00	24
3918	196	52	shipped	2020-12-05 00:00:00	2020-11-24 00:00:00	87
3922	612	12	completed	2020-12-09 00:00:00	2020-11-25 00:00:00	88
3924	676	34	completed	2020-11-29 00:00:00	2020-11-25 00:00:00	97
3927	630	54	completed	2020-12-20 00:00:00	2020-11-26 00:00:00	44
3933	437	15	processing	2020-12-28 00:00:00	2020-11-29 00:00:00	83
3936	490	75	shipped	2020-12-14 00:00:00	2020-11-30 00:00:00	11
3941	442	41	completed	2020-12-14 00:00:00	2020-11-30 00:00:00	1
3942	334	49	completed	2020-12-03 00:00:00	2020-11-30 00:00:00	92
3943	497	45	processing	2020-12-09 00:00:00	2020-11-30 00:00:00	23
3944	526	35	processing	2020-12-30 00:00:00	2020-11-30 00:00:00	5
3945	81	73	shipped	2020-12-20 00:00:00	2020-11-30 00:00:00	42
3947	323	60	processing	2020-12-24 00:00:00	2020-12-01 00:00:00	88
3951	41	75	completed	2020-12-24 00:00:00	2020-12-03 00:00:00	62
3953	470	31	shipped	2020-12-10 00:00:00	2020-12-04 00:00:00	28
3954	417	71	processing	2020-12-09 00:00:00	2020-12-04 00:00:00	94
3955	561	32	completed	2020-12-29 00:00:00	2020-12-04 00:00:00	61
3960	122	53	shipped	2021-01-04 00:00:00	2020-12-06 00:00:00	50
3961	432	62	completed	2021-01-05 00:00:00	2020-12-07 00:00:00	11
3963	263	12	processing	2020-12-14 00:00:00	2020-12-07 00:00:00	72
3965	165	36	completed	2020-12-12 00:00:00	2020-12-07 00:00:00	7
3967	454	65	completed	2020-12-15 00:00:00	2020-12-08 00:00:00	25
3969	646	96	completed	2020-12-28 00:00:00	2020-12-08 00:00:00	100
3971	518	37	shipped	2021-01-07 00:00:00	2020-12-09 00:00:00	1
3972	235	15	processing	2020-12-31 00:00:00	2020-12-09 00:00:00	35
3974	489	84	shipped	2020-12-25 00:00:00	2020-12-10 00:00:00	18
3975	148	21	shipped	2021-01-03 00:00:00	2020-12-10 00:00:00	44
3976	320	68	processing	2020-12-20 00:00:00	2020-12-10 00:00:00	67
3977	530	58	shipped	2021-01-09 00:00:00	2020-12-10 00:00:00	7
3978	175	4	completed	2021-01-04 00:00:00	2020-12-10 00:00:00	44
3979	656	33	processing	2020-12-22 00:00:00	2020-12-11 00:00:00	52
3980	583	28	completed	2020-12-24 00:00:00	2020-12-11 00:00:00	34
3981	114	25	processing	2020-12-15 00:00:00	2020-12-12 00:00:00	78
3983	268	69	completed	2020-12-23 00:00:00	2020-12-12 00:00:00	79
3985	356	83	processing	2021-01-01 00:00:00	2020-12-13 00:00:00	45
3987	355	27	shipped	2021-01-09 00:00:00	2020-12-13 00:00:00	73
3989	160	35	processing	2020-12-17 00:00:00	2020-12-13 00:00:00	16
3990	684	64	completed	2020-12-30 00:00:00	2020-12-13 00:00:00	77
3991	247	54	completed	2020-12-21 00:00:00	2020-12-14 00:00:00	35
3994	190	58	completed	2021-01-10 00:00:00	2020-12-15 00:00:00	19
3998	240	100	completed	2020-12-22 00:00:00	2020-12-15 00:00:00	31
3999	150	87	completed	2020-12-23 00:00:00	2020-12-15 00:00:00	47
4002	106	93	shipped	2020-12-23 00:00:00	2020-12-15 00:00:00	99
4003	699	95	completed	2021-01-04 00:00:00	2020-12-15 00:00:00	77
4004	266	19	processing	2021-01-13 00:00:00	2020-12-15 00:00:00	20
4096	291	8	processing	2021-01-08 00:00:00	2021-01-01 00:00:00	46
4098	607	84	processing	2021-01-22 00:00:00	2021-01-01 00:00:00	61
4099	352	50	processing	2021-01-15 00:00:00	2021-01-01 00:00:00	1
4100	231	2	shipped	2021-01-11 00:00:00	2021-01-01 00:00:00	97
4102	189	38	processing	2021-01-31 00:00:00	2021-01-01 00:00:00	72
4103	633	71	processing	2021-01-23 00:00:00	2021-01-01 00:00:00	60
4106	418	97	completed	2021-01-26 00:00:00	2021-01-01 00:00:00	17
4107	102	52	completed	2021-01-31 00:00:00	2021-01-01 00:00:00	12
4108	457	20	shipped	2021-01-09 00:00:00	2021-01-01 00:00:00	40
4109	165	28	completed	2021-01-10 00:00:00	2021-01-01 00:00:00	77
4111	59	43	processing	2021-01-21 00:00:00	2021-01-01 00:00:00	79
4113	611	96	completed	2021-01-23 00:00:00	2021-01-01 00:00:00	83
4114	287	98	completed	2021-01-19 00:00:00	2021-01-01 00:00:00	75
4115	502	30	processing	2021-01-25 00:00:00	2021-01-01 00:00:00	18
4116	331	37	processing	2021-01-17 00:00:00	2021-01-01 00:00:00	48
4117	170	84	processing	2021-01-30 00:00:00	2021-01-02 00:00:00	12
4118	165	49	processing	2021-01-17 00:00:00	2021-01-02 00:00:00	18
4119	619	68	shipped	2021-01-31 00:00:00	2021-01-02 00:00:00	92
4120	224	40	completed	2021-01-06 00:00:00	2021-01-02 00:00:00	36
4121	680	4	shipped	2021-01-12 00:00:00	2021-01-02 00:00:00	3
4122	139	27	processing	2021-01-29 00:00:00	2021-01-02 00:00:00	69
4123	19	85	processing	2021-01-10 00:00:00	2021-01-03 00:00:00	7
4124	241	40	processing	2021-02-01 00:00:00	2021-01-03 00:00:00	8
4125	437	38	shipped	2021-02-01 00:00:00	2021-01-04 00:00:00	27
4126	528	9	shipped	2021-01-28 00:00:00	2021-01-04 00:00:00	86
4127	355	65	processing	2021-01-26 00:00:00	2021-01-04 00:00:00	40
4128	80	55	shipped	2021-01-19 00:00:00	2021-01-04 00:00:00	44
4129	608	81	completed	2021-01-18 00:00:00	2021-01-05 00:00:00	16
4041	590	21	processing	2021-01-18 00:00:00	2020-12-23 00:00:00	11
4042	397	55	completed	2021-01-10 00:00:00	2020-12-23 00:00:00	9
4043	177	83	shipped	2020-12-25 00:00:00	2020-12-23 00:00:00	97
4044	251	27	completed	2021-01-12 00:00:00	2020-12-23 00:00:00	24
4045	623	46	shipped	2021-01-01 00:00:00	2020-12-24 00:00:00	67
4046	627	74	completed	2021-01-17 00:00:00	2020-12-24 00:00:00	41
4047	403	100	completed	2021-01-23 00:00:00	2020-12-24 00:00:00	17
4048	67	97	completed	2021-01-19 00:00:00	2020-12-24 00:00:00	42
4049	210	28	processing	2021-01-03 00:00:00	2020-12-24 00:00:00	7
4050	434	46	processing	2021-01-22 00:00:00	2020-12-24 00:00:00	67
4051	475	29	shipped	2021-01-12 00:00:00	2020-12-24 00:00:00	10
4052	407	6	shipped	2020-12-30 00:00:00	2020-12-24 00:00:00	47
4053	82	25	completed	2021-01-15 00:00:00	2020-12-24 00:00:00	64
4054	14	56	shipped	2021-01-11 00:00:00	2020-12-24 00:00:00	18
4055	400	24	shipped	2020-12-25 00:00:00	2020-12-24 00:00:00	21
4056	501	67	processing	2021-01-02 00:00:00	2020-12-24 00:00:00	53
4057	694	42	processing	2021-01-03 00:00:00	2020-12-25 00:00:00	73
4058	471	73	processing	2021-01-17 00:00:00	2020-12-25 00:00:00	18
4059	553	18	processing	2020-12-28 00:00:00	2020-12-25 00:00:00	90
4060	695	27	processing	2021-01-21 00:00:00	2020-12-25 00:00:00	40
4061	158	61	completed	2021-01-14 00:00:00	2020-12-25 00:00:00	79
4062	119	29	completed	2020-12-31 00:00:00	2020-12-25 00:00:00	92
4063	7	52	shipped	2021-01-10 00:00:00	2020-12-26 00:00:00	40
4064	202	56	shipped	2021-01-07 00:00:00	2020-12-26 00:00:00	79
4065	223	47	completed	2020-12-28 00:00:00	2020-12-27 00:00:00	58
4066	550	38	completed	2021-01-01 00:00:00	2020-12-27 00:00:00	94
4067	512	89	completed	2021-01-12 00:00:00	2020-12-27 00:00:00	79
4068	384	12	completed	2021-01-23 00:00:00	2020-12-27 00:00:00	20
4069	588	73	completed	2020-12-30 00:00:00	2020-12-27 00:00:00	37
4070	442	36	completed	2021-01-17 00:00:00	2020-12-27 00:00:00	6
4071	1	43	processing	2021-01-13 00:00:00	2020-12-27 00:00:00	66
4072	363	70	processing	2020-12-31 00:00:00	2020-12-27 00:00:00	70
4073	12	28	processing	2020-12-31 00:00:00	2020-12-28 00:00:00	17
4074	438	46	processing	2021-01-26 00:00:00	2020-12-28 00:00:00	61
4075	183	4	shipped	2021-01-14 00:00:00	2020-12-28 00:00:00	26
4076	398	80	processing	2021-01-10 00:00:00	2020-12-28 00:00:00	5
4077	258	20	completed	2020-12-29 00:00:00	2020-12-28 00:00:00	43
4078	241	1	processing	2020-12-29 00:00:00	2020-12-28 00:00:00	83
4079	225	96	processing	2021-01-11 00:00:00	2020-12-28 00:00:00	50
4080	218	34	processing	2021-01-18 00:00:00	2020-12-28 00:00:00	20
4081	507	25	shipped	2021-01-02 00:00:00	2020-12-28 00:00:00	24
4082	181	17	shipped	2021-01-03 00:00:00	2020-12-28 00:00:00	59
4083	280	42	shipped	2021-01-17 00:00:00	2020-12-28 00:00:00	86
4084	620	92	processing	2021-01-02 00:00:00	2020-12-29 00:00:00	4
4085	39	7	shipped	2021-01-29 00:00:00	2020-12-30 00:00:00	97
4086	487	92	completed	2021-01-18 00:00:00	2020-12-30 00:00:00	51
4087	266	76	completed	2021-01-07 00:00:00	2020-12-30 00:00:00	63
4088	535	89	shipped	2021-01-20 00:00:00	2020-12-30 00:00:00	95
4089	429	47	completed	2021-01-22 00:00:00	2020-12-30 00:00:00	74
4090	251	41	processing	2020-12-31 00:00:00	2020-12-30 00:00:00	91
4091	479	76	completed	2021-01-26 00:00:00	2020-12-30 00:00:00	55
4092	192	98	completed	2021-01-14 00:00:00	2020-12-30 00:00:00	2
4093	536	80	completed	2021-01-07 00:00:00	2020-12-31 00:00:00	12
4094	112	35	shipped	2021-01-25 00:00:00	2020-12-31 00:00:00	33
4095	439	30	completed	2021-01-08 00:00:00	2020-12-31 00:00:00	21
4097	96	51	shipped	2021-01-28 00:00:00	2021-01-01 00:00:00	53
4101	307	50	processing	2021-01-03 00:00:00	2021-01-01 00:00:00	26
4104	308	13	processing	2021-01-05 00:00:00	2021-01-01 00:00:00	76
4105	437	82	completed	2021-01-12 00:00:00	2021-01-01 00:00:00	42
4110	630	65	shipped	2021-01-13 00:00:00	2021-01-01 00:00:00	67
4112	526	78	shipped	2021-01-21 00:00:00	2021-01-01 00:00:00	27
4130	97	100	shipped	2021-01-08 00:00:00	2021-01-05 00:00:00	80
4131	364	15	shipped	2021-01-29 00:00:00	2021-01-06 00:00:00	30
4132	465	63	completed	2021-01-09 00:00:00	2021-01-06 00:00:00	100
4133	545	70	shipped	2021-01-10 00:00:00	2021-01-06 00:00:00	84
4134	454	63	processing	2021-01-16 00:00:00	2021-01-06 00:00:00	76
4135	347	63	processing	2021-01-19 00:00:00	2021-01-06 00:00:00	28
4136	66	98	processing	2021-01-30 00:00:00	2021-01-06 00:00:00	52
4137	186	66	completed	2021-01-09 00:00:00	2021-01-07 00:00:00	75
4138	41	73	shipped	2021-01-26 00:00:00	2021-01-08 00:00:00	4
4139	480	30	processing	2021-02-07 00:00:00	2021-01-08 00:00:00	93
4140	689	55	completed	2021-01-28 00:00:00	2021-01-08 00:00:00	87
4141	411	100	shipped	2021-01-28 00:00:00	2021-01-09 00:00:00	20
4142	560	96	processing	2021-01-18 00:00:00	2021-01-09 00:00:00	20
4143	235	91	completed	2021-01-27 00:00:00	2021-01-09 00:00:00	82
4144	444	32	processing	2021-01-10 00:00:00	2021-01-09 00:00:00	49
4145	181	43	processing	2021-01-17 00:00:00	2021-01-09 00:00:00	3
4146	565	14	completed	2021-01-11 00:00:00	2021-01-09 00:00:00	33
4147	660	26	completed	2021-02-07 00:00:00	2021-01-09 00:00:00	75
4148	374	82	completed	2021-02-05 00:00:00	2021-01-09 00:00:00	68
4149	23	70	shipped	2021-01-22 00:00:00	2021-01-09 00:00:00	30
4150	676	57	processing	2021-01-14 00:00:00	2021-01-09 00:00:00	91
4151	448	84	processing	2021-02-05 00:00:00	2021-01-09 00:00:00	24
4152	169	13	processing	2021-01-16 00:00:00	2021-01-10 00:00:00	85
4153	265	69	shipped	2021-01-22 00:00:00	2021-01-10 00:00:00	29
4154	545	57	completed	2021-02-07 00:00:00	2021-01-10 00:00:00	3
4155	382	82	completed	2021-01-13 00:00:00	2021-01-10 00:00:00	59
4156	251	49	shipped	2021-01-29 00:00:00	2021-01-10 00:00:00	50
4157	282	83	shipped	2021-02-06 00:00:00	2021-01-10 00:00:00	29
4158	217	38	completed	2021-01-24 00:00:00	2021-01-10 00:00:00	50
4159	662	44	completed	2021-01-16 00:00:00	2021-01-10 00:00:00	3
4160	30	15	shipped	2021-01-16 00:00:00	2021-01-10 00:00:00	81
4161	316	19	processing	2021-01-28 00:00:00	2021-01-10 00:00:00	38
4162	17	83	completed	2021-01-30 00:00:00	2021-01-10 00:00:00	44
4163	358	27	shipped	2021-01-25 00:00:00	2021-01-10 00:00:00	74
4164	316	46	shipped	2021-02-02 00:00:00	2021-01-10 00:00:00	74
4165	675	20	shipped	2021-01-14 00:00:00	2021-01-11 00:00:00	96
4166	400	56	completed	2021-02-01 00:00:00	2021-01-11 00:00:00	19
4167	311	32	completed	2021-01-15 00:00:00	2021-01-11 00:00:00	27
4168	614	8	processing	2021-01-22 00:00:00	2021-01-12 00:00:00	43
4169	175	63	completed	2021-01-30 00:00:00	2021-01-12 00:00:00	75
4170	700	86	completed	2021-02-10 00:00:00	2021-01-12 00:00:00	76
4171	669	2	shipped	2021-02-06 00:00:00	2021-01-12 00:00:00	52
4172	253	23	processing	2021-01-29 00:00:00	2021-01-12 00:00:00	15
4173	484	30	shipped	2021-02-09 00:00:00	2021-01-12 00:00:00	64
4174	184	9	shipped	2021-02-11 00:00:00	2021-01-12 00:00:00	73
4175	594	98	completed	2021-02-10 00:00:00	2021-01-12 00:00:00	29
4176	183	16	completed	2021-01-21 00:00:00	2021-01-12 00:00:00	86
4177	564	53	shipped	2021-01-17 00:00:00	2021-01-13 00:00:00	95
4178	556	47	shipped	2021-02-04 00:00:00	2021-01-13 00:00:00	59
4179	352	6	processing	2021-01-19 00:00:00	2021-01-13 00:00:00	37
4180	404	79	shipped	2021-02-01 00:00:00	2021-01-13 00:00:00	35
4181	646	22	shipped	2021-02-09 00:00:00	2021-01-13 00:00:00	95
4182	480	5	shipped	2021-02-07 00:00:00	2021-01-13 00:00:00	49
4183	31	10	processing	2021-01-17 00:00:00	2021-01-13 00:00:00	41
4184	303	93	shipped	2021-01-14 00:00:00	2021-01-13 00:00:00	60
4185	10	6	processing	2021-01-21 00:00:00	2021-01-13 00:00:00	73
4186	9	27	processing	2021-01-18 00:00:00	2021-01-14 00:00:00	43
4187	291	74	completed	2021-02-10 00:00:00	2021-01-15 00:00:00	94
4188	513	98	shipped	2021-02-12 00:00:00	2021-01-15 00:00:00	81
4189	302	74	completed	2021-02-02 00:00:00	2021-01-15 00:00:00	21
4190	544	32	completed	2021-02-02 00:00:00	2021-01-15 00:00:00	36
4191	391	72	completed	2021-02-03 00:00:00	2021-01-15 00:00:00	42
4192	274	72	shipped	2021-02-09 00:00:00	2021-01-15 00:00:00	42
4193	635	75	processing	2021-01-19 00:00:00	2021-01-15 00:00:00	51
4194	311	73	completed	2021-02-02 00:00:00	2021-01-16 00:00:00	86
4195	303	90	shipped	2021-02-04 00:00:00	2021-01-16 00:00:00	4
4196	360	57	processing	2021-01-18 00:00:00	2021-01-16 00:00:00	70
4197	465	79	shipped	2021-02-01 00:00:00	2021-01-17 00:00:00	78
4198	500	57	completed	2021-01-23 00:00:00	2021-01-17 00:00:00	28
4199	308	30	shipped	2021-02-07 00:00:00	2021-01-17 00:00:00	5
4200	59	82	shipped	2021-01-23 00:00:00	2021-01-17 00:00:00	28
4201	326	100	processing	2021-02-15 00:00:00	2021-01-18 00:00:00	29
4202	282	94	shipped	2021-02-16 00:00:00	2021-01-18 00:00:00	45
4203	658	45	shipped	2021-01-25 00:00:00	2021-01-18 00:00:00	44
4204	519	53	shipped	2021-02-17 00:00:00	2021-01-18 00:00:00	20
4205	137	34	processing	2021-02-13 00:00:00	2021-01-18 00:00:00	55
4206	699	73	shipped	2021-01-20 00:00:00	2021-01-19 00:00:00	56
4207	106	98	processing	2021-02-10 00:00:00	2021-01-20 00:00:00	30
4208	528	87	completed	2021-02-09 00:00:00	2021-01-20 00:00:00	4
4209	232	75	processing	2021-02-01 00:00:00	2021-01-20 00:00:00	91
4210	148	96	processing	2021-01-28 00:00:00	2021-01-21 00:00:00	84
4211	39	93	completed	2021-01-31 00:00:00	2021-01-21 00:00:00	89
4212	65	97	completed	2021-02-17 00:00:00	2021-01-21 00:00:00	14
4213	546	63	completed	2021-02-13 00:00:00	2021-01-22 00:00:00	52
4214	236	60	processing	2021-02-21 00:00:00	2021-01-22 00:00:00	73
4215	183	67	completed	2021-01-27 00:00:00	2021-01-22 00:00:00	67
4216	630	22	shipped	2021-01-24 00:00:00	2021-01-23 00:00:00	55
4217	222	20	shipped	2021-02-01 00:00:00	2021-01-24 00:00:00	80
4218	235	98	completed	2021-02-19 00:00:00	2021-01-24 00:00:00	41
4219	179	67	shipped	2021-02-01 00:00:00	2021-01-24 00:00:00	95
4220	335	49	shipped	2021-02-06 00:00:00	2021-01-24 00:00:00	23
4221	443	16	completed	2021-02-18 00:00:00	2021-01-24 00:00:00	77
4222	238	5	shipped	2021-01-30 00:00:00	2021-01-24 00:00:00	80
4223	38	33	shipped	2021-02-12 00:00:00	2021-01-24 00:00:00	82
4224	176	77	shipped	2021-01-31 00:00:00	2021-01-24 00:00:00	22
4225	101	46	processing	2021-01-26 00:00:00	2021-01-24 00:00:00	6
4226	328	89	shipped	2021-02-20 00:00:00	2021-01-24 00:00:00	51
4227	209	61	completed	2021-01-26 00:00:00	2021-01-24 00:00:00	28
4228	578	76	completed	2021-02-13 00:00:00	2021-01-24 00:00:00	44
4229	23	18	completed	2021-02-01 00:00:00	2021-01-24 00:00:00	22
4230	77	18	completed	2021-02-08 00:00:00	2021-01-24 00:00:00	56
4231	167	67	shipped	2021-02-14 00:00:00	2021-01-25 00:00:00	76
4232	510	45	processing	2021-02-20 00:00:00	2021-01-25 00:00:00	17
4233	196	68	completed	2021-02-04 00:00:00	2021-01-26 00:00:00	28
4234	224	58	shipped	2021-02-15 00:00:00	2021-01-26 00:00:00	30
4235	379	69	completed	2021-02-03 00:00:00	2021-01-26 00:00:00	59
4236	326	35	processing	2021-02-20 00:00:00	2021-01-26 00:00:00	48
4237	395	72	shipped	2021-02-10 00:00:00	2021-01-26 00:00:00	4
4238	44	47	processing	2021-02-25 00:00:00	2021-01-26 00:00:00	5
4239	643	39	shipped	2021-02-13 00:00:00	2021-01-26 00:00:00	12
4240	381	73	processing	2021-02-04 00:00:00	2021-01-27 00:00:00	67
4241	435	9	shipped	2021-02-07 00:00:00	2021-01-28 00:00:00	14
4242	267	33	processing	2021-02-16 00:00:00	2021-01-28 00:00:00	70
4243	486	28	processing	2021-02-16 00:00:00	2021-01-28 00:00:00	68
4244	121	17	completed	2021-02-05 00:00:00	2021-01-28 00:00:00	59
4245	217	32	shipped	2021-02-27 00:00:00	2021-01-28 00:00:00	73
4246	529	80	shipped	2021-02-14 00:00:00	2021-01-28 00:00:00	1
4247	164	40	processing	2021-02-08 00:00:00	2021-01-28 00:00:00	62
4248	178	25	shipped	2021-01-29 00:00:00	2021-01-28 00:00:00	23
4249	48	27	shipped	2021-02-19 00:00:00	2021-01-29 00:00:00	79
4250	54	85	processing	2021-02-15 00:00:00	2021-01-29 00:00:00	44
4251	437	70	processing	2021-02-07 00:00:00	2021-01-29 00:00:00	20
4252	212	87	processing	2021-02-25 00:00:00	2021-01-29 00:00:00	56
4253	71	62	shipped	2021-02-18 00:00:00	2021-01-29 00:00:00	42
4254	525	32	shipped	2021-02-10 00:00:00	2021-01-29 00:00:00	3
4255	117	26	completed	2021-02-04 00:00:00	2021-01-29 00:00:00	19
4256	663	19	shipped	2021-02-19 00:00:00	2021-01-29 00:00:00	25
4257	314	6	processing	2021-02-18 00:00:00	2021-01-29 00:00:00	9
4258	226	9	processing	2021-02-25 00:00:00	2021-01-30 00:00:00	9
4259	626	67	shipped	2021-02-15 00:00:00	2021-01-30 00:00:00	51
4260	174	58	shipped	2021-02-10 00:00:00	2021-01-30 00:00:00	12
4261	518	82	completed	2021-03-02 00:00:00	2021-01-31 00:00:00	80
4262	211	41	processing	2021-03-02 00:00:00	2021-01-31 00:00:00	13
4263	186	82	completed	2021-02-25 00:00:00	2021-01-31 00:00:00	58
4264	385	2	completed	2021-02-12 00:00:00	2021-02-01 00:00:00	91
4265	230	74	shipped	2021-02-02 00:00:00	2021-02-01 00:00:00	89
4266	676	100	processing	2021-02-15 00:00:00	2021-02-01 00:00:00	94
4267	594	87	processing	2021-02-08 00:00:00	2021-02-01 00:00:00	88
4268	175	11	processing	2021-02-14 00:00:00	2021-02-01 00:00:00	47
4269	667	93	processing	2021-02-09 00:00:00	2021-02-01 00:00:00	32
4270	633	80	shipped	2021-02-25 00:00:00	2021-02-01 00:00:00	71
4271	472	2	completed	2021-03-02 00:00:00	2021-02-01 00:00:00	27
4272	493	43	shipped	2021-02-07 00:00:00	2021-02-01 00:00:00	70
4273	627	14	shipped	2021-02-28 00:00:00	2021-02-02 00:00:00	21
4274	197	1	processing	2021-02-16 00:00:00	2021-02-02 00:00:00	77
4275	497	61	completed	2021-02-24 00:00:00	2021-02-02 00:00:00	31
4276	410	50	processing	2021-03-05 00:00:00	2021-02-03 00:00:00	59
4277	618	29	completed	2021-02-22 00:00:00	2021-02-03 00:00:00	27
4278	79	70	completed	2021-02-13 00:00:00	2021-02-03 00:00:00	66
4279	200	41	processing	2021-02-06 00:00:00	2021-02-03 00:00:00	80
4280	140	16	processing	2021-02-14 00:00:00	2021-02-03 00:00:00	55
4281	85	29	processing	2021-02-22 00:00:00	2021-02-04 00:00:00	62
4282	294	65	shipped	2021-02-22 00:00:00	2021-02-04 00:00:00	90
4283	442	75	shipped	2021-02-10 00:00:00	2021-02-04 00:00:00	32
4284	490	58	shipped	2021-02-11 00:00:00	2021-02-04 00:00:00	48
4285	427	8	completed	2021-02-11 00:00:00	2021-02-04 00:00:00	47
4286	2	54	shipped	2021-02-05 00:00:00	2021-02-04 00:00:00	13
4287	106	65	completed	2021-02-28 00:00:00	2021-02-04 00:00:00	18
4288	627	50	shipped	2021-03-02 00:00:00	2021-02-04 00:00:00	31
4289	112	27	shipped	2021-02-05 00:00:00	2021-02-04 00:00:00	1
4290	56	73	processing	2021-02-17 00:00:00	2021-02-04 00:00:00	56
4291	192	50	shipped	2021-02-28 00:00:00	2021-02-04 00:00:00	55
4292	517	53	completed	2021-03-06 00:00:00	2021-02-04 00:00:00	71
4293	547	22	processing	2021-02-18 00:00:00	2021-02-04 00:00:00	30
4294	60	99	completed	2021-02-12 00:00:00	2021-02-04 00:00:00	94
4295	557	15	completed	2021-02-21 00:00:00	2021-02-04 00:00:00	51
4296	528	74	processing	2021-03-02 00:00:00	2021-02-04 00:00:00	2
4297	574	81	shipped	2021-02-23 00:00:00	2021-02-04 00:00:00	43
4298	346	62	completed	2021-03-03 00:00:00	2021-02-04 00:00:00	80
4299	200	71	completed	2021-02-20 00:00:00	2021-02-04 00:00:00	55
4300	277	37	shipped	2021-02-17 00:00:00	2021-02-04 00:00:00	15
4301	388	86	completed	2021-03-03 00:00:00	2021-02-04 00:00:00	82
4302	39	44	completed	2021-02-21 00:00:00	2021-02-04 00:00:00	41
4303	627	39	completed	2021-02-26 00:00:00	2021-02-05 00:00:00	69
4304	52	98	shipped	2021-02-18 00:00:00	2021-02-05 00:00:00	94
4305	344	39	shipped	2021-02-14 00:00:00	2021-02-06 00:00:00	29
4306	475	22	processing	2021-03-09 00:00:00	2021-02-07 00:00:00	24
4307	182	36	processing	2021-02-24 00:00:00	2021-02-07 00:00:00	23
4308	232	27	completed	2021-02-26 00:00:00	2021-02-07 00:00:00	53
4309	18	53	processing	2021-03-04 00:00:00	2021-02-07 00:00:00	5
4310	7	14	completed	2021-03-02 00:00:00	2021-02-07 00:00:00	78
4311	426	66	processing	2021-02-28 00:00:00	2021-02-07 00:00:00	81
4312	41	91	shipped	2021-02-09 00:00:00	2021-02-07 00:00:00	64
4313	166	61	completed	2021-03-08 00:00:00	2021-02-08 00:00:00	21
4314	443	60	completed	2021-03-02 00:00:00	2021-02-08 00:00:00	32
4315	453	43	processing	2021-02-14 00:00:00	2021-02-08 00:00:00	50
4316	561	29	shipped	2021-03-10 00:00:00	2021-02-08 00:00:00	55
4317	322	36	completed	2021-02-16 00:00:00	2021-02-08 00:00:00	33
4318	303	66	completed	2021-03-02 00:00:00	2021-02-08 00:00:00	54
4319	124	53	shipped	2021-02-25 00:00:00	2021-02-08 00:00:00	48
4320	662	16	shipped	2021-03-09 00:00:00	2021-02-08 00:00:00	54
4321	404	54	shipped	2021-02-21 00:00:00	2021-02-09 00:00:00	69
4322	689	92	processing	2021-02-17 00:00:00	2021-02-09 00:00:00	100
4323	435	91	processing	2021-03-09 00:00:00	2021-02-09 00:00:00	55
4324	97	72	processing	2021-02-27 00:00:00	2021-02-09 00:00:00	8
4325	526	93	shipped	2021-02-20 00:00:00	2021-02-09 00:00:00	60
4326	612	81	completed	2021-02-22 00:00:00	2021-02-09 00:00:00	60
4327	467	59	completed	2021-03-02 00:00:00	2021-02-09 00:00:00	42
4328	423	74	completed	2021-02-10 00:00:00	2021-02-09 00:00:00	97
4329	130	40	shipped	2021-03-10 00:00:00	2021-02-09 00:00:00	82
4330	223	18	processing	2021-03-09 00:00:00	2021-02-09 00:00:00	34
4331	401	11	completed	2021-02-13 00:00:00	2021-02-09 00:00:00	17
4332	685	68	processing	2021-03-04 00:00:00	2021-02-09 00:00:00	16
4333	374	61	completed	2021-03-07 00:00:00	2021-02-09 00:00:00	96
4334	242	73	processing	2021-02-17 00:00:00	2021-02-10 00:00:00	35
4335	174	38	shipped	2021-02-28 00:00:00	2021-02-10 00:00:00	26
4336	376	99	shipped	2021-02-19 00:00:00	2021-02-11 00:00:00	90
4337	684	77	completed	2021-02-22 00:00:00	2021-02-11 00:00:00	43
4338	179	91	shipped	2021-02-12 00:00:00	2021-02-11 00:00:00	41
4339	159	48	shipped	2021-03-03 00:00:00	2021-02-11 00:00:00	21
4340	225	10	processing	2021-02-14 00:00:00	2021-02-11 00:00:00	72
4341	282	52	shipped	2021-03-12 00:00:00	2021-02-12 00:00:00	19
4342	530	88	completed	2021-02-24 00:00:00	2021-02-12 00:00:00	38
4343	665	78	processing	2021-02-24 00:00:00	2021-02-12 00:00:00	34
4344	205	73	shipped	2021-02-13 00:00:00	2021-02-12 00:00:00	8
4345	380	44	completed	2021-02-14 00:00:00	2021-02-13 00:00:00	61
4346	680	32	shipped	2021-02-26 00:00:00	2021-02-13 00:00:00	49
4347	288	81	shipped	2021-02-15 00:00:00	2021-02-13 00:00:00	91
4348	99	67	completed	2021-03-08 00:00:00	2021-02-13 00:00:00	21
4349	53	12	completed	2021-02-22 00:00:00	2021-02-14 00:00:00	72
4350	54	99	completed	2021-03-07 00:00:00	2021-02-14 00:00:00	16
4351	54	57	shipped	2021-02-24 00:00:00	2021-02-14 00:00:00	87
4352	258	6	processing	2021-02-25 00:00:00	2021-02-14 00:00:00	75
4353	686	13	completed	2021-03-03 00:00:00	2021-02-14 00:00:00	50
4354	397	29	shipped	2021-03-14 00:00:00	2021-02-14 00:00:00	28
4355	524	50	completed	2021-02-24 00:00:00	2021-02-14 00:00:00	32
4356	78	87	processing	2021-02-16 00:00:00	2021-02-15 00:00:00	11
4357	82	9	shipped	2021-03-10 00:00:00	2021-02-15 00:00:00	100
4358	264	93	processing	2021-02-25 00:00:00	2021-02-15 00:00:00	90
4359	584	84	completed	2021-03-05 00:00:00	2021-02-15 00:00:00	25
4360	276	66	processing	2021-03-07 00:00:00	2021-02-15 00:00:00	1
4361	119	11	processing	2021-03-15 00:00:00	2021-02-16 00:00:00	53
4362	453	65	shipped	2021-03-13 00:00:00	2021-02-16 00:00:00	8
4363	467	63	completed	2021-02-27 00:00:00	2021-02-17 00:00:00	81
4364	116	93	shipped	2021-03-17 00:00:00	2021-02-17 00:00:00	53
4365	446	2	shipped	2021-02-24 00:00:00	2021-02-17 00:00:00	68
4366	26	36	shipped	2021-03-18 00:00:00	2021-02-18 00:00:00	56
4367	524	23	shipped	2021-02-24 00:00:00	2021-02-18 00:00:00	10
4368	49	37	processing	2021-02-26 00:00:00	2021-02-18 00:00:00	3
4369	602	37	processing	2021-02-24 00:00:00	2021-02-18 00:00:00	81
4370	536	19	completed	2021-02-24 00:00:00	2021-02-18 00:00:00	78
4371	475	30	shipped	2021-03-14 00:00:00	2021-02-19 00:00:00	65
4372	433	55	completed	2021-03-07 00:00:00	2021-02-19 00:00:00	35
4373	589	8	shipped	2021-02-21 00:00:00	2021-02-19 00:00:00	97
4374	523	99	shipped	2021-03-06 00:00:00	2021-02-19 00:00:00	1
4375	188	67	shipped	2021-03-06 00:00:00	2021-02-19 00:00:00	34
4376	289	53	completed	2021-03-21 00:00:00	2021-02-19 00:00:00	55
4377	526	69	processing	2021-03-14 00:00:00	2021-02-20 00:00:00	30
4378	247	18	processing	2021-03-20 00:00:00	2021-02-20 00:00:00	54
4379	228	96	shipped	2021-03-05 00:00:00	2021-02-20 00:00:00	19
4380	262	77	processing	2021-02-26 00:00:00	2021-02-20 00:00:00	92
4381	431	29	completed	2021-02-25 00:00:00	2021-02-21 00:00:00	92
4382	19	27	completed	2021-03-01 00:00:00	2021-02-21 00:00:00	23
4383	128	91	completed	2021-03-04 00:00:00	2021-02-22 00:00:00	50
4384	294	16	processing	2021-03-13 00:00:00	2021-02-22 00:00:00	48
4385	262	60	shipped	2021-03-16 00:00:00	2021-02-22 00:00:00	25
4386	492	79	shipped	2021-03-23 00:00:00	2021-02-22 00:00:00	65
4387	294	41	processing	2021-03-08 00:00:00	2021-02-23 00:00:00	52
4388	526	72	processing	2021-03-21 00:00:00	2021-02-23 00:00:00	79
4389	178	76	processing	2021-03-05 00:00:00	2021-02-23 00:00:00	81
4390	689	59	processing	2021-03-20 00:00:00	2021-02-23 00:00:00	26
4391	294	65	completed	2021-03-09 00:00:00	2021-02-24 00:00:00	91
4392	19	19	processing	2021-02-28 00:00:00	2021-02-24 00:00:00	8
4393	230	4	completed	2021-03-17 00:00:00	2021-02-25 00:00:00	82
4394	215	20	completed	2021-03-09 00:00:00	2021-02-25 00:00:00	74
4395	345	50	processing	2021-03-19 00:00:00	2021-02-25 00:00:00	82
4396	198	38	shipped	2021-03-22 00:00:00	2021-02-25 00:00:00	44
4397	596	40	shipped	2021-03-23 00:00:00	2021-02-26 00:00:00	8
4398	202	2	processing	2021-03-13 00:00:00	2021-02-26 00:00:00	32
4399	394	76	processing	2021-03-12 00:00:00	2021-02-27 00:00:00	32
4400	390	21	completed	2021-03-24 00:00:00	2021-02-27 00:00:00	34
4401	398	34	shipped	2021-03-12 00:00:00	2021-02-27 00:00:00	63
4402	201	80	completed	2021-03-13 00:00:00	2021-02-28 00:00:00	51
4403	192	1	shipped	2021-03-21 00:00:00	2021-02-28 00:00:00	8
4404	253	28	completed	2021-03-17 00:00:00	2021-02-28 00:00:00	11
4405	422	97	processing	2021-03-23 00:00:00	2021-02-28 00:00:00	70
4406	677	59	completed	2021-03-10 00:00:00	2021-02-28 00:00:00	48
4407	47	85	shipped	2021-03-08 00:00:00	2021-02-28 00:00:00	52
4408	261	62	shipped	2021-03-26 00:00:00	2021-02-28 00:00:00	6
4409	92	93	shipped	2021-03-16 00:00:00	2021-02-28 00:00:00	76
4410	383	92	shipped	2021-03-03 00:00:00	2021-02-28 00:00:00	78
4411	175	37	shipped	2021-03-06 00:00:00	2021-03-01 00:00:00	5
4412	118	25	processing	2021-03-06 00:00:00	2021-03-01 00:00:00	28
4413	614	94	processing	2021-03-25 00:00:00	2021-03-01 00:00:00	1
4414	35	12	shipped	2021-03-27 00:00:00	2021-03-01 00:00:00	38
4415	589	73	completed	2021-03-23 00:00:00	2021-03-01 00:00:00	13
4416	388	24	processing	2021-03-26 00:00:00	2021-03-02 00:00:00	17
4417	426	85	shipped	2021-03-19 00:00:00	2021-03-03 00:00:00	11
4418	125	9	shipped	2021-03-23 00:00:00	2021-03-03 00:00:00	68
4419	318	27	completed	2021-03-29 00:00:00	2021-03-03 00:00:00	51
4420	171	61	completed	2021-03-05 00:00:00	2021-03-04 00:00:00	53
4421	312	48	processing	2021-03-27 00:00:00	2021-03-05 00:00:00	60
4422	548	74	processing	2021-03-10 00:00:00	2021-03-05 00:00:00	88
4423	14	6	shipped	2021-03-13 00:00:00	2021-03-05 00:00:00	96
4424	408	20	completed	2021-04-03 00:00:00	2021-03-05 00:00:00	78
4425	9	92	completed	2021-03-15 00:00:00	2021-03-06 00:00:00	29
4426	54	81	completed	2021-03-13 00:00:00	2021-03-06 00:00:00	6
4427	299	85	shipped	2021-03-15 00:00:00	2021-03-06 00:00:00	28
4428	236	79	shipped	2021-03-16 00:00:00	2021-03-06 00:00:00	7
4429	675	31	processing	2021-03-18 00:00:00	2021-03-07 00:00:00	35
4430	99	40	shipped	2021-03-22 00:00:00	2021-03-07 00:00:00	20
4431	372	88	processing	2021-03-12 00:00:00	2021-03-07 00:00:00	42
4432	20	53	shipped	2021-03-10 00:00:00	2021-03-07 00:00:00	49
4433	496	61	shipped	2021-03-09 00:00:00	2021-03-07 00:00:00	41
4434	396	87	processing	2021-03-20 00:00:00	2021-03-07 00:00:00	71
4435	142	28	shipped	2021-03-20 00:00:00	2021-03-07 00:00:00	18
4436	248	45	processing	2021-03-11 00:00:00	2021-03-08 00:00:00	21
4437	670	32	completed	2021-03-23 00:00:00	2021-03-08 00:00:00	42
4438	34	57	completed	2021-03-31 00:00:00	2021-03-08 00:00:00	17
4439	245	8	processing	2021-03-29 00:00:00	2021-03-08 00:00:00	58
4440	418	41	shipped	2021-03-09 00:00:00	2021-03-08 00:00:00	31
4441	178	75	shipped	2021-03-18 00:00:00	2021-03-08 00:00:00	66
4442	124	23	processing	2021-03-31 00:00:00	2021-03-08 00:00:00	22
4443	93	2	completed	2021-04-03 00:00:00	2021-03-08 00:00:00	46
4444	271	27	processing	2021-03-16 00:00:00	2021-03-09 00:00:00	74
4445	649	90	completed	2021-03-17 00:00:00	2021-03-10 00:00:00	40
4446	481	20	completed	2021-04-05 00:00:00	2021-03-11 00:00:00	92
4447	331	69	completed	2021-03-18 00:00:00	2021-03-11 00:00:00	80
4448	645	80	shipped	2021-03-14 00:00:00	2021-03-11 00:00:00	51
4449	680	76	completed	2021-03-22 00:00:00	2021-03-11 00:00:00	94
4450	35	43	processing	2021-03-22 00:00:00	2021-03-11 00:00:00	65
4451	401	87	shipped	2021-03-28 00:00:00	2021-03-11 00:00:00	98
4452	55	39	completed	2021-04-08 00:00:00	2021-03-11 00:00:00	66
4453	106	57	shipped	2021-03-17 00:00:00	2021-03-12 00:00:00	14
4454	111	40	completed	2021-03-18 00:00:00	2021-03-12 00:00:00	85
4455	698	43	completed	2021-03-17 00:00:00	2021-03-12 00:00:00	1
4456	199	40	shipped	2021-04-04 00:00:00	2021-03-13 00:00:00	51
4457	71	56	completed	2021-03-28 00:00:00	2021-03-13 00:00:00	12
4458	375	10	shipped	2021-03-17 00:00:00	2021-03-13 00:00:00	89
4459	155	82	completed	2021-03-15 00:00:00	2021-03-13 00:00:00	84
4460	11	25	shipped	2021-03-15 00:00:00	2021-03-13 00:00:00	78
4461	138	58	processing	2021-03-19 00:00:00	2021-03-13 00:00:00	93
4462	676	4	completed	2021-03-25 00:00:00	2021-03-13 00:00:00	63
4463	700	49	processing	2021-03-22 00:00:00	2021-03-13 00:00:00	94
4464	142	92	shipped	2021-03-23 00:00:00	2021-03-13 00:00:00	2
4465	514	26	processing	2021-04-09 00:00:00	2021-03-14 00:00:00	93
4466	164	32	shipped	2021-03-25 00:00:00	2021-03-14 00:00:00	74
4467	528	16	completed	2021-03-29 00:00:00	2021-03-14 00:00:00	33
4468	685	53	processing	2021-03-20 00:00:00	2021-03-14 00:00:00	39
4469	539	14	completed	2021-03-21 00:00:00	2021-03-14 00:00:00	22
4470	338	48	shipped	2021-03-28 00:00:00	2021-03-14 00:00:00	53
4471	382	29	processing	2021-04-12 00:00:00	2021-03-14 00:00:00	93
4472	601	55	shipped	2021-03-29 00:00:00	2021-03-14 00:00:00	16
4473	39	34	completed	2021-04-09 00:00:00	2021-03-14 00:00:00	65
4474	500	33	shipped	2021-04-10 00:00:00	2021-03-14 00:00:00	88
4475	173	72	processing	2021-04-06 00:00:00	2021-03-14 00:00:00	38
4476	223	87	completed	2021-04-03 00:00:00	2021-03-14 00:00:00	37
4477	228	79	shipped	2021-03-28 00:00:00	2021-03-15 00:00:00	93
4478	115	47	completed	2021-03-25 00:00:00	2021-03-15 00:00:00	1
4479	502	46	shipped	2021-04-07 00:00:00	2021-03-15 00:00:00	2
4482	320	86	shipped	2021-04-13 00:00:00	2021-03-15 00:00:00	28
4483	538	77	processing	2021-04-01 00:00:00	2021-03-15 00:00:00	1
4484	602	98	completed	2021-03-23 00:00:00	2021-03-15 00:00:00	62
4485	370	71	shipped	2021-04-03 00:00:00	2021-03-15 00:00:00	61
4486	693	42	shipped	2021-03-23 00:00:00	2021-03-15 00:00:00	84
4487	270	97	completed	2021-04-10 00:00:00	2021-03-15 00:00:00	84
4488	282	40	processing	2021-04-02 00:00:00	2021-03-15 00:00:00	39
4489	686	4	completed	2021-04-15 00:00:00	2021-03-16 00:00:00	9
4490	335	68	shipped	2021-03-19 00:00:00	2021-03-16 00:00:00	55
4491	644	51	shipped	2021-04-01 00:00:00	2021-03-16 00:00:00	54
4492	372	61	processing	2021-03-26 00:00:00	2021-03-16 00:00:00	49
4493	450	88	processing	2021-03-31 00:00:00	2021-03-16 00:00:00	31
4494	456	18	completed	2021-03-26 00:00:00	2021-03-16 00:00:00	29
4495	353	49	completed	2021-04-12 00:00:00	2021-03-16 00:00:00	100
4496	23	69	completed	2021-03-19 00:00:00	2021-03-16 00:00:00	59
4497	300	35	processing	2021-03-31 00:00:00	2021-03-16 00:00:00	68
4498	95	98	shipped	2021-04-06 00:00:00	2021-03-16 00:00:00	53
4499	154	43	shipped	2021-04-09 00:00:00	2021-03-16 00:00:00	35
4500	315	60	shipped	2021-03-31 00:00:00	2021-03-16 00:00:00	53
4501	350	5	processing	2021-04-08 00:00:00	2021-03-17 00:00:00	53
4502	411	42	shipped	2021-03-27 00:00:00	2021-03-17 00:00:00	21
4503	616	13	processing	2021-04-13 00:00:00	2021-03-17 00:00:00	86
4504	280	97	completed	2021-03-24 00:00:00	2021-03-17 00:00:00	14
4505	199	57	shipped	2021-03-21 00:00:00	2021-03-17 00:00:00	63
4506	589	25	completed	2021-03-29 00:00:00	2021-03-17 00:00:00	70
4507	5	55	shipped	2021-03-24 00:00:00	2021-03-18 00:00:00	87
4508	390	59	shipped	2021-03-29 00:00:00	2021-03-18 00:00:00	48
4509	196	30	processing	2021-04-02 00:00:00	2021-03-18 00:00:00	59
4510	124	84	completed	2021-04-03 00:00:00	2021-03-19 00:00:00	42
4511	4	85	processing	2021-04-18 00:00:00	2021-03-19 00:00:00	92
4512	131	79	processing	2021-04-10 00:00:00	2021-03-19 00:00:00	96
4513	629	81	processing	2021-04-02 00:00:00	2021-03-19 00:00:00	58
4514	569	20	completed	2021-03-24 00:00:00	2021-03-19 00:00:00	17
4515	403	13	shipped	2021-03-23 00:00:00	2021-03-19 00:00:00	91
4516	638	74	processing	2021-04-01 00:00:00	2021-03-19 00:00:00	79
4517	575	62	processing	2021-04-06 00:00:00	2021-03-20 00:00:00	54
4518	10	67	shipped	2021-03-24 00:00:00	2021-03-20 00:00:00	62
4519	3	34	completed	2021-04-12 00:00:00	2021-03-21 00:00:00	100
4520	506	73	processing	2021-04-17 00:00:00	2021-03-21 00:00:00	8
4521	454	52	processing	2021-04-02 00:00:00	2021-03-21 00:00:00	5
4522	350	46	shipped	2021-04-06 00:00:00	2021-03-21 00:00:00	68
4523	562	57	shipped	2021-04-02 00:00:00	2021-03-21 00:00:00	66
4524	331	19	shipped	2021-04-05 00:00:00	2021-03-21 00:00:00	89
4525	663	19	completed	2021-03-27 00:00:00	2021-03-21 00:00:00	96
4526	516	89	shipped	2021-03-25 00:00:00	2021-03-21 00:00:00	71
4527	417	98	completed	2021-03-27 00:00:00	2021-03-21 00:00:00	39
4528	647	67	completed	2021-03-22 00:00:00	2021-03-21 00:00:00	58
4529	258	92	shipped	2021-04-02 00:00:00	2021-03-22 00:00:00	88
4530	204	52	completed	2021-03-30 00:00:00	2021-03-22 00:00:00	58
4531	30	4	completed	2021-03-25 00:00:00	2021-03-23 00:00:00	51
4532	283	48	completed	2021-04-10 00:00:00	2021-03-23 00:00:00	57
4533	42	46	shipped	2021-04-08 00:00:00	2021-03-23 00:00:00	79
4534	663	29	shipped	2021-04-06 00:00:00	2021-03-23 00:00:00	9
4535	247	32	processing	2021-03-27 00:00:00	2021-03-23 00:00:00	6
4536	451	72	processing	2021-04-11 00:00:00	2021-03-23 00:00:00	55
4537	385	51	processing	2021-04-10 00:00:00	2021-03-24 00:00:00	49
4538	63	17	shipped	2021-04-14 00:00:00	2021-03-24 00:00:00	70
4539	692	23	shipped	2021-03-28 00:00:00	2021-03-24 00:00:00	71
4540	383	11	completed	2021-04-17 00:00:00	2021-03-24 00:00:00	8
4541	213	7	completed	2021-04-03 00:00:00	2021-03-24 00:00:00	86
4542	90	44	shipped	2021-03-29 00:00:00	2021-03-24 00:00:00	98
4543	397	6	shipped	2021-04-03 00:00:00	2021-03-24 00:00:00	21
4544	392	87	completed	2021-04-06 00:00:00	2021-03-24 00:00:00	38
4545	23	60	completed	2021-03-27 00:00:00	2021-03-25 00:00:00	31
4546	389	57	shipped	2021-04-05 00:00:00	2021-03-26 00:00:00	42
4547	293	17	shipped	2021-04-15 00:00:00	2021-03-26 00:00:00	56
4548	566	30	shipped	2021-04-06 00:00:00	2021-03-26 00:00:00	2
4549	335	97	processing	2021-04-22 00:00:00	2021-03-26 00:00:00	87
4550	287	97	shipped	2021-04-10 00:00:00	2021-03-26 00:00:00	14
4551	576	92	completed	2021-04-12 00:00:00	2021-03-26 00:00:00	41
4552	544	14	completed	2021-04-15 00:00:00	2021-03-26 00:00:00	87
4553	238	35	processing	2021-04-09 00:00:00	2021-03-27 00:00:00	5
4554	521	81	shipped	2021-04-17 00:00:00	2021-03-27 00:00:00	66
4555	195	31	processing	2021-04-08 00:00:00	2021-03-27 00:00:00	33
4556	698	65	shipped	2021-03-28 00:00:00	2021-03-27 00:00:00	68
4557	343	75	processing	2021-03-29 00:00:00	2021-03-27 00:00:00	31
4558	626	11	processing	2021-04-10 00:00:00	2021-03-28 00:00:00	7
4559	547	64	shipped	2021-04-22 00:00:00	2021-03-28 00:00:00	28
4480	282	76	completed	2021-04-04 00:00:00	2021-03-15 00:00:00	32
4481	441	66	shipped	2021-04-14 00:00:00	2021-03-15 00:00:00	57
4560	576	26	processing	2021-04-10 00:00:00	2021-03-28 00:00:00	32
4561	332	38	completed	2021-03-31 00:00:00	2021-03-28 00:00:00	39
4562	623	55	shipped	2021-04-20 00:00:00	2021-03-28 00:00:00	93
4569	115	44	processing	2021-04-03 00:00:00	2021-03-29 00:00:00	23
4570	605	69	shipped	2021-04-20 00:00:00	2021-03-29 00:00:00	48
4571	600	82	completed	2021-04-01 00:00:00	2021-03-29 00:00:00	75
4572	481	72	shipped	2021-04-08 00:00:00	2021-03-29 00:00:00	29
4575	206	93	processing	2021-04-07 00:00:00	2021-03-29 00:00:00	95
4576	163	51	shipped	2021-04-14 00:00:00	2021-03-29 00:00:00	90
4578	464	18	processing	2021-04-24 00:00:00	2021-03-30 00:00:00	8
4583	687	12	completed	2021-04-12 00:00:00	2021-04-01 00:00:00	88
4585	289	26	processing	2021-04-26 00:00:00	2021-04-01 00:00:00	97
4586	218	82	shipped	2021-04-29 00:00:00	2021-04-01 00:00:00	90
4588	147	33	processing	2021-04-22 00:00:00	2021-04-01 00:00:00	32
4589	103	37	shipped	2021-04-15 00:00:00	2021-04-02 00:00:00	87
4590	203	60	shipped	2021-04-29 00:00:00	2021-04-02 00:00:00	49
4591	491	66	processing	2021-04-27 00:00:00	2021-04-03 00:00:00	30
4592	654	14	completed	2021-04-12 00:00:00	2021-04-03 00:00:00	43
4593	62	18	shipped	2021-04-08 00:00:00	2021-04-04 00:00:00	55
4594	11	14	processing	2021-04-25 00:00:00	2021-04-04 00:00:00	74
4597	450	66	completed	2021-05-02 00:00:00	2021-04-04 00:00:00	24
4602	22	55	processing	2021-04-16 00:00:00	2021-04-05 00:00:00	11
4603	44	28	processing	2021-04-06 00:00:00	2021-04-05 00:00:00	18
4604	28	90	processing	2021-04-18 00:00:00	2021-04-05 00:00:00	50
4605	73	17	shipped	2021-04-17 00:00:00	2021-04-05 00:00:00	78
4611	119	73	shipped	2021-04-22 00:00:00	2021-04-08 00:00:00	15
4612	102	60	completed	2021-05-04 00:00:00	2021-04-08 00:00:00	68
4613	515	30	completed	2021-05-06 00:00:00	2021-04-08 00:00:00	11
4614	447	72	shipped	2021-04-20 00:00:00	2021-04-08 00:00:00	78
4615	417	57	shipped	2021-04-19 00:00:00	2021-04-08 00:00:00	68
4616	229	12	completed	2021-04-24 00:00:00	2021-04-08 00:00:00	32
4617	646	51	processing	2021-04-09 00:00:00	2021-04-08 00:00:00	89
4618	696	54	completed	2021-05-04 00:00:00	2021-04-08 00:00:00	21
4621	280	24	processing	2021-05-04 00:00:00	2021-04-09 00:00:00	3
4623	312	16	shipped	2021-04-27 00:00:00	2021-04-09 00:00:00	75
4625	243	72	processing	2021-04-12 00:00:00	2021-04-09 00:00:00	42
4626	341	35	processing	2021-04-18 00:00:00	2021-04-09 00:00:00	82
4629	541	30	completed	2021-04-18 00:00:00	2021-04-09 00:00:00	25
4633	338	90	completed	2021-05-09 00:00:00	2021-04-09 00:00:00	37
4635	59	54	processing	2021-04-14 00:00:00	2021-04-09 00:00:00	13
4637	27	33	shipped	2021-04-11 00:00:00	2021-04-09 00:00:00	43
4638	127	72	shipped	2021-04-16 00:00:00	2021-04-09 00:00:00	26
4640	147	51	shipped	2021-04-13 00:00:00	2021-04-10 00:00:00	22
4641	74	21	completed	2021-05-07 00:00:00	2021-04-11 00:00:00	62
4643	462	6	shipped	2021-04-30 00:00:00	2021-04-11 00:00:00	34
4645	41	28	completed	2021-04-17 00:00:00	2021-04-12 00:00:00	97
4647	61	39	completed	2021-05-08 00:00:00	2021-04-12 00:00:00	33
4650	506	55	completed	2021-05-07 00:00:00	2021-04-13 00:00:00	54
4655	630	89	shipped	2021-05-05 00:00:00	2021-04-14 00:00:00	50
4657	610	36	completed	2021-05-04 00:00:00	2021-04-15 00:00:00	1
4658	353	58	processing	2021-05-15 00:00:00	2021-04-15 00:00:00	23
4659	2	99	completed	2021-04-16 00:00:00	2021-04-15 00:00:00	90
4661	283	81	completed	2021-05-14 00:00:00	2021-04-16 00:00:00	29
4662	202	94	shipped	2021-05-13 00:00:00	2021-04-16 00:00:00	67
4663	265	41	completed	2021-04-22 00:00:00	2021-04-17 00:00:00	34
4668	114	2	completed	2021-05-14 00:00:00	2021-04-17 00:00:00	54
4669	93	61	shipped	2021-05-09 00:00:00	2021-04-18 00:00:00	62
4670	235	85	shipped	2021-05-18 00:00:00	2021-04-18 00:00:00	49
4671	523	67	shipped	2021-04-22 00:00:00	2021-04-18 00:00:00	87
4672	581	45	completed	2021-05-14 00:00:00	2021-04-19 00:00:00	31
4673	669	57	completed	2021-05-19 00:00:00	2021-04-19 00:00:00	53
4674	332	89	completed	2021-04-24 00:00:00	2021-04-19 00:00:00	62
4675	312	35	shipped	2021-04-21 00:00:00	2021-04-19 00:00:00	29
4676	684	58	processing	2021-05-09 00:00:00	2021-04-19 00:00:00	77
4563	341	28	processing	2021-04-19 00:00:00	2021-03-28 00:00:00	90
4564	681	48	completed	2021-04-10 00:00:00	2021-03-28 00:00:00	86
4565	555	49	processing	2021-04-13 00:00:00	2021-03-29 00:00:00	31
4566	597	48	shipped	2021-04-05 00:00:00	2021-03-29 00:00:00	50
4567	525	7	shipped	2021-04-05 00:00:00	2021-03-29 00:00:00	82
4568	142	35	completed	2021-04-06 00:00:00	2021-03-29 00:00:00	47
4573	619	54	shipped	2021-04-20 00:00:00	2021-03-29 00:00:00	73
4574	192	62	processing	2021-03-31 00:00:00	2021-03-29 00:00:00	52
4577	21	53	completed	2021-04-18 00:00:00	2021-03-30 00:00:00	34
4579	168	66	completed	2021-04-14 00:00:00	2021-03-31 00:00:00	95
4580	187	14	processing	2021-04-27 00:00:00	2021-03-31 00:00:00	54
4581	565	83	shipped	2021-04-11 00:00:00	2021-03-31 00:00:00	67
4582	501	86	completed	2021-04-06 00:00:00	2021-04-01 00:00:00	35
4584	380	12	completed	2021-04-14 00:00:00	2021-04-01 00:00:00	73
4587	339	6	completed	2021-04-25 00:00:00	2021-04-01 00:00:00	71
4595	603	69	processing	2021-04-08 00:00:00	2021-04-04 00:00:00	5
4596	112	38	shipped	2021-05-03 00:00:00	2021-04-04 00:00:00	82
4598	584	2	shipped	2021-04-27 00:00:00	2021-04-04 00:00:00	51
4599	231	24	completed	2021-05-02 00:00:00	2021-04-04 00:00:00	26
4600	339	17	completed	2021-05-02 00:00:00	2021-04-04 00:00:00	94
4601	23	9	processing	2021-04-23 00:00:00	2021-04-05 00:00:00	97
4606	574	32	processing	2021-05-02 00:00:00	2021-04-06 00:00:00	17
4607	494	84	processing	2021-04-24 00:00:00	2021-04-07 00:00:00	12
4608	397	65	completed	2021-04-21 00:00:00	2021-04-07 00:00:00	51
4609	215	75	completed	2021-04-21 00:00:00	2021-04-08 00:00:00	5
4610	192	12	shipped	2021-04-17 00:00:00	2021-04-08 00:00:00	92
4619	25	20	shipped	2021-04-13 00:00:00	2021-04-08 00:00:00	31
4620	632	22	completed	2021-04-11 00:00:00	2021-04-08 00:00:00	5
4622	58	98	completed	2021-04-24 00:00:00	2021-04-09 00:00:00	63
4624	319	1	processing	2021-04-29 00:00:00	2021-04-09 00:00:00	5
4627	322	15	shipped	2021-04-23 00:00:00	2021-04-09 00:00:00	90
4628	465	92	completed	2021-04-17 00:00:00	2021-04-09 00:00:00	42
4630	423	10	processing	2021-04-22 00:00:00	2021-04-09 00:00:00	2
4631	248	83	completed	2021-05-05 00:00:00	2021-04-09 00:00:00	26
4632	248	14	processing	2021-04-12 00:00:00	2021-04-09 00:00:00	8
4634	7	43	processing	2021-04-30 00:00:00	2021-04-09 00:00:00	15
4636	437	100	shipped	2021-04-30 00:00:00	2021-04-09 00:00:00	42
4639	414	98	shipped	2021-04-30 00:00:00	2021-04-10 00:00:00	100
4642	178	54	shipped	2021-04-21 00:00:00	2021-04-11 00:00:00	72
4644	459	46	completed	2021-04-20 00:00:00	2021-04-11 00:00:00	67
4646	678	30	processing	2021-04-23 00:00:00	2021-04-12 00:00:00	66
4648	363	98	processing	2021-04-17 00:00:00	2021-04-12 00:00:00	69
4649	196	67	processing	2021-05-05 00:00:00	2021-04-13 00:00:00	29
4651	505	39	processing	2021-04-25 00:00:00	2021-04-14 00:00:00	95
4652	223	99	completed	2021-04-25 00:00:00	2021-04-14 00:00:00	80
4653	68	39	shipped	2021-04-22 00:00:00	2021-04-14 00:00:00	83
4654	374	18	shipped	2021-04-19 00:00:00	2021-04-14 00:00:00	77
4656	669	16	processing	2021-05-07 00:00:00	2021-04-14 00:00:00	3
4660	161	56	shipped	2021-05-05 00:00:00	2021-04-15 00:00:00	79
4664	118	85	processing	2021-05-15 00:00:00	2021-04-17 00:00:00	78
4665	487	88	completed	2021-04-22 00:00:00	2021-04-17 00:00:00	61
4666	370	37	shipped	2021-05-08 00:00:00	2021-04-17 00:00:00	96
4667	207	73	processing	2021-05-17 00:00:00	2021-04-17 00:00:00	99
4677	24	9	completed	2021-05-07 00:00:00	2021-04-19 00:00:00	83
4678	9	44	completed	2021-05-11 00:00:00	2021-04-19 00:00:00	52
4679	80	53	shipped	2021-05-09 00:00:00	2021-04-19 00:00:00	4
4680	647	58	processing	2021-04-25 00:00:00	2021-04-19 00:00:00	72
4681	500	67	processing	2021-05-02 00:00:00	2021-04-20 00:00:00	57
4682	645	78	processing	2021-04-25 00:00:00	2021-04-20 00:00:00	94
4683	511	74	completed	2021-05-19 00:00:00	2021-04-20 00:00:00	67
4684	59	31	processing	2021-05-01 00:00:00	2021-04-20 00:00:00	65
4685	230	5	shipped	2021-05-20 00:00:00	2021-04-20 00:00:00	60
4686	351	24	processing	2021-05-02 00:00:00	2021-04-20 00:00:00	65
4687	384	90	completed	2021-04-26 00:00:00	2021-04-20 00:00:00	42
4688	194	36	processing	2021-05-11 00:00:00	2021-04-20 00:00:00	43
4689	313	88	shipped	2021-04-23 00:00:00	2021-04-21 00:00:00	19
4690	530	43	completed	2021-05-14 00:00:00	2021-04-21 00:00:00	91
4691	20	19	processing	2021-05-02 00:00:00	2021-04-21 00:00:00	37
4692	445	67	completed	2021-05-04 00:00:00	2021-04-21 00:00:00	73
4693	678	68	shipped	2021-05-07 00:00:00	2021-04-22 00:00:00	69
4694	6	77	completed	2021-04-28 00:00:00	2021-04-22 00:00:00	15
4695	260	20	shipped	2021-04-29 00:00:00	2021-04-22 00:00:00	9
4696	368	8	completed	2021-05-08 00:00:00	2021-04-22 00:00:00	47
4697	640	85	shipped	2021-05-21 00:00:00	2021-04-22 00:00:00	98
4698	381	3	completed	2021-05-22 00:00:00	2021-04-23 00:00:00	43
4699	383	68	completed	2021-05-17 00:00:00	2021-04-23 00:00:00	11
4700	613	97	processing	2021-05-12 00:00:00	2021-04-23 00:00:00	92
4701	509	88	processing	2021-05-19 00:00:00	2021-04-24 00:00:00	40
4702	533	27	completed	2021-05-07 00:00:00	2021-04-24 00:00:00	90
4703	533	1	completed	2021-05-14 00:00:00	2021-04-24 00:00:00	38
4704	480	51	completed	2021-04-28 00:00:00	2021-04-24 00:00:00	19
4705	367	90	completed	2021-05-22 00:00:00	2021-04-24 00:00:00	46
4706	81	92	processing	2021-05-07 00:00:00	2021-04-24 00:00:00	99
4707	318	96	processing	2021-05-13 00:00:00	2021-04-24 00:00:00	67
4708	525	97	shipped	2021-05-06 00:00:00	2021-04-24 00:00:00	27
4709	29	16	completed	2021-05-04 00:00:00	2021-04-24 00:00:00	60
4710	81	52	completed	2021-05-17 00:00:00	2021-04-24 00:00:00	64
4711	163	51	completed	2021-05-06 00:00:00	2021-04-24 00:00:00	69
4712	487	10	shipped	2021-05-04 00:00:00	2021-04-24 00:00:00	12
4713	324	8	completed	2021-05-16 00:00:00	2021-04-24 00:00:00	75
4714	677	84	completed	2021-05-22 00:00:00	2021-04-24 00:00:00	2
4715	219	13	processing	2021-05-10 00:00:00	2021-04-24 00:00:00	34
4716	387	16	shipped	2021-05-12 00:00:00	2021-04-25 00:00:00	53
4717	386	98	shipped	2021-05-18 00:00:00	2021-04-25 00:00:00	30
4718	147	30	completed	2021-04-30 00:00:00	2021-04-25 00:00:00	97
4719	170	18	processing	2021-05-19 00:00:00	2021-04-25 00:00:00	48
4720	526	16	shipped	2021-05-19 00:00:00	2021-04-25 00:00:00	93
4721	201	39	processing	2021-04-30 00:00:00	2021-04-26 00:00:00	58
4722	530	61	shipped	2021-05-18 00:00:00	2021-04-26 00:00:00	60
4723	165	33	processing	2021-05-25 00:00:00	2021-04-26 00:00:00	70
4724	183	19	processing	2021-05-02 00:00:00	2021-04-26 00:00:00	97
4725	262	93	processing	2021-05-02 00:00:00	2021-04-27 00:00:00	7
4726	178	15	processing	2021-05-25 00:00:00	2021-04-27 00:00:00	4
4727	623	64	completed	2021-05-06 00:00:00	2021-04-27 00:00:00	53
4728	506	51	shipped	2021-05-14 00:00:00	2021-04-27 00:00:00	80
4729	297	13	processing	2021-05-21 00:00:00	2021-04-28 00:00:00	51
4730	285	98	processing	2021-05-10 00:00:00	2021-04-28 00:00:00	49
4731	49	98	processing	2021-05-03 00:00:00	2021-04-28 00:00:00	85
4732	66	35	completed	2021-05-27 00:00:00	2021-04-28 00:00:00	31
4733	566	57	completed	2021-05-24 00:00:00	2021-04-28 00:00:00	86
4734	502	65	completed	2021-05-21 00:00:00	2021-04-28 00:00:00	6
4735	574	39	completed	2021-05-23 00:00:00	2021-04-28 00:00:00	82
4736	486	16	processing	2021-05-03 00:00:00	2021-04-28 00:00:00	13
4737	588	78	completed	2021-05-12 00:00:00	2021-04-28 00:00:00	51
4738	63	62	completed	2021-05-09 00:00:00	2021-04-28 00:00:00	68
4739	502	46	shipped	2021-05-22 00:00:00	2021-04-28 00:00:00	29
4740	520	35	completed	2021-05-04 00:00:00	2021-04-28 00:00:00	4
4741	263	95	completed	2021-05-18 00:00:00	2021-04-29 00:00:00	75
4742	54	1	processing	2021-05-19 00:00:00	2021-04-29 00:00:00	19
4743	141	25	completed	2021-04-30 00:00:00	2021-04-29 00:00:00	9
4744	346	48	completed	2021-05-14 00:00:00	2021-04-29 00:00:00	27
4745	338	65	shipped	2021-05-25 00:00:00	2021-04-29 00:00:00	96
4746	445	83	completed	2021-05-27 00:00:00	2021-04-29 00:00:00	43
4747	215	23	shipped	2021-05-18 00:00:00	2021-04-30 00:00:00	15
4748	347	35	processing	2021-05-04 00:00:00	2021-04-30 00:00:00	74
4749	562	46	shipped	2021-05-28 00:00:00	2021-05-01 00:00:00	85
4750	403	3	completed	2021-05-20 00:00:00	2021-05-01 00:00:00	21
4751	548	91	processing	2021-05-27 00:00:00	2021-05-02 00:00:00	15
4752	414	68	processing	2021-05-25 00:00:00	2021-05-02 00:00:00	7
4753	617	20	completed	2021-05-06 00:00:00	2021-05-02 00:00:00	67
4754	401	74	shipped	2021-05-14 00:00:00	2021-05-02 00:00:00	73
4755	131	25	processing	2021-05-18 00:00:00	2021-05-02 00:00:00	9
4756	287	73	processing	2021-05-15 00:00:00	2021-05-02 00:00:00	85
4757	171	73	processing	2021-05-28 00:00:00	2021-05-02 00:00:00	56
4758	157	96	processing	2021-05-14 00:00:00	2021-05-02 00:00:00	43
4759	699	16	processing	2021-05-21 00:00:00	2021-05-03 00:00:00	68
4760	155	34	completed	2021-05-23 00:00:00	2021-05-03 00:00:00	34
4761	619	19	shipped	2021-05-13 00:00:00	2021-05-04 00:00:00	25
4762	506	97	completed	2021-05-27 00:00:00	2021-05-05 00:00:00	95
4763	330	78	completed	2021-05-22 00:00:00	2021-05-05 00:00:00	88
4764	196	35	completed	2021-05-17 00:00:00	2021-05-05 00:00:00	78
4765	644	6	shipped	2021-05-16 00:00:00	2021-05-06 00:00:00	9
4766	646	39	shipped	2021-06-01 00:00:00	2021-05-06 00:00:00	4
4767	146	29	shipped	2021-06-04 00:00:00	2021-05-06 00:00:00	13
4768	9	15	completed	2021-05-31 00:00:00	2021-05-07 00:00:00	4
4769	5	56	processing	2021-05-17 00:00:00	2021-05-07 00:00:00	30
4770	468	79	shipped	2021-05-12 00:00:00	2021-05-07 00:00:00	38
4771	24	91	completed	2021-05-24 00:00:00	2021-05-08 00:00:00	69
4772	533	37	shipped	2021-05-21 00:00:00	2021-05-08 00:00:00	3
4773	300	16	shipped	2021-05-19 00:00:00	2021-05-08 00:00:00	24
4774	13	60	completed	2021-05-18 00:00:00	2021-05-08 00:00:00	26
4775	660	34	completed	2021-06-07 00:00:00	2021-05-08 00:00:00	97
4776	608	43	shipped	2021-05-23 00:00:00	2021-05-08 00:00:00	15
4777	489	45	shipped	2021-05-16 00:00:00	2021-05-08 00:00:00	44
4778	13	37	completed	2021-05-09 00:00:00	2021-05-08 00:00:00	70
4779	1	71	completed	2021-05-27 00:00:00	2021-05-08 00:00:00	30
4780	619	20	completed	2021-05-26 00:00:00	2021-05-09 00:00:00	93
4781	29	96	processing	2021-06-05 00:00:00	2021-05-09 00:00:00	50
4782	475	85	processing	2021-05-11 00:00:00	2021-05-09 00:00:00	4
4783	460	80	processing	2021-05-13 00:00:00	2021-05-09 00:00:00	22
4784	350	24	completed	2021-05-13 00:00:00	2021-05-09 00:00:00	8
4785	190	15	completed	2021-05-15 00:00:00	2021-05-10 00:00:00	90
4786	222	96	shipped	2021-05-16 00:00:00	2021-05-10 00:00:00	2
4787	12	58	processing	2021-05-30 00:00:00	2021-05-10 00:00:00	37
4788	584	17	completed	2021-06-01 00:00:00	2021-05-10 00:00:00	54
4789	179	99	processing	2021-05-26 00:00:00	2021-05-11 00:00:00	89
4790	299	50	processing	2021-05-19 00:00:00	2021-05-11 00:00:00	45
4791	247	40	shipped	2021-05-28 00:00:00	2021-05-11 00:00:00	29
4792	258	71	processing	2021-06-01 00:00:00	2021-05-11 00:00:00	100
4793	362	46	completed	2021-05-28 00:00:00	2021-05-11 00:00:00	22
4794	576	22	shipped	2021-05-12 00:00:00	2021-05-11 00:00:00	94
4795	168	89	shipped	2021-05-18 00:00:00	2021-05-11 00:00:00	16
4796	60	54	processing	2021-06-09 00:00:00	2021-05-11 00:00:00	16
4797	392	47	processing	2021-05-13 00:00:00	2021-05-12 00:00:00	23
4798	335	4	processing	2021-06-11 00:00:00	2021-05-12 00:00:00	2
4799	588	17	processing	2021-05-13 00:00:00	2021-05-12 00:00:00	19
4800	465	8	processing	2021-05-19 00:00:00	2021-05-12 00:00:00	89
4801	125	20	shipped	2021-05-26 00:00:00	2021-05-13 00:00:00	17
4802	298	95	processing	2021-06-01 00:00:00	2021-05-13 00:00:00	29
4803	281	57	completed	2021-06-10 00:00:00	2021-05-13 00:00:00	50
4804	130	16	shipped	2021-05-21 00:00:00	2021-05-13 00:00:00	97
4805	114	62	completed	2021-05-29 00:00:00	2021-05-13 00:00:00	71
4806	684	50	processing	2021-05-17 00:00:00	2021-05-13 00:00:00	83
4807	52	99	processing	2021-05-30 00:00:00	2021-05-13 00:00:00	58
4808	130	96	completed	2021-06-11 00:00:00	2021-05-13 00:00:00	56
4809	403	88	completed	2021-05-14 00:00:00	2021-05-13 00:00:00	48
4810	9	21	completed	2021-06-02 00:00:00	2021-05-13 00:00:00	35
4811	206	37	processing	2021-05-15 00:00:00	2021-05-13 00:00:00	24
4812	62	2	completed	2021-05-18 00:00:00	2021-05-13 00:00:00	22
4813	195	89	completed	2021-06-01 00:00:00	2021-05-13 00:00:00	39
4814	227	59	shipped	2021-05-23 00:00:00	2021-05-13 00:00:00	23
4815	183	23	completed	2021-06-05 00:00:00	2021-05-13 00:00:00	49
4816	297	21	completed	2021-05-18 00:00:00	2021-05-13 00:00:00	71
4817	248	17	shipped	2021-06-02 00:00:00	2021-05-14 00:00:00	17
4818	657	84	shipped	2021-05-27 00:00:00	2021-05-14 00:00:00	30
4819	651	97	completed	2021-05-30 00:00:00	2021-05-14 00:00:00	29
4820	429	20	completed	2021-05-17 00:00:00	2021-05-14 00:00:00	18
4821	138	16	shipped	2021-05-18 00:00:00	2021-05-15 00:00:00	78
4822	283	23	processing	2021-05-31 00:00:00	2021-05-16 00:00:00	55
4823	676	35	processing	2021-05-17 00:00:00	2021-05-16 00:00:00	72
4824	488	32	processing	2021-06-05 00:00:00	2021-05-16 00:00:00	26
4825	230	90	processing	2021-05-24 00:00:00	2021-05-17 00:00:00	56
4826	177	22	completed	2021-06-01 00:00:00	2021-05-17 00:00:00	58
4827	670	71	processing	2021-06-02 00:00:00	2021-05-17 00:00:00	35
4828	190	73	completed	2021-06-01 00:00:00	2021-05-18 00:00:00	34
4829	657	64	processing	2021-06-08 00:00:00	2021-05-18 00:00:00	3
4830	669	3	processing	2021-06-06 00:00:00	2021-05-18 00:00:00	60
4831	600	31	processing	2021-06-13 00:00:00	2021-05-19 00:00:00	53
4832	632	48	processing	2021-05-20 00:00:00	2021-05-19 00:00:00	1
4833	227	30	completed	2021-05-21 00:00:00	2021-05-19 00:00:00	31
4834	618	15	shipped	2021-06-06 00:00:00	2021-05-20 00:00:00	37
4835	261	12	shipped	2021-06-03 00:00:00	2021-05-20 00:00:00	90
4836	168	56	completed	2021-06-01 00:00:00	2021-05-20 00:00:00	38
4837	650	34	processing	2021-05-28 00:00:00	2021-05-20 00:00:00	72
4838	367	19	completed	2021-05-22 00:00:00	2021-05-20 00:00:00	94
4839	578	57	shipped	2021-06-11 00:00:00	2021-05-20 00:00:00	52
4840	7	89	processing	2021-05-21 00:00:00	2021-05-20 00:00:00	49
4841	485	38	processing	2021-06-12 00:00:00	2021-05-20 00:00:00	59
4842	128	34	completed	2021-06-19 00:00:00	2021-05-20 00:00:00	52
4843	494	76	completed	2021-06-02 00:00:00	2021-05-21 00:00:00	25
4844	141	77	shipped	2021-05-26 00:00:00	2021-05-21 00:00:00	11
4845	251	18	processing	2021-06-13 00:00:00	2021-05-21 00:00:00	71
4846	167	73	processing	2021-06-08 00:00:00	2021-05-22 00:00:00	99
4847	207	72	shipped	2021-05-28 00:00:00	2021-05-22 00:00:00	29
4848	332	22	shipped	2021-06-12 00:00:00	2021-05-22 00:00:00	75
4849	410	42	processing	2021-06-22 00:00:00	2021-05-23 00:00:00	57
4850	243	6	shipped	2021-06-09 00:00:00	2021-05-23 00:00:00	53
4851	261	77	shipped	2021-06-01 00:00:00	2021-05-23 00:00:00	25
4852	329	10	processing	2021-06-15 00:00:00	2021-05-24 00:00:00	88
4853	239	78	completed	2021-06-03 00:00:00	2021-05-24 00:00:00	95
4854	201	81	shipped	2021-06-01 00:00:00	2021-05-24 00:00:00	76
4855	186	83	completed	2021-05-31 00:00:00	2021-05-25 00:00:00	64
4856	359	25	completed	2021-06-11 00:00:00	2021-05-25 00:00:00	61
4857	252	9	shipped	2021-06-12 00:00:00	2021-05-25 00:00:00	38
4858	120	38	shipped	2021-05-28 00:00:00	2021-05-26 00:00:00	93
4859	609	97	shipped	2021-06-04 00:00:00	2021-05-26 00:00:00	84
4860	200	8	processing	2021-05-28 00:00:00	2021-05-26 00:00:00	30
4861	586	11	completed	2021-06-25 00:00:00	2021-05-27 00:00:00	83
4862	330	71	processing	2021-06-23 00:00:00	2021-05-27 00:00:00	71
4863	507	50	completed	2021-06-07 00:00:00	2021-05-27 00:00:00	14
4864	693	48	shipped	2021-06-07 00:00:00	2021-05-28 00:00:00	49
4865	569	21	shipped	2021-06-17 00:00:00	2021-05-29 00:00:00	14
4866	682	84	processing	2021-06-10 00:00:00	2021-05-30 00:00:00	85
4867	83	28	completed	2021-06-13 00:00:00	2021-05-30 00:00:00	21
4868	393	50	processing	2021-06-15 00:00:00	2021-05-30 00:00:00	2
4869	309	8	processing	2021-06-25 00:00:00	2021-05-30 00:00:00	4
4870	149	63	processing	2021-06-15 00:00:00	2021-05-30 00:00:00	81
4871	286	31	shipped	2021-06-14 00:00:00	2021-05-30 00:00:00	37
4872	169	99	shipped	2021-06-28 00:00:00	2021-05-30 00:00:00	100
4873	216	64	shipped	2021-06-25 00:00:00	2021-05-30 00:00:00	87
4874	106	70	shipped	2021-06-05 00:00:00	2021-05-30 00:00:00	95
4875	269	9	shipped	2021-06-03 00:00:00	2021-05-30 00:00:00	16
4876	355	92	completed	2021-06-27 00:00:00	2021-05-30 00:00:00	16
4877	555	94	processing	2021-06-16 00:00:00	2021-05-30 00:00:00	22
4878	109	41	completed	2021-06-23 00:00:00	2021-05-30 00:00:00	56
4879	263	15	processing	2021-06-25 00:00:00	2021-05-31 00:00:00	16
4880	422	92	completed	2021-06-09 00:00:00	2021-05-31 00:00:00	12
4881	496	45	processing	2021-06-12 00:00:00	2021-05-31 00:00:00	98
4882	442	20	processing	2021-06-22 00:00:00	2021-05-31 00:00:00	94
4883	33	73	completed	2021-06-30 00:00:00	2021-05-31 00:00:00	71
4884	147	82	processing	2021-06-18 00:00:00	2021-05-31 00:00:00	69
4885	643	10	processing	2021-06-18 00:00:00	2021-05-31 00:00:00	78
4886	69	11	completed	2021-06-09 00:00:00	2021-05-31 00:00:00	25
4887	438	99	shipped	2021-06-16 00:00:00	2021-05-31 00:00:00	29
4888	338	53	shipped	2021-06-16 00:00:00	2021-05-31 00:00:00	25
4889	286	70	shipped	2021-06-03 00:00:00	2021-05-31 00:00:00	43
4890	331	19	shipped	2021-06-05 00:00:00	2021-05-31 00:00:00	56
4891	483	24	processing	2021-06-15 00:00:00	2021-05-31 00:00:00	87
4892	52	13	shipped	2021-06-27 00:00:00	2021-05-31 00:00:00	24
4893	223	59	completed	2021-06-04 00:00:00	2021-05-31 00:00:00	72
4894	349	10	processing	2021-06-09 00:00:00	2021-05-31 00:00:00	93
4895	262	6	completed	2021-06-15 00:00:00	2021-05-31 00:00:00	84
4896	501	49	shipped	2021-06-14 00:00:00	2021-05-31 00:00:00	7
4897	441	25	completed	2021-06-09 00:00:00	2021-05-31 00:00:00	3
4898	90	68	shipped	2021-06-21 00:00:00	2021-05-31 00:00:00	23
4899	237	80	processing	2021-06-18 00:00:00	2021-05-31 00:00:00	78
4900	531	45	shipped	2021-06-06 00:00:00	2021-05-31 00:00:00	61
4901	599	22	processing	2021-06-16 00:00:00	2021-05-31 00:00:00	15
4902	487	63	processing	2021-06-03 00:00:00	2021-05-31 00:00:00	28
4903	333	100	completed	2021-06-07 00:00:00	2021-05-31 00:00:00	74
4904	390	85	completed	2021-06-09 00:00:00	2021-05-31 00:00:00	53
4905	647	21	shipped	2021-06-29 00:00:00	2021-05-31 00:00:00	53
4906	75	69	shipped	2021-06-07 00:00:00	2021-06-01 00:00:00	71
4907	177	85	shipped	2021-06-18 00:00:00	2021-06-01 00:00:00	94
4908	563	2	shipped	2021-06-24 00:00:00	2021-06-01 00:00:00	27
4909	48	66	shipped	2021-07-01 00:00:00	2021-06-02 00:00:00	52
4910	59	21	processing	2021-06-12 00:00:00	2021-06-02 00:00:00	65
4911	128	63	shipped	2021-06-09 00:00:00	2021-06-03 00:00:00	12
4912	196	67	processing	2021-06-15 00:00:00	2021-06-03 00:00:00	34
4913	636	55	completed	2021-06-20 00:00:00	2021-06-03 00:00:00	84
4914	604	45	processing	2021-06-13 00:00:00	2021-06-03 00:00:00	58
4915	197	37	processing	2021-06-25 00:00:00	2021-06-03 00:00:00	70
4916	79	45	processing	2021-06-27 00:00:00	2021-06-03 00:00:00	62
4917	489	4	completed	2021-06-25 00:00:00	2021-06-03 00:00:00	61
4918	293	98	completed	2021-06-12 00:00:00	2021-06-03 00:00:00	34
4919	141	90	shipped	2021-06-30 00:00:00	2021-06-03 00:00:00	98
4920	497	25	shipped	2021-06-10 00:00:00	2021-06-03 00:00:00	2
4921	675	87	processing	2021-06-12 00:00:00	2021-06-03 00:00:00	83
4922	373	38	completed	2021-06-24 00:00:00	2021-06-03 00:00:00	74
4923	211	43	completed	2021-06-27 00:00:00	2021-06-03 00:00:00	90
4924	477	61	shipped	2021-06-25 00:00:00	2021-06-03 00:00:00	79
4925	362	30	processing	2021-06-13 00:00:00	2021-06-03 00:00:00	62
4926	414	67	processing	2021-06-24 00:00:00	2021-06-03 00:00:00	79
4927	568	95	shipped	2021-07-01 00:00:00	2021-06-03 00:00:00	85
4928	564	63	completed	2021-06-25 00:00:00	2021-06-03 00:00:00	17
4929	694	37	processing	2021-06-14 00:00:00	2021-06-04 00:00:00	99
4930	475	68	processing	2021-06-29 00:00:00	2021-06-04 00:00:00	11
4931	515	46	processing	2021-06-11 00:00:00	2021-06-04 00:00:00	65
4932	200	47	processing	2021-06-24 00:00:00	2021-06-04 00:00:00	31
4933	428	82	completed	2021-06-09 00:00:00	2021-06-05 00:00:00	17
4934	652	52	processing	2021-06-08 00:00:00	2021-06-05 00:00:00	65
4935	525	74	processing	2021-06-17 00:00:00	2021-06-05 00:00:00	98
4936	411	29	completed	2021-07-01 00:00:00	2021-06-06 00:00:00	90
4937	153	58	processing	2021-06-27 00:00:00	2021-06-07 00:00:00	100
4938	693	17	processing	2021-06-10 00:00:00	2021-06-07 00:00:00	95
4939	293	38	completed	2021-06-14 00:00:00	2021-06-07 00:00:00	77
4940	61	30	processing	2021-06-15 00:00:00	2021-06-07 00:00:00	74
4942	418	42	processing	2021-06-09 00:00:00	2021-06-07 00:00:00	99
4944	12	3	shipped	2021-06-21 00:00:00	2021-06-07 00:00:00	85
4945	127	12	processing	2021-06-10 00:00:00	2021-06-07 00:00:00	39
4946	4	5	completed	2021-06-16 00:00:00	2021-06-07 00:00:00	23
4941	155	16	processing	2021-07-07 00:00:00	2021-06-07 00:00:00	77
4943	439	39	completed	2021-06-28 00:00:00	2021-06-07 00:00:00	42
4949	21	58	completed	2021-06-24 00:00:00	2021-06-08 00:00:00	70
4950	159	24	shipped	2021-06-18 00:00:00	2021-06-08 00:00:00	14
4952	266	3	completed	2021-07-04 00:00:00	2021-06-08 00:00:00	44
4953	384	40	processing	2021-06-27 00:00:00	2021-06-09 00:00:00	1
4955	527	61	completed	2021-07-05 00:00:00	2021-06-09 00:00:00	60
4957	97	36	completed	2021-06-12 00:00:00	2021-06-09 00:00:00	56
4961	301	57	shipped	2021-06-26 00:00:00	2021-06-09 00:00:00	4
4963	660	5	completed	2021-06-26 00:00:00	2021-06-09 00:00:00	73
4964	419	68	shipped	2021-06-26 00:00:00	2021-06-09 00:00:00	86
4965	684	13	processing	2021-06-10 00:00:00	2021-06-09 00:00:00	68
4969	540	41	completed	2021-07-07 00:00:00	2021-06-11 00:00:00	50
4971	678	89	processing	2021-06-19 00:00:00	2021-06-11 00:00:00	72
4972	312	87	completed	2021-07-09 00:00:00	2021-06-11 00:00:00	29
4973	333	90	completed	2021-06-17 00:00:00	2021-06-11 00:00:00	70
4975	630	7	completed	2021-07-10 00:00:00	2021-06-12 00:00:00	5
4976	171	87	shipped	2021-07-04 00:00:00	2021-06-12 00:00:00	55
4977	689	42	completed	2021-06-29 00:00:00	2021-06-12 00:00:00	85
4978	327	42	completed	2021-06-23 00:00:00	2021-06-12 00:00:00	94
4979	369	7	processing	2021-06-24 00:00:00	2021-06-12 00:00:00	37
4980	73	3	shipped	2021-07-11 00:00:00	2021-06-12 00:00:00	10
4985	621	54	completed	2021-06-15 00:00:00	2021-06-13 00:00:00	81
4986	619	36	shipped	2021-07-11 00:00:00	2021-06-13 00:00:00	52
4988	201	100	processing	2021-07-11 00:00:00	2021-06-13 00:00:00	85
4989	116	70	completed	2021-06-27 00:00:00	2021-06-14 00:00:00	43
4991	614	97	processing	2021-07-07 00:00:00	2021-06-14 00:00:00	26
4992	14	17	processing	2021-06-21 00:00:00	2021-06-14 00:00:00	73
4993	386	41	shipped	2021-06-20 00:00:00	2021-06-14 00:00:00	83
4994	519	59	processing	2021-07-01 00:00:00	2021-06-14 00:00:00	99
4995	170	78	completed	2021-07-10 00:00:00	2021-06-14 00:00:00	63
4996	585	95	shipped	2021-07-06 00:00:00	2021-06-15 00:00:00	79
4997	345	47	processing	2021-06-25 00:00:00	2021-06-15 00:00:00	90
4999	641	18	processing	2021-07-13 00:00:00	2021-06-16 00:00:00	88
5117	637	64	completed	2021-08-01 00:00:00	2021-07-08 00:00:00	71
5118	245	41	shipped	2021-07-16 00:00:00	2021-07-08 00:00:00	11
5119	411	68	completed	2021-07-11 00:00:00	2021-07-09 00:00:00	25
5120	517	93	shipped	2021-07-10 00:00:00	2021-07-09 00:00:00	18
5121	243	8	processing	2021-07-27 00:00:00	2021-07-10 00:00:00	40
5125	527	76	shipped	2021-08-08 00:00:00	2021-07-10 00:00:00	100
5128	232	89	shipped	2021-08-04 00:00:00	2021-07-11 00:00:00	20
5129	131	44	completed	2021-08-07 00:00:00	2021-07-11 00:00:00	99
5131	441	27	shipped	2021-07-23 00:00:00	2021-07-11 00:00:00	27
5133	24	12	completed	2021-08-01 00:00:00	2021-07-11 00:00:00	13
5134	130	63	shipped	2021-08-10 00:00:00	2021-07-11 00:00:00	80
5135	241	20	completed	2021-08-06 00:00:00	2021-07-11 00:00:00	88
5142	27	13	shipped	2021-07-16 00:00:00	2021-07-13 00:00:00	37
5143	120	18	completed	2021-07-15 00:00:00	2021-07-13 00:00:00	57
5145	62	69	completed	2021-08-01 00:00:00	2021-07-13 00:00:00	21
5146	16	55	shipped	2021-08-04 00:00:00	2021-07-14 00:00:00	86
5149	193	72	processing	2021-08-09 00:00:00	2021-07-15 00:00:00	30
5152	476	52	processing	2021-08-07 00:00:00	2021-07-16 00:00:00	90
5153	472	90	completed	2021-07-29 00:00:00	2021-07-17 00:00:00	21
5154	166	13	shipped	2021-08-06 00:00:00	2021-07-17 00:00:00	34
5155	416	41	shipped	2021-08-13 00:00:00	2021-07-17 00:00:00	66
5157	403	75	completed	2021-08-14 00:00:00	2021-07-17 00:00:00	60
5159	70	99	shipped	2021-08-02 00:00:00	2021-07-17 00:00:00	2
5161	394	41	shipped	2021-08-09 00:00:00	2021-07-18 00:00:00	96
5162	640	82	processing	2021-07-19 00:00:00	2021-07-18 00:00:00	7
5169	119	31	completed	2021-07-28 00:00:00	2021-07-19 00:00:00	14
5170	626	44	processing	2021-08-01 00:00:00	2021-07-20 00:00:00	68
5172	425	56	completed	2021-08-13 00:00:00	2021-07-20 00:00:00	33
5175	92	62	processing	2021-08-14 00:00:00	2021-07-20 00:00:00	35
5176	699	9	processing	2021-08-06 00:00:00	2021-07-20 00:00:00	18
5177	654	62	processing	2021-08-03 00:00:00	2021-07-20 00:00:00	3
5178	601	27	processing	2021-08-18 00:00:00	2021-07-20 00:00:00	35
5179	5	84	processing	2021-08-15 00:00:00	2021-07-20 00:00:00	65
5182	509	84	processing	2021-07-29 00:00:00	2021-07-21 00:00:00	36
5183	411	14	processing	2021-08-05 00:00:00	2021-07-21 00:00:00	85
5185	110	49	shipped	2021-08-07 00:00:00	2021-07-21 00:00:00	5
5187	375	13	completed	2021-08-18 00:00:00	2021-07-21 00:00:00	20
5188	132	70	shipped	2021-08-20 00:00:00	2021-07-21 00:00:00	100
5189	2	1	completed	2021-08-06 00:00:00	2021-07-21 00:00:00	87
5190	319	96	completed	2021-08-16 00:00:00	2021-07-21 00:00:00	86
5191	510	100	completed	2021-08-07 00:00:00	2021-07-21 00:00:00	55
5193	606	3	completed	2021-08-18 00:00:00	2021-07-21 00:00:00	42
5195	563	100	processing	2021-07-29 00:00:00	2021-07-21 00:00:00	13
5196	522	54	shipped	2021-08-14 00:00:00	2021-07-21 00:00:00	91
5197	547	40	completed	2021-08-09 00:00:00	2021-07-21 00:00:00	53
5198	650	38	completed	2021-07-25 00:00:00	2021-07-21 00:00:00	73
5199	229	36	completed	2021-08-07 00:00:00	2021-07-21 00:00:00	64
5201	598	100	processing	2021-08-13 00:00:00	2021-07-21 00:00:00	64
5202	470	26	completed	2021-08-13 00:00:00	2021-07-21 00:00:00	4
5203	224	84	completed	2021-08-15 00:00:00	2021-07-21 00:00:00	62
5204	174	63	processing	2021-07-23 00:00:00	2021-07-21 00:00:00	97
5205	376	63	completed	2021-07-22 00:00:00	2021-07-21 00:00:00	46
4947	135	92	processing	2021-06-11 00:00:00	2021-06-07 00:00:00	69
4948	680	26	shipped	2021-06-17 00:00:00	2021-06-07 00:00:00	54
4951	565	45	shipped	2021-06-18 00:00:00	2021-06-08 00:00:00	23
4954	622	98	shipped	2021-06-18 00:00:00	2021-06-09 00:00:00	80
4956	643	57	processing	2021-07-01 00:00:00	2021-06-09 00:00:00	47
4958	504	71	completed	2021-06-14 00:00:00	2021-06-09 00:00:00	25
4959	597	30	processing	2021-06-19 00:00:00	2021-06-09 00:00:00	53
4960	168	69	completed	2021-06-19 00:00:00	2021-06-09 00:00:00	57
4962	391	59	processing	2021-07-01 00:00:00	2021-06-09 00:00:00	55
4966	154	32	completed	2021-07-01 00:00:00	2021-06-10 00:00:00	45
4967	561	83	processing	2021-07-03 00:00:00	2021-06-10 00:00:00	4
4968	681	44	shipped	2021-06-26 00:00:00	2021-06-10 00:00:00	13
4970	695	68	processing	2021-07-09 00:00:00	2021-06-11 00:00:00	98
4974	682	45	completed	2021-06-22 00:00:00	2021-06-11 00:00:00	60
4981	576	3	completed	2021-07-09 00:00:00	2021-06-13 00:00:00	39
4982	16	47	completed	2021-07-02 00:00:00	2021-06-13 00:00:00	24
4983	554	64	shipped	2021-06-29 00:00:00	2021-06-13 00:00:00	83
4984	316	52	completed	2021-06-21 00:00:00	2021-06-13 00:00:00	15
4987	594	36	completed	2021-07-08 00:00:00	2021-06-13 00:00:00	91
4990	527	52	completed	2021-06-22 00:00:00	2021-06-14 00:00:00	22
4998	403	52	shipped	2021-07-01 00:00:00	2021-06-15 00:00:00	27
5000	151	63	completed	2021-07-08 00:00:00	2021-06-16 00:00:00	16
5001	286	63	completed	2021-07-13 00:00:00	2021-06-16 00:00:00	56
5002	607	9	shipped	2021-07-01 00:00:00	2021-06-16 00:00:00	69
5003	455	10	shipped	2021-07-06 00:00:00	2021-06-16 00:00:00	75
5004	452	71	processing	2021-07-07 00:00:00	2021-06-16 00:00:00	50
5005	401	84	processing	2021-06-24 00:00:00	2021-06-17 00:00:00	70
5006	115	8	shipped	2021-06-29 00:00:00	2021-06-17 00:00:00	32
5007	95	74	shipped	2021-07-08 00:00:00	2021-06-17 00:00:00	28
5008	109	19	processing	2021-07-08 00:00:00	2021-06-17 00:00:00	13
5009	2	91	shipped	2021-07-04 00:00:00	2021-06-18 00:00:00	82
5010	100	94	shipped	2021-07-10 00:00:00	2021-06-18 00:00:00	64
5011	441	39	completed	2021-07-15 00:00:00	2021-06-19 00:00:00	70
5012	267	33	shipped	2021-07-03 00:00:00	2021-06-19 00:00:00	41
5013	40	15	processing	2021-07-04 00:00:00	2021-06-20 00:00:00	33
5014	132	61	shipped	2021-07-11 00:00:00	2021-06-20 00:00:00	56
5015	345	20	processing	2021-06-29 00:00:00	2021-06-20 00:00:00	53
5016	496	13	completed	2021-06-26 00:00:00	2021-06-20 00:00:00	28
5017	695	57	completed	2021-07-20 00:00:00	2021-06-20 00:00:00	12
5018	578	41	processing	2021-07-02 00:00:00	2021-06-20 00:00:00	68
5019	26	38	processing	2021-06-30 00:00:00	2021-06-20 00:00:00	39
5020	441	28	shipped	2021-07-17 00:00:00	2021-06-20 00:00:00	100
5021	380	77	shipped	2021-06-22 00:00:00	2021-06-20 00:00:00	47
5022	454	96	processing	2021-06-30 00:00:00	2021-06-20 00:00:00	5
5023	149	28	completed	2021-06-28 00:00:00	2021-06-20 00:00:00	35
5024	261	7	completed	2021-07-17 00:00:00	2021-06-20 00:00:00	13
5025	252	62	processing	2021-07-19 00:00:00	2021-06-21 00:00:00	90
5026	157	2	shipped	2021-06-23 00:00:00	2021-06-22 00:00:00	41
5027	35	68	completed	2021-06-29 00:00:00	2021-06-22 00:00:00	24
5028	522	13	completed	2021-07-08 00:00:00	2021-06-22 00:00:00	67
5029	639	76	completed	2021-07-20 00:00:00	2021-06-22 00:00:00	49
5030	166	24	completed	2021-07-04 00:00:00	2021-06-22 00:00:00	71
5031	428	33	completed	2021-07-16 00:00:00	2021-06-23 00:00:00	66
5032	618	58	processing	2021-07-10 00:00:00	2021-06-24 00:00:00	17
5033	454	34	shipped	2021-07-04 00:00:00	2021-06-24 00:00:00	51
5034	378	44	shipped	2021-07-10 00:00:00	2021-06-24 00:00:00	38
5035	103	80	completed	2021-06-29 00:00:00	2021-06-25 00:00:00	15
5036	108	43	processing	2021-07-08 00:00:00	2021-06-25 00:00:00	37
5037	136	52	completed	2021-07-23 00:00:00	2021-06-25 00:00:00	26
5038	393	6	processing	2021-07-06 00:00:00	2021-06-25 00:00:00	59
5039	615	86	completed	2021-07-22 00:00:00	2021-06-25 00:00:00	2
5040	580	59	shipped	2021-07-17 00:00:00	2021-06-25 00:00:00	48
5041	521	47	processing	2021-07-01 00:00:00	2021-06-26 00:00:00	5
5042	513	15	completed	2021-06-30 00:00:00	2021-06-26 00:00:00	95
5043	397	66	shipped	2021-07-07 00:00:00	2021-06-26 00:00:00	93
5044	407	49	completed	2021-07-09 00:00:00	2021-06-26 00:00:00	8
5045	148	41	shipped	2021-07-02 00:00:00	2021-06-26 00:00:00	79
5046	340	58	shipped	2021-06-28 00:00:00	2021-06-26 00:00:00	22
5047	384	92	completed	2021-07-19 00:00:00	2021-06-26 00:00:00	14
5048	99	91	processing	2021-07-23 00:00:00	2021-06-26 00:00:00	14
5049	405	21	processing	2021-06-27 00:00:00	2021-06-26 00:00:00	88
5050	259	39	completed	2021-07-21 00:00:00	2021-06-27 00:00:00	66
5051	274	40	completed	2021-07-08 00:00:00	2021-06-28 00:00:00	80
5052	475	20	completed	2021-07-15 00:00:00	2021-06-28 00:00:00	15
5053	40	93	shipped	2021-07-11 00:00:00	2021-06-28 00:00:00	4
5054	236	11	completed	2021-07-23 00:00:00	2021-06-28 00:00:00	2
5055	385	57	completed	2021-07-13 00:00:00	2021-06-29 00:00:00	24
5056	496	64	completed	2021-07-18 00:00:00	2021-06-29 00:00:00	37
5057	380	45	completed	2021-07-23 00:00:00	2021-06-29 00:00:00	96
5058	123	41	shipped	2021-07-29 00:00:00	2021-06-29 00:00:00	86
5059	591	13	completed	2021-07-19 00:00:00	2021-06-29 00:00:00	56
5060	394	48	completed	2021-07-18 00:00:00	2021-06-29 00:00:00	26
5061	61	6	processing	2021-07-07 00:00:00	2021-06-29 00:00:00	86
5062	135	62	shipped	2021-07-25 00:00:00	2021-06-29 00:00:00	22
5063	18	65	completed	2021-07-15 00:00:00	2021-06-29 00:00:00	20
5064	70	2	processing	2021-07-29 00:00:00	2021-06-29 00:00:00	93
5065	635	32	completed	2021-07-05 00:00:00	2021-06-30 00:00:00	6
5066	85	21	completed	2021-07-20 00:00:00	2021-06-30 00:00:00	15
5067	52	39	shipped	2021-07-19 00:00:00	2021-06-30 00:00:00	46
5068	52	89	shipped	2021-07-03 00:00:00	2021-06-30 00:00:00	60
5069	355	14	processing	2021-07-29 00:00:00	2021-07-01 00:00:00	32
5070	688	71	shipped	2021-07-20 00:00:00	2021-07-01 00:00:00	38
5071	506	49	processing	2021-07-09 00:00:00	2021-07-01 00:00:00	73
5072	498	69	shipped	2021-07-09 00:00:00	2021-07-01 00:00:00	39
5073	159	29	processing	2021-07-19 00:00:00	2021-07-02 00:00:00	43
5074	38	13	completed	2021-07-18 00:00:00	2021-07-02 00:00:00	41
5075	592	9	completed	2021-07-25 00:00:00	2021-07-02 00:00:00	52
5076	10	3	shipped	2021-07-22 00:00:00	2021-07-02 00:00:00	16
5077	110	83	shipped	2021-07-23 00:00:00	2021-07-03 00:00:00	77
5078	272	90	shipped	2021-07-27 00:00:00	2021-07-03 00:00:00	79
5079	493	30	completed	2021-07-14 00:00:00	2021-07-03 00:00:00	33
5080	75	28	processing	2021-07-12 00:00:00	2021-07-03 00:00:00	11
5081	616	39	completed	2021-08-01 00:00:00	2021-07-04 00:00:00	46
5082	513	35	completed	2021-07-16 00:00:00	2021-07-04 00:00:00	85
5083	116	62	completed	2021-07-09 00:00:00	2021-07-04 00:00:00	98
5084	195	16	shipped	2021-07-24 00:00:00	2021-07-04 00:00:00	90
5085	127	77	processing	2021-07-31 00:00:00	2021-07-05 00:00:00	34
5086	502	99	completed	2021-08-02 00:00:00	2021-07-05 00:00:00	26
5087	690	81	shipped	2021-07-13 00:00:00	2021-07-05 00:00:00	89
5088	475	60	completed	2021-07-31 00:00:00	2021-07-05 00:00:00	64
5089	144	34	completed	2021-08-03 00:00:00	2021-07-05 00:00:00	39
5090	406	39	shipped	2021-07-06 00:00:00	2021-07-05 00:00:00	96
5091	259	62	processing	2021-07-20 00:00:00	2021-07-05 00:00:00	1
5092	23	17	shipped	2021-07-06 00:00:00	2021-07-05 00:00:00	78
5093	645	76	completed	2021-07-29 00:00:00	2021-07-05 00:00:00	56
5094	527	61	shipped	2021-07-08 00:00:00	2021-07-05 00:00:00	43
5095	169	96	shipped	2021-07-20 00:00:00	2021-07-06 00:00:00	66
5096	480	2	completed	2021-07-15 00:00:00	2021-07-06 00:00:00	24
5097	381	66	shipped	2021-07-08 00:00:00	2021-07-07 00:00:00	54
5098	479	61	shipped	2021-07-25 00:00:00	2021-07-07 00:00:00	3
5099	590	47	completed	2021-07-19 00:00:00	2021-07-07 00:00:00	83
5100	281	33	shipped	2021-07-24 00:00:00	2021-07-07 00:00:00	3
5101	473	35	shipped	2021-08-01 00:00:00	2021-07-07 00:00:00	29
5102	11	74	shipped	2021-07-15 00:00:00	2021-07-07 00:00:00	39
5103	47	54	processing	2021-08-01 00:00:00	2021-07-07 00:00:00	15
5104	408	4	processing	2021-07-22 00:00:00	2021-07-07 00:00:00	72
5105	244	10	processing	2021-07-15 00:00:00	2021-07-07 00:00:00	36
5106	339	94	processing	2021-07-28 00:00:00	2021-07-07 00:00:00	73
5107	499	99	shipped	2021-07-28 00:00:00	2021-07-07 00:00:00	81
5108	213	60	processing	2021-07-22 00:00:00	2021-07-07 00:00:00	11
5109	300	27	processing	2021-07-28 00:00:00	2021-07-07 00:00:00	59
5110	247	71	shipped	2021-07-08 00:00:00	2021-07-07 00:00:00	48
5111	617	93	processing	2021-07-12 00:00:00	2021-07-07 00:00:00	18
5112	252	9	shipped	2021-08-03 00:00:00	2021-07-07 00:00:00	1
5113	381	64	shipped	2021-07-16 00:00:00	2021-07-08 00:00:00	18
5114	76	51	shipped	2021-07-18 00:00:00	2021-07-08 00:00:00	38
5115	396	87	completed	2021-07-15 00:00:00	2021-07-08 00:00:00	68
5116	453	16	shipped	2021-07-26 00:00:00	2021-07-08 00:00:00	73
5122	42	66	completed	2021-08-03 00:00:00	2021-07-10 00:00:00	47
5123	197	1	shipped	2021-08-06 00:00:00	2021-07-10 00:00:00	83
5124	699	21	shipped	2021-07-20 00:00:00	2021-07-10 00:00:00	44
5126	344	78	processing	2021-07-22 00:00:00	2021-07-11 00:00:00	73
5127	223	5	completed	2021-07-18 00:00:00	2021-07-11 00:00:00	67
5130	260	62	processing	2021-07-16 00:00:00	2021-07-11 00:00:00	77
5132	380	29	completed	2021-07-19 00:00:00	2021-07-11 00:00:00	35
5136	181	69	processing	2021-08-10 00:00:00	2021-07-12 00:00:00	14
5137	52	53	completed	2021-08-01 00:00:00	2021-07-12 00:00:00	9
5138	680	13	completed	2021-07-29 00:00:00	2021-07-12 00:00:00	45
5139	598	50	processing	2021-08-06 00:00:00	2021-07-12 00:00:00	16
5140	488	19	processing	2021-08-09 00:00:00	2021-07-12 00:00:00	29
5141	375	47	processing	2021-08-01 00:00:00	2021-07-13 00:00:00	62
5144	49	73	processing	2021-07-28 00:00:00	2021-07-13 00:00:00	27
5147	28	34	completed	2021-07-31 00:00:00	2021-07-14 00:00:00	70
5148	78	2	shipped	2021-07-24 00:00:00	2021-07-14 00:00:00	56
5150	244	97	processing	2021-07-22 00:00:00	2021-07-15 00:00:00	79
5151	651	1	shipped	2021-08-15 00:00:00	2021-07-16 00:00:00	95
5156	134	78	completed	2021-07-30 00:00:00	2021-07-17 00:00:00	58
5158	20	27	completed	2021-07-31 00:00:00	2021-07-17 00:00:00	65
5160	681	5	completed	2021-08-07 00:00:00	2021-07-17 00:00:00	74
5163	425	51	processing	2021-08-05 00:00:00	2021-07-18 00:00:00	29
5164	462	38	shipped	2021-07-26 00:00:00	2021-07-18 00:00:00	77
5165	649	18	processing	2021-08-10 00:00:00	2021-07-18 00:00:00	12
5166	104	9	completed	2021-08-17 00:00:00	2021-07-18 00:00:00	18
5167	159	3	completed	2021-07-30 00:00:00	2021-07-18 00:00:00	49
5168	355	83	completed	2021-07-30 00:00:00	2021-07-18 00:00:00	30
5171	86	64	completed	2021-08-07 00:00:00	2021-07-20 00:00:00	23
5173	480	21	shipped	2021-07-25 00:00:00	2021-07-20 00:00:00	39
5174	663	2	shipped	2021-08-07 00:00:00	2021-07-20 00:00:00	62
5180	476	62	shipped	2021-08-18 00:00:00	2021-07-20 00:00:00	3
5181	344	37	processing	2021-08-20 00:00:00	2021-07-21 00:00:00	13
5184	658	89	processing	2021-08-05 00:00:00	2021-07-21 00:00:00	93
5186	231	13	shipped	2021-07-27 00:00:00	2021-07-21 00:00:00	92
5192	625	48	completed	2021-08-08 00:00:00	2021-07-21 00:00:00	68
5194	379	17	shipped	2021-08-14 00:00:00	2021-07-21 00:00:00	33
5200	457	73	completed	2021-07-30 00:00:00	2021-07-21 00:00:00	49
5206	465	6	processing	2021-07-31 00:00:00	2021-07-21 00:00:00	99
5207	608	95	processing	2021-07-27 00:00:00	2021-07-21 00:00:00	97
5208	229	79	processing	2021-08-08 00:00:00	2021-07-21 00:00:00	88
5209	365	57	completed	2021-08-08 00:00:00	2021-07-22 00:00:00	70
5210	415	2	shipped	2021-08-10 00:00:00	2021-07-22 00:00:00	59
5211	84	29	completed	2021-08-16 00:00:00	2021-07-22 00:00:00	77
5212	492	29	completed	2021-08-14 00:00:00	2021-07-22 00:00:00	97
5213	508	45	shipped	2021-08-01 00:00:00	2021-07-22 00:00:00	91
5214	532	50	shipped	2021-08-11 00:00:00	2021-07-22 00:00:00	55
5215	567	38	shipped	2021-07-26 00:00:00	2021-07-22 00:00:00	84
5216	525	42	completed	2021-07-30 00:00:00	2021-07-23 00:00:00	11
5217	684	26	processing	2021-07-28 00:00:00	2021-07-24 00:00:00	32
5218	351	79	completed	2021-08-04 00:00:00	2021-07-25 00:00:00	90
5219	687	5	processing	2021-07-31 00:00:00	2021-07-25 00:00:00	90
5220	600	96	processing	2021-07-28 00:00:00	2021-07-25 00:00:00	75
5221	137	39	shipped	2021-08-18 00:00:00	2021-07-26 00:00:00	18
5222	199	31	completed	2021-08-07 00:00:00	2021-07-26 00:00:00	46
5223	358	42	shipped	2021-08-08 00:00:00	2021-07-26 00:00:00	83
5224	125	15	shipped	2021-08-03 00:00:00	2021-07-26 00:00:00	92
5225	315	95	completed	2021-08-12 00:00:00	2021-07-26 00:00:00	62
5226	437	57	shipped	2021-07-31 00:00:00	2021-07-26 00:00:00	99
5227	305	65	shipped	2021-08-02 00:00:00	2021-07-26 00:00:00	56
5228	584	11	processing	2021-08-25 00:00:00	2021-07-26 00:00:00	69
5229	238	48	processing	2021-08-10 00:00:00	2021-07-26 00:00:00	20
5230	304	60	completed	2021-07-31 00:00:00	2021-07-27 00:00:00	60
5231	80	43	shipped	2021-08-07 00:00:00	2021-07-27 00:00:00	41
5232	97	30	shipped	2021-08-21 00:00:00	2021-07-27 00:00:00	75
5233	490	26	completed	2021-07-30 00:00:00	2021-07-28 00:00:00	89
5234	23	12	completed	2021-08-07 00:00:00	2021-07-28 00:00:00	80
5235	448	45	processing	2021-07-30 00:00:00	2021-07-28 00:00:00	61
5236	133	60	processing	2021-07-30 00:00:00	2021-07-28 00:00:00	58
5237	26	40	processing	2021-08-10 00:00:00	2021-07-28 00:00:00	6
5238	418	69	completed	2021-08-23 00:00:00	2021-07-28 00:00:00	95
5239	679	94	shipped	2021-08-11 00:00:00	2021-07-28 00:00:00	40
5240	144	75	processing	2021-08-03 00:00:00	2021-07-28 00:00:00	71
5241	669	42	completed	2021-08-08 00:00:00	2021-07-28 00:00:00	100
5242	686	57	processing	2021-08-13 00:00:00	2021-07-28 00:00:00	41
5243	139	71	processing	2021-08-20 00:00:00	2021-07-28 00:00:00	24
5244	537	100	completed	2021-08-24 00:00:00	2021-07-28 00:00:00	94
5245	629	32	completed	2021-08-25 00:00:00	2021-07-28 00:00:00	67
5246	208	33	shipped	2021-08-19 00:00:00	2021-07-28 00:00:00	51
5247	427	82	shipped	2021-08-13 00:00:00	2021-07-28 00:00:00	37
5248	417	71	processing	2021-08-07 00:00:00	2021-07-29 00:00:00	32
5249	376	65	shipped	2021-08-08 00:00:00	2021-07-30 00:00:00	42
5250	425	83	shipped	2021-08-22 00:00:00	2021-07-30 00:00:00	7
5251	328	31	shipped	2021-08-19 00:00:00	2021-07-30 00:00:00	32
5252	529	94	processing	2021-08-14 00:00:00	2021-07-30 00:00:00	47
5253	536	63	shipped	2021-08-28 00:00:00	2021-07-31 00:00:00	4
5254	266	35	completed	2021-08-15 00:00:00	2021-07-31 00:00:00	35
5255	426	85	processing	2021-08-04 00:00:00	2021-07-31 00:00:00	33
5256	112	81	processing	2021-08-27 00:00:00	2021-07-31 00:00:00	69
5257	239	41	shipped	2021-08-18 00:00:00	2021-07-31 00:00:00	75
5258	69	14	processing	2021-08-27 00:00:00	2021-07-31 00:00:00	80
5259	503	42	shipped	2021-08-06 00:00:00	2021-07-31 00:00:00	25
5260	381	66	shipped	2021-08-06 00:00:00	2021-07-31 00:00:00	58
5261	455	8	processing	2021-08-06 00:00:00	2021-08-01 00:00:00	38
5262	500	55	completed	2021-08-18 00:00:00	2021-08-01 00:00:00	52
5263	85	29	completed	2021-08-30 00:00:00	2021-08-02 00:00:00	79
5264	612	64	completed	2021-08-08 00:00:00	2021-08-02 00:00:00	91
5265	575	44	shipped	2021-08-25 00:00:00	2021-08-02 00:00:00	77
5266	62	93	processing	2021-08-18 00:00:00	2021-08-02 00:00:00	79
5267	395	13	shipped	2021-08-23 00:00:00	2021-08-02 00:00:00	52
5268	427	3	shipped	2021-08-03 00:00:00	2021-08-02 00:00:00	4
5269	279	53	processing	2021-08-14 00:00:00	2021-08-03 00:00:00	90
5270	653	11	processing	2021-08-05 00:00:00	2021-08-03 00:00:00	43
5271	342	100	shipped	2021-08-29 00:00:00	2021-08-04 00:00:00	61
5272	15	98	completed	2021-08-26 00:00:00	2021-08-04 00:00:00	47
5273	667	51	shipped	2021-08-09 00:00:00	2021-08-04 00:00:00	49
5274	92	12	shipped	2021-08-31 00:00:00	2021-08-04 00:00:00	18
5275	558	94	processing	2021-08-14 00:00:00	2021-08-04 00:00:00	84
5276	46	26	processing	2021-08-18 00:00:00	2021-08-04 00:00:00	24
5277	590	27	shipped	2021-08-28 00:00:00	2021-08-04 00:00:00	59
5278	394	96	completed	2021-08-27 00:00:00	2021-08-04 00:00:00	74
5279	454	7	completed	2021-08-12 00:00:00	2021-08-05 00:00:00	76
5280	640	79	processing	2021-08-14 00:00:00	2021-08-05 00:00:00	24
5281	82	98	completed	2021-08-24 00:00:00	2021-08-06 00:00:00	36
5282	399	95	shipped	2021-08-26 00:00:00	2021-08-06 00:00:00	68
5283	293	15	processing	2021-08-19 00:00:00	2021-08-06 00:00:00	32
5284	404	27	completed	2021-08-26 00:00:00	2021-08-06 00:00:00	43
5285	107	66	shipped	2021-08-13 00:00:00	2021-08-06 00:00:00	5
5286	398	51	processing	2021-09-04 00:00:00	2021-08-07 00:00:00	95
5287	3	23	processing	2021-08-13 00:00:00	2021-08-07 00:00:00	64
5288	575	44	processing	2021-08-24 00:00:00	2021-08-07 00:00:00	45
5289	309	37	completed	2021-09-01 00:00:00	2021-08-07 00:00:00	73
5290	505	35	processing	2021-08-20 00:00:00	2021-08-07 00:00:00	37
5291	336	29	processing	2021-08-19 00:00:00	2021-08-07 00:00:00	53
5292	631	90	processing	2021-08-27 00:00:00	2021-08-07 00:00:00	63
5293	155	63	processing	2021-09-03 00:00:00	2021-08-08 00:00:00	96
5294	305	26	processing	2021-08-31 00:00:00	2021-08-08 00:00:00	44
5295	348	83	completed	2021-09-01 00:00:00	2021-08-08 00:00:00	2
5296	104	10	shipped	2021-08-26 00:00:00	2021-08-08 00:00:00	47
5297	231	29	shipped	2021-09-03 00:00:00	2021-08-08 00:00:00	2
5298	478	15	completed	2021-08-17 00:00:00	2021-08-08 00:00:00	95
5299	132	73	processing	2021-08-17 00:00:00	2021-08-08 00:00:00	37
5300	687	46	completed	2021-09-03 00:00:00	2021-08-08 00:00:00	100
5301	33	3	completed	2021-08-13 00:00:00	2021-08-08 00:00:00	73
5302	639	14	processing	2021-08-14 00:00:00	2021-08-08 00:00:00	22
5303	79	49	processing	2021-08-20 00:00:00	2021-08-08 00:00:00	51
5304	307	36	processing	2021-09-06 00:00:00	2021-08-08 00:00:00	50
5305	439	72	completed	2021-09-06 00:00:00	2021-08-08 00:00:00	44
5306	76	20	processing	2021-09-03 00:00:00	2021-08-08 00:00:00	96
5307	8	55	completed	2021-08-10 00:00:00	2021-08-08 00:00:00	11
5308	364	10	shipped	2021-08-18 00:00:00	2021-08-08 00:00:00	46
5309	494	77	processing	2021-08-28 00:00:00	2021-08-08 00:00:00	52
5310	500	52	processing	2021-08-16 00:00:00	2021-08-08 00:00:00	6
5311	505	2	shipped	2021-08-31 00:00:00	2021-08-09 00:00:00	59
5312	671	32	shipped	2021-08-18 00:00:00	2021-08-09 00:00:00	18
5313	126	57	completed	2021-09-01 00:00:00	2021-08-09 00:00:00	1
5314	663	9	processing	2021-08-14 00:00:00	2021-08-09 00:00:00	62
5315	127	23	processing	2021-08-31 00:00:00	2021-08-09 00:00:00	39
5316	22	82	processing	2021-08-17 00:00:00	2021-08-09 00:00:00	2
5317	278	21	processing	2021-08-29 00:00:00	2021-08-10 00:00:00	86
5318	673	74	processing	2021-08-17 00:00:00	2021-08-10 00:00:00	65
5319	602	31	processing	2021-08-14 00:00:00	2021-08-10 00:00:00	89
5320	469	79	processing	2021-08-11 00:00:00	2021-08-10 00:00:00	12
5321	470	67	shipped	2021-08-18 00:00:00	2021-08-11 00:00:00	88
5322	607	81	processing	2021-08-15 00:00:00	2021-08-11 00:00:00	62
5323	337	49	completed	2021-08-15 00:00:00	2021-08-11 00:00:00	94
5324	136	52	completed	2021-08-17 00:00:00	2021-08-11 00:00:00	33
5325	33	52	completed	2021-08-13 00:00:00	2021-08-11 00:00:00	63
5326	634	85	processing	2021-08-25 00:00:00	2021-08-12 00:00:00	34
5327	64	25	shipped	2021-09-03 00:00:00	2021-08-12 00:00:00	26
5328	17	66	shipped	2021-08-29 00:00:00	2021-08-12 00:00:00	37
5329	577	42	processing	2021-08-23 00:00:00	2021-08-13 00:00:00	96
5330	391	95	shipped	2021-09-06 00:00:00	2021-08-13 00:00:00	68
5331	250	74	processing	2021-08-23 00:00:00	2021-08-13 00:00:00	94
5332	697	49	shipped	2021-08-28 00:00:00	2021-08-13 00:00:00	15
5333	452	51	completed	2021-08-27 00:00:00	2021-08-13 00:00:00	24
5334	451	32	processing	2021-09-08 00:00:00	2021-08-13 00:00:00	75
5335	587	3	completed	2021-09-10 00:00:00	2021-08-13 00:00:00	28
5336	530	43	completed	2021-09-05 00:00:00	2021-08-13 00:00:00	47
5337	473	16	completed	2021-08-23 00:00:00	2021-08-13 00:00:00	100
5338	78	40	shipped	2021-08-30 00:00:00	2021-08-14 00:00:00	52
5339	659	4	processing	2021-09-07 00:00:00	2021-08-14 00:00:00	46
5340	632	6	processing	2021-09-01 00:00:00	2021-08-14 00:00:00	1
5341	600	39	shipped	2021-09-07 00:00:00	2021-08-15 00:00:00	72
5342	197	95	completed	2021-09-03 00:00:00	2021-08-15 00:00:00	41
5343	32	9	completed	2021-09-01 00:00:00	2021-08-15 00:00:00	16
5344	87	41	shipped	2021-09-01 00:00:00	2021-08-15 00:00:00	35
5345	144	10	processing	2021-09-04 00:00:00	2021-08-15 00:00:00	39
5346	422	78	shipped	2021-08-18 00:00:00	2021-08-15 00:00:00	58
5347	516	18	processing	2021-08-28 00:00:00	2021-08-15 00:00:00	84
5348	160	77	completed	2021-08-29 00:00:00	2021-08-15 00:00:00	21
5349	384	77	processing	2021-08-25 00:00:00	2021-08-16 00:00:00	92
5350	343	50	processing	2021-09-08 00:00:00	2021-08-16 00:00:00	38
5351	285	74	processing	2021-08-22 00:00:00	2021-08-16 00:00:00	41
5352	686	74	processing	2021-09-10 00:00:00	2021-08-16 00:00:00	7
5353	423	44	completed	2021-09-09 00:00:00	2021-08-16 00:00:00	52
5354	609	1	completed	2021-08-31 00:00:00	2021-08-16 00:00:00	8
5355	68	25	shipped	2021-08-29 00:00:00	2021-08-16 00:00:00	68
5356	82	72	shipped	2021-09-02 00:00:00	2021-08-17 00:00:00	68
5357	417	37	completed	2021-08-29 00:00:00	2021-08-18 00:00:00	90
5358	29	5	shipped	2021-09-08 00:00:00	2021-08-18 00:00:00	54
5359	404	86	shipped	2021-08-31 00:00:00	2021-08-18 00:00:00	7
5360	688	60	completed	2021-08-29 00:00:00	2021-08-18 00:00:00	90
5361	9	16	processing	2021-08-31 00:00:00	2021-08-18 00:00:00	27
5362	356	73	processing	2021-09-11 00:00:00	2021-08-18 00:00:00	64
5363	213	50	shipped	2021-08-26 00:00:00	2021-08-18 00:00:00	13
5364	68	33	shipped	2021-08-23 00:00:00	2021-08-18 00:00:00	30
5365	688	41	shipped	2021-08-22 00:00:00	2021-08-18 00:00:00	62
5366	91	29	completed	2021-09-11 00:00:00	2021-08-18 00:00:00	40
5367	677	3	processing	2021-09-02 00:00:00	2021-08-18 00:00:00	36
5368	247	89	shipped	2021-09-03 00:00:00	2021-08-19 00:00:00	80
5369	564	75	processing	2021-09-13 00:00:00	2021-08-19 00:00:00	79
5370	686	12	shipped	2021-09-15 00:00:00	2021-08-19 00:00:00	1
5371	54	45	processing	2021-09-09 00:00:00	2021-08-19 00:00:00	60
5372	126	25	shipped	2021-09-01 00:00:00	2021-08-19 00:00:00	61
5373	216	62	processing	2021-09-05 00:00:00	2021-08-19 00:00:00	22
5374	225	13	completed	2021-09-16 00:00:00	2021-08-19 00:00:00	63
5375	624	12	shipped	2021-08-24 00:00:00	2021-08-19 00:00:00	20
5376	486	84	processing	2021-09-15 00:00:00	2021-08-19 00:00:00	75
5377	477	71	shipped	2021-08-21 00:00:00	2021-08-20 00:00:00	10
5378	606	89	shipped	2021-08-26 00:00:00	2021-08-20 00:00:00	21
5379	102	74	shipped	2021-09-05 00:00:00	2021-08-20 00:00:00	20
5380	551	20	completed	2021-08-27 00:00:00	2021-08-20 00:00:00	23
5381	533	85	shipped	2021-09-10 00:00:00	2021-08-20 00:00:00	11
5382	237	32	shipped	2021-08-26 00:00:00	2021-08-20 00:00:00	7
5383	15	45	completed	2021-08-24 00:00:00	2021-08-21 00:00:00	66
5384	482	93	processing	2021-08-22 00:00:00	2021-08-21 00:00:00	80
5385	333	81	processing	2021-08-28 00:00:00	2021-08-21 00:00:00	75
5386	41	22	completed	2021-09-03 00:00:00	2021-08-21 00:00:00	32
5387	690	17	shipped	2021-09-09 00:00:00	2021-08-21 00:00:00	6
5388	19	61	shipped	2021-08-30 00:00:00	2021-08-21 00:00:00	26
5389	566	48	processing	2021-08-25 00:00:00	2021-08-21 00:00:00	79
5390	402	54	shipped	2021-09-17 00:00:00	2021-08-21 00:00:00	9
5391	672	84	processing	2021-08-25 00:00:00	2021-08-22 00:00:00	26
5392	73	84	completed	2021-08-23 00:00:00	2021-08-22 00:00:00	97
5393	233	90	processing	2021-09-08 00:00:00	2021-08-22 00:00:00	8
5394	140	28	shipped	2021-09-19 00:00:00	2021-08-22 00:00:00	6
5395	370	38	processing	2021-08-25 00:00:00	2021-08-22 00:00:00	5
5396	492	62	completed	2021-09-01 00:00:00	2021-08-22 00:00:00	75
5397	355	24	shipped	2021-08-25 00:00:00	2021-08-22 00:00:00	1
5398	7	2	processing	2021-09-04 00:00:00	2021-08-22 00:00:00	22
5399	661	67	shipped	2021-09-10 00:00:00	2021-08-22 00:00:00	52
5400	224	99	processing	2021-09-18 00:00:00	2021-08-22 00:00:00	66
5401	64	55	completed	2021-09-10 00:00:00	2021-08-23 00:00:00	7
5402	609	9	shipped	2021-09-04 00:00:00	2021-08-23 00:00:00	71
5403	471	42	shipped	2021-09-05 00:00:00	2021-08-23 00:00:00	25
5404	128	16	completed	2021-09-14 00:00:00	2021-08-23 00:00:00	17
5405	349	27	processing	2021-08-29 00:00:00	2021-08-23 00:00:00	48
5406	91	84	completed	2021-09-20 00:00:00	2021-08-23 00:00:00	53
5407	247	78	processing	2021-09-19 00:00:00	2021-08-23 00:00:00	46
5408	568	64	processing	2021-09-13 00:00:00	2021-08-23 00:00:00	11
5409	43	52	shipped	2021-09-22 00:00:00	2021-08-23 00:00:00	37
5410	233	94	completed	2021-09-22 00:00:00	2021-08-23 00:00:00	90
5411	229	4	completed	2021-09-03 00:00:00	2021-08-23 00:00:00	24
5412	299	90	processing	2021-08-26 00:00:00	2021-08-23 00:00:00	81
5413	641	73	shipped	2021-09-15 00:00:00	2021-08-23 00:00:00	89
5414	262	35	processing	2021-09-22 00:00:00	2021-08-23 00:00:00	71
5415	528	94	shipped	2021-09-01 00:00:00	2021-08-23 00:00:00	77
5416	297	62	shipped	2021-09-15 00:00:00	2021-08-24 00:00:00	52
5417	152	21	shipped	2021-09-10 00:00:00	2021-08-24 00:00:00	16
5418	308	18	completed	2021-09-11 00:00:00	2021-08-24 00:00:00	57
5419	500	34	processing	2021-08-31 00:00:00	2021-08-24 00:00:00	98
5420	233	54	processing	2021-08-25 00:00:00	2021-08-24 00:00:00	13
5421	636	59	completed	2021-08-27 00:00:00	2021-08-25 00:00:00	49
5422	626	5	completed	2021-09-08 00:00:00	2021-08-25 00:00:00	4
5423	516	22	shipped	2021-09-22 00:00:00	2021-08-25 00:00:00	13
5424	51	38	completed	2021-09-15 00:00:00	2021-08-25 00:00:00	93
5425	32	17	shipped	2021-09-11 00:00:00	2021-08-26 00:00:00	6
5426	654	45	completed	2021-09-20 00:00:00	2021-08-26 00:00:00	9
5427	157	27	processing	2021-09-15 00:00:00	2021-08-26 00:00:00	94
5428	558	67	completed	2021-09-20 00:00:00	2021-08-26 00:00:00	95
5429	616	36	completed	2021-09-17 00:00:00	2021-08-26 00:00:00	59
5430	300	35	processing	2021-08-30 00:00:00	2021-08-26 00:00:00	25
5431	529	91	processing	2021-09-22 00:00:00	2021-08-27 00:00:00	3
5432	490	83	shipped	2021-09-16 00:00:00	2021-08-27 00:00:00	65
5433	697	5	completed	2021-08-31 00:00:00	2021-08-28 00:00:00	44
5434	81	74	shipped	2021-09-01 00:00:00	2021-08-28 00:00:00	96
5435	668	60	completed	2021-09-07 00:00:00	2021-08-28 00:00:00	35
5436	577	46	completed	2021-09-12 00:00:00	2021-08-28 00:00:00	13
5437	32	33	processing	2021-09-16 00:00:00	2021-08-29 00:00:00	70
5438	579	41	processing	2021-09-09 00:00:00	2021-08-29 00:00:00	26
5439	36	41	processing	2021-09-12 00:00:00	2021-08-29 00:00:00	82
5440	407	11	completed	2021-09-02 00:00:00	2021-08-30 00:00:00	19
5441	487	47	shipped	2021-09-14 00:00:00	2021-08-30 00:00:00	35
5442	685	99	shipped	2021-09-07 00:00:00	2021-08-30 00:00:00	74
5443	136	49	processing	2021-09-04 00:00:00	2021-08-30 00:00:00	54
5444	384	34	processing	2021-09-29 00:00:00	2021-08-30 00:00:00	66
5445	51	68	processing	2021-09-15 00:00:00	2021-08-30 00:00:00	62
5446	491	100	shipped	2021-09-07 00:00:00	2021-08-31 00:00:00	11
5447	40	37	completed	2021-09-27 00:00:00	2021-08-31 00:00:00	18
5448	204	64	processing	2021-09-28 00:00:00	2021-08-31 00:00:00	33
5449	99	6	processing	2021-09-06 00:00:00	2021-08-31 00:00:00	64
5450	189	31	shipped	2021-09-10 00:00:00	2021-08-31 00:00:00	81
5451	182	29	completed	2021-09-11 00:00:00	2021-09-01 00:00:00	47
5452	209	19	completed	2021-09-12 00:00:00	2021-09-01 00:00:00	28
5453	286	32	completed	2021-09-15 00:00:00	2021-09-01 00:00:00	25
5454	527	29	shipped	2021-09-24 00:00:00	2021-09-01 00:00:00	54
5456	627	5	processing	2021-09-21 00:00:00	2021-09-02 00:00:00	52
5458	191	76	processing	2021-09-23 00:00:00	2021-09-02 00:00:00	67
5459	467	89	shipped	2021-09-13 00:00:00	2021-09-02 00:00:00	64
5460	660	63	processing	2021-09-06 00:00:00	2021-09-02 00:00:00	46
5455	28	23	processing	2021-09-15 00:00:00	2021-09-01 00:00:00	36
5457	465	56	processing	2021-09-03 00:00:00	2021-09-02 00:00:00	30
5463	406	67	completed	2021-09-15 00:00:00	2021-09-03 00:00:00	50
5464	377	79	processing	2021-09-14 00:00:00	2021-09-03 00:00:00	49
5466	129	94	completed	2021-10-01 00:00:00	2021-09-04 00:00:00	73
5468	690	49	completed	2021-09-14 00:00:00	2021-09-04 00:00:00	53
5470	35	62	shipped	2021-09-22 00:00:00	2021-09-04 00:00:00	53
5475	551	82	completed	2021-09-23 00:00:00	2021-09-05 00:00:00	2
5477	667	97	shipped	2021-09-23 00:00:00	2021-09-05 00:00:00	39
5478	367	76	completed	2021-09-13 00:00:00	2021-09-05 00:00:00	38
5479	45	67	processing	2021-09-17 00:00:00	2021-09-05 00:00:00	91
5480	680	59	processing	2021-09-24 00:00:00	2021-09-05 00:00:00	46
5486	484	40	shipped	2021-09-26 00:00:00	2021-09-07 00:00:00	69
5487	492	16	processing	2021-09-23 00:00:00	2021-09-07 00:00:00	82
5491	447	91	completed	2021-09-24 00:00:00	2021-09-08 00:00:00	65
5495	252	37	completed	2021-09-26 00:00:00	2021-09-08 00:00:00	81
5497	158	16	shipped	2021-09-10 00:00:00	2021-09-09 00:00:00	99
5501	157	55	shipped	2021-09-12 00:00:00	2021-09-10 00:00:00	6
5502	680	4	processing	2021-09-25 00:00:00	2021-09-10 00:00:00	55
5503	334	40	completed	2021-10-08 00:00:00	2021-09-11 00:00:00	71
5506	469	74	processing	2021-10-07 00:00:00	2021-09-12 00:00:00	75
5507	510	89	shipped	2021-09-14 00:00:00	2021-09-12 00:00:00	92
5510	478	31	shipped	2021-09-21 00:00:00	2021-09-12 00:00:00	41
5511	442	97	shipped	2021-10-07 00:00:00	2021-09-12 00:00:00	41
5516	553	96	processing	2021-10-01 00:00:00	2021-09-13 00:00:00	95
5517	212	11	processing	2021-10-12 00:00:00	2021-09-14 00:00:00	15
5518	158	30	shipped	2021-10-08 00:00:00	2021-09-14 00:00:00	32
5521	155	41	shipped	2021-09-18 00:00:00	2021-09-15 00:00:00	56
5524	400	78	shipped	2021-10-02 00:00:00	2021-09-16 00:00:00	6
5525	270	90	completed	2021-10-09 00:00:00	2021-09-16 00:00:00	59
5526	608	43	processing	2021-09-18 00:00:00	2021-09-17 00:00:00	44
5528	555	80	shipped	2021-09-19 00:00:00	2021-09-17 00:00:00	82
5530	75	8	completed	2021-09-27 00:00:00	2021-09-17 00:00:00	79
5531	343	88	shipped	2021-10-01 00:00:00	2021-09-18 00:00:00	38
5532	46	55	completed	2021-10-15 00:00:00	2021-09-18 00:00:00	90
5533	464	56	completed	2021-10-03 00:00:00	2021-09-19 00:00:00	45
5535	445	16	shipped	2021-09-25 00:00:00	2021-09-19 00:00:00	3
5536	430	17	completed	2021-10-15 00:00:00	2021-09-19 00:00:00	45
5538	18	67	shipped	2021-09-29 00:00:00	2021-09-20 00:00:00	49
5539	527	54	completed	2021-10-01 00:00:00	2021-09-20 00:00:00	67
5540	189	68	completed	2021-10-12 00:00:00	2021-09-20 00:00:00	56
5542	186	34	shipped	2021-10-08 00:00:00	2021-09-20 00:00:00	65
5544	337	55	shipped	2021-10-19 00:00:00	2021-09-20 00:00:00	26
5545	554	24	shipped	2021-10-04 00:00:00	2021-09-21 00:00:00	9
5547	523	23	processing	2021-10-12 00:00:00	2021-09-21 00:00:00	88
5548	491	33	completed	2021-10-10 00:00:00	2021-09-22 00:00:00	17
5549	385	25	completed	2021-10-14 00:00:00	2021-09-23 00:00:00	87
5550	659	32	processing	2021-10-15 00:00:00	2021-09-23 00:00:00	69
5552	382	53	processing	2021-10-14 00:00:00	2021-09-23 00:00:00	24
5553	28	67	completed	2021-10-05 00:00:00	2021-09-23 00:00:00	15
5626	185	35	processing	2021-10-09 00:00:00	2021-10-04 00:00:00	28
5627	426	84	processing	2021-10-24 00:00:00	2021-10-04 00:00:00	12
5628	186	42	shipped	2021-10-31 00:00:00	2021-10-04 00:00:00	91
5629	57	78	processing	2021-10-20 00:00:00	2021-10-04 00:00:00	53
5632	262	34	completed	2021-10-19 00:00:00	2021-10-04 00:00:00	16
5633	26	96	completed	2021-10-13 00:00:00	2021-10-05 00:00:00	54
5635	559	51	completed	2021-10-18 00:00:00	2021-10-05 00:00:00	94
5636	427	36	processing	2021-10-12 00:00:00	2021-10-05 00:00:00	89
5638	686	39	completed	2021-10-06 00:00:00	2021-10-05 00:00:00	8
5639	112	56	shipped	2021-10-11 00:00:00	2021-10-05 00:00:00	27
5640	70	79	shipped	2021-10-22 00:00:00	2021-10-05 00:00:00	97
5641	84	77	shipped	2021-10-16 00:00:00	2021-10-06 00:00:00	6
5649	117	41	processing	2021-10-21 00:00:00	2021-10-08 00:00:00	55
5650	691	67	shipped	2021-10-21 00:00:00	2021-10-08 00:00:00	72
5651	304	73	completed	2021-10-21 00:00:00	2021-10-09 00:00:00	92
5652	502	17	processing	2021-11-04 00:00:00	2021-10-09 00:00:00	69
5655	28	98	completed	2021-11-03 00:00:00	2021-10-09 00:00:00	79
5658	590	74	processing	2021-10-21 00:00:00	2021-10-10 00:00:00	86
5661	414	72	completed	2021-10-23 00:00:00	2021-10-11 00:00:00	43
5664	693	66	shipped	2021-10-28 00:00:00	2021-10-11 00:00:00	84
5665	269	54	shipped	2021-10-21 00:00:00	2021-10-11 00:00:00	91
5676	685	71	shipped	2021-10-15 00:00:00	2021-10-11 00:00:00	1
5677	688	69	completed	2021-10-21 00:00:00	2021-10-11 00:00:00	77
5678	363	84	shipped	2021-10-29 00:00:00	2021-10-11 00:00:00	55
5679	694	79	processing	2021-10-15 00:00:00	2021-10-11 00:00:00	65
5681	126	88	shipped	2021-10-25 00:00:00	2021-10-11 00:00:00	48
5685	72	47	completed	2021-10-22 00:00:00	2021-10-13 00:00:00	28
5686	44	22	shipped	2021-11-11 00:00:00	2021-10-13 00:00:00	26
5689	119	14	shipped	2021-11-08 00:00:00	2021-10-14 00:00:00	35
5692	277	5	completed	2021-10-26 00:00:00	2021-10-14 00:00:00	9
5693	561	1	shipped	2021-10-22 00:00:00	2021-10-14 00:00:00	90
5695	83	20	shipped	2021-10-18 00:00:00	2021-10-14 00:00:00	72
5696	103	80	shipped	2021-11-13 00:00:00	2021-10-14 00:00:00	93
5697	442	94	processing	2021-11-03 00:00:00	2021-10-14 00:00:00	91
5698	127	62	processing	2021-10-24 00:00:00	2021-10-14 00:00:00	63
5699	164	31	shipped	2021-10-20 00:00:00	2021-10-15 00:00:00	41
5700	413	59	processing	2021-11-02 00:00:00	2021-10-15 00:00:00	22
5701	575	17	completed	2021-11-04 00:00:00	2021-10-16 00:00:00	65
5702	453	50	shipped	2021-11-12 00:00:00	2021-10-16 00:00:00	43
5703	446	50	completed	2021-10-23 00:00:00	2021-10-16 00:00:00	46
5704	319	84	completed	2021-10-26 00:00:00	2021-10-17 00:00:00	99
5705	528	46	completed	2021-10-31 00:00:00	2021-10-17 00:00:00	33
5706	170	77	processing	2021-10-30 00:00:00	2021-10-17 00:00:00	61
5707	666	56	shipped	2021-11-09 00:00:00	2021-10-18 00:00:00	86
5708	228	5	shipped	2021-11-03 00:00:00	2021-10-18 00:00:00	62
5709	668	13	completed	2021-11-01 00:00:00	2021-10-18 00:00:00	31
5710	141	4	shipped	2021-11-07 00:00:00	2021-10-18 00:00:00	38
5711	586	31	completed	2021-10-22 00:00:00	2021-10-18 00:00:00	82
5712	43	34	completed	2021-10-30 00:00:00	2021-10-18 00:00:00	69
5713	532	1	processing	2021-11-04 00:00:00	2021-10-19 00:00:00	46
5714	201	64	processing	2021-10-26 00:00:00	2021-10-19 00:00:00	21
5715	622	36	processing	2021-10-22 00:00:00	2021-10-19 00:00:00	88
5716	625	18	completed	2021-11-15 00:00:00	2021-10-19 00:00:00	82
5717	675	61	shipped	2021-11-02 00:00:00	2021-10-19 00:00:00	53
5718	306	87	completed	2021-10-30 00:00:00	2021-10-19 00:00:00	26
5719	562	40	shipped	2021-11-17 00:00:00	2021-10-19 00:00:00	71
5720	661	42	processing	2021-11-09 00:00:00	2021-10-19 00:00:00	17
5461	264	95	processing	2021-09-10 00:00:00	2021-09-03 00:00:00	46
5462	102	91	shipped	2021-09-12 00:00:00	2021-09-03 00:00:00	91
5465	458	41	completed	2021-09-29 00:00:00	2021-09-04 00:00:00	52
5467	609	58	shipped	2021-09-07 00:00:00	2021-09-04 00:00:00	38
5469	213	44	processing	2021-09-17 00:00:00	2021-09-04 00:00:00	67
5471	96	6	completed	2021-09-15 00:00:00	2021-09-04 00:00:00	38
5472	307	37	completed	2021-09-29 00:00:00	2021-09-04 00:00:00	61
5473	101	97	shipped	2021-09-16 00:00:00	2021-09-05 00:00:00	30
5474	120	21	processing	2021-10-02 00:00:00	2021-09-05 00:00:00	80
5476	90	60	completed	2021-09-06 00:00:00	2021-09-05 00:00:00	56
5481	13	79	completed	2021-10-06 00:00:00	2021-09-06 00:00:00	53
5482	685	90	completed	2021-09-26 00:00:00	2021-09-06 00:00:00	55
5483	588	63	shipped	2021-10-06 00:00:00	2021-09-06 00:00:00	74
5484	506	24	shipped	2021-09-07 00:00:00	2021-09-06 00:00:00	21
5485	25	3	processing	2021-09-17 00:00:00	2021-09-07 00:00:00	92
5488	201	16	completed	2021-10-05 00:00:00	2021-09-08 00:00:00	5
5489	623	55	shipped	2021-10-08 00:00:00	2021-09-08 00:00:00	30
5490	343	63	processing	2021-10-08 00:00:00	2021-09-08 00:00:00	100
5492	493	23	shipped	2021-09-09 00:00:00	2021-09-08 00:00:00	65
5493	416	82	shipped	2021-10-08 00:00:00	2021-09-08 00:00:00	34
5494	66	72	processing	2021-09-21 00:00:00	2021-09-08 00:00:00	37
5496	578	62	shipped	2021-10-05 00:00:00	2021-09-08 00:00:00	50
5498	479	88	completed	2021-09-21 00:00:00	2021-09-09 00:00:00	37
5499	484	84	processing	2021-10-03 00:00:00	2021-09-09 00:00:00	63
5500	454	95	processing	2021-09-15 00:00:00	2021-09-10 00:00:00	55
5504	415	30	shipped	2021-09-12 00:00:00	2021-09-11 00:00:00	52
5505	29	90	shipped	2021-10-03 00:00:00	2021-09-12 00:00:00	80
5508	596	22	processing	2021-09-17 00:00:00	2021-09-12 00:00:00	30
5509	693	32	processing	2021-10-04 00:00:00	2021-09-12 00:00:00	16
5512	208	38	shipped	2021-09-20 00:00:00	2021-09-12 00:00:00	68
5513	115	16	processing	2021-10-04 00:00:00	2021-09-13 00:00:00	38
5514	175	99	processing	2021-10-10 00:00:00	2021-09-13 00:00:00	65
5515	187	36	completed	2021-10-13 00:00:00	2021-09-13 00:00:00	49
5519	299	16	completed	2021-10-05 00:00:00	2021-09-14 00:00:00	41
5520	20	87	completed	2021-09-24 00:00:00	2021-09-14 00:00:00	7
5522	490	50	processing	2021-10-14 00:00:00	2021-09-15 00:00:00	81
5523	345	75	completed	2021-09-17 00:00:00	2021-09-15 00:00:00	85
5527	396	4	processing	2021-09-26 00:00:00	2021-09-17 00:00:00	15
5529	543	71	completed	2021-10-12 00:00:00	2021-09-17 00:00:00	42
5534	231	7	processing	2021-10-09 00:00:00	2021-09-19 00:00:00	51
5537	308	56	processing	2021-09-30 00:00:00	2021-09-20 00:00:00	36
5541	239	24	completed	2021-10-17 00:00:00	2021-09-20 00:00:00	54
5543	347	48	completed	2021-10-08 00:00:00	2021-09-20 00:00:00	34
5546	644	6	shipped	2021-10-15 00:00:00	2021-09-21 00:00:00	15
5551	533	57	shipped	2021-10-10 00:00:00	2021-09-23 00:00:00	5
5554	145	41	processing	2021-09-29 00:00:00	2021-09-23 00:00:00	6
5555	413	92	completed	2021-10-01 00:00:00	2021-09-23 00:00:00	44
5556	39	64	completed	2021-10-22 00:00:00	2021-09-24 00:00:00	70
5557	567	9	completed	2021-10-22 00:00:00	2021-09-24 00:00:00	46
5558	451	46	shipped	2021-10-04 00:00:00	2021-09-24 00:00:00	31
5559	557	20	shipped	2021-10-08 00:00:00	2021-09-24 00:00:00	32
5560	164	28	shipped	2021-10-24 00:00:00	2021-09-24 00:00:00	53
5561	332	89	shipped	2021-10-07 00:00:00	2021-09-24 00:00:00	25
5562	31	86	shipped	2021-10-13 00:00:00	2021-09-24 00:00:00	38
5563	454	51	completed	2021-10-19 00:00:00	2021-09-24 00:00:00	27
5564	172	87	shipped	2021-10-09 00:00:00	2021-09-24 00:00:00	70
5565	578	76	completed	2021-10-20 00:00:00	2021-09-24 00:00:00	49
5566	281	10	processing	2021-10-17 00:00:00	2021-09-24 00:00:00	11
5567	536	94	shipped	2021-10-02 00:00:00	2021-09-24 00:00:00	27
5568	567	39	shipped	2021-10-07 00:00:00	2021-09-24 00:00:00	80
5569	109	17	shipped	2021-10-22 00:00:00	2021-09-24 00:00:00	22
5570	192	7	completed	2021-10-03 00:00:00	2021-09-24 00:00:00	5
5571	1	14	processing	2021-09-26 00:00:00	2021-09-24 00:00:00	78
5572	323	63	processing	2021-10-15 00:00:00	2021-09-24 00:00:00	79
5573	690	23	shipped	2021-09-29 00:00:00	2021-09-24 00:00:00	8
5574	216	82	shipped	2021-10-11 00:00:00	2021-09-24 00:00:00	65
5575	346	38	completed	2021-09-30 00:00:00	2021-09-24 00:00:00	34
5576	392	58	processing	2021-10-09 00:00:00	2021-09-24 00:00:00	78
5577	495	56	processing	2021-10-15 00:00:00	2021-09-25 00:00:00	45
5578	508	46	shipped	2021-10-02 00:00:00	2021-09-25 00:00:00	32
5579	580	85	completed	2021-10-12 00:00:00	2021-09-25 00:00:00	5
5580	246	92	completed	2021-10-19 00:00:00	2021-09-25 00:00:00	25
5581	554	82	processing	2021-10-07 00:00:00	2021-09-26 00:00:00	76
5582	56	100	shipped	2021-10-21 00:00:00	2021-09-26 00:00:00	2
5583	682	60	completed	2021-10-18 00:00:00	2021-09-26 00:00:00	3
5584	446	53	shipped	2021-09-29 00:00:00	2021-09-26 00:00:00	67
5585	45	96	shipped	2021-09-29 00:00:00	2021-09-26 00:00:00	3
5586	74	60	shipped	2021-10-12 00:00:00	2021-09-26 00:00:00	12
5587	59	60	processing	2021-10-20 00:00:00	2021-09-27 00:00:00	11
5588	608	61	completed	2021-10-05 00:00:00	2021-09-27 00:00:00	4
5589	664	31	completed	2021-10-26 00:00:00	2021-09-27 00:00:00	57
5590	229	44	completed	2021-10-07 00:00:00	2021-09-27 00:00:00	65
5591	662	15	processing	2021-10-22 00:00:00	2021-09-27 00:00:00	33
5592	100	11	shipped	2021-10-17 00:00:00	2021-09-27 00:00:00	31
5593	542	54	processing	2021-10-03 00:00:00	2021-09-28 00:00:00	52
5594	359	31	shipped	2021-10-01 00:00:00	2021-09-28 00:00:00	22
5595	605	30	processing	2021-10-06 00:00:00	2021-09-28 00:00:00	94
5596	112	54	processing	2021-10-19 00:00:00	2021-09-28 00:00:00	100
5597	564	30	processing	2021-10-27 00:00:00	2021-09-28 00:00:00	96
5598	405	30	shipped	2021-10-06 00:00:00	2021-09-28 00:00:00	26
5599	422	14	shipped	2021-10-20 00:00:00	2021-09-28 00:00:00	23
5600	676	43	shipped	2021-10-12 00:00:00	2021-09-28 00:00:00	35
5601	508	66	processing	2021-10-19 00:00:00	2021-09-28 00:00:00	59
5602	106	87	shipped	2021-10-27 00:00:00	2021-09-28 00:00:00	96
5603	293	1	shipped	2021-10-06 00:00:00	2021-09-28 00:00:00	43
5604	592	90	completed	2021-10-14 00:00:00	2021-09-28 00:00:00	9
5605	231	37	shipped	2021-10-18 00:00:00	2021-09-29 00:00:00	3
5606	116	20	completed	2021-10-23 00:00:00	2021-09-29 00:00:00	62
5607	24	23	completed	2021-10-07 00:00:00	2021-09-29 00:00:00	26
5608	598	32	shipped	2021-10-21 00:00:00	2021-09-29 00:00:00	19
5609	219	24	processing	2021-10-03 00:00:00	2021-09-30 00:00:00	94
5610	148	3	processing	2021-10-29 00:00:00	2021-09-30 00:00:00	86
5611	554	2	processing	2021-10-16 00:00:00	2021-10-01 00:00:00	49
5612	298	28	processing	2021-10-08 00:00:00	2021-10-01 00:00:00	30
5613	335	84	shipped	2021-10-20 00:00:00	2021-10-01 00:00:00	75
5614	352	63	shipped	2021-10-31 00:00:00	2021-10-01 00:00:00	43
5615	666	35	completed	2021-10-24 00:00:00	2021-10-01 00:00:00	50
5616	606	15	completed	2021-10-31 00:00:00	2021-10-01 00:00:00	5
5617	351	39	completed	2021-10-26 00:00:00	2021-10-02 00:00:00	42
5618	312	60	processing	2021-10-04 00:00:00	2021-10-02 00:00:00	27
5619	422	16	processing	2021-10-23 00:00:00	2021-10-02 00:00:00	66
5620	142	100	completed	2021-11-01 00:00:00	2021-10-02 00:00:00	10
5621	582	53	shipped	2021-10-11 00:00:00	2021-10-03 00:00:00	18
5622	662	4	completed	2021-10-25 00:00:00	2021-10-03 00:00:00	70
5623	429	6	completed	2021-10-23 00:00:00	2021-10-03 00:00:00	71
5624	182	93	completed	2021-10-25 00:00:00	2021-10-03 00:00:00	64
5625	239	68	shipped	2021-10-14 00:00:00	2021-10-03 00:00:00	67
5630	28	70	processing	2021-10-31 00:00:00	2021-10-04 00:00:00	35
5631	673	2	shipped	2021-11-01 00:00:00	2021-10-04 00:00:00	64
5634	51	54	processing	2021-10-14 00:00:00	2021-10-05 00:00:00	39
5637	479	6	processing	2021-10-26 00:00:00	2021-10-05 00:00:00	28
5642	659	27	completed	2021-10-14 00:00:00	2021-10-06 00:00:00	18
5643	263	61	processing	2021-10-25 00:00:00	2021-10-06 00:00:00	83
5644	367	78	completed	2021-10-09 00:00:00	2021-10-06 00:00:00	79
5645	691	2	shipped	2021-10-21 00:00:00	2021-10-06 00:00:00	96
5646	59	63	shipped	2021-10-26 00:00:00	2021-10-06 00:00:00	69
5647	524	13	processing	2021-10-09 00:00:00	2021-10-07 00:00:00	12
5648	416	78	processing	2021-10-23 00:00:00	2021-10-07 00:00:00	82
5653	119	29	completed	2021-10-10 00:00:00	2021-10-09 00:00:00	90
5654	479	86	shipped	2021-10-19 00:00:00	2021-10-09 00:00:00	21
5656	392	67	completed	2021-10-24 00:00:00	2021-10-10 00:00:00	68
5657	509	21	completed	2021-10-29 00:00:00	2021-10-10 00:00:00	93
5659	268	9	completed	2021-11-06 00:00:00	2021-10-10 00:00:00	92
5660	321	57	processing	2021-10-26 00:00:00	2021-10-10 00:00:00	92
5662	67	89	completed	2021-10-22 00:00:00	2021-10-11 00:00:00	34
5663	339	92	processing	2021-10-23 00:00:00	2021-10-11 00:00:00	27
5666	211	21	completed	2021-10-12 00:00:00	2021-10-11 00:00:00	13
5667	480	67	shipped	2021-10-20 00:00:00	2021-10-11 00:00:00	21
5668	520	17	completed	2021-11-07 00:00:00	2021-10-11 00:00:00	82
5669	241	78	processing	2021-10-22 00:00:00	2021-10-11 00:00:00	62
5670	384	54	processing	2021-10-17 00:00:00	2021-10-11 00:00:00	45
5671	506	51	shipped	2021-10-18 00:00:00	2021-10-11 00:00:00	15
5672	35	46	completed	2021-10-21 00:00:00	2021-10-11 00:00:00	48
5673	658	80	shipped	2021-11-08 00:00:00	2021-10-11 00:00:00	46
5674	627	57	processing	2021-10-25 00:00:00	2021-10-11 00:00:00	29
5675	251	48	shipped	2021-10-26 00:00:00	2021-10-11 00:00:00	48
5680	55	70	completed	2021-11-01 00:00:00	2021-10-11 00:00:00	3
5682	574	87	completed	2021-10-28 00:00:00	2021-10-11 00:00:00	80
5683	114	73	completed	2021-11-11 00:00:00	2021-10-12 00:00:00	93
5684	207	17	completed	2021-10-16 00:00:00	2021-10-12 00:00:00	47
5687	388	85	shipped	2021-11-05 00:00:00	2021-10-13 00:00:00	99
5688	624	25	processing	2021-11-12 00:00:00	2021-10-13 00:00:00	12
5690	468	53	shipped	2021-10-28 00:00:00	2021-10-14 00:00:00	33
5691	636	23	shipped	2021-10-15 00:00:00	2021-10-14 00:00:00	28
5694	364	92	completed	2021-11-11 00:00:00	2021-10-14 00:00:00	63
5802	322	61	shipped	2021-11-09 00:00:00	2021-11-01 00:00:00	6
5804	316	36	shipped	2021-11-20 00:00:00	2021-11-02 00:00:00	79
5805	246	89	completed	2021-11-03 00:00:00	2021-11-02 00:00:00	37
5806	293	24	processing	2021-11-04 00:00:00	2021-11-03 00:00:00	63
5807	576	76	processing	2021-11-07 00:00:00	2021-11-03 00:00:00	96
5808	11	65	shipped	2021-11-30 00:00:00	2021-11-03 00:00:00	4
5809	474	2	shipped	2021-11-16 00:00:00	2021-11-03 00:00:00	9
5810	450	23	completed	2021-11-14 00:00:00	2021-11-03 00:00:00	13
5811	578	55	completed	2021-11-30 00:00:00	2021-11-03 00:00:00	28
5812	521	37	shipped	2021-11-13 00:00:00	2021-11-03 00:00:00	70
5813	634	98	processing	2021-11-23 00:00:00	2021-11-04 00:00:00	95
5814	299	67	completed	2021-11-17 00:00:00	2021-11-04 00:00:00	78
5815	93	94	completed	2021-11-19 00:00:00	2021-11-04 00:00:00	22
5816	250	90	completed	2021-12-02 00:00:00	2021-11-05 00:00:00	5
5817	246	70	shipped	2021-11-12 00:00:00	2021-11-05 00:00:00	22
5818	407	75	shipped	2021-11-28 00:00:00	2021-11-05 00:00:00	80
5819	194	94	shipped	2021-11-18 00:00:00	2021-11-05 00:00:00	94
5822	93	35	processing	2021-11-09 00:00:00	2021-11-06 00:00:00	51
5824	243	37	shipped	2021-11-19 00:00:00	2021-11-07 00:00:00	64
5827	421	90	shipped	2021-12-02 00:00:00	2021-11-07 00:00:00	41
5828	436	53	processing	2021-11-30 00:00:00	2021-11-07 00:00:00	51
5829	670	42	shipped	2021-11-18 00:00:00	2021-11-07 00:00:00	20
5830	442	97	completed	2021-12-02 00:00:00	2021-11-07 00:00:00	95
5721	159	69	processing	2021-11-04 00:00:00	2021-10-19 00:00:00	17
5722	278	97	shipped	2021-11-15 00:00:00	2021-10-19 00:00:00	57
5723	416	44	processing	2021-11-04 00:00:00	2021-10-19 00:00:00	90
5724	661	83	shipped	2021-11-04 00:00:00	2021-10-19 00:00:00	87
5725	404	29	shipped	2021-11-17 00:00:00	2021-10-20 00:00:00	5
5726	22	58	completed	2021-10-26 00:00:00	2021-10-20 00:00:00	13
5727	528	70	shipped	2021-10-30 00:00:00	2021-10-20 00:00:00	58
5728	164	70	completed	2021-11-13 00:00:00	2021-10-20 00:00:00	80
5729	102	18	processing	2021-11-15 00:00:00	2021-10-21 00:00:00	92
5730	225	13	completed	2021-10-31 00:00:00	2021-10-21 00:00:00	2
5731	687	23	completed	2021-10-30 00:00:00	2021-10-22 00:00:00	24
5732	663	66	shipped	2021-10-31 00:00:00	2021-10-22 00:00:00	8
5733	682	98	processing	2021-10-23 00:00:00	2021-10-22 00:00:00	79
5734	596	66	shipped	2021-11-19 00:00:00	2021-10-23 00:00:00	90
5735	389	47	shipped	2021-11-15 00:00:00	2021-10-23 00:00:00	21
5736	279	80	shipped	2021-11-07 00:00:00	2021-10-23 00:00:00	18
5737	76	80	shipped	2021-10-25 00:00:00	2021-10-23 00:00:00	26
5738	100	67	processing	2021-10-27 00:00:00	2021-10-23 00:00:00	88
5739	128	32	processing	2021-10-28 00:00:00	2021-10-23 00:00:00	67
5740	500	69	shipped	2021-11-04 00:00:00	2021-10-23 00:00:00	7
5741	389	65	processing	2021-11-04 00:00:00	2021-10-23 00:00:00	40
5742	630	18	processing	2021-11-04 00:00:00	2021-10-23 00:00:00	69
5743	573	21	processing	2021-11-02 00:00:00	2021-10-23 00:00:00	19
5744	222	7	processing	2021-11-07 00:00:00	2021-10-23 00:00:00	49
5745	76	44	completed	2021-11-08 00:00:00	2021-10-24 00:00:00	24
5746	407	92	completed	2021-11-22 00:00:00	2021-10-24 00:00:00	61
5747	202	62	processing	2021-10-31 00:00:00	2021-10-24 00:00:00	50
5748	140	79	processing	2021-11-18 00:00:00	2021-10-24 00:00:00	44
5749	506	42	shipped	2021-10-27 00:00:00	2021-10-24 00:00:00	77
5750	563	38	shipped	2021-10-27 00:00:00	2021-10-24 00:00:00	83
5751	200	7	completed	2021-11-16 00:00:00	2021-10-24 00:00:00	52
5752	404	84	shipped	2021-11-08 00:00:00	2021-10-24 00:00:00	15
5753	225	8	processing	2021-10-29 00:00:00	2021-10-24 00:00:00	14
5754	691	1	shipped	2021-11-03 00:00:00	2021-10-24 00:00:00	80
5755	615	44	shipped	2021-11-21 00:00:00	2021-10-24 00:00:00	61
5756	151	91	completed	2021-10-27 00:00:00	2021-10-24 00:00:00	45
5757	524	41	completed	2021-10-25 00:00:00	2021-10-24 00:00:00	84
5758	212	26	completed	2021-11-16 00:00:00	2021-10-24 00:00:00	78
5759	571	35	shipped	2021-11-03 00:00:00	2021-10-24 00:00:00	67
5760	506	21	shipped	2021-10-26 00:00:00	2021-10-24 00:00:00	78
5761	138	9	shipped	2021-11-23 00:00:00	2021-10-25 00:00:00	13
5762	469	12	processing	2021-11-07 00:00:00	2021-10-25 00:00:00	66
5763	427	33	shipped	2021-10-29 00:00:00	2021-10-25 00:00:00	23
5764	344	36	processing	2021-11-13 00:00:00	2021-10-25 00:00:00	72
5765	178	39	processing	2021-11-10 00:00:00	2021-10-26 00:00:00	62
5766	444	27	processing	2021-11-04 00:00:00	2021-10-26 00:00:00	46
5767	80	21	shipped	2021-10-29 00:00:00	2021-10-26 00:00:00	66
5768	369	12	shipped	2021-11-20 00:00:00	2021-10-26 00:00:00	91
5769	328	54	processing	2021-11-22 00:00:00	2021-10-26 00:00:00	44
5770	398	47	processing	2021-11-24 00:00:00	2021-10-27 00:00:00	68
5771	573	94	shipped	2021-11-03 00:00:00	2021-10-27 00:00:00	68
5772	192	85	shipped	2021-10-30 00:00:00	2021-10-27 00:00:00	88
5773	30	86	shipped	2021-11-08 00:00:00	2021-10-28 00:00:00	20
5774	12	16	processing	2021-11-19 00:00:00	2021-10-28 00:00:00	90
5775	606	13	processing	2021-11-24 00:00:00	2021-10-28 00:00:00	17
5776	441	48	processing	2021-11-14 00:00:00	2021-10-28 00:00:00	49
5777	96	61	processing	2021-11-05 00:00:00	2021-10-28 00:00:00	40
5778	570	82	shipped	2021-11-14 00:00:00	2021-10-28 00:00:00	38
5779	471	52	completed	2021-11-11 00:00:00	2021-10-29 00:00:00	20
5780	61	25	processing	2021-10-30 00:00:00	2021-10-29 00:00:00	79
5781	50	41	shipped	2021-10-31 00:00:00	2021-10-29 00:00:00	77
5782	39	18	completed	2021-11-18 00:00:00	2021-10-29 00:00:00	61
5783	282	7	processing	2021-11-09 00:00:00	2021-10-29 00:00:00	56
5784	392	64	shipped	2021-11-11 00:00:00	2021-10-29 00:00:00	2
5785	192	12	processing	2021-11-19 00:00:00	2021-10-30 00:00:00	41
5786	208	69	processing	2021-11-22 00:00:00	2021-10-31 00:00:00	6
5787	410	32	shipped	2021-11-26 00:00:00	2021-10-31 00:00:00	81
5788	178	75	processing	2021-11-06 00:00:00	2021-10-31 00:00:00	89
5789	124	19	processing	2021-11-20 00:00:00	2021-10-31 00:00:00	20
5790	365	69	processing	2021-11-26 00:00:00	2021-10-31 00:00:00	5
5791	360	47	completed	2021-11-15 00:00:00	2021-10-31 00:00:00	7
5792	273	46	processing	2021-11-02 00:00:00	2021-10-31 00:00:00	69
5793	450	84	processing	2021-11-19 00:00:00	2021-10-31 00:00:00	13
5794	470	7	processing	2021-11-05 00:00:00	2021-10-31 00:00:00	2
5795	348	69	processing	2021-11-14 00:00:00	2021-10-31 00:00:00	74
5796	28	72	processing	2021-11-11 00:00:00	2021-10-31 00:00:00	60
5797	117	100	shipped	2021-11-04 00:00:00	2021-10-31 00:00:00	74
5798	72	83	shipped	2021-11-25 00:00:00	2021-10-31 00:00:00	36
5799	391	78	completed	2021-11-29 00:00:00	2021-10-31 00:00:00	87
5800	331	88	completed	2021-11-03 00:00:00	2021-10-31 00:00:00	45
5801	303	29	shipped	2021-11-11 00:00:00	2021-11-01 00:00:00	5
5803	335	62	shipped	2021-11-17 00:00:00	2021-11-02 00:00:00	65
5820	395	73	shipped	2021-11-20 00:00:00	2021-11-05 00:00:00	98
5821	561	73	completed	2021-11-24 00:00:00	2021-11-06 00:00:00	98
5823	521	26	shipped	2021-11-22 00:00:00	2021-11-06 00:00:00	65
5825	280	9	completed	2021-11-11 00:00:00	2021-11-07 00:00:00	94
5826	152	35	processing	2021-11-25 00:00:00	2021-11-07 00:00:00	100
5831	507	76	completed	2021-12-01 00:00:00	2021-11-07 00:00:00	34
5832	331	1	processing	2021-12-07 00:00:00	2021-11-07 00:00:00	89
5833	303	17	completed	2021-11-23 00:00:00	2021-11-08 00:00:00	28
5834	104	49	shipped	2021-11-30 00:00:00	2021-11-08 00:00:00	7
5835	275	19	completed	2021-11-12 00:00:00	2021-11-08 00:00:00	98
5836	699	11	shipped	2021-12-07 00:00:00	2021-11-08 00:00:00	84
5837	36	80	processing	2021-11-27 00:00:00	2021-11-09 00:00:00	16
5838	383	90	processing	2021-11-11 00:00:00	2021-11-09 00:00:00	65
5839	321	68	shipped	2021-11-12 00:00:00	2021-11-10 00:00:00	72
5840	469	72	completed	2021-12-08 00:00:00	2021-11-10 00:00:00	55
5841	352	10	processing	2021-12-10 00:00:00	2021-11-10 00:00:00	8
5842	240	74	shipped	2021-12-07 00:00:00	2021-11-10 00:00:00	53
5843	190	83	processing	2021-12-07 00:00:00	2021-11-10 00:00:00	39
5844	208	86	processing	2021-11-13 00:00:00	2021-11-10 00:00:00	70
5845	368	20	processing	2021-11-14 00:00:00	2021-11-11 00:00:00	48
5846	166	20	processing	2021-11-18 00:00:00	2021-11-11 00:00:00	70
5847	533	57	completed	2021-11-20 00:00:00	2021-11-11 00:00:00	53
5848	109	81	completed	2021-12-10 00:00:00	2021-11-11 00:00:00	35
5849	636	15	processing	2021-11-18 00:00:00	2021-11-11 00:00:00	41
5850	147	63	completed	2021-11-22 00:00:00	2021-11-11 00:00:00	1
5851	228	51	processing	2021-11-26 00:00:00	2021-11-12 00:00:00	77
5852	438	54	shipped	2021-11-26 00:00:00	2021-11-12 00:00:00	79
5853	360	15	shipped	2021-11-25 00:00:00	2021-11-12 00:00:00	66
5856	436	1	completed	2021-11-20 00:00:00	2021-11-12 00:00:00	71
5861	498	44	processing	2021-11-19 00:00:00	2021-11-15 00:00:00	35
5862	336	19	shipped	2021-12-08 00:00:00	2021-11-15 00:00:00	16
5863	367	11	processing	2021-12-04 00:00:00	2021-11-15 00:00:00	8
5864	61	35	completed	2021-11-19 00:00:00	2021-11-15 00:00:00	55
5865	145	66	processing	2021-11-30 00:00:00	2021-11-15 00:00:00	25
5866	35	62	shipped	2021-11-21 00:00:00	2021-11-15 00:00:00	66
5868	584	90	completed	2021-12-08 00:00:00	2021-11-15 00:00:00	49
5870	374	87	shipped	2021-11-20 00:00:00	2021-11-16 00:00:00	53
5872	153	59	processing	2021-11-24 00:00:00	2021-11-16 00:00:00	76
5874	236	65	shipped	2021-12-06 00:00:00	2021-11-16 00:00:00	94
5877	438	51	completed	2021-11-17 00:00:00	2021-11-16 00:00:00	98
5880	677	20	shipped	2021-12-03 00:00:00	2021-11-16 00:00:00	52
5970	233	92	processing	2022-01-01 00:00:00	2021-12-04 00:00:00	97
5971	240	63	completed	2021-12-31 00:00:00	2021-12-05 00:00:00	96
5975	105	29	completed	2021-12-31 00:00:00	2021-12-05 00:00:00	2
5976	53	47	completed	2021-12-10 00:00:00	2021-12-05 00:00:00	52
5977	679	12	shipped	2021-12-23 00:00:00	2021-12-05 00:00:00	47
5978	236	39	completed	2021-12-31 00:00:00	2021-12-05 00:00:00	11
5979	648	77	shipped	2021-12-11 00:00:00	2021-12-05 00:00:00	67
5993	601	82	processing	2022-01-04 00:00:00	2021-12-08 00:00:00	38
5994	111	54	shipped	2022-01-07 00:00:00	2021-12-08 00:00:00	21
5995	193	10	processing	2022-01-03 00:00:00	2021-12-08 00:00:00	42
5997	268	54	processing	2021-12-17 00:00:00	2021-12-08 00:00:00	77
5999	300	73	shipped	2021-12-20 00:00:00	2021-12-08 00:00:00	86
6001	13	74	processing	2021-12-31 00:00:00	2021-12-09 00:00:00	24
6002	266	53	completed	2022-01-01 00:00:00	2021-12-09 00:00:00	69
6007	317	20	processing	2021-12-30 00:00:00	2021-12-10 00:00:00	20
6008	322	96	shipped	2021-12-21 00:00:00	2021-12-10 00:00:00	35
6009	240	80	processing	2022-01-06 00:00:00	2021-12-10 00:00:00	96
6010	421	35	shipped	2021-12-14 00:00:00	2021-12-10 00:00:00	40
6011	267	71	completed	2021-12-27 00:00:00	2021-12-10 00:00:00	52
6012	416	24	shipped	2021-12-31 00:00:00	2021-12-10 00:00:00	19
6013	292	27	processing	2021-12-27 00:00:00	2021-12-11 00:00:00	29
6014	359	5	processing	2022-01-02 00:00:00	2021-12-11 00:00:00	96
6015	125	59	shipped	2021-12-23 00:00:00	2021-12-11 00:00:00	64
6016	59	13	completed	2022-01-05 00:00:00	2021-12-12 00:00:00	84
6017	34	1	processing	2021-12-30 00:00:00	2021-12-12 00:00:00	97
6018	656	42	completed	2021-12-30 00:00:00	2021-12-12 00:00:00	66
6019	551	41	shipped	2022-01-04 00:00:00	2021-12-12 00:00:00	23
6020	425	34	processing	2021-12-28 00:00:00	2021-12-12 00:00:00	21
6021	481	27	completed	2022-01-06 00:00:00	2021-12-12 00:00:00	90
6022	375	88	processing	2022-01-12 00:00:00	2021-12-13 00:00:00	23
6023	460	96	processing	2022-01-03 00:00:00	2021-12-13 00:00:00	54
6024	687	1	processing	2021-12-31 00:00:00	2021-12-13 00:00:00	72
6025	340	64	shipped	2022-01-02 00:00:00	2021-12-14 00:00:00	24
6026	357	71	completed	2021-12-20 00:00:00	2021-12-14 00:00:00	32
6027	649	66	shipped	2022-01-10 00:00:00	2021-12-14 00:00:00	94
6028	282	77	completed	2022-01-10 00:00:00	2021-12-14 00:00:00	8
6029	333	100	shipped	2021-12-20 00:00:00	2021-12-14 00:00:00	30
6030	180	19	processing	2022-01-10 00:00:00	2021-12-14 00:00:00	80
6031	170	20	processing	2021-12-19 00:00:00	2021-12-15 00:00:00	2
6032	186	70	shipped	2021-12-17 00:00:00	2021-12-15 00:00:00	91
6033	200	98	processing	2021-12-26 00:00:00	2021-12-15 00:00:00	11
6034	5	39	completed	2021-12-26 00:00:00	2021-12-15 00:00:00	66
6035	121	22	shipped	2022-01-10 00:00:00	2021-12-16 00:00:00	34
6036	653	5	shipped	2021-12-26 00:00:00	2021-12-16 00:00:00	64
6037	272	56	shipped	2021-12-28 00:00:00	2021-12-16 00:00:00	69
6038	283	49	shipped	2022-01-11 00:00:00	2021-12-16 00:00:00	34
6039	277	61	shipped	2022-01-05 00:00:00	2021-12-16 00:00:00	58
6040	515	13	completed	2022-01-04 00:00:00	2021-12-16 00:00:00	28
6041	335	63	processing	2021-12-31 00:00:00	2021-12-16 00:00:00	48
6042	680	69	completed	2022-01-02 00:00:00	2021-12-17 00:00:00	48
6043	264	71	completed	2021-12-29 00:00:00	2021-12-17 00:00:00	33
6044	262	70	completed	2022-01-16 00:00:00	2021-12-17 00:00:00	77
6045	535	58	shipped	2021-12-28 00:00:00	2021-12-17 00:00:00	46
6046	384	91	completed	2021-12-25 00:00:00	2021-12-17 00:00:00	30
6047	581	81	processing	2021-12-18 00:00:00	2021-12-17 00:00:00	85
6048	614	95	shipped	2022-01-07 00:00:00	2021-12-17 00:00:00	23
6049	250	18	processing	2022-01-17 00:00:00	2021-12-18 00:00:00	16
6050	159	85	shipped	2022-01-16 00:00:00	2021-12-18 00:00:00	10
6051	321	23	shipped	2021-12-25 00:00:00	2021-12-18 00:00:00	41
6052	664	31	shipped	2022-01-17 00:00:00	2021-12-18 00:00:00	16
6053	633	38	completed	2022-01-02 00:00:00	2021-12-19 00:00:00	3
6054	647	7	processing	2021-12-28 00:00:00	2021-12-19 00:00:00	80
6055	650	3	processing	2021-12-31 00:00:00	2021-12-19 00:00:00	57
6056	509	28	processing	2022-01-10 00:00:00	2021-12-19 00:00:00	57
6057	376	96	completed	2022-01-17 00:00:00	2021-12-19 00:00:00	11
6058	130	96	shipped	2022-01-18 00:00:00	2021-12-19 00:00:00	98
6059	264	92	completed	2022-01-09 00:00:00	2021-12-19 00:00:00	9
6060	313	18	shipped	2022-01-16 00:00:00	2021-12-19 00:00:00	60
6061	9	94	shipped	2021-12-22 00:00:00	2021-12-19 00:00:00	70
6062	115	94	processing	2022-01-03 00:00:00	2021-12-19 00:00:00	72
6063	191	17	processing	2022-01-10 00:00:00	2021-12-19 00:00:00	40
6064	686	31	completed	2021-12-26 00:00:00	2021-12-19 00:00:00	10
6065	81	8	completed	2022-01-12 00:00:00	2021-12-19 00:00:00	1
6066	648	68	completed	2021-12-24 00:00:00	2021-12-19 00:00:00	69
6067	428	35	processing	2021-12-25 00:00:00	2021-12-19 00:00:00	66
6068	444	73	shipped	2022-01-03 00:00:00	2021-12-19 00:00:00	11
6069	295	91	processing	2022-01-11 00:00:00	2021-12-20 00:00:00	52
6070	542	66	processing	2022-01-15 00:00:00	2021-12-20 00:00:00	53
6071	428	53	shipped	2022-01-10 00:00:00	2021-12-20 00:00:00	74
6072	231	63	completed	2022-01-18 00:00:00	2021-12-20 00:00:00	11
6073	108	36	shipped	2022-01-15 00:00:00	2021-12-21 00:00:00	90
6074	624	34	completed	2022-01-06 00:00:00	2021-12-21 00:00:00	50
6075	64	97	processing	2022-01-10 00:00:00	2021-12-21 00:00:00	66
6076	59	30	shipped	2022-01-09 00:00:00	2021-12-21 00:00:00	8
6077	375	52	completed	2022-01-12 00:00:00	2021-12-21 00:00:00	17
6078	338	27	completed	2022-01-16 00:00:00	2021-12-21 00:00:00	85
6079	504	17	completed	2021-12-26 00:00:00	2021-12-22 00:00:00	37
6081	687	56	processing	2022-01-15 00:00:00	2021-12-22 00:00:00	20
6082	642	77	completed	2022-01-17 00:00:00	2021-12-22 00:00:00	42
6083	492	92	completed	2021-12-30 00:00:00	2021-12-22 00:00:00	72
6086	263	77	processing	2022-01-16 00:00:00	2021-12-24 00:00:00	37
5854	60	83	shipped	2021-11-29 00:00:00	2021-11-12 00:00:00	56
5855	353	37	shipped	2021-11-20 00:00:00	2021-11-12 00:00:00	100
5857	364	72	completed	2021-11-15 00:00:00	2021-11-13 00:00:00	27
5858	554	50	completed	2021-12-05 00:00:00	2021-11-13 00:00:00	93
5859	432	59	processing	2021-11-22 00:00:00	2021-11-13 00:00:00	90
5860	402	4	processing	2021-12-03 00:00:00	2021-11-14 00:00:00	83
5867	272	44	completed	2021-12-12 00:00:00	2021-11-15 00:00:00	42
5869	94	27	shipped	2021-12-05 00:00:00	2021-11-16 00:00:00	41
5871	439	51	processing	2021-12-08 00:00:00	2021-11-16 00:00:00	23
5873	255	36	completed	2021-12-09 00:00:00	2021-11-16 00:00:00	10
5875	263	47	shipped	2021-11-29 00:00:00	2021-11-16 00:00:00	41
5876	102	73	completed	2021-12-15 00:00:00	2021-11-16 00:00:00	13
5878	57	49	completed	2021-12-13 00:00:00	2021-11-16 00:00:00	40
5879	496	27	completed	2021-11-28 00:00:00	2021-11-16 00:00:00	12
5881	209	11	completed	2021-12-15 00:00:00	2021-11-17 00:00:00	2
5882	475	21	shipped	2021-11-23 00:00:00	2021-11-17 00:00:00	83
5883	431	81	shipped	2021-12-01 00:00:00	2021-11-17 00:00:00	94
5884	599	22	shipped	2021-12-09 00:00:00	2021-11-17 00:00:00	45
5885	204	66	completed	2021-12-08 00:00:00	2021-11-17 00:00:00	76
5886	293	72	processing	2021-12-12 00:00:00	2021-11-17 00:00:00	78
5887	87	68	processing	2021-12-08 00:00:00	2021-11-17 00:00:00	39
5888	77	45	completed	2021-11-18 00:00:00	2021-11-17 00:00:00	86
5889	190	14	processing	2021-11-24 00:00:00	2021-11-17 00:00:00	85
5890	509	4	processing	2021-11-21 00:00:00	2021-11-17 00:00:00	15
5891	246	69	processing	2021-12-09 00:00:00	2021-11-17 00:00:00	19
5892	683	22	shipped	2021-12-02 00:00:00	2021-11-17 00:00:00	89
5893	389	50	completed	2021-12-10 00:00:00	2021-11-18 00:00:00	74
5894	498	1	processing	2021-11-23 00:00:00	2021-11-18 00:00:00	82
5895	45	28	completed	2021-11-29 00:00:00	2021-11-19 00:00:00	92
5896	156	10	processing	2021-11-23 00:00:00	2021-11-19 00:00:00	97
5897	92	66	shipped	2021-11-26 00:00:00	2021-11-20 00:00:00	6
5898	284	11	completed	2021-11-23 00:00:00	2021-11-20 00:00:00	16
5899	107	8	shipped	2021-12-17 00:00:00	2021-11-21 00:00:00	36
5900	322	58	processing	2021-11-25 00:00:00	2021-11-21 00:00:00	17
5901	312	9	shipped	2021-12-13 00:00:00	2021-11-21 00:00:00	83
5902	401	2	processing	2021-12-02 00:00:00	2021-11-21 00:00:00	33
5903	129	74	shipped	2021-11-22 00:00:00	2021-11-21 00:00:00	83
5904	248	33	shipped	2021-11-23 00:00:00	2021-11-21 00:00:00	62
5905	516	63	processing	2021-11-29 00:00:00	2021-11-22 00:00:00	33
5906	272	67	shipped	2021-12-22 00:00:00	2021-11-22 00:00:00	80
5907	290	50	processing	2021-12-16 00:00:00	2021-11-22 00:00:00	55
5908	130	39	completed	2021-12-17 00:00:00	2021-11-22 00:00:00	83
5909	336	98	completed	2021-12-03 00:00:00	2021-11-22 00:00:00	95
5910	54	58	shipped	2021-11-26 00:00:00	2021-11-22 00:00:00	88
5911	38	91	completed	2021-12-16 00:00:00	2021-11-23 00:00:00	22
5912	362	85	processing	2021-12-06 00:00:00	2021-11-23 00:00:00	85
5913	610	48	shipped	2021-11-26 00:00:00	2021-11-23 00:00:00	99
5914	439	52	completed	2021-12-10 00:00:00	2021-11-23 00:00:00	21
5915	282	39	processing	2021-12-03 00:00:00	2021-11-23 00:00:00	88
5916	498	31	processing	2021-12-10 00:00:00	2021-11-23 00:00:00	46
5917	76	36	processing	2021-12-06 00:00:00	2021-11-24 00:00:00	16
5918	521	22	processing	2021-12-06 00:00:00	2021-11-24 00:00:00	9
5919	58	40	shipped	2021-12-18 00:00:00	2021-11-24 00:00:00	48
5920	502	5	completed	2021-12-16 00:00:00	2021-11-24 00:00:00	63
5921	611	55	processing	2021-12-09 00:00:00	2021-11-24 00:00:00	31
5922	195	80	shipped	2021-12-06 00:00:00	2021-11-24 00:00:00	12
5923	331	34	processing	2021-12-20 00:00:00	2021-11-25 00:00:00	16
5924	462	79	shipped	2021-12-13 00:00:00	2021-11-25 00:00:00	6
5925	305	78	processing	2021-12-03 00:00:00	2021-11-25 00:00:00	20
5926	419	84	processing	2021-12-02 00:00:00	2021-11-25 00:00:00	94
5927	518	87	shipped	2021-11-28 00:00:00	2021-11-25 00:00:00	50
5928	613	63	processing	2021-12-13 00:00:00	2021-11-25 00:00:00	15
5929	374	35	shipped	2021-12-16 00:00:00	2021-11-25 00:00:00	38
5930	48	46	completed	2021-12-05 00:00:00	2021-11-25 00:00:00	93
5931	660	40	shipped	2021-12-01 00:00:00	2021-11-25 00:00:00	93
5932	268	50	processing	2021-12-13 00:00:00	2021-11-25 00:00:00	18
5933	450	94	processing	2021-12-20 00:00:00	2021-11-25 00:00:00	55
5934	308	64	shipped	2021-11-27 00:00:00	2021-11-25 00:00:00	41
5935	264	81	shipped	2021-12-14 00:00:00	2021-11-25 00:00:00	66
5936	332	75	processing	2021-12-07 00:00:00	2021-11-25 00:00:00	1
5937	465	25	processing	2021-11-28 00:00:00	2021-11-26 00:00:00	25
5938	514	39	completed	2021-12-02 00:00:00	2021-11-26 00:00:00	9
5939	236	45	shipped	2021-12-06 00:00:00	2021-11-26 00:00:00	83
5940	530	72	completed	2021-12-19 00:00:00	2021-11-26 00:00:00	78
5941	390	92	shipped	2021-12-10 00:00:00	2021-11-27 00:00:00	8
5942	284	88	processing	2021-12-24 00:00:00	2021-11-27 00:00:00	50
5943	101	89	shipped	2021-12-08 00:00:00	2021-11-27 00:00:00	86
5944	463	97	processing	2021-12-23 00:00:00	2021-11-28 00:00:00	44
5945	60	21	completed	2021-12-08 00:00:00	2021-11-28 00:00:00	92
5946	243	2	shipped	2021-12-21 00:00:00	2021-11-28 00:00:00	30
5947	363	42	processing	2021-12-13 00:00:00	2021-11-28 00:00:00	4
5948	663	11	completed	2021-12-17 00:00:00	2021-11-28 00:00:00	9
5949	546	24	processing	2021-12-12 00:00:00	2021-11-29 00:00:00	86
5950	602	52	processing	2021-12-14 00:00:00	2021-11-29 00:00:00	97
5951	94	57	shipped	2021-12-04 00:00:00	2021-11-29 00:00:00	50
5952	485	3	processing	2021-12-13 00:00:00	2021-11-29 00:00:00	35
5953	433	56	processing	2021-12-17 00:00:00	2021-11-30 00:00:00	89
5954	144	27	shipped	2021-12-20 00:00:00	2021-11-30 00:00:00	2
5955	271	98	processing	2021-12-25 00:00:00	2021-11-30 00:00:00	19
5956	559	7	shipped	2021-12-09 00:00:00	2021-11-30 00:00:00	6
5957	123	16	shipped	2021-12-08 00:00:00	2021-12-01 00:00:00	17
5958	302	29	processing	2021-12-04 00:00:00	2021-12-01 00:00:00	46
5959	379	7	completed	2021-12-29 00:00:00	2021-12-02 00:00:00	12
5960	91	16	processing	2021-12-26 00:00:00	2021-12-02 00:00:00	66
5961	456	81	processing	2021-12-04 00:00:00	2021-12-03 00:00:00	91
5962	507	58	processing	2022-01-02 00:00:00	2021-12-03 00:00:00	81
5963	317	62	completed	2021-12-29 00:00:00	2021-12-03 00:00:00	94
5964	321	95	shipped	2021-12-24 00:00:00	2021-12-03 00:00:00	86
5965	258	4	shipped	2021-12-08 00:00:00	2021-12-03 00:00:00	18
5966	272	73	processing	2021-12-31 00:00:00	2021-12-04 00:00:00	2
5967	202	77	shipped	2021-12-30 00:00:00	2021-12-04 00:00:00	41
5968	309	65	shipped	2021-12-21 00:00:00	2021-12-04 00:00:00	96
5969	457	59	completed	2022-01-01 00:00:00	2021-12-04 00:00:00	32
5972	99	10	processing	2021-12-15 00:00:00	2021-12-05 00:00:00	51
5973	286	31	completed	2021-12-07 00:00:00	2021-12-05 00:00:00	40
5974	58	52	processing	2021-12-24 00:00:00	2021-12-05 00:00:00	25
5980	279	53	processing	2021-12-28 00:00:00	2021-12-05 00:00:00	8
5981	248	98	completed	2021-12-27 00:00:00	2021-12-05 00:00:00	7
5982	678	14	completed	2021-12-29 00:00:00	2021-12-05 00:00:00	14
5983	528	68	shipped	2021-12-24 00:00:00	2021-12-05 00:00:00	69
5984	509	37	shipped	2021-12-13 00:00:00	2021-12-05 00:00:00	25
5985	333	78	completed	2021-12-29 00:00:00	2021-12-05 00:00:00	66
5986	268	86	completed	2021-12-22 00:00:00	2021-12-06 00:00:00	76
5987	462	27	completed	2021-12-29 00:00:00	2021-12-06 00:00:00	59
5988	650	8	processing	2021-12-19 00:00:00	2021-12-06 00:00:00	76
5989	447	33	processing	2021-12-30 00:00:00	2021-12-06 00:00:00	20
5990	55	4	processing	2021-12-28 00:00:00	2021-12-06 00:00:00	95
5991	601	71	processing	2022-01-02 00:00:00	2021-12-07 00:00:00	56
5992	530	9	completed	2021-12-24 00:00:00	2021-12-07 00:00:00	10
5996	294	66	shipped	2022-01-03 00:00:00	2021-12-08 00:00:00	70
5998	592	56	processing	2021-12-28 00:00:00	2021-12-08 00:00:00	29
6000	492	9	shipped	2022-01-02 00:00:00	2021-12-08 00:00:00	16
6003	52	45	completed	2021-12-31 00:00:00	2021-12-09 00:00:00	52
6004	254	67	shipped	2021-12-29 00:00:00	2021-12-09 00:00:00	47
6005	131	44	shipped	2021-12-22 00:00:00	2021-12-09 00:00:00	82
6006	48	16	processing	2021-12-17 00:00:00	2021-12-09 00:00:00	53
6080	590	63	processing	2022-01-09 00:00:00	2021-12-22 00:00:00	54
6084	667	17	completed	2022-01-05 00:00:00	2021-12-23 00:00:00	50
6085	219	12	shipped	2021-12-28 00:00:00	2021-12-24 00:00:00	78
6087	250	65	shipped	2021-12-26 00:00:00	2021-12-24 00:00:00	87
6088	153	11	processing	2022-01-07 00:00:00	2021-12-25 00:00:00	57
6089	363	22	shipped	2022-01-16 00:00:00	2021-12-25 00:00:00	6
6090	125	78	shipped	2022-01-20 00:00:00	2021-12-25 00:00:00	49
6091	247	34	processing	2021-12-31 00:00:00	2021-12-26 00:00:00	96
6092	393	26	completed	2022-01-19 00:00:00	2021-12-26 00:00:00	71
6140	315	86	shipped	2022-01-24 00:00:00	2022-01-03 00:00:00	4
6142	618	62	processing	2022-01-17 00:00:00	2022-01-04 00:00:00	61
6143	396	31	processing	2022-02-02 00:00:00	2022-01-04 00:00:00	76
6144	377	35	completed	2022-01-29 00:00:00	2022-01-04 00:00:00	70
6147	494	41	completed	2022-01-23 00:00:00	2022-01-04 00:00:00	94
6148	491	77	processing	2022-01-27 00:00:00	2022-01-04 00:00:00	66
6151	142	81	shipped	2022-01-23 00:00:00	2022-01-04 00:00:00	99
6154	551	79	shipped	2022-01-12 00:00:00	2022-01-04 00:00:00	7
6156	683	85	shipped	2022-02-02 00:00:00	2022-01-04 00:00:00	66
6157	490	51	shipped	2022-01-08 00:00:00	2022-01-05 00:00:00	91
6158	120	6	shipped	2022-01-10 00:00:00	2022-01-05 00:00:00	60
6159	362	8	completed	2022-01-25 00:00:00	2022-01-05 00:00:00	29
6160	86	77	processing	2022-01-22 00:00:00	2022-01-05 00:00:00	87
6164	511	13	completed	2022-01-18 00:00:00	2022-01-07 00:00:00	2
6166	154	65	completed	2022-01-10 00:00:00	2022-01-07 00:00:00	30
6167	151	89	processing	2022-01-13 00:00:00	2022-01-07 00:00:00	74
6168	645	38	processing	2022-01-09 00:00:00	2022-01-08 00:00:00	39
6169	141	48	completed	2022-01-15 00:00:00	2022-01-08 00:00:00	78
6170	250	87	shipped	2022-01-15 00:00:00	2022-01-08 00:00:00	95
6171	101	95	processing	2022-02-05 00:00:00	2022-01-08 00:00:00	65
6172	362	1	completed	2022-02-05 00:00:00	2022-01-08 00:00:00	82
6173	98	1	shipped	2022-01-27 00:00:00	2022-01-08 00:00:00	37
6174	443	36	processing	2022-01-22 00:00:00	2022-01-08 00:00:00	57
6175	161	80	shipped	2022-01-30 00:00:00	2022-01-09 00:00:00	21
6176	126	33	shipped	2022-02-07 00:00:00	2022-01-10 00:00:00	17
6177	655	35	shipped	2022-02-01 00:00:00	2022-01-10 00:00:00	44
6178	600	30	processing	2022-02-01 00:00:00	2022-01-10 00:00:00	36
6179	157	10	shipped	2022-01-19 00:00:00	2022-01-10 00:00:00	13
6180	107	18	processing	2022-02-09 00:00:00	2022-01-10 00:00:00	93
6181	441	38	shipped	2022-01-18 00:00:00	2022-01-11 00:00:00	29
\.


--
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: chatbi
--

COPY public.product_categories (id, created_at, name) FROM stdin;
1	2016-12-25 06:50:22	Clothing
2	2016-11-24 21:42:09	Phones
3	2016-10-31 00:43:56	Computers
4	2016-10-24 17:02:57	Electronics
5	2016-12-14 02:50:20	Jewellery
6	2017-01-21 21:31:25	Watches
7	2017-02-03 22:21:31	Beauty
8	2016-11-28 16:16:50	Toys
9	2017-02-21 18:44:01	Home
10	2017-01-03 16:31:19	Sports
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: chatbi
--

COPY public.products (id, name, description, created_at, supplier_id, product_category_id) FROM stdin;
1	Generic Fresh Keyboard	Tools Incredible Frozen Keyboard	2020-02-22 00:00:00	33	3
2	Gorgeous Cotton Sausages	Jewelery Practical Soft Bike	2020-05-04 00:00:00	79	2
3	Practical Wooden Keyboard	Movies Tasty Plastic Fish	2019-03-14 00:00:00	41	1
4	Handmade Wooden Soap	Tools Gorgeous Frozen Ball	2019-04-28 00:00:00	88	8
5	Handcrafted Rubber Chicken	Outdoors Practical Granite Car	2019-05-09 00:00:00	83	2
6	Handcrafted Plastic Chair	Electronics Sleek Rubber Tuna	2021-02-27 00:00:00	71	2
7	Refined Soft Mouse	Garden Gorgeous Wooden Tuna	2021-05-24 00:00:00	38	5
8	Practical Plastic Sausages	Movies Small Steel Tuna	2021-07-30 00:00:00	25	6
9	Handmade Wooden Chicken	Clothing Incredible Wooden Towels	2020-11-10 00:00:00	56	5
10	Fantastic Rubber Shirt	Clothing Licensed Fresh Chicken	2019-12-09 00:00:00	35	8
11	Intelligent Soft Car	Clothing Unbranded Metal Computer	2020-04-11 00:00:00	15	9
12	Handcrafted Rubber Chips	Tools Generic Metal Shoes	2021-01-02 00:00:00	66	4
13	Incredible Granite Cheese	Health Licensed Frozen Table	2020-03-13 00:00:00	6	9
14	Small Fresh Pants	Baby Rustic Frozen Sausages	2019-02-07 00:00:00	73	5
15	Intelligent Cotton Ball	Grocery Small Cotton Chicken	2019-03-03 00:00:00	56	10
16	Licensed Plastic Tuna	Grocery Tasty Soft Chicken	2021-06-30 00:00:00	99	1
17	Incredible Granite Bacon	Kids Refined Wooden Sausages	2021-05-18 00:00:00	65	5
18	Refined Concrete Cheese	Computers Small Frozen Ball	2021-09-14 00:00:00	44	6
19	Intelligent Concrete Pizza	Home Intelligent Soft Bike	2021-05-11 00:00:00	78	4
20	Sleek Soft Chicken	Baby Rustic Plastic Pizza	2021-04-17 00:00:00	48	9
21	Sleek Rubber Bike	Tools Licensed Plastic Bike	2020-11-12 00:00:00	5	4
22	Tasty Rubber Mouse	Books Awesome Cotton Bike	2021-06-20 00:00:00	2	2
23	Licensed Cotton Fish	Movies Awesome Concrete Soap	2021-03-05 00:00:00	54	5
24	Tasty Plastic Mouse	Baby Incredible Metal Chicken	2020-10-14 00:00:00	67	6
25	Generic Plastic Bacon	Toys Fantastic Metal Pizza	2021-05-01 00:00:00	56	8
26	Incredible Steel Chair	Music Tasty Soft Towels	2019-06-08 00:00:00	17	8
27	Tasty Wooden Pants	Home Incredible Fresh Towels	2019-01-19 00:00:00	40	10
28	Handmade Concrete Keyboard	Music Licensed Concrete Cheese	2020-06-05 00:00:00	67	8
29	Handcrafted Rubber Shirt	Movies Unbranded Metal Towels	2020-03-12 00:00:00	62	10
30	Gorgeous Cotton Gloves	Outdoors Tasty Wooden Bike	2020-12-11 00:00:00	21	7
31	Licensed Metal Chicken	Sports Gorgeous Frozen Keyboard	2019-06-15 00:00:00	3	4
32	Handcrafted Steel Mouse	Baby Fantastic Frozen Mouse	2019-03-30 00:00:00	34	4
33	Fantastic Granite Pizza	Kids Tasty Soft Shoes	2021-11-29 00:00:00	3	3
34	Practical Plastic Chair	Beauty Ergonomic Soft Bacon	2019-11-16 00:00:00	67	6
35	Handcrafted Granite Fish	Jewelery Incredible Concrete Towels	2020-02-19 00:00:00	19	2
36	Practical Fresh Keyboard	Grocery Sleek Steel Ball	2019-09-17 00:00:00	85	5
37	Unbranded Cotton Keyboard	Grocery Incredible Concrete Mouse	2020-01-06 00:00:00	2	8
38	Handmade Wooden Tuna	Computers Licensed Rubber Shirt	2021-09-30 00:00:00	30	9
39	Sleek Rubber Chair	Computers Refined Cotton Shirt	2021-09-26 00:00:00	1	4
40	Gorgeous Plastic Gloves	Automotive Gorgeous Rubber Bike	2019-06-23 00:00:00	31	2
41	Licensed Frozen Table	Garden Gorgeous Steel Pizza	2019-12-22 00:00:00	92	10
42	Generic Wooden Gloves	Games Unbranded Rubber Chair	2021-11-27 00:00:00	56	6
43	Handmade Soft Keyboard	Grocery Fantastic Frozen Pants	2020-03-05 00:00:00	5	2
44	Awesome Cotton Sausages	Garden Gorgeous Cotton Tuna	2019-10-29 00:00:00	68	2
45	Small Metal Table	Toys Refined Steel Fish	2019-12-03 00:00:00	33	9
46	Practical Metal Chicken	Toys Awesome Frozen Chips	2020-07-24 00:00:00	2	8
47	Refined Fresh Car	Automotive Handcrafted Granite Hat	2021-11-23 00:00:00	31	2
48	Intelligent Wooden Mouse	Outdoors Unbranded Metal Tuna	2020-06-20 00:00:00	86	9
49	Unbranded Frozen Shirt	Games Small Steel Tuna	2019-09-12 00:00:00	9	3
50	Fantastic Granite Bacon	Computers Rustic Rubber Tuna	2020-06-09 00:00:00	50	5
51	Handcrafted Cotton Table	Home Rustic Steel Pants	2019-05-26 00:00:00	90	3
52	Rustic Fresh Computer	Games Generic Cotton Mouse	2019-04-08 00:00:00	51	6
53	Rustic Soft Fish	Health Incredible Wooden Fish	2020-10-18 00:00:00	57	10
54	Licensed Metal Chips	Outdoors Gorgeous Frozen Chicken	2021-05-13 00:00:00	50	1
55	Fantastic Plastic Salad	Home Intelligent Granite Towels	2020-06-15 00:00:00	96	6
56	Incredible Frozen Chips	Baby Generic Fresh Chair	2020-10-11 00:00:00	10	9
57	Refined Rubber Pants	Kids Licensed Soft Gloves	2021-03-05 00:00:00	86	7
58	Incredible Plastic Chair	Industrial Handcrafted Wooden Shirt	2019-06-25 00:00:00	36	3
59	Fantastic Frozen Pants	Jewelery Unbranded Rubber Shirt	2019-03-15 00:00:00	41	9
60	Generic Cotton Shirt	Games Handcrafted Rubber Car	2019-02-21 00:00:00	76	4
61	Generic Metal Pants	Automotive Ergonomic Fresh Keyboard	2019-01-10 00:00:00	53	7
62	Gorgeous Fresh Shirt	Automotive Rustic Fresh Salad	2021-12-22 00:00:00	46	8
63	Ergonomic Rubber Chicken	Toys Awesome Wooden Sausages	2020-05-27 00:00:00	84	1
64	Practical Plastic Ball	Home Gorgeous Plastic Towels	2021-07-13 00:00:00	86	1
65	Fantastic Frozen Chips	Sports Fantastic Soft Pizza	2021-10-08 00:00:00	91	1
66	Sleek Metal Shirt	Garden Ergonomic Wooden Shoes	2021-07-09 00:00:00	5	5
67	Handmade Wooden Gloves	Automotive Refined Soft Chips	2020-12-17 00:00:00	35	9
68	Gorgeous Rubber Chips	Automotive Practical Plastic Chair	2020-06-20 00:00:00	49	6
69	Rustic Steel Bacon	Clothing Intelligent Soft Tuna	2020-06-12 00:00:00	11	8
70	Practical Concrete Car	Sports Unbranded Plastic Pizza	2019-01-27 00:00:00	62	6
71	Refined Granite Fish	Baby Refined Fresh Keyboard	2019-10-08 00:00:00	22	5
72	Rustic Granite Gloves	Books Licensed Fresh Pants	2019-02-11 00:00:00	100	8
73	Sleek Steel Pizza	Industrial Handcrafted Steel Fish	2019-02-25 00:00:00	23	9
74	Rustic Metal Towels	Books Fantastic Cotton Bike	2019-09-28 00:00:00	89	8
75	Intelligent Metal Ball	Electronics Incredible Steel Salad	2020-06-25 00:00:00	50	3
76	Sleek Wooden Towels	Tools Fantastic Frozen Ball	2020-06-21 00:00:00	43	6
77	Ergonomic Granite Towels	Games Incredible Wooden Bacon	2019-02-21 00:00:00	72	10
78	Unbranded Wooden Mouse	Outdoors Incredible Rubber Car	2019-07-16 00:00:00	37	9
79	Practical Concrete Hat	Home Handcrafted Cotton Ball	2021-03-17 00:00:00	84	2
80	Tasty Soft Chicken	Health Rustic Concrete Chicken	2019-03-31 00:00:00	18	9
81	Refined Frozen Pants	Automotive Rustic Soft Ball	2021-02-21 00:00:00	22	5
82	Refined Cotton Towels	Clothing Awesome Plastic Salad	2021-05-07 00:00:00	5	1
83	Awesome Rubber Soap	Grocery Generic Steel Pizza	2021-02-16 00:00:00	19	1
88	Intelligent Rubber Pants	Books Gorgeous Metal Cheese	2021-06-13 00:00:00	5	2
99	Gorgeous Concrete Towels	Movies Refined Frozen Mouse	2021-01-22 00:00:00	56	5
84	Awesome Wooden Pizza	Books Intelligent Rubber Table	2020-10-14 00:00:00	46	5
89	Practical Cotton Shoes	Industrial Sleek Concrete Pizza	2019-11-24 00:00:00	84	6
91	Handcrafted Frozen Table	Music Ergonomic Concrete Pizza	2021-07-12 00:00:00	18	4
96	Tasty Frozen Ball	Baby Fantastic Fresh Bike	2020-08-29 00:00:00	11	7
85	Tasty Plastic Salad	Baby Fantastic Granite Soap	2021-12-19 00:00:00	51	10
86	Gorgeous Cotton Computer	Industrial Intelligent Concrete Keyboard	2021-02-04 00:00:00	25	6
87	Handcrafted Frozen Soap	Tools Sleek Steel Towels	2021-01-24 00:00:00	52	3
90	Gorgeous Plastic Bike	Automotive Fantastic Concrete Shirt	2021-02-27 00:00:00	76	8
92	Awesome Soft Salad	Garden Small Granite Sausages	2021-10-23 00:00:00	100	10
93	Ergonomic Steel Tuna	Grocery Handcrafted Soft Chips	2021-03-23 00:00:00	61	10
94	Incredible Soft Salad	Tools Refined Soft Computer	2020-10-14 00:00:00	7	9
95	Incredible Fresh Chicken	Electronics Generic Fresh Computer	2020-06-29 00:00:00	84	8
97	Generic Wooden Pizza	Games Refined Rubber Gloves	2019-09-14 00:00:00	21	3
98	Practical Cotton Bacon	Kids Tasty Cotton Salad	2020-05-07 00:00:00	26	10
100	Awesome Fresh Keyboard	Home Rustic Rubber Bacon	2021-10-05 00:00:00	18	1
\.


--
-- Data for Name: products_clean; Type: TABLE DATA; Schema: public; Owner: chatbi
--

COPY public.products_clean (id, name, description, created_at, supplier_id, product_category_id, etl_build_ts, etl_build_name) FROM stdin;
1	Generic Fresh Keyboard	Tools Incredible Frozen Keyboard	2020-02-22 00:00:00	33	3	2024-10-28	etl_datasculpt
2	Gorgeous Cotton Sausages	Jewelery Practical Soft Bike	2020-05-04 00:00:00	79	2	2024-10-28	etl_datasculpt
3	Practical Wooden Keyboard	Movies Tasty Plastic Fish	2019-03-14 00:00:00	41	1	2024-10-28	etl_datasculpt
4	Handmade Wooden Soap	Tools Gorgeous Frozen Ball	2019-04-28 00:00:00	88	8	2024-10-28	etl_datasculpt
5	Handcrafted Rubber Chicken	Outdoors Practical Granite Car	2019-05-09 00:00:00	83	2	2024-10-28	etl_datasculpt
6	Handcrafted Plastic Chair	Electronics Sleek Rubber Tuna	2021-02-27 00:00:00	71	2	2024-10-28	etl_datasculpt
7	Refined Soft Mouse	Garden Gorgeous Wooden Tuna	2021-05-24 00:00:00	38	5	2024-10-28	etl_datasculpt
8	Practical Plastic Sausages	Movies Small Steel Tuna	2021-07-30 00:00:00	25	6	2024-10-28	etl_datasculpt
9	Handmade Wooden Chicken	Clothing Incredible Wooden Towels	2020-11-10 00:00:00	56	5	2024-10-28	etl_datasculpt
10	Fantastic Rubber Shirt	Clothing Licensed Fresh Chicken	2019-12-09 00:00:00	35	8	2024-10-28	etl_datasculpt
11	Intelligent Soft Car	Clothing Unbranded Metal Computer	2020-04-11 00:00:00	15	9	2024-10-28	etl_datasculpt
12	Handcrafted Rubber Chips	Tools Generic Metal Shoes	2021-01-02 00:00:00	66	4	2024-10-28	etl_datasculpt
13	Incredible Granite Cheese	Health Licensed Frozen Table	2020-03-13 00:00:00	6	9	2024-10-28	etl_datasculpt
14	Small Fresh Pants	Baby Rustic Frozen Sausages	2019-02-07 00:00:00	73	5	2024-10-28	etl_datasculpt
15	Intelligent Cotton Ball	Grocery Small Cotton Chicken	2019-03-03 00:00:00	56	10	2024-10-28	etl_datasculpt
16	Licensed Plastic Tuna	Grocery Tasty Soft Chicken	2021-06-30 00:00:00	99	1	2024-10-28	etl_datasculpt
17	Incredible Granite Bacon	Kids Refined Wooden Sausages	2021-05-18 00:00:00	65	5	2024-10-28	etl_datasculpt
18	Refined Concrete Cheese	Computers Small Frozen Ball	2021-09-14 00:00:00	44	6	2024-10-28	etl_datasculpt
19	Intelligent Concrete Pizza	Home Intelligent Soft Bike	2021-05-11 00:00:00	78	4	2024-10-28	etl_datasculpt
20	Sleek Soft Chicken	Baby Rustic Plastic Pizza	2021-04-17 00:00:00	48	9	2024-10-28	etl_datasculpt
21	Sleek Rubber Bike	Tools Licensed Plastic Bike	2020-11-12 00:00:00	5	4	2024-10-28	etl_datasculpt
22	Tasty Rubber Mouse	Books Awesome Cotton Bike	2021-06-20 00:00:00	2	2	2024-10-28	etl_datasculpt
23	Licensed Cotton Fish	Movies Awesome Concrete Soap	2021-03-05 00:00:00	54	5	2024-10-28	etl_datasculpt
24	Tasty Plastic Mouse	Baby Incredible Metal Chicken	2020-10-14 00:00:00	67	6	2024-10-28	etl_datasculpt
25	Generic Plastic Bacon	Toys Fantastic Metal Pizza	2021-05-01 00:00:00	56	8	2024-10-28	etl_datasculpt
26	Incredible Steel Chair	Music Tasty Soft Towels	2019-06-08 00:00:00	17	8	2024-10-28	etl_datasculpt
27	Tasty Wooden Pants	Home Incredible Fresh Towels	2019-01-19 00:00:00	40	10	2024-10-28	etl_datasculpt
28	Handmade Concrete Keyboard	Music Licensed Concrete Cheese	2020-06-05 00:00:00	67	8	2024-10-28	etl_datasculpt
29	Handcrafted Rubber Shirt	Movies Unbranded Metal Towels	2020-03-12 00:00:00	62	10	2024-10-28	etl_datasculpt
30	Gorgeous Cotton Gloves	Outdoors Tasty Wooden Bike	2020-12-11 00:00:00	21	7	2024-10-28	etl_datasculpt
31	Licensed Metal Chicken	Sports Gorgeous Frozen Keyboard	2019-06-15 00:00:00	3	4	2024-10-28	etl_datasculpt
32	Handcrafted Steel Mouse	Baby Fantastic Frozen Mouse	2019-03-30 00:00:00	34	4	2024-10-28	etl_datasculpt
33	Fantastic Granite Pizza	Kids Tasty Soft Shoes	2021-11-29 00:00:00	3	3	2024-10-28	etl_datasculpt
34	Practical Plastic Chair	Beauty Ergonomic Soft Bacon	2019-11-16 00:00:00	67	6	2024-10-28	etl_datasculpt
35	Handcrafted Granite Fish	Jewelery Incredible Concrete Towels	2020-02-19 00:00:00	19	2	2024-10-28	etl_datasculpt
36	Practical Fresh Keyboard	Grocery Sleek Steel Ball	2019-09-17 00:00:00	85	5	2024-10-28	etl_datasculpt
37	Unbranded Cotton Keyboard	Grocery Incredible Concrete Mouse	2020-01-06 00:00:00	2	8	2024-10-28	etl_datasculpt
38	Handmade Wooden Tuna	Computers Licensed Rubber Shirt	2021-09-30 00:00:00	30	9	2024-10-28	etl_datasculpt
39	Sleek Rubber Chair	Computers Refined Cotton Shirt	2021-09-26 00:00:00	1	4	2024-10-28	etl_datasculpt
40	Gorgeous Plastic Gloves	Automotive Gorgeous Rubber Bike	2019-06-23 00:00:00	31	2	2024-10-28	etl_datasculpt
41	Licensed Frozen Table	Garden Gorgeous Steel Pizza	2019-12-22 00:00:00	92	10	2024-10-28	etl_datasculpt
42	Generic Wooden Gloves	Games Unbranded Rubber Chair	2021-11-27 00:00:00	56	6	2024-10-28	etl_datasculpt
43	Handmade Soft Keyboard	Grocery Fantastic Frozen Pants	2020-03-05 00:00:00	5	2	2024-10-28	etl_datasculpt
44	Awesome Cotton Sausages	Garden Gorgeous Cotton Tuna	2019-10-29 00:00:00	68	2	2024-10-28	etl_datasculpt
45	Small Metal Table	Toys Refined Steel Fish	2019-12-03 00:00:00	33	9	2024-10-28	etl_datasculpt
46	Practical Metal Chicken	Toys Awesome Frozen Chips	2020-07-24 00:00:00	2	8	2024-10-28	etl_datasculpt
47	Refined Fresh Car	Automotive Handcrafted Granite Hat	2021-11-23 00:00:00	31	2	2024-10-28	etl_datasculpt
48	Intelligent Wooden Mouse	Outdoors Unbranded Metal Tuna	2020-06-20 00:00:00	86	9	2024-10-28	etl_datasculpt
49	Unbranded Frozen Shirt	Games Small Steel Tuna	2019-09-12 00:00:00	9	3	2024-10-28	etl_datasculpt
50	Fantastic Granite Bacon	Computers Rustic Rubber Tuna	2020-06-09 00:00:00	50	5	2024-10-28	etl_datasculpt
51	Handcrafted Cotton Table	Home Rustic Steel Pants	2019-05-26 00:00:00	90	3	2024-10-28	etl_datasculpt
52	Rustic Fresh Computer	Games Generic Cotton Mouse	2019-04-08 00:00:00	51	6	2024-10-28	etl_datasculpt
53	Rustic Soft Fish	Health Incredible Wooden Fish	2020-10-18 00:00:00	57	10	2024-10-28	etl_datasculpt
54	Licensed Metal Chips	Outdoors Gorgeous Frozen Chicken	2021-05-13 00:00:00	50	1	2024-10-28	etl_datasculpt
55	Fantastic Plastic Salad	Home Intelligent Granite Towels	2020-06-15 00:00:00	96	6	2024-10-28	etl_datasculpt
56	Incredible Frozen Chips	Baby Generic Fresh Chair	2020-10-11 00:00:00	10	9	2024-10-28	etl_datasculpt
57	Refined Rubber Pants	Kids Licensed Soft Gloves	2021-03-05 00:00:00	86	7	2024-10-28	etl_datasculpt
58	Incredible Plastic Chair	Industrial Handcrafted Wooden Shirt	2019-06-25 00:00:00	36	3	2024-10-28	etl_datasculpt
59	Fantastic Frozen Pants	Jewelery Unbranded Rubber Shirt	2019-03-15 00:00:00	41	9	2024-10-28	etl_datasculpt
60	Generic Cotton Shirt	Games Handcrafted Rubber Car	2019-02-21 00:00:00	76	4	2024-10-28	etl_datasculpt
61	Generic Metal Pants	Automotive Ergonomic Fresh Keyboard	2019-01-10 00:00:00	53	7	2024-10-28	etl_datasculpt
62	Gorgeous Fresh Shirt	Automotive Rustic Fresh Salad	2021-12-22 00:00:00	46	8	2024-10-28	etl_datasculpt
63	Ergonomic Rubber Chicken	Toys Awesome Wooden Sausages	2020-05-27 00:00:00	84	1	2024-10-28	etl_datasculpt
64	Practical Plastic Ball	Home Gorgeous Plastic Towels	2021-07-13 00:00:00	86	1	2024-10-28	etl_datasculpt
65	Fantastic Frozen Chips	Sports Fantastic Soft Pizza	2021-10-08 00:00:00	91	1	2024-10-28	etl_datasculpt
66	Sleek Metal Shirt	Garden Ergonomic Wooden Shoes	2021-07-09 00:00:00	5	5	2024-10-28	etl_datasculpt
67	Handmade Wooden Gloves	Automotive Refined Soft Chips	2020-12-17 00:00:00	35	9	2024-10-28	etl_datasculpt
68	Gorgeous Rubber Chips	Automotive Practical Plastic Chair	2020-06-20 00:00:00	49	6	2024-10-28	etl_datasculpt
69	Rustic Steel Bacon	Clothing Intelligent Soft Tuna	2020-06-12 00:00:00	11	8	2024-10-28	etl_datasculpt
70	Practical Concrete Car	Sports Unbranded Plastic Pizza	2019-01-27 00:00:00	62	6	2024-10-28	etl_datasculpt
71	Refined Granite Fish	Baby Refined Fresh Keyboard	2019-10-08 00:00:00	22	5	2024-10-28	etl_datasculpt
72	Rustic Granite Gloves	Books Licensed Fresh Pants	2019-02-11 00:00:00	100	8	2024-10-28	etl_datasculpt
73	Sleek Steel Pizza	Industrial Handcrafted Steel Fish	2019-02-25 00:00:00	23	9	2024-10-28	etl_datasculpt
74	Rustic Metal Towels	Books Fantastic Cotton Bike	2019-09-28 00:00:00	89	8	2024-10-28	etl_datasculpt
75	Intelligent Metal Ball	Electronics Incredible Steel Salad	2020-06-25 00:00:00	50	3	2024-10-28	etl_datasculpt
76	Sleek Wooden Towels	Tools Fantastic Frozen Ball	2020-06-21 00:00:00	43	6	2024-10-28	etl_datasculpt
77	Ergonomic Granite Towels	Games Incredible Wooden Bacon	2019-02-21 00:00:00	72	10	2024-10-28	etl_datasculpt
78	Unbranded Wooden Mouse	Outdoors Incredible Rubber Car	2019-07-16 00:00:00	37	9	2024-10-28	etl_datasculpt
79	Practical Concrete Hat	Home Handcrafted Cotton Ball	2021-03-17 00:00:00	84	2	2024-10-28	etl_datasculpt
80	Tasty Soft Chicken	Health Rustic Concrete Chicken	2019-03-31 00:00:00	18	9	2024-10-28	etl_datasculpt
81	Refined Frozen Pants	Automotive Rustic Soft Ball	2021-02-21 00:00:00	22	5	2024-10-28	etl_datasculpt
82	Refined Cotton Towels	Clothing Awesome Plastic Salad	2021-05-07 00:00:00	5	1	2024-10-28	etl_datasculpt
83	Awesome Rubber Soap	Grocery Generic Steel Pizza	2021-02-16 00:00:00	19	1	2024-10-28	etl_datasculpt
88	Intelligent Rubber Pants	Books Gorgeous Metal Cheese	2021-06-13 00:00:00	5	2	2024-10-28	etl_datasculpt
99	Gorgeous Concrete Towels	Movies Refined Frozen Mouse	2021-01-22 00:00:00	56	5	2024-10-28	etl_datasculpt
84	Awesome Wooden Pizza	Books Intelligent Rubber Table	2020-10-14 00:00:00	46	5	2024-10-28	etl_datasculpt
89	Practical Cotton Shoes	Industrial Sleek Concrete Pizza	2019-11-24 00:00:00	84	6	2024-10-28	etl_datasculpt
91	Handcrafted Frozen Table	Music Ergonomic Concrete Pizza	2021-07-12 00:00:00	18	4	2024-10-28	etl_datasculpt
96	Tasty Frozen Ball	Baby Fantastic Fresh Bike	2020-08-29 00:00:00	11	7	2024-10-28	etl_datasculpt
85	Tasty Plastic Salad	Baby Fantastic Granite Soap	2021-12-19 00:00:00	51	10	2024-10-28	etl_datasculpt
86	Gorgeous Cotton Computer	Industrial Intelligent Concrete Keyboard	2021-02-04 00:00:00	25	6	2024-10-28	etl_datasculpt
87	Handcrafted Frozen Soap	Tools Sleek Steel Towels	2021-01-24 00:00:00	52	3	2024-10-28	etl_datasculpt
90	Gorgeous Plastic Bike	Automotive Fantastic Concrete Shirt	2021-02-27 00:00:00	76	8	2024-10-28	etl_datasculpt
92	Awesome Soft Salad	Garden Small Granite Sausages	2021-10-23 00:00:00	100	10	2024-10-28	etl_datasculpt
93	Ergonomic Steel Tuna	Grocery Handcrafted Soft Chips	2021-03-23 00:00:00	61	10	2024-10-28	etl_datasculpt
94	Incredible Soft Salad	Tools Refined Soft Computer	2020-10-14 00:00:00	7	9	2024-10-28	etl_datasculpt
95	Incredible Fresh Chicken	Electronics Generic Fresh Computer	2020-06-29 00:00:00	84	8	2024-10-28	etl_datasculpt
97	Generic Wooden Pizza	Games Refined Rubber Gloves	2019-09-14 00:00:00	21	3	2024-10-28	etl_datasculpt
98	Practical Cotton Bacon	Kids Tasty Cotton Salad	2020-05-07 00:00:00	26	10	2024-10-28	etl_datasculpt
100	Awesome Fresh Keyboard	Home Rustic Rubber Bacon	2021-10-05 00:00:00	18	1	2024-10-28	etl_datasculpt
\.


--
-- Data for Name: student_teacher; Type: TABLE DATA; Schema: public; Owner: chatbi
--

COPY public.student_teacher (student_id, teacher_id, id) FROM stdin;
1	1	1
1	2	2
2	1	3
2	2	4
\.


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: chatbi
--

COPY public.suppliers (id, address, email, created_at, company) FROM stdin;
1	6845 Orci Avenue	sit.amet@ultriciesligula.com	2017-09-16 21:25:57	Ipsum Incorporated
2	3755 Tempor Rd.	eget@nuncullamcorper.edu	2016-10-05 05:14:40	Enim Ltd
3	6841 Mauris Av.	Nullam.feugiat.placerat@odiosagittissemper.net	2018-12-07 01:56:01	Ipsum Leo Foundation
4	6523 Cursus Rd.	Phasellus.at.augue@risusDuisa.co.uk	2019-02-16 17:28:11	At Pede Cras Corporation
5	P.O. Box 800, 6310 Eu Rd.	dolor.tempus@elit.net	2017-01-22 12:18:11	Eget Volutpat Limited
6	442 Aliquam Avenue	gravida.sit.amet@risus.net	2018-10-28 22:50:29	Ullamcorper Duis LLC
7	P.O. Box 947, 4761 Consectetuer St.	sapien@lectusNullam.ca	2018-07-20 06:07:22	Scelerisque Foundation
8	P.O. Box 714, 501 Sit Avenue	volutpat@Quisquepurussapien.net	2018-12-08 07:44:35	Elit Aliquam Auctor Incorporated
9	Ap #630-2093 Aliquam Avenue	augue.Sed@ullamcorper.org	2016-09-24 22:51:43	A Inc.
10	Ap #435-9227 Nunc St.	Sed.nunc@Etiamgravidamolestie.co.uk	2016-11-16 21:49:15	Imperdiet LLC
11	P.O. Box 899, 6870 Sed Street	malesuada@id.co.uk	2019-01-04 05:56:18	Urna Ut Tincidunt Inc.
12	194-271 Diam. Av.	dapibus.ligula@congue.com	2017-03-16 20:50:13	Dolor Sit Amet Associates
13	668-9568 Velit. Rd.	Quisque@risusDonec.org	2017-04-20 10:07:50	Non Bibendum Sed Incorporated
14	Ap #424-2088 Suspendisse St.	Quisque.purus.sapien@lobortis.com	2018-06-10 21:31:20	Eu Turpis Foundation
15	P.O. Box 367, 727 Aenean Av.	et.ipsum.cursus@fermentumconvallis.ca	2018-03-29 08:47:06	Sagittis Nullam Industries
16	129-7517 Egestas Avenue	elit.erat.vitae@arcu.org	2016-10-11 16:07:35	Egestas A Scelerisque Ltd
17	590-7965 Nisi Street	est.tempor.bibendum@ridiculusmusProin.ca	2017-02-12 15:19:52	Non Company
18	P.O. Box 700, 3864 Tincidunt. Street	Cras@consectetuercursuset.co.uk	2018-02-26 13:10:42	Quisque Purus Sapien Limited
19	768-2240 Sapien Avenue	Mauris@ac.com	2018-09-03 02:54:00	Tortor Inc.
20	Ap #620-3092 Malesuada St.	tortor.dictum.eu@Pellentesqueultricies.edu	2018-01-26 03:14:38	Ut Industries
21	P.O. Box 579, 4233 Ultricies Rd.	sagittis.placerat@nibhsitamet.ca	2018-04-29 02:20:18	Tortor At Risus Institute
22	512-7140 Lobortis Av.	felis@nibhDonec.ca	2017-01-04 02:16:59	In Cursus Incorporated
23	Ap #463-812 Id, Street	eget.metus.eu@justoProinnon.co.uk	2017-03-30 06:36:52	Ut Dolor Inc.
24	Ap #953-7335 Porttitor Rd.	porttitor@mifringilla.net	2016-12-06 17:27:06	Scelerisque Scelerisque Industries
25	9135 Luctus Av.	pulvinar@scelerisquenequesed.com	2018-11-10 10:30:42	Eget Corp.
26	2805 Turpis Ave	at.pede@laciniaSed.org	2018-06-18 22:48:44	Suspendisse Sagittis Ltd
27	2147 Et, Avenue	non.lacinia.at@risusDuisa.org	2019-01-28 13:47:32	Adipiscing Lobortis Associates
28	P.O. Box 546, 4193 Aliquet, Rd.	eu.eros@semper.net	2018-04-02 14:55:02	Nibh Associates
29	4126 Donec Street	eget.dictum.placerat@dolor.co.uk	2016-10-17 10:34:50	Ornare Ltd
30	Ap #940-4287 Egestas. Road	eu@lacinia.co.uk	2018-07-22 23:24:54	Posuere Ltd
31	6443 Ac Street	netus.et.malesuada@orcilobortisaugue.edu	2017-01-17 01:18:17	Fusce Consulting
32	P.O. Box 867, 2109 Sed Avenue	Aliquam@egestasrhoncusProin.net	2017-08-30 11:39:36	Morbi Ltd
33	103-1537 Morbi Rd.	sit@suscipit.edu	2018-08-02 13:43:25	Tempus Risus Foundation
34	4556 Lectus St.	in.faucibus.orci@adipiscing.net	2017-06-12 19:46:46	Proin PC
35	Ap #695-2694 Feugiat Av.	Mauris.nulla@consectetuer.co.uk	2017-11-12 14:16:41	Sapien Molestie Orci Ltd
36	1066 Erat St.	In@Maecenaslibero.net	2017-10-31 03:57:31	Convallis Inc.
37	914-7194 Nisl. Av.	orci.sem.eget@nasceturridiculus.co.uk	2016-11-12 02:34:26	Erat Eget Associates
38	P.O. Box 746, 1392 Et Road	Vivamus@lacus.net	2017-08-05 13:32:26	Vitae Erat Vivamus Company
39	7028 Sed Road	Maecenas@lacinia.edu	2018-06-06 16:19:49	Ipsum Cursus Foundation
40	501-3407 Dolor, Avenue	ipsum@nullavulputate.org	2017-05-11 18:49:13	Ut Inc.
41	5155 Interdum. Avenue	magna.a@magnaet.ca	2018-04-21 06:57:12	Vestibulum Mauris Magna Limited
42	Ap #335-2051 Placerat. Ave	primis.in.faucibus@aodiosemper.net	2018-12-10 08:51:15	Dictum Proin Corporation
43	Ap #429-8230 Turpis. Av.	nec.tempus.scelerisque@Sedneque.net	2018-01-16 14:25:59	Pede Malesuada Vel Limited
44	P.O. Box 194, 6601 Elit Road	Lorem.ipsum.dolor@pharetrased.net	2018-04-02 17:44:13	Ligula Donec Industries
45	P.O. Box 760, 536 Donec Road	sapien@dolorquamelementum.com	2018-09-20 20:12:31	Non Lorem Limited
46	P.O. Box 244, 3366 Duis Avenue	ultrices.posuere@at.edu	2018-04-10 05:16:08	Sed Company
47	778-4900 Massa. Street	Donec.non@velesttempor.net	2018-02-10 04:56:53	Ultricies Adipiscing Enim LLC
48	Ap #152-2565 Molestie Ave	ultrices.Duis@nequevenenatis.ca	2016-09-24 04:13:57	Purus PC
49	P.O. Box 634, 5998 Pellentesque Road	enim.Etiam.gravida@convallisantelectus.co.uk	2017-09-09 16:01:07	Ante Nunc Mauris Ltd
50	Ap #345-6621 Duis Rd.	vel.faucibus@DonectinciduntDonec.org	2017-09-01 18:42:48	Enim Gravida Sit Inc.
51	P.O. Box 993, 3621 Duis Avenue	erat@necimperdietnec.co.uk	2016-11-14 20:49:12	Eu Incorporated
52	911-2412 In Av.	dignissim.lacus.Aliquam@at.org	2017-08-27 07:53:14	Ut Dolor Dapibus Limited
53	518-1353 Duis Street	dapibus.gravida.Aliquam@congueturpisIn.com	2019-02-27 17:44:55	Lorem Ac PC
54	219-9735 Sed St.	id.ante@natoque.org	2016-10-06 00:32:08	Metus Sit Amet Limited
55	3963 Non St.	magna.Phasellus.dolor@InfaucibusMorbi.ca	2017-03-21 19:52:11	Nullam Corp.
56	6082 Nec St.	est.congue.a@enimCurabitur.net	2016-12-16 12:50:48	Luctus Aliquet Odio Corporation
57	792 Dui Street	Praesent.luctus.Curabitur@metusIn.edu	2018-02-26 16:11:19	Donec Elementum Lorem Limited
58	P.O. Box 325, 4872 Dui, Av.	rutrum@volutpat.ca	2016-09-06 09:57:24	Nec Metus Facilisis LLP
59	Ap #359-8986 Volutpat. St.	Morbi@sitamet.ca	2018-11-08 01:23:53	Cursus Et LLC
60	6228 Nisi. Av.	est@facilisisfacilisismagna.net	2017-09-29 06:24:14	Senectus Et Ltd
61	897-3460 Arcu. Ave	in.cursus@Duisdignissimtempor.co.uk	2017-12-03 20:37:12	Volutpat Nulla Facilisis Company
62	P.O. Box 619, 1926 Imperdiet, St.	ac.arcu.Nunc@fringillapurusmauris.com	2016-11-28 07:22:38	Eu Foundation
63	904-8454 Cras Ave	neque.pellentesque@amifringilla.edu	2017-10-09 16:52:37	Ac Mattis Industries
64	710-3507 Amet St.	a.malesuada@etmagnisdis.co.uk	2017-12-05 21:51:22	Non Dui Nec Limited
65	884-5218 Scelerisque St.	magna.Cras@eratSed.edu	2017-05-23 22:09:32	Nulla Dignissim Maecenas Corp.
66	Ap #994-6283 Est Rd.	vitae@eutempor.org	2017-04-23 03:17:17	Mattis Cras Incorporated
67	Ap #955-3163 Egestas. St.	risus.a@Sedauctor.co.uk	2017-07-24 09:20:18	Parturient Inc.
68	538-2024 Sodales Rd.	id.risus@luctuslobortisClass.net	2017-05-16 15:41:07	Justo Eu Arcu Inc.
69	788-5733 Tempor Rd.	elementum.at.egestas@atiaculis.com	2017-03-26 22:39:03	Sed Neque Sed Corporation
70	7852 Risus. Rd.	amet.risus.Donec@eget.com	2018-07-24 20:20:28	Hendrerit Associates
71	5413 Ligula. Av.	Nam@Integervitae.ca	2018-02-04 16:15:16	Urna Convallis Industries
72	Ap #328-6738 Nec, Rd.	eu.arcu.Morbi@porttitor.net	2017-09-09 09:36:02	Dapibus Quam Quis Company
73	1588 Mi Rd.	diam.at.pretium@purus.org	2017-11-26 18:07:22	Ut Corporation
74	Ap #776-6470 Mi Street	nunc.sit@pedeet.net	2017-08-09 16:56:18	Amet Diam Eu Ltd
75	1483 Rhoncus. Rd.	sem.ut.dolor@vitaerisusDuis.co.uk	2018-05-13 05:55:25	Ipsum Ac Mi Corp.
76	702-3865 Sit Avenue	lobortis@a.com	2016-09-12 07:01:14	Consectetuer Cursus Consulting
77	225-6778 Turpis. Avenue	dolor.egestas@metus.org	2018-01-03 19:49:47	Parturient Company
78	Ap #877-4123 Tempus Rd.	purus.Duis@acurnaUt.org	2017-03-26 07:23:23	Aliquam Nisl LLP
79	P.O. Box 966, 8153 Facilisis. Rd.	lectus@scelerisque.com	2019-01-24 06:46:18	Rutrum Urna Consulting
80	Ap #634-6343 Consequat St.	orci.luctus@tortor.edu	2017-02-27 17:24:45	Scelerisque Sed Institute
81	680-7980 Egestas Street	nibh@egestashendrerit.net	2018-09-24 15:29:16	Donec Nibh Enim Associates
82	4639 Vitae Avenue	pharetra.nibh@in.ca	2018-12-19 02:56:08	Aliquam Rutrum Lorem Incorporated
83	709-6774 Luctus Ave	at.pede.Cras@nec.org	2016-11-06 20:12:35	Ante Ipsum Corp.
84	5568 Egestas. Av.	tellus@loremDonec.edu	2017-07-17 21:53:41	Nulla Aliquet Proin PC
85	443-7806 Mauris Ave	lorem.ac.risus@placeratCras.co.uk	2017-05-04 02:30:53	Arcu Sed Institute
86	581-3889 Ligula. Rd.	elit.Nulla.facilisi@Sedeget.co.uk	2018-11-16 20:57:12	Varius Inc.
87	956-244 Magna St.	non.leo.Vivamus@ornarelectus.com	2019-02-23 12:07:33	Vehicula Risus Nulla Inc.
88	874 Dignissim. Rd.	at.sem.molestie@Nunc.org	2018-05-06 06:43:45	Leo Elementum Sem Corporation
89	4084 Non, Street	laoreet@semper.com	2017-08-15 01:59:58	Egestas LLC
90	Ap #791-1589 Eu Street	ut.pellentesque@fringillaornare.edu	2017-08-28 08:07:12	Fames Ac Turpis PC
91	P.O. Box 326, 5981 Imperdiet St.	Aliquam.auctor.velit@luctuslobortisClass.net	2018-11-02 02:36:53	Ullamcorper Duis Cursus Corp.
92	P.O. Box 894, 8799 Magna Rd.	nascetur@consectetueripsum.org	2018-12-15 06:01:10	Class Aptent Taciti Consulting
93	5203 Laoreet Rd.	ante.ipsum.primis@bibendumfermentummetus.net	2017-01-17 03:21:45	Cras LLC
94	Ap #509-5272 Nonummy Avenue	eleifend@dolornonummyac.edu	2017-11-26 07:05:15	Lobortis Mauris Suspendisse Consulting
95	P.O. Box 688, 8892 Est Rd.	Mauris.magna@euenimEtiam.net	2017-11-14 19:15:08	Tellus Id Consulting
96	Ap #480-2469 Praesent St.	augue.eu@Curabiturconsequatlectus.co.uk	2017-04-06 16:54:34	Eu Associates
97	Ap #209-4483 Quis, Ave	orci.Donec.nibh@velit.org	2016-09-29 11:12:37	Aliquam Inc.
98	574-2867 Non, St.	laoreet.ipsum@eleifendnunc.co.uk	2017-10-12 17:42:40	Adipiscing Ligula Aenean Inc.
99	Ap #537-5867 Ligula. St.	enim@consectetuerrhoncusNullam.org	2019-02-27 05:52:58	Nullam Limited
100	Ap #543-7572 Consectetuer Rd.	purus.accumsan@Proin.org	2018-10-19 12:01:47	Massa Integer LLC
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: chatbi
--

COPY public.teachers (id, first_name, last_name, school, hire_date, salary) FROM stdin;
1	Janet	Smith	F.D. Roosevelt HS	2011-10-30	36200
2	Lee	Reynolds	F.D. Roosevelt HS	1993-05-22	65000
3	Samuel	Cole	Myers Middle School	2005-08-01	43500
4	Samantha	Bush	Myers Middle School	2011-10-30	36200
5	Betty	Diaz	Myers Middle School	2005-08-30	43500
6	Kathleen	Roush	F.D. Roosevelt HS	2010-10-22	38500
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: chatbi
--

COPY public.users (id, city, age, company, gender, created_at, first_name, last_name, state) FROM stdin;
407	San Francisco	51	In Consulting	male	2019-12-20 22:22:52	Rudy	Reilly	us-mt
408	Seattle	84	Elit Fermentum Industries	male	2018-09-14 14:55:15	Chaz	O'Connell	us-nh
409	Seattle	55	Sapien Nunc Associates	male	2017-11-09 10:47:26	Kacie	Stoltenberg	us-mo
411	Seattle	55	Vestibulum Massa LLP	male	2019-01-01 15:55:17	Onie	Hodkiewicz	us-nm
412	Los Angeles	73	Vitae Posuere At Corp.	male	2019-12-19 14:44:01	Delphine	Effertz	us-co
414	Palo Alto	26	Ut Ltd	male	2019-05-28 00:39:21	Arvel	Anderson	us-me
416	Austin	65	Nisi Nibh Lacinia Limited	male	2018-05-03 17:19:02	Breana	Shanahan	us-nv
417	Chicago	31	Nunc Mauris LLP	male	2017-10-03 10:37:02	Anastacio	Romaguera	us-ky
419	Los Angeles	65	Laoreet Libero PC	male	2019-02-06 03:35:10	Catherine	Zboncak	us-vt
420	Mountain View	55	Non Associates	male	2019-02-23 01:12:42	Noemie	Botsford	us-il
421	Palo Alto	43	Augue Ltd	male	2019-05-04 07:46:52	Ismael	Kling	us-nd
423	New York	72	Dolor Company	male	2018-06-29 23:37:47	Keegan	Walter	us-nv
424	San Francisco	46	Mauris Industries	male	2019-06-13 05:31:41	Ressie	Goldner	us-ct
425	Chicago	28	Semper Tellus Corporation	male	2019-02-24 05:54:08	Nels	Mertz	us-nd
427	San Francisco	79	Nascetur LLC	male	2018-01-31 06:19:21	Aiyana	Bailey	us-wy
428	New York	43	Nec Cursus Industries	male	2018-07-09 02:56:47	Isabelle	Wiza	us-pa
429	New York	44	In Ltd	male	2017-12-30 09:09:18	Elias	Lind	us-ks
431	New York	59	Morbi Tristique Incorporated	male	2019-03-03 11:37:40	Quinn	Tillman	us-ga
432	Palo Alto	31	In Molestie Tortor Ltd	male	2017-08-13 08:33:04	Larue	Kessler	us-md
433	Seattle	73	Mi Pede Ltd	male	2018-01-10 23:44:13	Cordell	Rodriguez	us-nc
435	Austin	82	Cursus Purus Nullam Corp.	male	2018-11-08 23:47:03	Carole	Luettgen	us-tx
436	San Francisco	60	Est Arcu Associates	male	2018-01-19 16:23:44	Pearlie	Rau	us-nc
437	Austin	23	Hendrerit Neque In Inc.	male	2018-01-24 10:46:55	Marcos	Simonis	us-ar
438	San Francisco	29	Orci Luctus LLP	female	2018-09-07 02:31:47	Jefferey	Schowalter	us-vt
440	Austin	47	Eget Consulting	female	2019-09-01 09:50:19	Iva	Swift	us-ri
441	Palo Alto	64	Fames Incorporated	female	2019-02-22 07:53:26	Bridgette	Yundt	us-pa
443	Austin	49	Phasellus Dolor Elit LLP	female	2019-01-26 20:25:40	Martina	Collins	us-ar
445	Seattle	52	Mus LLP	female	2019-08-05 10:07:14	Maude	Renner	us-nc
447	Los Angeles	47	Sed Pede Company	female	2018-05-20 13:27:47	Moses	Koelpin	us-nv
448	New York	80	Pellentesque LLC	female	2019-09-06 00:08:02	Theodora	Krajcik	us-ct
449	Austin	60	Nulla Semper Tellus Company	female	2019-12-11 22:12:00	Florian	Greenholt	us-ma
553	Austin	57	Ut Tincidunt Orci Limited	female	2018-06-04 23:37:21	Antonia	Moore	us-sd
554	Seattle	67	Neque Institute	female	2019-10-26 21:33:04	Eugenia	Mitchell	us-tn
555	Palo Alto	51	Faucibus Id Associates	female	2019-09-13 10:54:09	Oral	Kautzer	us-wy
556	Los Angeles	66	Vel Venenatis Vel Institute	female	2017-11-20 06:53:08	Seth	Kautzer	us-pa
557	Palo Alto	66	Et Euismod Et Ltd	female	2018-09-04 02:22:46	Lauryn	Howe	us-al
559	Austin	49	Ligula Tortor Dictum LLC	female	2019-03-01 17:41:37	Flossie	Upton	us-de
560	Los Angeles	70	Magna Praesent Foundation	female	2018-06-06 17:31:39	Claud	Pagac	us-id
561	Mountain View	38	Duis Risus Odio Associates	female	2019-07-01 06:03:06	Tierra	Bartell	us-de
562	Mountain View	82	Sit Consulting	female	2018-10-04 16:41:03	Lexi	Prosacco	us-ia
564	Mountain View	58	Risus Donec Egestas LLP	female	2019-03-18 11:34:46	Nathanial	Okuneva	us-id
565	Chicago	78	Sit Amet Corporation	female	2018-08-31 16:03:47	Lauryn	Wunsch	us-tx
568	Palo Alto	51	Mollis Corp.	female	2018-11-09 07:48:16	Jarrod	Weber	us-ms
569	Austin	34	Nisi Corporation	female	2019-05-03 09:44:59	Uriah	Dach	us-nj
571	Austin	58	Feugiat Placerat Inc.	female	2019-02-12 05:28:47	Sharon	Yundt	us-tn
572	Chicago	82	Orci Tincidunt Adipiscing Foundation	female	2019-05-22 23:16:43	Isaias	Lind	us-ks
573	Chicago	26	Augue Inc.	female	2019-12-05 13:54:23	Ashtyn	Gaylord	us-wa
575	Palo Alto	44	Mus Aenean Foundation	male	2017-08-14 08:54:31	Denis	Miller	us-nd
577	Austin	58	At Pede Incorporated	male	2019-01-11 09:26:26	Larue	Streich	us-mn
578	San Francisco	34	Donec Tempus Lorem LLC	male	2019-09-17 17:53:49	Luna	Swift	us-tx
579	Mountain View	65	Ut Cursus Institute	male	2019-12-22 09:21:48	Jarod	Wilderman	us-de
580	New York	59	Sed Institute	male	2019-04-20 06:08:46	Olaf	Schmitt	us-tx
581	Los Angeles	45	Cubilia Curae; Donec Corporation	male	2017-09-26 10:24:01	Stacy	Russel	us-nh
582	Austin	66	Tellus Faucibus Leo Associates	male	2019-10-10 16:40:29	Elyssa	Greenfelder	us-nv
584	Mountain View	27	Dolor Fusce Incorporated	male	2018-02-01 11:49:59	Colin	Reichel	us-ky
586	Seattle	36	Orci Inc.	male	2017-12-05 06:35:51	Daisha	Bergstrom	us-wy
588	New York	80	Enim Industries	male	2018-04-16 10:48:48	Breanne	Conn	us-ut
589	Palo Alto	35	Dignissim Maecenas Ornare LLC	male	2019-06-24 18:35:36	Iva	Metz	us-ma
590	Palo Alto	56	Purus Ac Tellus Company	male	2019-07-20 12:03:55	Rocio	Wehner	us-mt
591	Mountain View	79	Sociis Incorporated	male	2018-09-30 09:55:09	Jaron	Spinka	us-dc
592	Austin	79	Ad PC	male	2019-04-21 16:57:32	Ellie	Sipes	us-nd
593	New York	40	Eget Ipsum Donec Consulting	male	2019-12-14 21:28:15	Loyce	Emard	us-nj
594	San Francisco	81	Sed Et Libero Foundation	male	2018-07-25 20:34:08	Allie	Glover	us-ms
596	San Francisco	68	Vel Industries	male	2019-06-20 14:17:55	Natalie	Jaskolski	us-ga
597	Palo Alto	42	Elementum Corp.	male	2019-01-03 17:20:48	Estell	Streich	us-il
598	Chicago	67	Rhoncus Donec Company	male	2018-07-24 12:59:34	Bennett	Pfannerstill	us-ut
401	Mountain View	74	Odio Tristique Incorporated	male	2017-11-10 21:54:03	Magali	Rutherford	us-id
402	Austin	72	Cum Inc.	male	2019-03-18 05:21:14	Kelley	Johnson	us-pa
404	Los Angeles	30	Duis Gravida Industries	male	2019-04-29 22:28:43	Dannie	Lindgren	us-ma
405	Seattle	56	Placerat Cras Ltd	male	2019-09-03 02:27:26	Laura	Howell	us-in
524	Palo Alto	29	Sed Nunc Est Ltd	male	2019-06-07 13:32:56	Vivienne	Toy	us-il
525	Los Angeles	40	Amet Inc.	male	2019-12-12 05:29:09	Hassan	Nolan	us-dc
526	Seattle	83	Ipsum Corp.	male	2019-10-19 05:04:59	Winston	Lubowitz	us-nh
527	Austin	55	Eleifend Nunc Risus Limited	male	2018-11-24 11:53:42	Concepcion	Schultz	us-wa
599	Mountain View	82	Cras Sed Inc.	male	2018-03-21 23:44:35	Allan	Fay	us-ri
600	Chicago	21	Facilisis Suspendisse Associates	male	2017-07-19 07:44:57	Ariel	Streich	us-nm
602	New York	43	Ornare In Faucibus Incorporated	male	2018-06-02 06:22:42	Yadira	Lemke	us-ri
603	Seattle	41	Integer Sem Elit PC	male	2017-12-25 04:57:09	Prince	Macejkovic	us-nh
604	Palo Alto	84	Neque Tellus Institute	male	2018-04-12 08:37:13	Osbaldo	Towne	us-la
606	New York	60	Luctus Aliquet Odio Foundation	male	2019-12-05 21:52:27	Mercedes	Huels	us-nj
607	Palo Alto	19	Et Magnis Dis Associates	male	2018-08-14 10:05:56	Annamarie	Stoltenberg	us-nv
608	Palo Alto	20	Odio Incorporated	male	2018-10-30 01:40:37	Helena	Ziemann	us-vt
610	Austin	72	Consectetuer Rhoncus Nullam Associates	male	2019-06-10 00:01:32	Eliza	Towne	us-co
611	Mountain View	28	Aliquam Arcu Aliquam PC	male	2019-04-15 06:50:13	Felicita	Medhurst	us-mi
612	Chicago	65	Dis Consulting	male	2019-09-24 18:20:46	Skyla	Franecki	us-ia
613	San Francisco	85	Eu Eleifend Corp.	male	2017-11-01 07:04:23	Conrad	Kreiger	us-wy
615	San Francisco	26	Integer Vulputate Risus Incorporated	male	2019-10-10 12:08:42	Brock	Cummerata	us-wv
616	San Francisco	77	Ac Ltd	male	2019-02-21 03:35:10	Katharina	Hahn	us-az
618	Seattle	29	Tristique Incorporated	male	2018-09-15 03:32:41	Megane	Feeney	us-sc
619	Austin	38	Sed Consequat Auctor Corp.	male	2018-08-20 09:51:57	Jack	Kohler	us-wi
621	Austin	30	Elit Pretium Institute	male	2019-01-21 14:36:33	Friedrich	Franecki	us-vt
624	Seattle	47	Sodales Corp.	male	2019-03-06 04:43:04	Kenya	Conn	us-or
136	Seattle	82	Ultrices Posuere Associates	male	2017-01-13 18:06:29	Esta	Bode	us-va
137	Palo Alto	53	Volutpat Ornare Facilisis Corporation	male	2017-06-27 02:45:20	Walter	Farrell	us-il
138	Los Angeles	34	Cras Dictum Incorporated	female	2017-06-04 22:11:16	Tom	Johnston	us-ga
139	Palo Alto	77	Interdum Nunc Associates	female	2018-04-12 05:33:30	Jakayla	Nader	us-in
140	Austin	48	Orci Ut Sagittis Consulting	female	2018-08-06 17:49:11	Melisa	Leffler	us-ri
141	New York	59	Enim Etiam Incorporated	female	2019-09-12 03:34:00	Retha	Wisozk	us-nh
143	Palo Alto	59	Tristique Senectus Et Inc.	female	2017-12-08 14:24:24	Karolann	Swaniawski	us-va
144	Seattle	53	Eu Neque Inc.	female	2018-06-29 21:23:49	Emilio	Barrows	us-nc
145	New York	65	Magnis LLP	female	2017-12-10 00:48:26	Ramon	DuBuque	us-ny
146	Austin	74	Condimentum Eget Inc.	female	2018-01-12 15:41:32	Miracle	Roob	us-ia
149	Seattle	82	Nec Mollis Company	female	2017-10-16 01:46:34	Bailee	Jenkins	us-sc
150	Palo Alto	62	Faucibus Ut Nulla Company	female	2018-03-05 07:08:30	Devan	Brekke	us-mt
151	Chicago	33	Fames PC	female	2017-04-10 17:35:06	Sadie	Rosenbaum	us-de
153	Los Angeles	59	Suspendisse Commodo Tincidunt LLP	female	2017-03-04 14:20:52	Garth	Lang	us-mo
154	San Francisco	54	Etiam Imperdiet Dictum LLP	female	2017-03-18 14:47:38	Chaz	Jones	us-tn
155	Palo Alto	29	Et Foundation	female	2019-07-18 17:40:35	Karen	Fisher	us-vt
157	Mountain View	74	Elit Pharetra Associates	female	2019-05-03 21:50:03	Demetris	Hammes	us-wa
519	Mountain View	57	Mauris Company	male	2017-10-31 07:51:16	Bertram	Friesen	us-mi
520	Mountain View	25	Placerat Augue Industries	male	2018-09-10 19:06:11	Rachel	Thompson	us-in
521	New York	43	Sagittis Felis Consulting	male	2019-05-27 15:47:33	Gaylord	Turcotte	us-ne
523	New York	48	Leo Company	male	2018-04-07 06:19:20	Summer	Pollich	us-nm
625	San Francisco	43	Malesuada LLC	male	2019-03-06 10:23:16	Demond	Kiehn	us-ms
626	New York	44	Sed Sem LLP	male	2019-01-16 17:19:49	Corrine	Padberg	us-ca
628	Austin	22	Dolor Fusce Mi Ltd	male	2018-06-20 22:35:51	Adell	Gutmann	us-wv
134	Austin	44	Posuere Cubilia Curae; PC	male	2017-12-23 13:08:07	Brycen	Tromp	us-az
629	Seattle	65	Tristique Senectus Et PC	male	2019-04-28 20:25:30	Joshua	Funk	us-mo
630	Palo Alto	74	Risus Nunc Foundation	male	2018-12-17 05:51:47	Abel	McGlynn	us-ky
631	Chicago	40	Lorem Corporation	male	2017-12-22 09:38:24	June	Stoltenberg	us-wy
633	Chicago	67	Ornare In Faucibus Incorporated	male	2019-11-30 16:24:45	Jules	Goldner	us-al
634	Los Angeles	49	Vitae Aliquet Inc.	male	2017-07-05 17:00:02	Margarita	Kuhn	us-wy
635	Los Angeles	66	Senectus Et Consulting	male	2018-07-08 22:53:13	Lilliana	Mills	us-nh
637	New York	34	Pede Ac Urna Associates	male	2018-10-30 23:57:06	Ken	McLaughlin	us-dc
638	New York	63	Amet Luctus Vulputate LLP	female	2018-11-07 23:37:43	Newton	Glover	us-vt
639	Chicago	22	Mollis Industries	female	2018-06-01 13:00:13	Layla	Sipes	us-mo
640	Palo Alto	38	Magnis Incorporated	female	2019-04-28 07:15:18	Nels	Mertz	us-co
641	Los Angeles	64	Pede LLP	female	2019-08-26 07:51:14	Michale	Skiles	us-dc
644	Austin	76	Cursus Foundation	female	2018-05-09 10:49:52	Ashleigh	Parker	us-nm
646	Chicago	34	Euismod Consulting	female	2018-04-04 04:24:48	Rahul	Murazik	us-co
647	Los Angeles	53	Velit Egestas Foundation	female	2019-11-04 08:34:36	Nannie	Stracke	us-mo
648	Mountain View	42	Ante Ltd	female	2018-02-20 23:08:32	Emilie	Schulist	us-la
649	New York	61	Penatibus Et Magnis LLC	female	2018-09-04 19:22:06	Georgiana	Mraz	us-de
103	Chicago	34	Non Institute	male	2017-10-14 08:04:01	Fausto	Bednar	us-md
107	Mountain View	79	Cras Sed Corp.	male	2018-07-24 16:23:15	Hilma	Klocko	us-ne
131	Chicago	51	Nulla Dignissim Foundation	male	2017-06-11 15:45:25	Kaleigh	Fadel	us-ks
132	San Francisco	32	Mi PC	male	2017-09-03 04:35:58	Irma	Huel	us-ma
133	Mountain View	62	Donec Consectetuer Mauris Corp.	male	2017-08-21 09:37:56	Madelynn	Casper	us-va
148	Austin	28	Lectus Convallis Limited	female	2017-01-21 12:19:58	Carolina	Dare	us-ia
373	Mountain View	32	Mus Donec LLC	female	2019-08-07 21:46:16	Simeon	Grady	us-de
375	Austin	58	Urna Incorporated	male	2018-08-26 13:57:50	Bryana	Stehr	us-id
376	Mountain View	33	Dui Corp.	male	2018-01-24 15:34:40	Richard	Leannon	us-az
528	Los Angeles	20	Commodo At Libero Ltd	male	2019-02-16 12:02:22	Hilario	Satterfield	us-ky
531	Chicago	41	Amet Risus Donec Ltd	male	2019-01-17 16:47:49	Llewellyn	Heaney	us-me
533	Palo Alto	27	Imperdiet Non Consulting	male	2018-07-29 03:08:02	Nigel	Mills	us-tx
534	Palo Alto	27	Nisl LLC	male	2019-06-16 12:59:13	Brendon	Schaden	us-md
535	New York	82	Nulla PC	male	2017-08-15 11:45:17	Willow	Gottlieb	us-dc
538	Palo Alto	54	Auctor Limited	female	2019-03-31 19:13:03	April	Metz	us-mi
539	New York	61	Proin Velit Foundation	female	2017-12-13 21:40:25	Kade	Wisozk	us-vt
540	Chicago	34	Non Industries	female	2018-08-02 17:23:16	Thurman	Schinner	us-al
541	New York	66	Erat Semper Limited	female	2019-03-27 15:44:37	Bret	Hegmann	us-ms
543	Palo Alto	67	Neque Sed Associates	female	2018-04-01 00:10:30	Ward	Abbott	us-wy
544	Los Angeles	78	Proin Vel LLP	female	2017-10-31 23:00:16	Armando	Sipes	us-al
545	San Francisco	84	Vestibulum Ut Eros LLC	female	2019-02-22 13:35:50	Jewel	Okuneva	us-ok
546	Chicago	64	Fermentum Risus PC	female	2018-07-04 02:22:02	Elwyn	Veum	us-nj
548	Los Angeles	79	Ut Quam Ltd	female	2017-12-14 13:26:57	Grant	Leannon	us-sc
549	Austin	85	Tellus Nunc Lectus Foundation	female	2017-12-19 05:51:36	Eunice	Klocko	us-ne
620	Seattle	25	Orci Tincidunt Adipiscing Corp.	male	2019-03-12 21:15:36	Ignatius	Hoppe	us-sc
666	New York	21	Libero Corporation	female	2017-07-14 23:28:55	Horacio	Wiza	us-wa
667	Chicago	54	Proin Corp.	female	2018-11-12 19:35:10	Yoshiko	Feeney	us-nj
671	San Francisco	50	In LLC	female	2017-12-09 18:23:05	Rocio	Breitenberg	us-nv
350	Chicago	31	Libero Consulting	female	2017-01-31 14:07:41	Oran	Kling	us-sc
351	Mountain View	32	Cras Eu Tellus Foundation	female	2017-10-16 04:57:55	Lorine	Windler	us-sc
352	Mountain View	62	Dolor Nulla LLP	female	2017-06-09 14:23:15	Modesta	Heidenreich	us-ga
353	Austin	59	Cursus Non Egestas Ltd	female	2018-08-03 07:15:36	Eulah	Lebsack	us-md
355	Mountain View	25	Eu Neque Pellentesque Corporation	female	2020-01-01 04:30:57	Enrique	Gerhold	us-or
357	San Francisco	54	Bibendum Associates	female	2018-03-19 04:55:19	Eula	Eichmann	us-ct
207	Austin	37	Mus Proin Company	male	2018-04-17 09:02:23	Adan	Becker	us-ma
359	Austin	57	Massa Lobortis PC	female	2018-10-26 14:38:49	Meredith	Stiedemann	us-ms
360	Seattle	53	Auctor Ltd	female	2018-09-04 07:18:15	Bell	Johnson	us-ar
361	Palo Alto	20	Nullam Ltd	female	2017-02-16 20:34:50	Roxanne	Hauck	us-va
365	Mountain View	78	Eu Elit Nulla PC	female	2017-01-25 20:24:51	Lura	Beer	us-wy
366	New York	82	Nam Interdum Consulting	female	2018-07-10 19:30:25	Velma	Kub	us-ct
367	Mountain View	67	Libero Proin Sed Incorporated	female	2017-04-19 01:47:57	Missouri	McDermott	us-md
369	Mountain View	85	Natoque Penatibus Et Associates	female	2017-03-21 21:35:11	Cielo	Spinka	us-or
370	Austin	34	Aliquam Auctor Velit LLP	female	2017-05-16 18:44:56	Bradly	Renner	us-ca
371	Chicago	81	Eu Corp.	female	2019-11-25 12:52:41	Hattie	Langosh	us-mt
372	Seattle	51	Phasellus LLP	female	2017-09-04 06:09:29	Florida	Dooley	us-ms
529	New York	85	Aenean LLP	male	2018-04-09 22:03:18	Toby	Bednar	us-mt
672	Mountain View	71	Dolor Limited	female	2019-08-24 12:51:55	Josefina	Hermann	us-co
673	Seattle	35	Duis Dignissim Tempor PC	female	2019-01-19 13:37:48	Sammie	Parisian	us-tn
674	Mountain View	35	Ante Iaculis Ltd	female	2019-03-27 15:42:54	Leora	Conroy	us-il
675	Seattle	74	Lobortis Mauris LLC	male	2017-10-09 22:49:44	Lesly	Rodriguez	us-la
677	New York	49	Integer Tincidunt LLC	male	2018-04-13 14:01:19	Petra	Wisozk	us-wa
678	Austin	62	At Fringilla Purus Industries	male	2018-08-20 02:42:19	Milo	Blanda	us-dc
679	Palo Alto	57	Mauris Ltd	male	2017-12-04 14:38:15	Otis	Kling	us-dc
681	New York	53	Cursus PC	male	2018-08-24 15:37:23	Claude	Ullrich	us-or
356	San Francisco	64	Dui Lectus Rutrum LLC	female	2018-04-18 05:24:16	Adriel	Kovacek	us-ca
682	Palo Alto	83	Urna Justo Associates	male	2017-09-13 15:07:15	Don	Conn	us-ut
683	Mountain View	79	Mollis Nec Cursus Institute	male	2019-10-14 12:59:42	Lewis	Russel	us-az
684	New York	45	Vestibulum Incorporated	male	2019-06-15 05:02:03	Eve	Quitzon	us-in
686	Los Angeles	73	Magna PC	male	2018-03-13 01:13:14	Camilla	Hartmann	us-md
687	Palo Alto	47	Sollicitudin Institute	male	2018-03-25 13:23:02	Fermin	Hilpert	us-ma
690	New York	35	Eleifend Non Dapibus Limited	male	2018-11-06 15:15:48	Eloisa	Barrows	us-mi
691	Los Angeles	28	Vulputate Lacus Cras Institute	male	2017-10-22 20:55:15	Nathanial	Kerluke	us-ga
692	New York	49	Mus Aenean Ltd	male	2018-05-27 23:02:15	Esteban	Johns	us-ga
694	Seattle	60	Eu Ligula Corporation	male	2018-03-27 11:08:08	Kattie	Beier	us-ct
696	Mountain View	36	Ut Nec Corp.	male	2018-07-18 11:20:55	Gia	Abbott	us-nm
697	Austin	34	At Iaculis Quis Company	male	2018-04-27 06:36:00	Hailie	Mosciski	us-il
699	Seattle	57	In Cursus Et PC	male	2017-08-29 13:31:23	Julie	Crooks	us-wi
700	Seattle	22	Accumsan Interdum Libero Institute	male	2019-08-09 21:35:00	Freddy	Gulgowski	us-ct
201	Seattle	39	Ante Ltd	male	2019-12-14 11:05:05	Quinten	Franecki	us-wv
202	Chicago	27	Suspendisse Dui Foundation	male	2018-04-02 23:19:56	Ines	Gottlieb	us-me
203	San Francisco	64	Dui Augue Foundation	male	2019-01-14 05:13:33	Adrianna	Gerlach	us-oh
205	Seattle	64	Risus Morbi Metus Consulting	male	2018-05-18 15:05:39	Dedric	Yost	us-ok
209	Seattle	27	Pede Ultrices A Institute	male	2019-10-09 15:51:56	Carmel	Gulgowski	us-id
206	Mountain View	36	Velit In Limited	male	2019-11-10 23:13:59	Jonas	Metz	us-ga
358	Mountain View	79	Tempus Industries	female	2017-12-26 20:27:57	Lucy	Hettinger	us-sc
530	Seattle	23	A Incorporated	male	2019-12-13 03:23:49	Moriah	Ullrich	us-ne
383	Mountain View	67	Lectus Consulting	male	2017-01-14 04:03:32	Bobby	Cole	us-ky
385	Seattle	45	Suspendisse Aliquet Inc.	male	2017-03-04 06:12:22	Vinnie	Greenholt	us-ny
386	Seattle	68	Suspendisse LLP	male	2018-01-03 07:23:34	Ally	Blanda	us-nh
387	Austin	54	Nec Quam Curabitur Foundation	male	2018-06-26 11:42:14	Erica	Robel	us-ky
388	New York	69	Dolor LLC	male	2017-03-02 05:29:21	Taryn	Quigley	us-co
389	Los Angeles	83	Ultrices LLC	male	2017-01-19 15:14:41	Charles	Wintheiser	us-de
391	Los Angeles	49	Pharetra Nam Corporation	male	2019-05-31 23:40:20	Omari	Rodriguez	us-mi
392	Palo Alto	72	Tortor Nunc Inc.	male	2019-02-03 23:36:03	Misty	McKenzie	us-tn
394	New York	27	Fringilla PC	male	2019-12-30 14:21:42	Keegan	Hane	us-id
395	Chicago	22	Neque Industries	male	2018-08-20 04:41:31	Viola	Crooks	us-nj
397	New York	39	Consequat Incorporated	male	2018-09-04 13:44:54	Marcia	Balistreri	us-ok
398	Seattle	72	Bibendum Donec Felis Institute	male	2019-03-29 05:14:12	Ted	Gislason	us-ny
399	Mountain View	39	Et Corp.	male	2017-06-13 10:18:26	Tom	Abbott	us-nm
451	Los Angeles	80	Amet Consectetuer Corp.	female	2018-03-02 14:22:40	Jodie	Metz	us-va
452	San Francisco	52	Magna LLP	female	2019-02-23 21:55:22	Isaias	Considine	us-dc
453	Seattle	73	Aenean Eget Industries	female	2018-07-25 11:07:06	Arden	Deckow	us-nd
454	Seattle	46	A Neque Institute	female	2017-10-03 03:48:19	Bennett	Gaylord	us-co
456	Chicago	55	Vel Inc.	female	2017-07-31 12:15:07	Sonia	Koss	us-wy
457	New York	58	Et Eros Corp.	female	2018-10-16 04:53:02	Ignacio	Keebler	us-nd
458	Los Angeles	31	Hendrerit Consectetuer Cursus Inc.	female	2019-11-25 21:53:42	Maximus	Feest	us-oh
459	Los Angeles	19	Velit Consulting	female	2018-07-31 22:00:18	Zachary	Hayes	us-ky
460	New York	55	Mauris Erat LLC	female	2018-09-08 18:21:06	Mathew	Kautzer	us-or
462	New York	53	Quisque Ltd	female	2018-04-04 07:52:32	Manuel	Kuhic	us-me
464	Los Angeles	70	Sed Est Foundation	female	2018-03-05 16:12:01	Xzavier	Heller	us-nm
465	Austin	54	Lacus Quisque Imperdiet Limited	female	2019-11-29 22:45:32	Yadira	Hoeger	us-mt
466	Austin	77	Vel LLP	female	2018-05-13 14:25:33	Pearline	Koss	us-il
468	San Francisco	53	Lectus Limited	female	2017-08-23 07:14:29	Eda	Homenick	us-id
469	Palo Alto	20	Nostra Incorporated	female	2018-10-08 23:01:12	Cordia	Thiel	us-nh
470	Palo Alto	61	Velit Eget Laoreet PC	female	2019-12-24 00:53:49	Vada	Harvey	us-al
471	New York	29	Sit Amet Company	female	2018-11-22 16:24:50	Aric	Ebert	us-tx
472	New York	46	Sollicitudin Adipiscing Ltd	female	2018-03-11 02:25:46	Stewart	Mills	us-nm
473	Palo Alto	69	Imperdiet Dictum Foundation	female	2019-07-14 15:12:30	Ali	McClure	us-mn
474	Austin	47	Lorem Ipsum Dolor LLP	female	2019-04-22 03:38:53	Larry	Corkery	us-fl
476	Austin	25	Lorem Vitae Odio Ltd	male	2019-12-07 23:36:07	Kelvin	Murphy	us-ri
477	Seattle	33	Turpis Foundation	male	2019-10-10 00:38:53	Emery	Kuhic	us-az
479	Palo Alto	23	Iaculis Nec Consulting	male	2017-11-17 01:54:56	Isadore	Bradtke	us-vt
480	Mountain View	37	Eu Dui Cum Corporation	male	2019-10-07 09:14:21	Luciano	Kutch	us-id
481	Austin	57	Mollis Foundation	male	2017-10-21 19:58:29	Clair	Toy	us-ma
483	Mountain View	64	Consectetuer Ltd	male	2019-07-04 06:55:04	Anderson	Eichmann	us-wa
484	New York	20	In Consulting	male	2019-12-08 06:00:44	Hallie	Cruickshank	us-wa
485	New York	47	Vel Arcu Foundation	male	2018-08-16 22:36:36	Onie	Schroeder	us-ma
488	Seattle	45	Donec Inc.	male	2018-05-15 07:00:03	Vincenza	Upton	us-in
489	Austin	37	Per Limited	male	2017-11-30 07:50:29	Blake	Schoen	us-nv
490	Palo Alto	50	Pellentesque Sed Limited	male	2018-04-03 17:35:19	June	Bosco	us-nm
491	Chicago	38	Feugiat Lorem Ipsum LLC	male	2019-08-31 19:50:33	Jovani	Orn	us-dc
492	New York	69	Mattis Company	male	2019-10-23 23:36:20	Gaylord	Keebler	us-mi
493	New York	61	Et Magnis Institute	male	2019-04-23 07:26:51	Mandy	Rogahn	us-ms
495	Seattle	20	Eget Mollis Corp.	male	2018-06-08 13:03:54	Katharina	Hansen	us-la
496	Palo Alto	26	Integer Sem Elit Limited	male	2019-10-24 01:52:07	Hanna	Trantow	us-mt
500	Chicago	23	Nulla In Tincidunt Foundation	male	2019-04-26 21:44:38	Virginie	Hayes	us-nv
501	Chicago	81	Tristique Aliquet Phasellus PC	male	2017-09-13 00:21:40	Kayla	O'Hara	us-vt
502	New York	64	Pede Nec Ante Ltd	male	2019-05-05 19:08:23	Wilmer	Bode	us-la
505	Seattle	75	Quisque Varius Nam Associates	male	2018-01-25 03:01:04	Letha	Prosacco	us-nm
506	San Francisco	70	Sit LLP	male	2019-11-12 08:47:20	Ines	Treutel	us-mo
507	San Francisco	32	Vestibulum Massa Rutrum Corporation	male	2017-10-14 11:16:44	Chelsie	Fay	us-ne
508	Austin	46	Fusce Diam Inc.	male	2019-12-24 09:36:03	Bernice	Auer	us-al
509	San Francisco	29	Ligula Aenean Euismod Corporation	male	2018-01-14 20:28:42	Salma	Bauch	us-oh
511	Los Angeles	22	Rutrum Lorem Ac Foundation	male	2019-01-16 05:03:54	Ludwig	Gerlach	us-me
512	New York	61	Eu Nulla Associates	male	2018-04-19 04:06:10	Rubye	Ankunding	us-me
513	San Francisco	69	Eget Venenatis Consulting	male	2019-08-18 08:33:04	Grady	Dicki	us-nc
514	San Francisco	54	Maecenas Iaculis Aliquet Inc.	male	2019-07-11 06:49:01	Anastacio	Hackett	us-nc
515	Los Angeles	23	Cras Pellentesque Inc.	male	2018-09-26 12:51:28	Omari	Ernser	us-wa
516	Austin	23	Aliquam Corp.	male	2019-11-20 02:48:44	Destiney	Konopelski	us-ok
518	Austin	55	Vitae Risus Company	male	2018-05-17 17:40:32	Magdalen	Rice	us-vt
669	Los Angeles	56	Tortor Nunc Commodo Institute	female	2018-11-07 00:46:06	Elody	Fadel	us-ks
324	San Francisco	52	Amet Diam Industries	male	2018-05-18 18:45:11	Giovani	Denesik	us-mo
378	Seattle	77	Odio Corporation	male	2018-01-19 04:13:50	Lonzo	Goyette	us-in
379	Seattle	40	Dictum Placerat Augue Foundation	male	2018-02-27 10:43:45	Isaac	Lemke	us-nd
380	Chicago	24	Consectetuer Adipiscing Elit Consulting	male	2018-09-01 03:13:32	Bernadette	Reinger	us-ms
381	San Francisco	77	Posuere Cubilia Curae; Incorporated	male	2018-09-04 11:47:02	Maya	Bins	us-mo
651	Palo Alto	40	Praesent Interdum Consulting	female	2018-10-13 02:38:38	Tamia	Olson	us-dc
652	New York	66	Ac Facilisis Facilisis Limited	female	2018-04-12 12:08:37	Matilda	Deckow	us-ut
653	Austin	69	Velit In LLP	female	2019-05-23 13:38:53	Mikel	Wisoky	us-oh
654	Mountain View	61	Venenatis Limited	female	2019-06-07 12:12:18	Leonel	Torp	us-nd
656	Austin	61	Ligula Aenean PC	female	2019-08-23 20:43:13	Oscar	Beatty	us-de
658	New York	85	Faucibus Morbi LLC	female	2018-02-12 21:22:59	Coby	Wisozk	us-va
659	Chicago	64	Nec Urna Et Consulting	female	2019-02-27 06:40:54	Cordelia	Dach	us-fl
660	Los Angeles	79	Gravida Corporation	female	2018-08-18 01:27:46	Alda	Gleichner	us-vt
663	Austin	62	Ut Cursus Inc.	female	2018-03-18 07:31:03	Trudie	Mertz	us-mn
5	New York	50	Egestas Ligula Corporation	male	2017-01-10 05:03:28	Louvenia	Brakus	us-az
6	San Francisco	63	Nunc Industries	male	2018-08-01 03:02:40	Raegan	Bailey	us-ne
8	Los Angeles	23	Ac Turpis Egestas Associates	male	2019-07-17 00:06:43	Candice	Durgan	us-wv
9	Los Angeles	72	Donec Dignissim Magna LLP	male	2017-04-14 03:25:10	Jacky	Ferry	us-wy
10	New York	28	A Institute	male	2019-04-09 06:11:03	Elisabeth	Brakus	us-il
12	Seattle	51	Duis Mi Consulting	male	2016-12-26 15:54:27	Heath	Hayes	us-nj
13	Los Angeles	78	Aliquam Gravida Consulting	male	2017-08-29 20:46:38	Dewayne	O'Keefe	us-ia
15	Mountain View	34	Eleifend Egestas Sed Corporation	male	2018-11-20 04:53:46	Catherine	Lowe	us-tx
650	Chicago	60	Molestie Company	female	2018-07-09 04:40:21	Cayla	Mayert	us-az
16	New York	52	A Arcu Sed PC	male	2018-06-06 23:27:14	Ryan	Hickle	us-fl
17	Seattle	34	Dis Parturient Ltd	male	2018-11-12 14:45:21	Cornelius	MacGyver	us-mo
18	New York	75	Eget Odio Institute	male	2017-03-30 11:01:13	Adrienne	Brown	us-ca
19	Austin	25	Ut Quam Vel Corporation	male	2019-09-23 13:24:05	Vicente	Walter	us-nv
20	Seattle	61	Ac Mattis Semper PC	male	2017-09-24 11:39:38	Vance	Weimann	us-la
22	Austin	61	A Dui Cras PC	male	2016-01-16 07:40:27	Kolby	Rippin	us-sd
23	Chicago	34	Mi Fringilla Mi Limited	male	2017-01-10 05:20:53	Jocelyn	Ward	us-ks
24	Mountain View	37	At Inc.	male	2016-05-13 10:39:21	Davion	Prohaska	us-vt
25	New York	74	Integer Id Magna LLC	male	2019-03-01 19:01:26	Elda	Skiles	us-ks
26	Los Angeles	82	Pede Nunc Corp.	male	2019-03-23 00:16:32	Conrad	White	us-nm
28	San Francisco	22	Libero Limited	male	2017-02-10 07:12:52	Gordon	Yundt	us-nv
29	Chicago	78	Eleifend Incorporated	male	2018-09-23 19:52:11	Gilberto	Klein	us-wy
30	Austin	37	Vulputate Lacus PC	male	2016-03-30 07:15:08	Rosendo	Schuster	us-mo
31	New York	21	Purus Incorporated	male	2017-03-28 14:58:00	Zoey	Dibbert	us-al
32	Los Angeles	57	Et Magnis Foundation	male	2016-09-05 17:25:12	Ole	Lebsack	us-tn
33	Austin	69	Dictum Mi Limited	male	2018-12-30 01:52:35	Dangelo	Wehner	us-mn
35	Seattle	69	Fringilla Donec Feugiat PC	male	2016-08-26 21:28:18	Cathrine	Rice	us-me
36	Seattle	39	Tincidunt Neque Vitae LLP	male	2017-08-19 12:28:58	Albina	Johns	us-va
37	Chicago	48	Pede Sagittis PC	male	2019-07-10 18:45:27	Leatha	Hodkiewicz	us-nv
38	Palo Alto	47	Magna Cras LLP	female	2018-06-11 06:05:30	Luigi	Raynor	us-mi
40	Mountain View	47	Sem Elit Pharetra Inc.	female	2019-10-06 16:26:58	Caterina	Walsh	us-ne
41	Seattle	35	Rutrum Fusce Consulting	female	2016-08-08 19:50:33	Aglae	Fadel	us-vt
42	San Francisco	41	Posuere Cubilia PC	female	2016-05-17 09:03:55	Shaniya	Hilll	us-nv
43	Austin	49	Sed Eget Lacus Inc.	female	2017-04-16 15:57:46	Joelle	Schmidt	us-pa
44	Los Angeles	80	Tincidunt Congue Institute	female	2019-05-21 01:07:10	Claudie	Greenholt	us-ks
45	Mountain View	81	Vivamus LLP	female	2016-01-06 21:19:45	Mozell	Homenick	us-nh
47	Seattle	47	Penatibus Et Magnis Institute	female	2018-09-25 02:09:00	Laurine	Morissette	us-pa
48	Los Angeles	48	Habitant Morbi Tristique Corporation	female	2018-04-01 01:49:22	Vallie	Casper	us-nd
49	Seattle	46	Adipiscing Industries	female	2016-04-10 16:04:50	Christina	Heaney	us-vt
50	Chicago	60	Ipsum PC	female	2016-10-28 13:18:49	Darrell	Fay	us-vt
51	Los Angeles	77	Penatibus Et Magnis LLC	female	2018-05-28 22:56:51	Katrine	Rau	us-ca
52	Los Angeles	49	Ac Sem Corp.	female	2016-12-25 11:04:01	Cleo	Lesch	us-nj
54	Los Angeles	27	Eu Incorporated	female	2019-09-05 08:30:49	Anjali	Kertzmann	us-wi
57	Chicago	32	A PC	female	2016-02-29 12:00:16	Loma	Steuber	us-ma
58	New York	66	Enim Inc.	female	2016-12-20 05:34:09	Antonina	Feil	us-id
60	Chicago	22	Purus Nullam Scelerisque Ltd	female	2019-05-15 10:47:53	Alejandrin	Leffler	us-va
61	Los Angeles	64	A Mi Incorporated	female	2016-09-08 13:16:50	Laila	Walker	us-mt
62	Austin	65	Mollis Corp.	female	2019-01-24 07:00:47	Damien	Lind	us-nc
63	Mountain View	53	Ornare LLC	female	2016-02-18 10:05:17	Raphaelle	O'Kon	us-ut
64	Los Angeles	34	Duis Foundation	female	2016-10-11 13:41:03	Tommie	Collins	us-nv
66	Mountain View	68	Metus Limited	female	2017-11-11 04:13:30	Stevie	Wunsch	us-ok
67	San Francisco	27	Sem Nulla Corporation	female	2019-06-03 07:23:08	Tyra	Fritsch	us-az
68	Los Angeles	58	Duis Sit Company	female	2018-12-22 16:48:03	Miracle	Rohan	us-id
69	Palo Alto	25	Vestibulum Inc.	female	2019-05-01 20:48:07	Florida	Glover	us-sd
70	Palo Alto	76	Interdum Corp.	female	2017-03-17 14:59:18	Albert	Wyman	us-sd
72	San Francisco	55	Erat Volutpat Associates	female	2016-08-14 19:47:46	Ayana	Jones	us-ut
74	Palo Alto	57	At Associates	female	2018-06-16 05:51:46	Andrew	Sporer	us-va
75	Los Angeles	66	Nulla Ltd	male	2016-05-31 19:18:46	Oran	Doyle	us-ct
497	Palo Alto	65	Pharetra Corporation	male	2018-02-17 15:09:27	Milford	Ratke	us-nj
498	Seattle	51	Scelerisque Foundation	male	2018-08-14 03:34:13	Keyshawn	Moore	us-wa
499	Chicago	74	Proin Corporation	male	2019-04-28 02:31:57	Elena	Gusikowski	us-ut
655	Los Angeles	67	Eros Turpis Non Corporation	female	2019-04-26 13:10:29	Darian	Pfannerstill	us-wa
82	Chicago	56	Dolor Nonummy Ac Limited	male	2018-03-15 00:07:44	Florida	Schmidt	us-ar
84	Seattle	44	Non LLC	male	2016-04-06 12:00:15	Patience	Swaniawski	us-in
87	Chicago	55	Lacus Ut Nec LLC	male	2017-05-22 03:02:53	Desiree	Abernathy	us-sc
88	New York	24	Sit Foundation	male	2017-03-04 18:55:09	Bart	Lesch	us-nc
89	Palo Alto	43	Primis In Faucibus Ltd	male	2018-12-27 16:41:32	Adolfo	Mills	us-nc
91	Los Angeles	64	Erat Eget PC	male	2016-05-30 18:25:36	Natalie	Balistreri	us-oh
92	Mountain View	41	Interdum Sed Industries	male	2019-07-28 20:46:42	Duncan	Schuppe	us-or
93	Mountain View	70	In Mi Pede Limited	male	2018-03-14 03:26:56	Emilie	King	us-ri
97	Los Angeles	53	Vivamus Rhoncus Donec Associates	male	2018-12-27 19:43:38	Lois	Bednar	us-tx
98	New York	65	Auctor Mauris Vel PC	male	2018-06-29 14:15:27	Zoey	Lynch	us-dc
99	San Francisco	40	Penatibus Et Corporation	male	2016-12-15 19:18:52	Dorothy	Witting	us-nd
104	Chicago	48	Morbi Quis Incorporated	male	2018-07-01 22:56:54	Bobby	Koepp	us-nd
105	Chicago	33	Pellentesque Habitant Morbi Company	male	2017-08-08 06:09:19	Lon	Parker	us-ks
106	Seattle	29	A Tortor Nunc LLC	male	2017-10-01 06:45:04	Bulah	Rice	us-ma
109	San Francisco	69	Adipiscing Lobortis Risus Consulting	male	2017-08-28 06:02:54	Yasmeen	Christiansen	us-fl
110	Los Angeles	58	Lectus LLP	male	2017-02-07 16:03:24	Clovis	Lubowitz	us-ct
111	Austin	65	Hendrerit Consectetuer Cursus Corp.	male	2018-12-29 09:51:16	Katlyn	Doyle	us-mn
112	San Francisco	36	Sit Amet Consectetuer Inc.	male	2018-01-17 18:23:59	Danial	McKenzie	us-md
113	San Francisco	82	Diam At PC	male	2018-01-13 00:06:16	Carter	Tremblay	us-ms
115	Los Angeles	69	Diam Nunc Foundation	male	2017-09-30 06:13:46	Quinten	Von	us-nh
117	Mountain View	26	Ultrices Mauris Ipsum Ltd	male	2019-04-23 04:10:37	Jaden	Kautzer	us-sd
119	New York	38	Amet Luctus Associates	male	2017-11-13 07:23:18	Seth	Zulauf	us-mt
120	Austin	49	Consectetuer Mauris Incorporated	male	2019-05-03 16:01:27	Justina	Bergnaum	us-wa
347	Austin	44	Ante LLP	female	2017-08-25 15:21:50	Jefferey	Zieme	us-mo
121	Los Angeles	29	In Hendrerit Limited	male	2017-12-02 20:35:12	Ola	Hagenes	us-ar
122	Chicago	82	At Velit Industries	male	2018-02-10 15:04:20	Alberto	D'Amore	us-al
124	New York	34	Nisi Aenean Inc.	male	2017-01-21 16:35:51	Deonte	Morar	us-id
125	San Francisco	70	Lectus Convallis Corp.	male	2017-07-24 20:14:52	Karson	Pfannerstill	us-mt
126	Seattle	60	Ipsum Cursus PC	male	2019-02-10 03:29:51	Barry	Smith	us-wa
127	Mountain View	50	Magnis Dis Limited	male	2018-06-10 19:24:37	Moshe	Senger	us-mn
129	Palo Alto	67	Etiam Bibendum Corp.	male	2017-10-19 18:35:32	Ibrahim	Hayes	us-wa
165	Seattle	53	Vulputate PC	female	2019-10-17 11:42:11	Khalil	Goyette	us-ct
167	Austin	74	Natoque Penatibus PC	female	2017-10-07 08:29:45	Randal	Hansen	us-ok
158	Chicago	52	Montes Institute	female	2019-05-06 21:42:26	Allene	Kunze	us-ut
159	Chicago	55	Vestibulum Massa LLC	female	2018-08-09 10:32:55	Aracely	Cruickshank	us-ma
161	Palo Alto	32	Tempor Limited	female	2017-11-06 06:56:35	Krista	Berge	us-ok
173	New York	25	Dui In Sodales Associates	female	2019-05-04 03:19:34	Cleveland	Von	us-me
163	Los Angeles	63	Justo Faucibus Lectus Corp.	female	2018-07-08 08:17:02	Ethan	Corkery	us-nj
178	Mountain View	22	Enim Incorporated	male	2019-07-07 19:54:10	Roger	Miller	us-il
183	Mountain View	49	Eleifend Cras Ltd	male	2019-10-22 00:25:42	Cornell	Windler	us-sd
164	San Francisco	52	Lectus Pede Ultrices Industries	female	2018-04-15 17:27:30	Kurt	Rolfson	us-ks
168	Mountain View	28	Egestas LLP	female	2017-09-09 09:42:50	Lauryn	Casper	us-dc
169	New York	83	Urna Convallis LLP	female	2019-09-03 07:50:29	Eliseo	Huel	us-sc
171	Mountain View	26	Nam Limited	female	2018-12-01 11:53:22	Noelia	Jenkins	us-nj
187	Austin	57	Turpis Institute	male	2017-03-14 15:30:57	Korey	Willms	us-tn
191	Los Angeles	30	A Ltd	male	2018-05-24 17:48:50	Felicia	Dare	us-ut
192	San Francisco	78	Donec Nibh Limited	male	2019-09-11 12:49:25	Ada	Ledner	us-de
193	Palo Alto	34	Malesuada Augue Limited	male	2017-07-21 01:41:38	Rhoda	Kling	us-ms
172	Palo Alto	60	Et Magnis Ltd	female	2019-07-10 03:44:22	Golden	Bayer	us-nd
174	Los Angeles	84	Eros Corporation	female	2018-11-23 05:57:09	Rylee	Fritsch	us-az
176	Mountain View	51	Tortor Company	male	2017-11-29 19:45:33	Emmanuelle	Nader	us-ms
177	Los Angeles	33	Nam Ac LLC	male	2018-12-21 18:27:48	Madonna	O'Connell	us-il
180	New York	76	Sit Amet Inc.	male	2019-07-03 15:46:02	Rebecca	Schimmel	us-ok
181	Seattle	74	Pede Blandit Congue Consulting	male	2019-08-22 13:00:53	Oswaldo	Klein	us-wa
184	Los Angeles	61	Quis Diam Inc.	male	2018-06-05 15:28:13	Alex	Schultz	us-nd
212	Chicago	29	Sed Corp.	male	2019-04-14 20:20:36	Mable	Collier	us-tn
263	Seattle	24	Semper Cursus Associates	female	2017-08-04 07:19:25	Destany	Gutmann	us-ms
186	Austin	53	Dui Corp.	male	2019-02-07 21:58:02	Sheridan	Hickle	us-pa
188	Seattle	50	Mollis Lectus LLP	male	2018-06-11 05:34:05	Kira	Weber	us-ri
190	Seattle	79	Sed Turpis Foundation	male	2018-08-24 21:58:23	Ariane	Romaguera	us-pa
194	Seattle	64	Ac Tellus LLP	male	2019-12-24 05:56:58	Sienna	Shanahan	us-wa
195	Austin	21	Nam PC	male	2018-03-23 07:44:09	Jenifer	Wunsch	us-nj
197	Mountain View	25	Purus Gravida Sagittis Inc.	male	2017-10-08 06:10:23	Archibald	Terry	us-ok
198	Seattle	63	Pede Nunc Sed LLC	male	2019-06-10 13:53:41	Gwendolyn	Carroll	us-vt
199	New York	19	Eu Dui Limited	male	2018-06-17 11:13:23	Zack	Considine	us-vt
211	Los Angeles	53	Condimentum Donec LLP	male	2018-06-01 09:44:14	Brent	Metz	us-de
213	Palo Alto	52	Dui Ltd	male	2019-11-13 20:23:37	Trevion	Hilll	us-ia
382	New York	54	Penatibus Inc.	male	2018-10-14 06:17:50	Karlee	Adams	us-wi
79	Mountain View	20	Dictum Limited	male	2016-03-28 22:29:13	Allison	Hintz	us-wa
80	Austin	53	Orci Ut Semper Institute	male	2019-10-25 22:25:00	Evan	Wyman	us-md
81	San Francisco	26	Phasellus Institute	male	2019-01-27 17:52:08	Carolina	Bergstrom	us-ms
94	Los Angeles	34	Turpis Egestas LLP	male	2018-03-20 03:17:30	Brando	Douglas	us-ny
222	New York	45	Diam Sed Diam Institute	male	2018-08-21 11:16:37	Berenice	Ebert	us-oh
223	Los Angeles	46	Aliquet Foundation	male	2018-06-18 23:37:06	Brenna	O'Keefe	us-mi
226	Mountain View	37	Eget Odio Aliquam Consulting	male	2017-09-07 10:17:43	Albin	Ryan	us-id
227	Chicago	57	Tincidunt Neque Vitae LLC	male	2019-06-05 04:54:26	Carleton	Ortiz	us-ok
228	New York	45	Mattis Industries	male	2018-07-30 16:17:44	Ramon	Botsford	us-mt
231	Palo Alto	67	Quis Lectus Industries	male	2017-12-08 23:10:44	Daron	Auer	us-ks
232	Palo Alto	85	Velit Corp.	male	2019-10-27 09:42:47	Korey	O'Reilly	us-wi
234	San Francisco	82	Id Industries	male	2018-07-30 11:46:03	Cathryn	Kulas	us-pa
235	Los Angeles	38	Sodales Mauris Blandit Institute	male	2018-07-16 05:54:12	Sophie	Muller	us-oh
237	San Francisco	74	Cubilia Curae; Phasellus Limited	male	2017-01-31 21:05:25	Cleveland	Reynolds	us-md
238	Seattle	48	Vestibulum Accumsan Incorporated	female	2018-03-27 14:20:13	Dedrick	Price	us-mt
239	San Francisco	63	Praesent Eu Dui LLC	female	2019-10-23 16:17:12	Edd	Sipes	us-dc
241	Palo Alto	40	Aliquam Auctor Velit Corp.	female	2019-08-29 11:00:40	Napoleon	Frami	us-mi
242	Los Angeles	25	Duis Corp.	female	2018-12-18 12:07:25	Erin	Hartmann	us-md
243	San Francisco	56	Posuere Cubilia Curae; Ltd	female	2019-03-10 13:47:03	Kobe	Durgan	us-nj
244	Seattle	43	Ipsum Industries	female	2017-06-16 21:52:01	Dallas	Abbott	us-nj
246	Seattle	82	Ultricies Dignissim Lacus LLP	female	2019-11-26 03:57:08	Zachariah	McCullough	us-mn
247	Chicago	44	Ante LLP	female	2017-08-25 15:21:50	Sammie	Senger	us-ga
248	Mountain View	83	Sem Consulting	female	2019-05-27 17:11:36	Bernhard	Heller	us-az
251	Austin	32	Cras Eu Tellus Foundation	female	2017-10-16 04:57:55	Carlee	Aufderhar	us-pa
252	New York	62	Dolor Nulla LLP	female	2017-06-09 14:23:15	Maudie	Breitenberg	us-ok
253	Mountain View	59	Cursus Non Egestas Ltd	female	2018-08-03 07:15:36	Georgianna	Sporer	us-ut
255	New York	25	Eu Neque Pellentesque Corporation	female	2020-01-01 04:30:57	Leonor	Rolfson	us-ks
256	Seattle	64	Dui Lectus Rutrum LLC	female	2018-04-18 05:24:16	Ibrahim	Harris	us-pa
257	New York	54	Bibendum Associates	female	2018-03-19 04:55:19	Litzy	Heaney	us-sd
258	Seattle	79	Tempus Industries	female	2017-12-26 20:27:57	Jean	Stanton	us-al
259	Palo Alto	57	Massa Lobortis PC	female	2018-10-26 14:38:49	Olaf	Christiansen	us-ne
298	Palo Alto	72	Bibendum Donec Felis Institute	male	2019-03-29 05:14:12	Verna	Wiegand	us-ut
260	Seattle	53	Auctor Ltd	female	2018-09-04 07:18:15	Jeffery	Jacobs	us-nc
262	Chicago	29	Elementum Purus Inc.	female	2017-07-21 05:44:40	America	Predovic	us-nj
264	Chicago	54	Sed Pede Cum Associates	female	2019-05-16 07:01:04	Carolanne	Cormier	us-la
301	Seattle	39	Ante Ltd	male	2019-12-14 11:05:05	Lizzie	Corkery	us-vt
266	San Francisco	82	Nam Interdum Consulting	female	2018-07-10 19:30:25	Mae	Morissette	us-wa
306	Chicago	36	Velit In Limited	male	2019-11-10 23:13:59	Valentine	Senger	us-ct
267	Chicago	67	Libero Proin Sed Incorporated	female	2017-04-19 01:47:57	Jovanny	Flatley	us-nj
268	Seattle	25	Amet Industries	female	2017-12-31 04:20:03	Celestine	Lueilwitz	us-dc
269	Los Angeles	85	Natoque Penatibus Et Associates	female	2017-03-21 21:35:11	Kimberly	Mills	us-tn
271	Seattle	81	Eu Corp.	female	2019-11-25 12:52:41	Dino	Turcotte	us-dc
272	San Francisco	51	Phasellus LLP	female	2017-09-04 06:09:29	Dasia	Graham	us-mn
274	San Francisco	24	Lorem Lorem Incorporated	female	2018-05-13 10:16:43	Shad	Reichel	us-wa
275	Chicago	58	Urna Incorporated	male	2018-08-26 13:57:50	Pierre	Walsh	us-nd
277	San Francisco	55	Tincidunt Nunc Ac Associates	male	2017-10-31 05:38:49	Haskell	Roob	us-id
278	Austin	77	Odio Corporation	male	2018-01-19 04:13:50	Raegan	Blanda	us-ut
280	Mountain View	24	Consectetuer Adipiscing Elit Consulting	male	2018-09-01 03:13:32	Pat	Schowalter	us-nh
281	New York	77	Posuere Cubilia Curae; Incorporated	male	2018-09-04 11:47:02	Dewitt	Kovacek	us-ri
282	Chicago	54	Penatibus Inc.	male	2018-10-14 06:17:50	Lenna	Wuckert	us-ms
283	Palo Alto	67	Lectus Consulting	male	2017-01-14 04:03:32	Kaitlyn	Wuckert	us-nc
284	Seattle	24	Ornare Tortor At Corp.	male	2019-08-22 00:43:50	Max	Greenfelder	us-mi
286	Seattle	68	Suspendisse LLP	male	2018-01-03 07:23:34	Irving	Skiles	us-ca
287	Palo Alto	54	Nec Quam Curabitur Foundation	male	2018-06-26 11:42:14	Leola	Moore	us-wy
288	Chicago	69	Dolor LLC	male	2017-03-02 05:29:21	Kian	Stamm	us-ok
289	Seattle	83	Ultrices LLC	male	2017-01-19 15:14:41	Elias	Weimann	us-sc
292	Seattle	72	Tortor Nunc Inc.	male	2019-02-03 23:36:03	Jack	Klocko	us-in
293	Palo Alto	63	Erat Volutpat Associates	male	2018-12-24 07:38:11	Karlee	Feil	us-mo
294	Chicago	27	Fringilla PC	male	2019-12-30 14:21:42	Adonis	Labadie	us-nj
295	Palo Alto	22	Neque Industries	male	2018-08-20 04:41:31	Jace	Ritchie	us-wi
296	Austin	32	Etiam Incorporated	male	2019-09-07 05:05:57	Geoffrey	Hartmann	us-wy
299	San Francisco	39	Et Corp.	male	2017-06-13 10:18:26	Wava	Schimmel	us-mi
300	Chicago	59	Ipsum Donec Ltd	male	2018-01-17 12:39:19	Emmy	Beier	us-nv
303	Mountain View	64	Dui Augue Foundation	male	2019-01-14 05:13:33	Kelsie	Trantow	us-ms
304	Mountain View	26	Nulla Ltd	male	2018-01-12 15:21:31	Arch	Lynch	us-sd
305	Austin	64	Risus Morbi Metus Consulting	male	2018-05-18 15:05:39	Kylee	Schamberger	us-va
307	Los Angeles	37	Mus Proin Company	male	2018-04-17 09:02:23	Rosa	Kessler	us-de
413	Seattle	33	Aliquet Sem Ut Inc.	male	2019-01-10 17:04:30	Eino	Strosin	us-dc
217	Los Angeles	63	Sollicitudin A Ltd	male	2019-05-16 12:40:15	Anna	Corwin	us-nc
218	Mountain View	57	Lectus Ante Incorporated	male	2019-01-02 07:55:24	Eldora	Mueller	us-me
219	New York	33	Eu Lacus Quisque Inc.	male	2018-04-15 14:08:30	Dena	Schimmel	us-in
221	Chicago	44	In Tempus Incorporated	male	2018-03-03 04:40:10	Gideon	Champlin	us-ne
224	Palo Alto	52	Amet Diam Industries	male	2018-05-18 18:45:11	Breanne	Abbott	us-ne
7	Mountain View	43	Sed Pede Cum Incorporated	male	2018-02-06 04:41:33	Kenton	Beier	us-nj
11	Seattle	35	Eu Elit Nulla LLC	male	2017-10-08 23:45:43	Matilda	Frami	us-ms
14	Palo Alto	79	Mauris Aliquam Inc.	male	2017-12-31 02:09:34	Tillman	Thompson	us-wy
27	Chicago	22	Lectus Rutrum Urna Foundation	male	2018-09-04 09:53:22	Una	Gibson	us-ne
34	Austin	55	A Feugiat PC	male	2016-12-23 20:02:12	Stevie	VonRueden	us-md
39	Seattle	62	Orci Quis Consulting	female	2018-06-07 09:37:58	Rex	Crooks	us-ri
46	Austin	51	Nullam Company	female	2017-11-01 08:37:38	Eugene	Tillman	us-ms
59	Chicago	51	Sodales Elit Erat LLC	female	2017-07-13 18:52:00	Audra	Johns	us-fl
65	Seattle	31	Integer LLP	female	2016-09-26 18:13:43	Carter	Balistreri	us-nd
71	Austin	35	Ut Tincidunt Orci PC	female	2016-08-25 21:32:56	Marc	Glover	us-wv
73	Chicago	66	At Iaculis Limited	female	2017-05-19 21:34:59	Ferne	Oberbrunner	us-nm
77	Los Angeles	46	Elit Dictum Eu Institute	male	2018-05-14 10:08:54	Earline	Berge	us-id
318	Mountain View	57	Lectus Ante Incorporated	male	2019-01-02 07:55:24	Rosalee	Hackett	us-nd
319	Chicago	33	Eu Lacus Quisque Inc.	male	2018-04-15 14:08:30	Mike	Gusikowski	us-wy
320	Palo Alto	57	Mi Lorem Vehicula Inc.	male	2019-01-10 23:10:32	Furman	Brakus	us-or
321	Los Angeles	44	In Tempus Incorporated	male	2018-03-03 04:40:10	Nathen	Kunze	us-ok
323	New York	46	Aliquet Foundation	male	2018-06-18 23:37:06	Frankie	Sawayn	us-al
325	Los Angeles	70	Tempus Consulting	male	2019-08-17 20:56:46	Grover	Casper	us-ia
326	Chicago	37	Eget Odio Aliquam Consulting	male	2017-09-07 10:17:43	Odie	O'Conner	us-ne
328	New York	45	Mattis Industries	male	2018-07-30 16:17:44	Moses	Keebler	us-ks
329	Palo Alto	58	Morbi Metus Incorporated	male	2019-09-14 20:20:57	Jovani	Quitzon	us-tx
330	San Francisco	51	Felis Corp.	male	2017-11-11 15:11:49	Dimitri	Mraz	us-tx
331	Los Angeles	67	Quis Lectus Industries	male	2017-12-08 23:10:44	Wallace	Yundt	us-la
332	Los Angeles	85	Velit Corp.	male	2019-10-27 09:42:47	Wilmer	Wiza	us-az
335	Palo Alto	38	Sodales Mauris Blandit Institute	male	2018-07-16 05:54:12	Terrell	Mayer	us-oh
336	New York	74	Magna Nec Quam Industries	male	2018-02-02 17:04:48	Alexandra	Wolff	us-co
338	San Francisco	48	Vestibulum Accumsan Incorporated	female	2018-03-27 14:20:13	Dulce	Maggio	us-al
339	Seattle	63	Praesent Eu Dui LLC	female	2019-10-23 16:17:12	Jerrold	Wintheiser	us-wv
340	Chicago	52	Nunc Id Limited	female	2018-03-04 07:46:28	Lou	Krajcik	us-ia
341	New York	40	Aliquam Auctor Velit Corp.	female	2019-08-29 11:00:40	Wilma	Ryan	us-ia
342	Chicago	25	Duis Corp.	female	2018-12-18 12:07:25	Alexandria	Hilpert	us-ca
344	Austin	43	Ipsum Industries	female	2017-06-16 21:52:01	Arely	Eichmann	us-ga
345	Seattle	65	Cubilia Limited	female	2018-03-11 19:06:31	Sabryna	Schumm	us-ct
348	Los Angeles	83	Sem Consulting	female	2019-05-27 17:11:36	Kiarra	Runolfsson	us-vt
657	Chicago	34	Dui Fusce Consulting	female	2018-11-09 06:16:37	Vickie	Reilly	us-nv
1	San Francisco	65	Ornare LLP	male	2018-07-27 14:29:36	Rahsaan	Collins	us-nj
2	Seattle	81	Ut Nulla Limited	male	2017-03-04 06:40:41	Nyasia	Medhurst	us-il
78	Austin	61	Ac Mattis Ornare LLC	male	2017-02-15 21:14:13	Abigail	Gutmann	us-or
90	Palo Alto	70	Sit Amet Massa Associates	male	2019-09-17 20:52:37	Marisa	Wintheiser	us-id
315	Austin	39	Pede Ac Urna Associates	male	2019-03-30 16:49:19	Rubie	Gerhold	us-de
317	Austin	63	Sollicitudin A Ltd	male	2019-05-16 12:40:15	Kayli	Stokes	us-or
108	San Francisco	36	Convallis Est Vitae Limited	male	2019-05-03 05:58:23	Kara	Senger	us-nv
95	Palo Alto	56	Morbi Tristique Senectus Corp.	male	2019-06-24 20:34:36	Ruthie	Ledner	us-dc
100	Mountain View	80	Proin Inc.	male	2016-02-17 04:39:47	Jamie	Langworth	us-az
101	San Francisco	39	Nunc Sit Company	male	2019-11-09 00:19:57	Rodger	Schneider	us-wi
189	Los Angeles	68	Pellentesque Foundation	male	2017-07-11 07:38:04	Anita	Hayes	us-md
196	Chicago	20	Suspendisse Tristique Institute	male	2019-07-29 08:13:24	Zula	Daugherty	us-va
114	Los Angeles	77	Eu Tempor Erat Inc.	male	2018-06-30 05:30:42	Beulah	Auer	us-va
204	Seattle	26	Nulla Ltd	male	2018-01-12 15:21:31	August	White	us-tn
142	San Francisco	72	In Scelerisque Inc.	female	2019-11-19 13:15:36	Malachi	Hickle	us-or
156	Mountain View	21	Velit Dui Semper LLC	female	2018-09-03 04:27:06	Alison	Abshire	us-wy
160	San Francisco	55	Risus Donec Egestas Company	female	2019-01-05 22:14:02	Emma	Ward	us-pa
21	Los Angeles	20	Mi Consulting	male	2016-10-30 14:08:42	Charles	Maggio	us-mo
118	Los Angeles	45	Malesuada Corporation	male	2017-12-14 19:08:51	Avery	Metz	us-nc
175	Chicago	28	Nunc Inc.	male	2017-09-16 18:38:35	Derick	Lind	us-sc
123	Mountain View	20	Mauris Consulting	male	2017-04-24 23:08:23	Leta	Wolff	us-nj
179	Mountain View	84	Et Netus Et Associates	male	2018-10-18 13:09:48	Margarita	Labadie	us-ca
128	Austin	77	Molestie Foundation	male	2018-02-12 10:08:37	Rupert	Nienow	us-mi
130	Austin	21	Metus Urna Convallis Foundation	male	2017-09-30 14:35:34	Zita	Wuckert	us-al
135	Mountain View	69	Ante Maecenas Industries	male	2018-04-23 10:38:31	Marcella	Smitham	us-mn
152	Chicago	26	Sed Associates	female	2018-07-18 08:15:13	Marilou	Lehner	us-al
200	Austin	71	Nibh Vulputate Mauris Ltd	male	2019-03-01 21:20:10	Junius	Romaguera	us-vt
170	Los Angeles	48	Convallis Ligula Industries	female	2018-11-12 01:31:34	Hal	Parisian	us-in
309	Seattle	27	Pede Ultrices A Institute	male	2019-10-09 15:51:56	Delbert	Olson	us-al
185	Los Angeles	36	Porta Elit A Industries	male	2018-11-12 03:33:38	Gabrielle	Pacocha	us-mi
208	Palo Alto	34	Odio Sagittis Industries	male	2018-10-08 15:50:11	Freda	Howell	us-id
313	Chicago	52	Dui Ltd	male	2019-11-13 20:23:37	Osborne	Halvorson	us-ny
311	Chicago	53	Condimentum Donec LLP	male	2018-06-01 09:44:14	Retta	Will	us-me
312	Mountain View	29	Sed Corp.	male	2019-04-14 20:20:36	Edgar	Sporer	us-ms
210	Seattle	78	Maecenas Malesuada Fringilla Incorporated	male	2017-03-23 01:32:46	Sandra	Parker	us-wi
214	Palo Alto	82	Fusce Aliquam PC	male	2019-07-29 14:14:26	Einar	Baumbach	us-ne
215	New York	39	Pede Ac Urna Associates	male	2019-03-30 16:49:19	June	Ondricka	us-ca
220	Mountain View	57	Mi Lorem Vehicula Inc.	male	2019-01-10 23:10:32	Precious	Frami	us-in
225	Mountain View	70	Tempus Consulting	male	2019-08-17 20:56:46	Doug	Gleason	us-in
229	New York	58	Morbi Metus Incorporated	male	2019-09-14 20:20:57	Gwen	Hirthe	us-wi
230	San Francisco	51	Felis Corp.	male	2017-11-11 15:11:49	Levi	Lakin	us-ct
233	Los Angeles	83	Amet Massa Quisque Industries	male	2017-07-03 22:57:10	Brielle	Lesch	us-sc
240	Seattle	52	Nunc Id Limited	female	2018-03-04 07:46:28	Rodolfo	Moore	us-az
245	San Francisco	65	Cubilia Limited	female	2018-03-11 19:06:31	Cesar	Fahey	us-wi
249	San Francisco	27	Nec Corporation	female	2019-05-09 23:46:06	Jonathan	Rowe	us-sd
354	Mountain View	69	Consequat Auctor Nunc Foundation	female	2019-03-09 08:54:44	Juana	Hagenes	us-nh
418	Seattle	56	Justo Proin Company	male	2019-07-12 10:14:23	Edwina	Bergnaum	us-mt
444	Seattle	56	Ipsum Non Industries	female	2019-03-24 20:40:00	Jaylan	Conn	us-ga
463	Los Angeles	84	Eget Magna Suspendisse Corporation	female	2018-03-15 07:27:12	Hector	Torphy	us-mi
478	Mountain View	38	Aliquet Vel Vulputate Incorporated	male	2018-01-25 22:02:23	Erich	Murazik	us-nd
486	Seattle	37	Mauris Non Dui Associates	male	2017-09-30 10:00:27	Jazmyne	Jakubowski	us-vt
494	Mountain View	21	Venenatis Lacus Etiam Company	male	2019-06-27 22:43:05	Vena	Jerde	us-az
503	Palo Alto	81	Mi Enim Condimentum Ltd	male	2018-03-18 17:11:56	Richard	Kshlerin	us-ca
536	Mountain View	35	Vel Corporation	male	2018-06-05 09:50:36	Eli	Mante	us-nv
567	New York	35	Ante Ipsum Primis Ltd	female	2018-11-12 14:11:19	Bria	Baumbach	us-nm
576	Los Angeles	82	Convallis Convallis Dolor Industries	male	2018-03-18 05:35:27	Charity	Cassin	us-pa
585	Los Angeles	52	Tincidunt Orci Quis Corp.	male	2018-11-01 01:10:20	Horace	Witting	us-ct
601	Austin	63	Donec Fringilla Donec Limited	male	2018-03-06 12:34:17	Camron	Bartell	us-ct
623	Austin	79	Nonummy Ut Molestie Institute	male	2017-09-17 10:32:24	Franz	Welch	us-ri
643	Los Angeles	36	Ligula Aenean Gravida Ltd	female	2017-07-01 23:26:16	Marc	Conroy	us-ne
662	Palo Alto	53	Amet Massa Inc.	female	2018-03-23 17:51:32	Wendell	Hamill	us-mi
670	New York	75	Blandit LLP	female	2019-02-01 03:55:23	Beaulah	Ankunding	us-mi
250	New York	31	Libero Consulting	female	2017-01-31 14:07:41	Tierra	Price	us-ia
254	Los Angeles	69	Consequat Auctor Nunc Foundation	female	2019-03-09 08:54:44	Johnny	Thompson	us-ne
261	Seattle	20	Nullam Ltd	female	2017-02-16 20:34:50	Emmanuel	Tillman	us-ks
265	San Francisco	78	Eu Elit Nulla PC	female	2017-01-25 20:24:51	Karlie	Schiller	us-ga
270	San Francisco	34	Aliquam Auctor Velit LLP	female	2017-05-16 18:44:56	Kyra	Trantow	us-wv
273	Palo Alto	32	Mus Donec LLC	female	2019-08-07 21:46:16	Carlie	Ernser	us-ar
276	New York	33	Dui Corp.	male	2018-01-24 15:34:40	Joany	Botsford	us-nj
279	Austin	40	Dictum Placerat Augue Foundation	male	2018-02-27 10:43:45	Jalen	Ondricka	us-nc
285	San Francisco	45	Suspendisse Aliquet Inc.	male	2017-03-04 06:12:22	Sven	Rippin	us-ca
290	Los Angeles	43	Rhoncus Proin Nisl LLC	male	2017-11-24 14:29:49	Bernhard	Wuckert	us-sd
291	Seattle	49	Pharetra Nam Corporation	male	2019-05-31 23:40:20	Bruce	Kunze	us-ut
297	Mountain View	39	Consequat Incorporated	male	2018-09-04 13:44:54	Pierce	Deckow	us-ks
302	Austin	27	Suspendisse Dui Foundation	male	2018-04-02 23:19:56	Emil	Runolfsson	us-ct
308	Chicago	34	Odio Sagittis Industries	male	2018-10-08 15:50:11	Amina	Johnston	us-id
310	San Francisco	78	Maecenas Malesuada Fringilla Incorporated	male	2017-03-23 01:32:46	Trenton	Barrows	us-pa
314	Los Angeles	82	Fusce Aliquam PC	male	2019-07-29 14:14:26	Pietro	Kertzmann	us-wv
688	New York	78	Lorem Ipsum Sodales Limited	male	2017-09-29 22:07:36	Wilma	Halvorson	us-md
56	Seattle	81	Purus Accumsan Interdum Institute	female	2018-11-23 05:30:13	Stephen	Hessel	us-ia
76	Mountain View	83	Nec Tempus Inc.	male	2016-01-02 02:54:38	Santino	Crona	us-nh
85	San Francisco	80	Erat Etiam Vestibulum Corp.	male	2019-07-31 16:50:12	Kory	McClure	us-wy
96	Palo Alto	60	Tellus Nunc Lectus Ltd	male	2018-04-15 16:11:45	Sofia	Hermiston	us-nj
116	Chicago	25	Venenatis Lacus Etiam Foundation	male	2019-12-25 16:16:14	Jeremy	Ruecker	us-id
322	San Francisco	45	Diam Sed Diam Institute	male	2018-08-21 11:16:37	Velda	Schulist	us-sd
327	Chicago	57	Tincidunt Neque Vitae LLC	male	2019-06-05 04:54:26	Kristy	Beier	us-nd
333	Mountain View	83	Amet Massa Quisque Industries	male	2017-07-03 22:57:10	Dorcas	Ullrich	us-ri
334	New York	82	Id Industries	male	2018-07-30 11:46:03	Deontae	Hessel	us-il
346	Chicago	82	Ultricies Dignissim Lacus LLP	female	2019-11-26 03:57:08	Megane	O'Kon	us-id
349	San Francisco	27	Nec Corporation	female	2019-05-09 23:46:06	Greg	Waters	us-ar
162	Los Angeles	72	Accumsan Convallis Ltd	female	2019-11-22 02:57:08	Malinda	Jacobi	us-dc
182	Mountain View	57	Consectetuer Adipiscing Associates	male	2018-03-04 13:12:26	Vince	Fadel	us-dc
166	Palo Alto	59	Integer In Inc.	female	2018-08-19 19:53:44	Jerome	Kozey	us-co
236	Los Angeles	74	Magna Nec Quam Industries	male	2018-02-02 17:04:48	Rosario	Schuster	us-il
316	Austin	29	Sollicitudin Commodo Limited	male	2017-01-07 15:32:28	Henri	Fadel	us-wi
337	Mountain View	74	Cubilia Curae; Phasellus Limited	male	2017-01-31 21:05:25	Russ	Jones	us-nj
343	Chicago	56	Posuere Cubilia Curae; Ltd	female	2019-03-10 13:47:03	Lois	Graham	us-oh
362	Seattle	29	Elementum Purus Inc.	female	2017-07-21 05:44:40	Lizzie	Rempel	us-ut
363	New York	24	Semper Cursus Associates	female	2017-08-04 07:19:25	Gerardo	Deckow	us-mn
368	Los Angeles	25	Amet Industries	female	2017-12-31 04:20:03	Freddie	Halvorson	us-pa
446	Seattle	54	Ipsum Phasellus Vitae Ltd	female	2017-10-15 18:41:50	Kathleen	Medhurst	us-ga
542	Austin	76	Pellentesque Ut PC	female	2019-09-27 10:34:41	Damaris	Rice	us-ok
475	Seattle	38	Etiam Ligula Institute	male	2019-12-29 08:54:14	Juston	Kilback	us-la
482	Mountain View	41	Lacinia Foundation	male	2017-11-01 21:05:46	Luis	Prosacco	us-mo
396	Los Angeles	32	Etiam Incorporated	male	2019-09-07 05:05:57	Tate	Collier	us-sd
406	Mountain View	50	Ut Odio Corp.	male	2019-01-10 07:47:00	Jayde	Lemke	us-nd
566	Austin	33	Enim Etiam Associates	female	2018-05-06 17:17:44	Dolly	Botsford	us-ca
364	Los Angeles	54	Sed Pede Cum Associates	female	2019-05-16 07:01:04	Clint	Larson	us-sc
410	Seattle	80	Pellentesque Ut Corp.	male	2017-12-13 05:11:51	Nikita	Treutel	us-ma
426	Mountain View	53	Neque Incorporated	male	2019-08-06 23:44:19	Ben	Mante	us-la
430	Los Angeles	42	Erat Eget Ipsum Incorporated	male	2019-05-26 03:56:50	Alexis	Strosin	us-pa
583	Mountain View	23	Commodo At Libero Foundation	male	2019-08-02 11:07:40	Caitlyn	Stamm	us-nj
374	Austin	24	Lorem Lorem Incorporated	female	2018-05-13 10:16:43	Hayley	Wolf	us-il
434	Chicago	64	Proin Velit Sed Incorporated	male	2017-09-08 04:30:55	Quentin	Hartmann	us-ri
450	Chicago	85	Semper Institute	female	2018-07-25 20:12:46	Savion	Leuschke	us-al
377	Chicago	55	Tincidunt Nunc Ac Associates	male	2017-10-31 05:38:49	Alek	Vandervort	us-tx
455	San Francisco	70	Sed Industries	female	2018-09-15 10:28:35	Buck	Walker	us-nc
617	Seattle	79	Amet Orci Consulting	male	2019-01-05 08:34:59	Alena	Predovic	us-wy
384	New York	24	Ornare Tortor At Corp.	male	2019-08-22 00:43:50	Eva	Russel	us-tn
390	Los Angeles	43	Rhoncus Proin Nisl LLC	male	2017-11-24 14:29:49	Vella	Schiller	us-dc
393	Los Angeles	63	Erat Volutpat Associates	male	2018-12-24 07:38:11	Delta	Labadie	us-ga
551	San Francisco	46	Nunc Sed Company	female	2018-03-14 14:58:28	Ayana	Morar	us-mn
400	Chicago	59	Ipsum Donec Ltd	male	2018-01-17 12:39:19	Neoma	Veum	us-or
487	Chicago	56	Morbi Tristique Senectus Associates	male	2017-12-05 08:08:03	Alexys	Weissnat	us-wi
403	San Francisco	63	Pede Ltd	male	2017-11-09 08:47:31	Andreanne	Upton	us-il
552	Mountain View	43	Tempor Bibendum Donec Incorporated	female	2017-08-21 20:14:06	Giovani	Mertz	us-wy
510	Austin	48	Orci Quis Lectus Inc.	male	2018-09-25 09:31:19	Magali	Hintz	us-wy
415	Seattle	30	Libero Company	male	2018-05-27 02:43:30	David	Schulist	us-nm
570	New York	19	Lectus Cum Institute	female	2017-10-04 23:28:23	Leopoldo	Gerlach	us-co
422	New York	63	Vulputate Dui Nec Foundation	male	2018-05-26 12:44:16	Jasen	Lesch	us-mt
439	Mountain View	80	Eget Inc.	female	2019-12-16 03:43:01	Nestor	Jaskolski	us-ct
517	Los Angeles	25	A Institute	male	2018-05-28 17:40:55	Lelah	Dooley	us-az
442	Mountain View	54	Fermentum LLP	female	2019-12-23 19:26:18	Destany	Skiles	us-nv
532	Seattle	80	Eu Company	male	2019-10-01 02:12:57	Hazle	Paucek	us-nh
461	San Francisco	22	A Sollicitudin Foundation	female	2018-05-23 12:50:46	Lloyd	Heathcote	us-dc
587	San Francisco	63	Mollis Lectus Pede Institute	male	2018-08-18 02:05:21	Zelda	Dooley	us-nm
467	New York	55	Sit Amet Consectetuer Corporation	female	2018-12-14 08:43:51	Priscilla	Hahn	us-or
504	Los Angeles	40	Cum Sociis Incorporated	male	2018-05-11 08:55:45	Josue	Simonis	us-tn
522	New York	73	Vitae Odio Sagittis Industries	male	2017-11-15 13:36:46	Hassie	Ziemann	us-nm
537	San Francisco	68	Vel Industries	male	2018-12-20 17:53:22	Edd	Hayes	us-al
547	Chicago	46	Proin Dolor Nulla Limited	female	2019-03-26 02:40:59	Bradly	Welch	us-ca
595	New York	35	Risus Quis Corporation	male	2017-07-24 00:28:12	Concepcion	Maggio	us-nj
550	Mountain View	42	Quisque Company	female	2018-01-28 13:35:49	Skylar	Zboncak	us-in
605	New York	51	Et Eros Proin PC	male	2017-08-21 00:34:18	Palma	D'Amore	us-de
609	San Francisco	37	Facilisi Foundation	male	2019-07-21 20:38:13	Jamir	Sipes	us-mi
558	Seattle	79	Viverra Maecenas Iaculis Limited	female	2019-04-05 23:17:51	Cristal	Flatley	us-ks
614	Austin	71	Enim Mauris Institute	male	2017-08-21 02:26:12	Cullen	Wyman	us-nc
622	Seattle	26	Interdum Enim Non Limited	male	2017-12-21 20:16:27	Kieran	Zemlak	us-mi
563	New York	50	Donec Industries	female	2018-08-18 15:23:55	Zena	Monahan	us-tn
627	New York	50	Orci Adipiscing Corporation	male	2019-10-31 12:15:33	Maximilian	Bednar	us-nv
574	Austin	42	Donec Corp.	female	2019-03-20 02:53:31	Helena	Ziemann	us-fl
632	Palo Alto	68	Nunc Sollicitudin Commodo Foundation	male	2018-05-19 11:10:29	Genoveva	Fahey	us-md
636	Mountain View	81	Ipsum Suspendisse Non Ltd	male	2019-09-17 03:00:19	Hoyt	Haley	us-ga
642	Austin	32	Dapibus Quam Institute	female	2019-07-12 14:21:12	Adrain	Bruen	us-la
645	Chicago	34	Vitae Semper Foundation	female	2019-03-28 13:42:55	Franz	Osinski	us-sc
3	Seattle	67	Risus Corporation	male	2018-08-29 09:41:54	Emile	Windler	us-nm
4	New York	85	Accumsan Neque Industries	male	2017-11-17 05:56:58	Kendall	Weissnat	us-nh
83	San Francisco	65	Cursus Integer Mollis Foundation	male	2019-10-06 20:55:24	Onie	Schmidt	us-id
86	New York	50	Lorem Fringilla Ornare Institute	male	2018-10-06 08:10:07	Nicolas	Hartmann	us-nm
102	San Francisco	50	Lorem Auctor Quis Corporation	male	2018-02-17 00:26:16	Jude	Barrows	us-tx
216	Seattle	29	Sollicitudin Commodo Limited	male	2017-01-07 15:32:28	Jazlyn	Toy	us-pa
661	Los Angeles	59	Neque In Consulting	female	2018-03-09 09:07:20	Edgardo	Zieme	us-ia
664	Austin	68	Libero Proin Sed Foundation	female	2019-07-31 04:07:37	Gage	Goodwin	us-co
665	Mountain View	76	Feugiat Associates	female	2019-05-03 20:32:27	Greg	Kshlerin	us-wi
668	San Francisco	42	Integer Aliquam Institute	female	2018-02-15 10:49:01	Selmer	White	us-tx
676	Palo Alto	58	At Corporation	male	2019-04-22 02:29:41	Damian	Hoeger	us-id
680	Mountain View	56	Parturient Montes Nascetur Incorporated	male	2019-05-18 20:43:12	Chaim	Windler	us-id
685	Mountain View	31	Suspendisse Sed Corporation	male	2019-03-27 06:39:31	Estevan	Ziemann	us-pa
689	Austin	50	Tempor Erat LLP	male	2018-12-28 10:56:33	Vicky	Green	us-co
693	Mountain View	76	Pede Ultrices A Foundation	male	2018-05-03 08:54:32	Rosa	Durgan	us-mi
695	Austin	73	Hymenaeos Mauris Ut Industries	male	2018-05-04 19:30:42	Gavin	Gutmann	us-id
698	Los Angeles	21	At Sem Molestie PC	male	2017-09-27 12:46:40	Macie	Ryan	us-ms
53	Mountain View	73	Primis In Faucibus Corp.	female	2018-12-02 09:05:05	Eleazar	Stokes	us-sc
55	Los Angeles	52	Donec Egestas Duis Consulting	female	2019-11-10 07:06:23	Kassandra	Bins	us-ks
147	Los Angeles	72	Elit Pede Malesuada Company	female	2017-12-30 21:48:46	Sigmund	Konopelski	us-mi
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chatbi
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chatbi
--

SELECT pg_catalog.setval('public.product_categories_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chatbi
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: student_teacher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chatbi
--

SELECT pg_catalog.setval('public.student_teacher_id_seq', 1, false);


--
-- Name: student_teacher_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chatbi
--

SELECT pg_catalog.setval('public.student_teacher_student_id_seq', 1, false);


--
-- Name: student_teacher_teacher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chatbi
--

SELECT pg_catalog.setval('public.student_teacher_teacher_id_seq', 1, false);


--
-- Name: suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chatbi
--

SELECT pg_catalog.setval('public.suppliers_id_seq', 1, false);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chatbi
--

SELECT pg_catalog.setval('public.teachers_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chatbi
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: chatbi
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: chatbi
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: chatbi
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: student_teacher student_teacher_pk; Type: CONSTRAINT; Schema: public; Owner: chatbi
--

ALTER TABLE ONLY public.student_teacher
    ADD CONSTRAINT student_teacher_pk PRIMARY KEY (id);


--
-- Name: student_teacher student_teacher_un; Type: CONSTRAINT; Schema: public; Owner: chatbi
--

ALTER TABLE ONLY public.student_teacher
    ADD CONSTRAINT student_teacher_un UNIQUE (teacher_id, student_id);


--
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: chatbi
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: chatbi
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: items_product_id; Type: INDEX; Schema: public; Owner: chatbi
--

CREATE INDEX items_product_id ON public.orders USING btree (product_id);


--
-- Name: orders_completed_at_user_id; Type: INDEX; Schema: public; Owner: chatbi
--

CREATE INDEX orders_completed_at_user_id ON public.orders USING btree (completed_at, user_id);


--
-- Name: orders_product_id; Type: INDEX; Schema: public; Owner: chatbi
--

CREATE INDEX orders_product_id ON public.orders USING btree (product_id);


--
-- Name: orders_product_id_id; Type: INDEX; Schema: public; Owner: chatbi
--

CREATE INDEX orders_product_id_id ON public.orders USING btree (product_id, id);


--
-- Name: orders_user_id_id; Type: INDEX; Schema: public; Owner: chatbi
--

CREATE INDEX orders_user_id_id ON public.orders USING btree (user_id, id);


--
-- Name: products_id_name; Type: INDEX; Schema: public; Owner: chatbi
--

CREATE INDEX products_id_name ON public.products USING btree (id, name);


--
-- Name: products_name_id; Type: INDEX; Schema: public; Owner: chatbi
--

CREATE INDEX products_name_id ON public.products USING btree (name, id);


--
-- Name: users_gender; Type: INDEX; Schema: public; Owner: chatbi
--

CREATE INDEX users_gender ON public.users USING btree (gender);


--
-- Name: users_gender_id; Type: INDEX; Schema: public; Owner: chatbi
--

CREATE INDEX users_gender_id ON public.users USING btree (gender, id);


--
-- PostgreSQL database dump complete
--

