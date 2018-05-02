<?php
namespace app\admin\controller;
use think\Controller;
class Chart extends Controller
{
    public function zhexian()
    {
        return $this->fetch();
    }
    public function timeline()
    {
        $input = file_get_contents('php://input');
        return $this->fetch();
    }


}
