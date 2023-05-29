import 'package:fluent_ui/fluent_ui.dart';

class Pagination extends StatefulWidget {
  const Pagination({Key? key}) : super(key: key);

  @override
  _PaginationState createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  List _list = []; // 存放页码的数组
  final int _total = 10; // 页码数量（总数据量/一页需要展示多少条数据）
  final int _pageIndex = 2; // 当前页码

  /*
	      假如：
	        在一行上展示七个页码item，那么要对total进行分配，并且需要根据当前的页码来决定list里面页码的规划
	   */
  void managePage() {
    _list = []; // 将页码数组制空
    if (_total <= 1) {
      // 当页码数量小于等于1时就不需要页码了，直接跳过，此时list为空数组
      return;
    }
    if (_total <= 7) {
      // 7：是我自己规定一行内展示的页码item数量，需要展示多少可以自己定义，当小于等于7时，直接进行展示这7个页码item
      for (var i = 0; i < _total; i++) {
        _list.add(i + 1);
      }
    } else if (_pageIndex <= 4) {
      // 当页码大于7后，则需要根据当前页码对有些页码进行隐藏
      _list = [1, 2, 3, 4, 5, "...", _total];
    } else if (_pageIndex > _total - 3) {
      // 以此类推
      _list = [1, 2, "...", _total - 3, _total - 2, _total - 1, _total];
    } else {
      _list = [
        1,
        "...",
        _pageIndex - 1,
        _pageIndex,
        _pageIndex + 1,
        "...",
        _total
      ];
    }
    // 页码制定好后，根据自己需求，加上前一页按钮，后一页按钮
    _list.insert(0, "上一页");
    _list.add("下一页");
  }

  List<Widget> _listView() {
    managePage();

    int index = 0;

    return _list.map(
      (e) {
        index++;
        bool choose = _pageIndex + 2 == index + 1;

        var boxDecoration = BoxDecoration(
          color: (choose) ? Colors.blue : Color.fromARGB(255, 243, 242, 242),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        );

        // 获取颜色
        // ignore: no_leading_underscores_for_local_identifiers
        Color _getColor(bool hover) {
          if (hover && !choose) {
            return Colors.blue;
          } else if (choose) {
            return Colors.white;
          } else {
            return Colors.black;
          }
        }

        return HoverButton(
          onPressed: () {},
          builder: (ctx, state) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 10),
              width: (e.toString() == "上一页" || e.toString() == "下一页") ? 60 : 30,
              // ignore: sort_child_properties_last
              child: Text(
                e.toString(),
                style: TextStyle(
                  color: _getColor(state.isHovering),
                ),
              ),
              decoration: boxDecoration,
            );
          },
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      width: double.infinity,
      height: 30,
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: _listView(),
      ),
    );
  }
}
