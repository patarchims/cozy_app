part of 'widgets.dart';

class ButtonWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final String? title;
  final Function() onTap;
  final Color? color;

  const ButtonWidget(
      {Key? key,
      this.height,
      this.width,
      this.title = '',
      required this.onTap,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: Text(title.toString()),
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17))),
      ),
    );
  }
}
