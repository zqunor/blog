<?php
namespace app\index\controller;

use think\Controller;

class Index extends Controller
{
    public function index()
    {
//        var_dump('zzz');die;
        return $this->fetch();
    }

    /**
     * 导航分类
     */
    public function category()
    {
        $cate = input('cate');
        $where['name'] = $cate;
        // $contents = db('category')->where($where)
        //     ->join('content cont', 'category.id = cont.cat_id', 'right')
        //     ->select();

        // $this->assigin('contents', $contents);
        return $this->fetch('category');
    }

    /**
     * 文章详情页
     */
    public function detail()
    {
        $content_id = input('id');
        $content = db('article')->where('id', $content_id)->find();
        return $this->fetch('detail', ['content'=>$content]);
    }

    /**
     * 留言页
     */
    public function liuyan()
    {
        $input = file_get_contents('php://input');
        if(isset($input) || empty($input)) {
            return $this->fetch();
        }
        
        $inputdata = isset($input) ? json_decode($input, 1) : '';
        $res = db('message')->allowField(true)->save($inputdata);
        if($res) {
            $this->success('');
        }else {
            
        }
        
    }

    /**
     * 关于我
     */
    public function about()
    {
        return $this->fetch();
    }

    public function test()
    {
        echo strtotime('30 April 2018');
        // echo 'hello world';
    }
}
