create database `zq_blogs`;

--创建用户表
create table `zxwfd_user`(
`id` int primary key not null auto_increment,
`username` varchar(20) not null default '',
`password` char(32),
`email` varchar(30) default '',
`qq` varchar(30) default '',
`status` int default 0 comment '用于标记博主和访客',
`create_time` int not null default '',
`last_login_time` int not null default '',
`login_time` int not null default ''
);

--创建文章表
create table `zxwfd_content`(
`id` int primary key not null auto_increment,
`title` varchar(40) not null default '',
`content` text not null default '',
`create_time` int not null default 0,
`cat_id` int,
`tag_id` int,
`modify_time` int default 0,
`status` tinyint default 0,
FOREIGN KEY(`cat_id`) REFERENCES `zxwfd_category`(`id`),
FOREIGN KEY(`tag_id`) REFERENCES `zxwfd_tag`(`id`)
);

--用户-文章关联表
create table `zxwfd_user_content`(
`id` int primary key not null auto_increment,
`user_id` int not null default '',
`content_id` int not null default '',
FOREIGN KEY (`user_id`) REFERENCES `zxwfd_user` (`id`),
FOREIGN KEY (`content_id`) REFERENCES `zxwfd_content`(`id`),
);

--创建分类表
create table `zxwfd_category`(
`id` int primary key not null auto_increment,
`cat_name` varchar(20) not null default '',
`cat_description` text default '',
`pid` int not null default 0,
`path` varchar(10) not null default '',
FOREIGN KEY (`pid`) REFERENCES `zxwfd_category` (`id`)
);

--创建标签表
create table `zxwfd_tag`(
`id` int primary key not null auto_increment,
`tag_name` varchar(20) not null default ''
);

--创建评论/回复表
create table `zxwfd_comment`(
`id` int primary key not null auto_increment,
`comment` text not null default '',
`user_id` int not null default '',
`create_time` int not null default '',
FOREIGN KEY (`user_id`) REFERENCES `zxwfd_user` (`id`)
);

--创建文章-评论/回复关联表
create table `zxwfd_content_comment`(
`id` int primary key not null auto_increment,
`user_id` int not null default '',
`content_id` int not null default '',
`comment_user_id` int not null default '',
`create_time` int not null default '',
FOREIGN KEY (`user_id`) REFERENCES `zxwfd_user` (`id`),
FOREIGN KEY (`content_id`) REFERENCES `zxwfd_content`(`id`),
);

-- 创建留言表
create table `zxwfd_message`(
`id` int primary key not null auto_increment,
`title` varchar(100) not null default '',
`user_id` int not null default '',
`content` text not null default '',
`create_time` int not null default '',
FOREIGN KEY (`user_id`) REFERENCES `zxwfd_user` (`id`),
FOREIGN KEY (`content_id`) REFERENCES `zxwfd_content`(`id`),
);