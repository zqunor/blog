## json_decode()  --- 对 JSON 格式的字符串进行解码

### 1、用法：
`mixed json_decode ( string $json [, bool $assoc = false [, int $depth = 512 [, int $options = 0 ]]] )`

参数说明：

* $json: json格式的字符串

* $assoc:
    * 值为`true`: 表示返回`数组`形式的数据
    * 值为`false`：表示返回`对象`形式的数据
    * 默认为`false`
    
* $depth：指定递归深度。

* $options: JSON解码的掩码选项。 现在有两个支持的选项。 
    * 第一个是`JSON_BIGINT_AS_STRING`， 用于将大整数转为`字符串`而非默认的float类型。
    * 第二个是`JSON_OBJECT_AS_ARRAY`， 与将assoc设置为 TRUE 有相同的效果。
    

### 2、范例：
**`$json = '{"a":1,"b":2,"c":3,"d":4,"e":5}'`**
* json_decode($json);
      
      
    object(stdClass)#1 (5) {
      ["a"] => int(1)
      ["b"] => int(2)
      ["c"] => int(3)
      ["d"] => int(4)
      ["e"] => int(5)
    }   
         
* json_decode($json, true);


    array(5) {
        ["a"] => int(1)
        ["b"] => int(2)
        ["c"] => int(3)
        ["d"] => int(4)
        ["e"] => int(5)
    }

### 3、应用场景：    
**有返回的数据`$modeofpayment`，需要对其进行循环输出每条数据。如何实现？**    

其中：`$modeofpayment` = `[{"id":1,"name":"货到付款"},{"id":2,"name":"支付宝付款"},{"id":3,"name":"微信付款"}]`;

（1）var_dump()打印结果为`string '[{"id":1,"name":"货到付款"},{"id":2,"name":"支付宝付款"},{"id":3,"name":"微信付款"}]'`

其数据类型为**string**

（2）将数据转化为数组形式：`json_decode($json, true)`。得到结果为：
    
    array (size=3)
      0 => 
        array (size=2)
          'id' => int 1
          'name' => string '货到付款' (length=12)
      1 => 
        array (size=2)
          'id' => int 2
          'name' => string '支付宝付款' (length=15)
      2 => 
        array (size=2)
          'id' => int 3
          'name' => string '微信付款' (length=12)

（3）使用模板引擎循环输出
```php
{foreach name="$offer.modeofpayment" item="vo"}
<label class="iconfont wx">
    <input type="radio" name="paymentmode" value="{$vo.id}" /> {$vo.name}
</label>
{/foreach}
```

或者
```php
{volist name="$offer.modeofpayment" id="vo"}
<label class="iconfont wx">
    <input type="radio" name="paymentmode" value="{$vo.id}" /> {$vo.name}
</label>
{/volist}
```