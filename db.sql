--创建数据库
create databse `blog`;

--创建用户表
create table `b_user`(
`id` int primary key not null auto_increment,
`username` varchar(20) not null default '',
`password` char(32),
`email` varchar(30) default '',
`status` int default 0 comment '用于标记博主和访客',
`create_time` int,
`last_login_time` int ,
`login_time` int
);

--创建文章表
create table `b_content`(
`id` int primary key not null auto_increment,
`title` varchar(40) not null default '',
`content` text not null default '',
`create_time` int not null,
`modify_time` int default ''
);

--用户-文章关联表
create table `b_user_content`(
`id` int primary key not null auto_increment,
`user_id` int ,
`content_id` int,
FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`),
FOREIGN KEY (`content_id`) REFERENCES `b_content`(`id`),
);

--创建分类表
create table `b_category`(
`id` int primary key not null auto_increment,
`cat_name` varchar(20) not null default '',
`cat_description` text default '',
`pid` int
);

--创建标签表
create table `b_tag`(
`id` int primary key not null auto_increment,
`tag_name` varchar(20) not null default ''
);

--创建评论/回复表
create table `b_comment`(
`id` int primary key not null auto_increment,
`comment` text not null default '',
`user_id` int not null,
`create_time` int not null default '',
FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`)
);

--创建文章-评论/回复关联表
create table `b_content_comment`(
`id` int primary key not null auto_increment,
`user_id` int,
`content_id` int,
`comment_user_id` int,
FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`),
FOREIGN KEY (`content_id`) REFERENCES `b_content`(`id`),
);