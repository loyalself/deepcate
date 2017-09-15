<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DeepCate extends Model
{
    //
    protected $table = 'deepcate';

    public static function tree()
    {
        $cate = self::get()->toArray();
        $tree = self::SortOut($cate);
        return $tree;
    }
    //封装递归调用的方法
    public static function SortOut($cate,$pid=0,$level=0,$html='|---')
    {
        //先定义一个空数组,目的是为了将所有数据存入到新数组树状化
        $tree = array();
        foreach($cate as $v)
        {
            if($v['pid'] == $pid)
            {
                $v['level'] = $level;
                $v['html'] = str_repeat($html,$level);
                $tree[] = $v;
                $tree = array_merge($tree,self::SortOut($cate,$v['id'],$level+1,$html));
            }
        }
        return $tree;
    }
}
