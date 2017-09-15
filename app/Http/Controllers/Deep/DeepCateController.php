<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/15
 * Time: 9:40
 */
namespace App\Http\Controllers\Deep;
use App\Http\Controllers\Controller;
use App\Models\DeepCate;

class DeepCateController extends Controller
{
    //第一种方法使用递归实现无限级分类,利用模型
    public function deep1()
    {
        //这获取到的是一个集合
        //$categories = DeepCate::all();
        //运用toArray方法得到的是一个数组
        //$categories = DeepCate::all()->toArray();
        //print_r($categories);
        $tree = DeepCate::tree();
        dump($tree);
    }
    //第二种方法实现
    public function deep2()
    {
        //将结果集转换为数组
        $goodsinfo = DeepCate::get()->toArray();
        //dd($goodsinfo);
        $a = $this->list_to_tree($goodsinfo);
        print_r($a);

    }
    public function list_to_tree($list, $pk='id',$pid = 'pid',$child = '_child',$root=0) {
        // 创建Tree
        $tree = array();
        if(is_array($list)) {
            // 创建基于主键的数组引用
            $refer = array();
            foreach ($list as $key => $data) {
                $refer[$data[$pk]] =& $list[$key];
            }
            foreach ($list as $key => $data) {
                // 判断是否存在parent
                $parentId = $data[$pid];
                if ($root == $parentId) {
                    $tree[] =& $list[$key];
                }else{
                    if (isset($refer[$parentId])) {
                        $parent =& $refer[$parentId];
                        $parent[$child][] =& $list[$key];
                    }
                }
            }
        }
        return $tree;
    }
}