part of 'pages.dart';

class HomePages extends StatefulWidget {
  final int initialPage;

  const HomePages({Key? key, this.initialPage = 0}) : super(key: key);

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  int selectedPage = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    selectedPage = widget.initialPage;
    pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          bottom: false,
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                selectedPage = index;
              });
            },
            children: [
              DashboardPage(),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.green,
              ),
            ],
          ),
        ),

        // NOTE: FLOATING ACTIOAN BOTTOM
        floatingActionButton: BottomNavbarItem(
          selectedIndex: selectedPage,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
            pageController.jumpToPage(selectedPage);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
