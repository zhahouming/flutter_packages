part of '../ezplayer.dart';

abstract class EzplayerBtn extends StatelessWidget {
  const EzplayerBtn({super.key});
}

class EzplayerTextBtn extends EzplayerBtn {
  final String text;
  final Color color;
  final void Function() onPressed;
  const EzplayerTextBtn({
    Key? key,
    required this.text,
    required this.onPressed,
    color,
  })  : color = color ?? Colors.white,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: color, fontSize: 12))
        .div(DivStyle(alignment: Alignment.center, height: 40, paddingLR: 8))
        .ink(onPressed, radius: 40);
  }
}

class EzplayerIconBtn extends EzplayerBtn {
  final IconData iconData;
  final Color color;
  final void Function() onPressed;

  const EzplayerIconBtn({
    Key? key,
    required this.iconData,
    required this.onPressed,
    color,
  })  : color = color ?? Colors.white,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(iconData, color: color)
        .div(DivStyle(alignment: Alignment.center, height: 40, width: 40))
        .ink(onPressed, radius: 40);
  }
}

class OverlaySelectItem {
  String title;
  String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  bool selected;
  void Function()? onPressed;
  OverlaySelectItem({
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.selected = false,
    this.onPressed,
  });
}

class OverlaySelect extends StatelessWidget {
  final List<OverlaySelectItem> list;
  final String? title;
  final double width;

  const OverlaySelect({
    Key? key,
    this.title,
    required this.list,
    this.width = 220,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.only(bottom: 10),
        physics: const BouncingScrollPhysics(),
        children: [
          if (title != null)
            Text(
              title!,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ).div(DivStyle(
              alignment: Alignment.center,
              paddingTB: 4,
              paddingLR: 10,
              marginLR: 5,
              marginTB: 2,
              radiusAll: 5,
            )),
          ...list
              .map((item) => Row(
                    children: [
                      if (item.leading != null) item.leading!,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                          if (item.subtitle != null)
                            Text(
                              item.subtitle!,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white38,
                              ),
                            ),
                        ],
                      ).expanded(),
                      if (item.trailing != null) item.trailing!,
                    ],
                  )
                      .div(DivStyle(
                        paddingTB: 8,
                        paddingLR: 10,
                        marginLR: 10,
                        marginTB: 5,
                        radiusAll: 5,
                        backgroundColor: item.selected
                            ? Colors.blue.withOpacity(0.5)
                            : Colors.white.withOpacity(0.1),
                      ))
                      .ink(item.onPressed))
              .toList(),
        ]).div(DivStyle(
      width: width,
      alignment: Alignment.center,
      backgroundColor: Colors.black87,
    ));
  }
}

class SyyTabBarView extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> children;
  final double width;
  const SyyTabBarView({
    Key? key,
    required this.tabs,
    required this.children,
    this.width = 200,
  }) : super(key: key);

  @override
  State<SyyTabBarView> createState() => _SyyTabBarViewState();
}

class _SyyTabBarViewState extends State<SyyTabBarView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: widget.tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          padding: EdgeInsets.zero,
          isScrollable: true,
          physics: const BouncingScrollPhysics(),
          indicatorColor: Colors.blue,
          unselectedLabelColor: Colors.white70,
          labelStyle: const TextStyle(fontSize: 14),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 4,
          tabs: widget.tabs.map((e) => Tab(text: e)).toList(),
          controller: tabController,
          indicator: const CustomTabIndicator(
            width: 24,
            borderSide: BorderSide(width: 4.0, color: Colors.blue),
          ),
        ).div(DivStyle(
          height: 28,
          alignment: Alignment.center,
        )),
        TabBarView(
          controller: tabController,
          physics: const BouncingScrollPhysics(),
          children: widget.children,
        ).expanded()
      ],
    ).div(DivStyle(
      width: widget.width,
      alignment: Alignment.center,
      backgroundColor: Colors.black87,
    ));
  }
}

class EzplayerPlusMinus extends StatelessWidget {
  final String title;
  final String value;
  final void Function() onMinus;
  final void Function() onPlus;
  final void Function() onReset;
  final EzPlayer ezplayer;
  const EzplayerPlusMinus({
    super.key,
    required this.title,
    required this.value,
    required this.onMinus,
    required this.onPlus,
    required this.onReset,
    required this.ezplayer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ).div(DivStyle(marginBottom: 20, marginTop: 10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(
                Icons.text_decrease,
                color: Colors.white,
                size: 18,
              ),
              onPressed: onMinus,
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ).div(DivStyle(
              width: 80,
              alignment: Alignment.center,
              height: 20,
            )),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 18,
              ),
              onPressed: onPlus,
            ),
          ],
        ).div(DivStyle(marginBottom: 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: onReset,
              child: const Text('恢复默认'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('保存修改'),
            ),
          ],
        )
      ],
    );
  }
}
