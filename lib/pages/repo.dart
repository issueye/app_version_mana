import 'package:fluent_ui/fluent_ui.dart';

class Repo extends StatefulWidget {
  const Repo({Key? key}) : super(key: key);

  @override
  _RepoState createState() => _RepoState();
}

class _RepoState extends State<Repo> {
  Widget _header(BuildContext ctx) {
    return Row(
      children: [
        // 颜色
        Container(
          width: 2,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 10),
        // 文字标题
        const Text("仓库管理"),
        const Spacer(),
        SizedBox(
          height: 30,
          child: FilledButton(
            child: const Text("添加仓库"),
            onPressed: () {
              showContentDialog(ctx);
            },
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  // 分割线
  Widget _Divider() {
    return const FractionallySizedBox(
      alignment: Alignment.bottomCenter,
      child: Divider(
        style: DividerThemeData(
          decoration: BoxDecoration(
            color: Color.fromARGB(162, 179, 170, 162),
          ),
        ),
      ),
    );
  }

  List _tableData = [
    {
      "id": "1",
      "name": "测试数据001",
      "path": "https://github.com/issueye/lichee.git",
      "branch": "V2.1.DEV.20230601.BETA",
      "branchList": ["local/main", "remote/mater", "V2.1.DEV.20230601.BETA"]
    },
    {
      "id": "2",
      "name": "测试数据002",
      "path": "https://github.com/issueye/lichee.git",
      "branch": "V2.1.DEV.20230601.BETA",
      "branchList": ["local/main", "remote/mater", "V2.1.DEV.20230601.BETA"]
    },
    {
      "id": "3",
      "name": "测试数据003",
      "path": "https://github.com/issueye/lichee.git",
      "branch": "V2.1.DEV.20230601.BETA",
      "branchList": ["local/main", "remote/mater", "V2.1.DEV.20230601.BETA"]
    },
    {
      "id": "4",
      "name": "测试数据004",
      "path": "https://github.com/issueye/lichee.git",
      "branch": "V2.1.DEV.20230601.BETA",
      "branchList": ["local/main", "remote/mater", "V2.1.DEV.20230601.BETA"]
    }
  ];

  Widget _checkBox(bool? isSelectd) {
    return Checkbox(
      checked: isSelectd,
      onChanged: (value) {
        setState(() {
          isSelectd = value;
          debugPrint("isSelectd = $isSelectd");
        });
      },
    );
  }

  // 表格
  Widget _table() {
    bool isSelectd = false;
    int count = 0;
    return Expanded(
      flex: 10,
      child: Container(
        padding: const EdgeInsets.only(right: 20, left: 20),
        margin: const EdgeInsets.only(bottom: 20),
        child: Container(
          child: ListView.builder(
            itemCount: _tableData.length,
            itemBuilder: (ctx, index) {
              
              return HoverButton(
                onPressed: () {
                  isSelectd = !isSelectd;
                    count++;
                    debugPrint('onPressed = $isSelectd count = $count');
                  setState(() {});
                },
                builder: (ctx, state) {
                  List<String> branchList = _tableData[index]["branchList"];
                  return Container(
                    // ignore: sort_child_properties_last
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: _checkBox(isSelectd),
                            ),
                            const SizedBox(width: 30),
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset("images/git.png"),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                                flex: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            child: Text(
                                              '${_tableData[index]["name"]}',
                                              style: const TextStyle(
                                                fontSize: 25,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(_tableData[index]["branch"]),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text('仓库地址：${_tableData[index]["path"]}'),
                                    const SizedBox(height: 10),
                                    Container(
                                      child: Row(
                                        children: branchList.map((e) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            padding: const EdgeInsets.all(3),
                                            child: Text(
                                              e,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5)),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                )),
                            const Spacer(),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: state.isHovering
                          ? const Color.fromARGB(255, 241, 239, 239)
                          : Colors.white,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  // 弹窗
  void showContentDialog(BuildContext ctx) async {
    TextEditingController? nameCtl = TextEditingController();
    TextEditingController? urlCtl = TextEditingController();

    final result = await showDialog<String>(
      context: context,
      builder: (context) {
        return ContentDialog(
          title: const Text("添加仓库"),
          content: Container(
            height: 110,
            child: Column(
              children: [
                InfoLabel(
                  label: "仓库名称",
                  child: TextBox(controller: nameCtl),
                ),
                InfoLabel(
                  label: "仓库地址",
                  child: TextBox(controller: urlCtl),
                )
              ],
            ),
          ),
          actions: [
            FilledButton(
              child: const Text('确定'),
              onPressed: () {
                debugPrint('name = ${nameCtl.text}  url = ${urlCtl.text}');
                _tableData.add({
                  "id": "",
                  "name": nameCtl.text,
                  "path": urlCtl.text,
                  "branch": "master",
                  "branchList": ["local/master"],
                });
                Navigator.pop(context, 'User deleted file');
              },
            ),
            Button(
              child: const Text('退出'),
              onPressed: () => Navigator.pop(context, 'User canceled dialog'),
            ),
          ],
        );
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          children: [
            // 头部
            _header(context),
            // 分割线
            _Divider(),
            // _queryForm(),
            const SizedBox(height: 40),
            // _tableHeader(),
            _table(),
          ],
        ),
      ),
    );
  }
}
