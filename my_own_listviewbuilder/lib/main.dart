import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_own_listviewbuilder/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 1000; i++) {
      products.add(Product(id: i, name: "Product $i"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My own List View"),
      ),
      body: MyOwnListViewBuilder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                products[index].name,
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyOwnListViewBuilder extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const MyOwnListViewBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  State<MyOwnListViewBuilder> createState() => _MyOwnListViewBuilderState();
}

class _MyOwnListViewBuilderState extends State<MyOwnListViewBuilder> {
  final scrollController = ScrollController();
  List<SingleListViewItemWidget> renderList = [];
  int currentStartIndex = 0;
  int currentLastIndex = 5;
  int howManyWidgetsFillOurScreen = 0;
  Size? screenSize;
  Size? childSize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      screenSize = MediaQuery.of(context).size;
      renderComponents();
      setState(() {});
    });
  }

  void childCallback() {
    print("Calling void callback");
    renderComponents();
    setState(() {});
  }

  void renderComponents() {
    renderList = [];
    if (childSize == null) {
      if (widget.itemCount > currentLastIndex) {
        for (int i = 0; i < currentLastIndex; i++) {
          renderList.add(
            SingleListViewItemWidget(
              emiteChildSize: handleEvent,
              child: widget.itemBuilder(context, i),
            ),
          );
        }
      } else {
        for (int i = 0; i < widget.itemCount; i++) {
          renderList.add(
            SingleListViewItemWidget(
              emiteChildSize: handleEvent,
              child: widget.itemBuilder(context, i),
            ),
          );
        }
      }
    } else {
      for (int i = 0; i < howManyWidgetsFillOurScreen; i++) {
        renderList.add(
          SingleListViewItemWidget(
            emiteChildSize: handleEvent,
            child: widget.itemBuilder(context, i),
          ),
        );
      }
    }
  }

  void handleEvent(Size size) {
    print("emitedSize: $size");
    childSize = size;
    double howManyWidgetsFillsOurScreenCount =
        screenSize!.height / childSize!.height;
    print("nossa tela cabe: $howManyWidgetsFillsOurScreenCount");

    howManyWidgetsFillOurScreen = howManyWidgetsFillsOurScreenCount.toInt();

    childCallback();
  }

  void scrollControllerListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      renderNextWidget();
    }
  }

  void renderNextWidget() {
    renderList.add(
      SingleListViewItemWidget(
        emiteChildSize: handleEvent,
        child: widget.itemBuilder(context, renderList.length),
      ),
    );
    print("Adicionando widget");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(scrollControllerListener);
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: renderList,
      ),
    );
  }
}

class SingleListViewItemWidget extends StatefulWidget {
  final Widget child;
  final Function(Size size) emiteChildSize;

  const SingleListViewItemWidget({
    super.key,
    required this.child,
    required this.emiteChildSize,
  });

  @override
  State<SingleListViewItemWidget> createState() =>
      _SingleListViewItemWidgetState();
}

class _SingleListViewItemWidgetState extends State<SingleListViewItemWidget> {
  final _childKey = GlobalKey();
  Size? _childSize;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contrainsts) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            final RenderBox? renderBox =
                _childKey.currentContext?.findRenderObject() as RenderBox?;
            if (renderBox != null) {
              final size = renderBox.size;
              if (_childSize != size) {
                setState(() {
                  _childSize = size;
                });
                widget.emiteChildSize(size);
                print('height ${size.height}');
              }
            }
          },
        );
        return Container(
          key: _childKey,
          child: widget.child,
        );
      },
    );
  }
}
