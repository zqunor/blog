--创建数据库
create databse `blog`;

--创建用户表
create table `b_user`(
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
create table `b_content`(
`id` int primary key not null auto_increment,
`title` varchar(40) not null default '',
`content` text not null default '',
`create_time` int not null default '',
`cat_id` int not null default '',
`tag_id` int not null default '',
`modify_time` int default '',
FOREIGN KEY(`cat_id`) REFERENCES `b_category`(`id`)
FOREIGN KEY(`tag_id`) REFERENCES `b_tag`(`id`)
);

--用户-文章关联表
create table `b_user_content`(
`id` int primary key not null auto_increment,
`user_id` int not null default '',
`content_id` int not null default '',
FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`),
FOREIGN KEY (`content_id`) REFERENCES `b_content`(`id`),
);

--创建分类表
create table `b_category`(
`id` int primary key not null auto_increment,
`cat_name` varchar(20) not null default '',
`cat_description` text default '',
`pid` int not null default '',
FOREIGN KEY (`pid`) REFERENCES `b_category` (`id`),
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
`user_id` int not null default '',
`create_time` int not null default '',
FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`)
);

--创建文章-评论/回复关联表
create table `b_content_comment`(
`id` int primary key not null auto_increment,
`user_id` int not null default '',
`content_id` int not null default '',
`comment_user_id` int not null default '',
`create_time` int not null default '',
FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`),
FOREIGN KEY (`content_id`) REFERENCES `b_content`(`id`),
);

-- 创建留言表
create table `b_message`(
`id` int primary key not null auto_increment,
`title` varchar(100) not null default '',
`user_id` int not null default '',
`content` text not null default '',
`create_time` int not null default '',
FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`),
FOREIGN KEY (`content_id`) REFERENCES `b_content`(`id`),
);
