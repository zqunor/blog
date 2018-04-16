www.h-ui.net/H-ui.admin/

http://sc.chinaz.com/tag_moban/shangcheng.html



无限级分类
```php
$m = M('goods_type');
$data = $m->field("*, concat(path,',',id) as paths ")-.order('paths')->select();

foreach($data as $k=>$v ){
    $data[$k]['name'] = str_repeat("|---", $v['level']) . $v['name'];
}
```


```php
<div class="row cl">
  <label class="dorm-label col-2">描述：</lable>
  <div class="formControls col-5">
      <span class="select-box">
         <select class="select" size="1" name="pid">
            <option value="0" selected>顶级分类</option>
            {foreach $data as $item}
               <option value="{$item.id}">{$item.name}</option>
            {/foreach}
         </select>
      </span>
  </div>
</div>
```


