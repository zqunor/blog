<?php
namespace app\admin\controller;
use think\Controller;
class Article extends Controller
{
    public function index()
    {
        return $this->fetch();
    }
    public function add()
    {
        $input = file_get_contents('php://input');
        return $this->fetch();
    }


}
