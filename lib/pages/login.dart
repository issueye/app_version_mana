import 'package:app_version_mana/pages/home.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // 阴影的颜色
            offset: const Offset(-0.2, 0.2), //阴影x轴偏移量
            blurRadius: 27.0, // 高斯的标准偏差与盒子的形状卷积。
            spreadRadius: 5.0, // 在应用模糊之前，框应该膨胀的量。
          )
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 450,
            height: 400,
            child: GestureDetector(
              onTapDown: (tapDown) async {
                await windowManager.startDragging();
              },
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/app_version.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTapDown: (tapDown) async {
                            await windowManager.startDragging();
                          },
                          child: const Text(
                            "",
                            style: TextStyle(
                              height: 2,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: IconButton(
                          icon: const Icon(FluentIcons.chrome_close),
                          onPressed: () async {
                            debugPrint('close');
                            await windowManager.close();
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "程序版本管理系统",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: const [
                      Spacer(flex: 2),
                      Expanded(
                        flex: 10,
                        child: TextBox(
                          prefix: Icon(FluentIcons.people),
                        ),
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Spacer(flex: 2),
                      Expanded(
                        flex: 10,
                        child: TextBox(
                          prefix: Icon(FluentIcons.password_field),
                        ),
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    child: const SizedBox(
                      width: 200,
                      height: 35,
                      child: Center(
                        child: Text(
                          '立即登录',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      debugPrint('登录');

                      await windowManager.setSize(
                        const Size(1000, 800),
                        animate: false,
                      );
                      await windowManager.center();

                      // 跳转到 home 界面
                      Navigator.push(
                        context,
                        FluentPageRoute(
                          builder: (_) {
                            return const Home();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
