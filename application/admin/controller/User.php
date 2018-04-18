<?php
namespace app\admin\controller;
use think\Controller;
class User extends Controller
{
    public function login()
    {
        return $this->fetch();
    }
    public function index()
    {
        return $this->fetch();
    }
}