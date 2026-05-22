/****** Object:  Table places ******/
CREATE TABLE places(
	p_location_ID int primary key,
	p_location_name varchar(50) NOT NULL,
	p_access_level varchar(50) NOT NULL
);
/****** Object:  Table plants ******/
CREATE TABLE plants(
	pl_plant_ID int primary key,
	pl_plant_name varchar(50) NOT NULL,
	pl_plant_type text check(pl_plant_type in ('control', 'treatment', 'community')) NOT NULL,
	pl_harvestable varchar(50) NOT NULL,
	pl_planted_when varchar(50) NOT NULL
);

/****** Object:  Table grows ******/
CREATE TABLE grows(
	g_location_ID int NOT NULL,
	g_plant_ID int not NULL,
	primary key (g_location_ID, g_plant_ID),
	foreign key (g_location_ID) references places(p_location_ID),
	foreign key (g_plant_ID) references plants(pl_plant_ID)
);

/****** Object:  Table status ******/
CREATE TABLE status(
	s_plant_ID int primary key,
	s_plant_status text check(s_plant_status in ('producing', 'seed', 'pests', 'sick', 'juvenile', 'flowering/bolting', 'healthy', 'dead', 'unplanted')) NOT NULL,
	foreign key (s_plant_ID) references plants(pl_plant_ID)
);