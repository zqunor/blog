<?php
namespace app\index\controller;

use think\Controller;

class Index extends Controller
{
    public function index()
    {
//        var_dump(123);die;
        return $this->fetch();
    }
}
