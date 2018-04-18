<?php
namespace app\admin\controller;
use think\Controller;
class Index extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

    // 欢迎页
    public function welcome()
    {
        return $this->fetch();
    }

    // 文章管理
    public function article()
    {
        return $this->fetch();
    }

    // 分类管理
    public function category()
    {
        return $this->fetch();
    }

    // 标签管理
    public function tag()
    {
        return $this->fetch();
    }

    // 友情链接管理
    public function link()
    {
        return $this->fetch();
    }

    // 评论管理
    public function comment()
    {
        return $this->fetch();
    }
    // 留言管理
    public function message()
    {
        return $this->fetch();
    }

    // 关于页内容管理
    public function about()
    {
        return $this->fetch();
    }
}
