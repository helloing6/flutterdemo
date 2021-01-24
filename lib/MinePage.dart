import 'package:flutter/material.dart';

/*我的页面*/


class MinePage extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(children: <Widget>[
      ListTileWidget(),
      ListTileWidget(),
      ListTileWidget(),

      ListTile(
          leading: Icon(Icons.access_time), title: Text('access_time')),
      ListTile(
          leading: Icon(Icons.account_balance), title: Text('account_balance')),

    ]);
  }
}
/*ListTile(列表瓦片)组件 , ListTile通常用于填充 ListView*/
class ListTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      //标题
        title: Text("House"),
        //副标题
        subtitle: Text("A House"),
        //前置图标
        leading: Icon(Icons.home),
        //后置图标
        trailing: Icon(Icons.keyboard_arrow_right),
        //内容内边距
        contentPadding: EdgeInsets.all(5.0),
        //是否选中状态
        selected: true);
  }
}
