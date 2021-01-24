import 'package:flutter/material.dart';
import 'package:flutterapp/MainPage.dart';

void main() => runApp(MyLoginApp());

class MyLoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: new ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          body: new LoginHomePage(),
        ));
  }
}

class LoginHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginHomePageState();
  }
}

class _LoginHomePageState extends State<LoginHomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.max,
          //表示Row在主轴(水平)方向占用的空间，默认是MainAxisSize.max，表示尽可能多的占用水平方向的空间，
          crossAxisAlignment: CrossAxisAlignment.center,
          // 表示子组件在纵轴方向的对齐方式，Row的高度等于子组件中最高的子元素高度
          children: <Widget>[
            /* TODO 1, 放置登录页面logo或文字等等 */
            Container(
              //容器类组件(组合类,可以同时实现装饰、变换、限制的场景)
              height: 150.0,
              alignment: Alignment.center,
              //居中
              padding: EdgeInsets.only(top: 20.0),
              color: const Color(0xfff2f2f2),
              child: Text('购物',
                  style: TextStyle(
                      color: const Color(0xffc8a675),
                      fontSize: 40.0,
                      fontFamily: "Courier")),
            ),

            /* TODO 2, 文本输入框区域 */
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              margin: EdgeInsets.only(bottom: 10.0),
              child: new Container(
                child: buildForm(),
              ),
            ),

            /* TODO 3, 忘记密码 */
            Text(
              '忘记密码?',
              style: TextStyle(
                fontSize: 15.0,
                decoration: TextDecoration.underline,
              ),
            )
          ],
        )
      ],
    );
  }

  /* 定义两个container类 unameController和pwdController*/
  TextEditingController nameController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  GlobalKey formKey = new GlobalKey<FormState>();

  buildForm() {
    return Form(
      /* globalKey, 用于后面获取FormState*/
      key: formKey,
      /* 开启自动效验 */
      autovalidate: true,
      child: Column(
        children: <Widget>[
          /*用户名*/
          TextFormField(
            autofocus: false,
            keyboardType: TextInputType.text,
            //键盘输入类型(七种类型)
            textInputAction: TextInputAction.next,
            //键盘动作按钮图标
            controller: nameController,
            //container
            maxLength: 12,
            //最大位数
            maxLengthEnforced: true,
            //超出maxLength,禁止输入
            decoration: InputDecoration(
              labelText: "用户名",
              hintText: "请输入用户名",
              icon: Icon(Icons.person),
            ),

            onChanged: (v) {
              //监听输入框值变化
              /*print("$v");*/
            },

            /* 效验用户名 */
            validator: (v) {
              return v.trim().length > 5 ? null : '请输入用户名';
            },
          ),

          /*密码*/
          TextFormField(
            autofocus: false,
            controller: pwdController,
            maxLength: 12,
            obscureText: true,
            // 密码输入类型
            decoration: InputDecoration(
                labelText: "密码", hintText: "请输入密码", icon: Icon(Icons.lock)),
            validator: (v) {
              return v.trim().length > 5 ? null : '请输入密码';
            },
          ),

          /*登陆*/
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  //"漂浮"按钮
                  child: RaisedButton(
                    padding: EdgeInsets.all(12.0),
                    color: const Color(0xffc8a675),
                    textColor: Colors.white,
                    child: Text('登录', style: TextStyle(fontSize: 17)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0) //设置圆角
                        ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return MainPage();
                      }));

                      // if ((formKey.currentState as FormState).validate()) {
                      //   print('点击了');
                      //   print(nameController.text);
                      //   print(pwdController.text);
                      // }
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
