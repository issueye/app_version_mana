import 'package:fluent_ui/fluent_ui.dart';

class Table extends StatefulWidget {
  const Table({Key? key}) : super(key: key);

  @override
  _TableState createState() => _TableState();
}

class _TableState extends State<Table> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// 操作列
class LOperationColumn extends StatefulWidget {
  const LOperationColumn({Key? key, required this.flex, this.isCenter = false})
      : super(key: key);

  // 是否居中
  final bool isCenter;
  // 格子
  final int flex;

  @override
  _LOperationColumnState createState() => _LOperationColumnState();
}

class _LOperationColumnState extends State<LOperationColumn> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: Container(
        child: Row(
          // 处理居中
          mainAxisAlignment: widget.isCenter
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Button(child: const Text("编辑"), onPressed: () {}),
            const SizedBox(width: 10),
            Button(child: const Text("删除"), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

// 数据列
class DataColumn extends StatefulWidget {
  const DataColumn(
      {Key? key, required this.flex, this.data, this.isCenter = false})
      : super(key: key);

  // 格子
  final int flex;
  // 显示数据
  final dynamic data;
  // 是否居中
  final bool isCenter;

  @override
  _DataColumnState createState() => _DataColumnState();
}

class _DataColumnState extends State<DataColumn> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: Container(
        alignment: widget.isCenter ? Alignment.center : Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Text(widget.data),
      ),
    );
  }
}
