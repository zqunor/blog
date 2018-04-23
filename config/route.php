<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

return [
    '__pattern__' => [
        'name' => '\w+',
    ],
    '[hello]' => [
        ':id' => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
        ':name' => ['index/hello', ['method' => 'post']],
    ],

    // 前端路由
    '/' => 'index/index/index',
    'about' => 'index/index/about',

    ':cate' => 'index/index/category',

    'liuyan' => 'index/index/liuyan',
    'detail/:id' => 'index/index/detail',

    // 后台路由
    'admin' => 'admin/index/index',
    'welcome' => 'admin/index/welcome',
    'article' => 'admin/index/article',
    'category' => 'admin/index/category',
    'tag' => 'admin/index/tag',
    'link' => 'admin/index/link',
    'comment' => 'admin/index/comment',
    'message' => 'admin/index/message',
    // 'about' => 'admin/index/about',

    // 测试路由
    'test' => 'index/index/test',

];
