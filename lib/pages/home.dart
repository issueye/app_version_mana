import 'package:app_version_mana/pages/login.dart';
import 'package:app_version_mana/pages/repo.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final viewKey = GlobalKey();

  int _select = 0;

  final List<NavigationPaneItem> _items = [
    PaneItem(
      icon: const Icon(FluentIcons.home),
      title: const Text('主页'),
      body: const Text("主页"),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.folder_search),
      title: const Text('代码仓库'),
      body: const Repo(),
    ),
  ];

  final List<NavigationPaneItem> _footerItems = [
    PaneItem(
      icon: const Icon(FluentIcons.settings),
      title: const Text("设置"),
      body: const Text("设置"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      // 头部
      appBar: NavigationAppBar(
        backgroundColor: Colors.white,
        title: FractionallySizedBox(
          alignment: Alignment.bottomCenter,
          widthFactor: 0.8,
          child: GestureDetector(
            child: const Text(
              '程序版本管理系统',
              style: TextStyle(
                fontSize: 20,
                height: 2,
              ),
            ),
            onTapDown: (tapDown) async {
              await windowManager.startDragging();
            },
          ),
        ),
        // 头部按钮
        actions: Container(
          width: 150,
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // 登出
              Tooltip(
                message: "登出系统",
                style: const TooltipThemeData(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(146, 196, 191, 191),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
                child: IconButton(
                  icon: const Icon(FluentIcons.sign_out),
                  onPressed: () async {
                    bool isMax = await windowManager.isMaximized();
                    if (isMax) {
                      await windowManager.unmaximize();
                    }

                    await windowManager.setSize(
                      const Size(800, 400),
                      animate: false,
                    );

                    await windowManager.center();

                    Navigator.push(
                      context,
                      FluentPageRoute(
                        builder: (_) {
                          return const Login();
                        },
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(width: 5),
              // 最小化
              IconButton(
                icon: const Icon(FluentIcons.chrome_minimize),
                onPressed: () async => {
                  await windowManager.minimize(),
                },
              ),
              // 最大化、重置大小
              const SizedBox(width: 5),
              IconButton(
                icon: const Icon(FluentIcons.chrome_restore),
                onPressed: () async {
                  bool isMax = await windowManager.isMaximized();
                  if (isMax) {
                    await windowManager.unmaximize();
                  } else {
                    await windowManager.maximize();
                  }
                },
              ),
              const SizedBox(width: 5),
              // 关闭
              IconButton(
                icon: const Icon(FluentIcons.chrome_close),
                onPressed: () async => {
                  await windowManager.close(),
                },
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      pane: NavigationPane(
        size: const NavigationPaneSize(
          // 设置导航区域打开时的宽度
          openWidth: 200,
        ),
        selected: _select,
        onChanged: (index) => {
          setState(() => _select = index),
        },
        displayMode: PaneDisplayMode.compact,
        items: _items,
        footerItems: _footerItems,
      ),
    );
  }
}
