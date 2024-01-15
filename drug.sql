create table druginfo
(
    drugname   varchar(50)  null,
    changshang varchar(50)  null,
    beizhu     varchar(100) null,
    location   varchar(100) null,
    unit       varchar(50)  null,
    guige      varchar(50)  null,
    tiaoxingma varchar(50)  null
);

create table ghs
(
    gonghuoshang varchar(80) null
);

create table jinhuo
(
    drugname     varchar(50)  null,
    changshang   varchar(50)  null,
    beginprice   varchar(50)  null,
    price        varchar(50)  null,
    amount       varchar(50)  null,
    sum          varchar(50)  null,
    begindate    varchar(50)  null,
    date         varchar(50)  null,
    pihao        varchar(50)  null,
    beizhu       varchar(100) null,
    location     varchar(100) null,
    unit         varchar(50)  null,
    guige        varchar(50)  null,
    tiaoxingma   varchar(50)  null,
    jinhuo_time  varchar(100) null,
    gonghuoshang varchar(100) null
);

create table jinhuorecords
(
    drugname     varchar(50)  null,
    changshang   varchar(50)  null,
    beginprice   varchar(50)  null,
    price        varchar(50)  null,
    amount       varchar(50)  null,
    sum          varchar(50)  null,
    begindate    varchar(50)  null,
    date         varchar(50)  null,
    pihao        varchar(50)  null,
    beizhu       varchar(100) null,
    location     varchar(100) null,
    unit         varchar(50)  null,
    guige        varchar(50)  null,
    tiaoxingma   varchar(50)  null,
    jinhuo_time  varchar(100) null,
    gonghuoshang varchar(100) null
);

create table limitsell
(
    drugname   varchar(100)  null,
    changshang varchar(100)  null,
    amount     int default 0 null
);

create table manager
(
    user     varchar(50) null,
    password varchar(50) null,
    role     int         null
);

create table rxdrug
(
    time       varchar(50) not null,
    drugname   varchar(80) not null,
    changshang varchar(80) not null,
    date       varchar(80) not null,
    pihao      varchar(50) not null,
    count      varchar(50) not null
);

create table rxperson
(
    time     varchar(50) not null,
    name     varchar(50) null,
    gendar   varchar(20) null,
    age      varchar(20) null,
    phone    varchar(50) null,
    location varchar(80) null,
    hospital varchar(80) null,
    htime    varchar(80) null,
    yz       varchar(80) null,
    ysname   varchar(80) null,
    zdys     varchar(80) null
);

create table sell
(
    drugname   varchar(100) null,
    changshang varchar(100) null,
    price      varchar(100) null,
    date       varchar(100) null,
    pihao      varchar(100) null,
    beizhu     varchar(100) null,
    count      varchar(100) null,
    unit       varchar(100) null,
    guige      varchar(100) null,
    amount     varchar(100) null,
    sum        varchar(100) null
);

create table sellover
(
    drugname   varchar(50)  null,
    changshang varchar(50)  null,
    price      varchar(50)  null,
    date       varchar(50)  null,
    pihao      varchar(50)  null,
    beizhu     varchar(100) null,
    count      varchar(50)  null,
    unit       varchar(50)  null,
    guige      varchar(50)  null
);

create table sellrecords
(
    drugname   varchar(100) null,
    changshang varchar(100) null,
    beginprice varchar(100) null,
    price      varchar(100) null,
    date       varchar(100) null,
    pihao      varchar(100) null,
    beizhu     varchar(100) null,
    unit       varchar(100) null,
    guige      varchar(100) null,
    amount     varchar(100) null,
    sum        varchar(100) null,
    selltime   varchar(100) null
);

create table store
(
    drugname   varchar(50)  null,
    changshang varchar(50)  null,
    beginprice varchar(50)  null,
    price      varchar(50)  null,
    begindate  varchar(50)  null,
    date       varchar(50)  null,
    pihao      varchar(50)  null,
    beizhu     varchar(100) null,
    location   varchar(100) null,
    count      varchar(50)  null,
    unit       varchar(50)  null,
    guige      varchar(50)  null,
    tiaoxingma varchar(50)  null
)
    charset = utf8mb4;

