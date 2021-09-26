part of 'widgets.dart';

class BottomNavbarItem extends StatelessWidget {
  final int selectedIndex;
  final Function(int index)? onTap;

  const BottomNavbarItem({Key? key, this.selectedIndex = 0, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23), color: Color(0xFFF6F7F8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              if (onTap != null) {
                onTap!(0);
              }
            },
            child: Column(
              children: [
                Spacer(),
                Image.asset(
                  "assets/icon_home" +
                      ((selectedIndex == 0) ? "_active.png" : ".png"),
                  width: 26,
                ),
                Spacer(),
                (selectedIndex == 0) ? _lineSelected() : Container()
              ],
            ),
          ),
          InkWell(
            onTap: () {
              if (onTap != null) {
                onTap!(1);
              }
            },
            child: Column(
              children: [
                Spacer(),
                Image.asset(
                  "assets/icon_email" +
                      ((selectedIndex == 1) ? "_active.png" : ".png"),
                  width: 26,
                ),
                Spacer(),
                (selectedIndex == 1) ? _lineSelected() : Container()
              ],
            ),
          ),
          InkWell(
            onTap: () {
              if (onTap != null) {
                onTap!(2);
              }
            },
            child: Column(
              children: [
                Spacer(),
                Image.asset(
                  "assets/icon_card" +
                      ((selectedIndex == 2) ? "_active.png" : ".png"),
                  width: 26,
                ),
                Spacer(),
                (selectedIndex == 2) ? _lineSelected() : Container()
              ],
            ),
          ),
          InkWell(
            onTap: () {
              if (onTap != null) {
                onTap!(3);
              }
            },
            child: Column(
              children: [
                Spacer(),
                Image.asset(
                  "assets/icon_love" +
                      ((selectedIndex == 3) ? "_active.png" : ".png"),
                  width: 26,
                ),
                Spacer(),
                (selectedIndex == 3) ? _lineSelected() : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _lineSelected() {
    return Container(
      width: 30,
      height: 2,
      decoration: BoxDecoration(
          color: purpleColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(1000))),
    );
  }
}
