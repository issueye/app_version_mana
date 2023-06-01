import 'package:app_version_mana/components/table.dart';
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

  // 查询表单
  Widget _queryForm() {
    return Row(
      children: [
        SizedBox(width: 20),
        Expanded(
          child: Container(
            width: 200,
            child: const TextBox(placeholder: '请输入检索内容'),
          ),
        ),
        const SizedBox(width: 20),
        FilledButton(
          child: const Text('查询'),
          onPressed: () {},
        ),
        const Spacer(),
      ],
    );
  }

  final List _tableData = [
    {
      "id": "0001",
      "name": "测试数据001",
      "path": "https://github.com/issueye/lichee.git",
      "branch": [
        {
          "isHead": true,
          "name": "master",
        },
        {
          "isHead": false,
          "name": "main",
        },
        {
          "isHead": false,
          "name": "V2.1.DEV.20230601.BETA",
        }
      ]
    },
    {
      "id": "0002",
      "name": "测试数据002",
      "path": "https://github.com/issueye/lichee.git",
      "branch": [
        {
          "isHead": false,
          "name": "master",
        },
        {
          "isHead": false,
          "name": "main",
        },
        {
          "isHead": true,
          "name": "V2.1.DEV.20230601.BETA",
        }
      ]
    },
    {
      "id": "0003",
      "name": "测试数据003",
      "path": "https://github.com/issueye/lichee.git",
      "branch": [
        {
          "isHead": false,
          "name": "master",
        },
        {
          "isHead": false,
          "name": "main",
        },
        {
          "isHead": true,
          "name": "V2.1.DEV.20230601.BETA",
        }
      ]
    },
    {
      "id": "0004",
      "name": "测试数据004",
      "path": "https://github.com/issueye/lichee.git",
      "branch": [
        {
          "isHead": false,
          "name": "master",
        },
        {
          "isHead": true,
          "name": "main",
        },
        {
          "isHead": false,
          "name": "V2.1.DEV.20230601.BETA",
        }
      ]
    },
    {
      "id": "0005",
      "name": "测试数据005",
      "path": "https://github.com/issueye/lichee.git",
      "branch": [
        {
          "isHead": false,
          "name": "master",
        },
        {
          "isHead": false,
          "name": "main",
        },
        {
          "isHead": true,
          "name": "V2.1.DEV.20230601.BETA",
        }
      ]
    },
    {
      "id": "0006",
      "name": "测试数据006",
      "path": "https://github.com/issueye/lichee.git",
      "branch": [
        {
          "isHead": false,
          "name": "master",
        },
        {
          "isHead": false,
          "name": "main",
        },
        {
          "isHead": true,
          "name": "V2.1.DEV.20230601.BETA",
        }
      ]
    },
  ];

  Widget _branchCombox(int flex, List<Map<String, Object>> data) {
    String? selectValue;

    for (var element in data) {
      if (element["isHead"].toString() == "true") {
        selectValue = element["name"].toString();
      }
    }

    return Expanded(
      flex: flex,
      child: ComboBox<String>(
        isExpanded: true,
        value: selectValue,
        items: data.map((e){
          return ComboBoxItem(
            child: Text(e["name"].toString()), 
            value: e["name"].toString(),
          );
        }).toList(),
        onChanged: (value) {
          setState(() => selectValue = value);
        },
      ),
    );
  }

  // 表格
  Widget _table() {
    return Expanded(
      flex: 10,
      child: Container(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffe5e5e5),
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
          child: ListView.builder(
            itemCount: _tableData.length,
            itemBuilder: (ctx, index) {
              return HoverButton(
                onPressed: () {},
                builder: (ctx, state) {
                  return Container(
                    // height: 40,
                    // ignore: sort_child_properties_last
                    child: Row(
                      children: [
                        // id
                        DataColumn(flex: 2, data: _tableData[index]["id"]),
                        // name
                        DataColumn(flex: 3, data: _tableData[index]["name"]),
                        // path
                        DataColumn(flex: 7, data: _tableData[index]["path"]),
                        // 分支
                        _branchCombox(6, _tableData[index]["branch"]),
                        // 操作列
                        const LOperationColumn(flex: 5, isCenter: true),
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: const Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Color(0xffe5e5e5),
                        ),
                      ),
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

  // 表格头部header
  Widget _tableHeader() {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(right: 20, left: 20),
      decoration: const BoxDecoration(
        color: Color(0xffe5e5e5),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: const Text("ID"),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: const Text("名称"),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: const Text("仓库路径"),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: const Text("分支"),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: 150,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: const Text("操作"),
            ),
          ),
        ],
      ),
    );
  }

  // 弹窗
  void showContentDialog(BuildContext ctx) async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) {
        return ContentDialog(
          title: const Text("添加仓库"),
          content: const Text("测试数据"),
          actions: [
            Button(
              child: const Text('Delete'),
              onPressed: () {
                Navigator.pop(context, 'User deleted file');
                // Delete file here
              },
            ),
            FilledButton(
              child: const Text('Cancel'),
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
            const SizedBox(height: 40),
            _queryForm(),
            const SizedBox(height: 40),
            _tableHeader(),
            _table(),
          ],
        ),
      ),
    );
  }
}
