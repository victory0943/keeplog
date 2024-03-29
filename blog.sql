create table user(
	id int not null auto_increment primary key,
    username varchar(16) not null,
    nickname varchar(16) not null,
	mobile char(11) not null,
    password varchar(64) not null,
    email varchar(64) not null,
    ctime datetime not null
)default charset=utf8;


create table article(
	id int not null auto_increment primary key,
    title varchar(255) not null,
    text text not null,
	read_count int default 0,
	comment_count int default 0,
	up_count int default 0,
	down_count int default 0,
    user_id int not null,
    ctime datetime not null,
    constraint fk_article_user foreign key (user_id) references user(id)
)default charset=utf8;


create table comment(
    id int not null auto_increment primary key,
    content varchar(255) not null,
    user_id int not null,
	article_id int not null,
    ctime datetime not null,
    constraint fk_comment_user foreign key (user_id) references user(id),
    constraint fk_comment_article foreign key (article_id) references article(id)
)default charset=utf8;


create table up_down(
    id int not null auto_increment primary key,
    choice tinyint not null,
    user_id int not null,
	article_id int not null,
    ctime datetime not null,
    constraint fk_up_down_user foreign key (user_id) references user(id),
    constraint fk_up_down_article foreign key (article_id) references article(id)
)default charset=utf8;