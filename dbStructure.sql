create table "Houses"
(
    id        serial
        primary key,
    "userIds" integer[] default ARRAY []::integer[],
    name      text not null,
    address   text not null
);

alter table "Houses"
    owner to postgres;

create table "RoomTypes"
(
    id   serial
        primary key,
    type integer not null,
    name text    not null
);

alter table "RoomTypes"
    owner to postgres;

create table "Rooms"
(
    id        serial
        primary key,
    "houseId" integer not null
        references "Houses"
            on delete cascade,
    name      text    not null,
    "typeId"  integer not null
        references "RoomTypes"
            on delete cascade
);

alter table "Rooms"
    owner to postgres;

create table "SensorTypes"
(
    id   serial
        primary key,
    type text not null
);

alter table "SensorTypes"
    owner to postgres;

create table "Sensors"
(
    id                 serial
        primary key,
    "roomId"           integer
                                          references "Rooms"
                                              on update cascade on delete set null,
    "houseId"          integer            not null
        references "Houses"
            on delete cascade,
    name               text               not null,
    "sensorType"       integer            not null,
    "macAddress"       text               not null,
    "readingFrequency" integer default 10 not null,
    "networkStatus"    text    default 'offline'::text,
    ip                 text
);

alter table "Sensors"
    owner to postgres;

create table "SensorsData"
(
    id         serial
        primary key,
    "sensorId" integer
        references "Sensors"
            on delete cascade,
    data       json                    not null,
    timestamp  timestamp default now() not null
);

alter table "SensorsData"
    owner to postgres;

create table "Users"
(
    id               serial
        primary key,
    email            text not null
        unique,
    password         text not null,
    salt             uuid not null,
    "defaultHouseId" integer
        references "Houses"
            on update cascade,
    "firstName"      text not null,
    "lastName"       text not null
);

alter table "Users"
    owner to postgres;

