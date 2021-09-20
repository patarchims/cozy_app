part of 'widgets.dart';

class FacilityItem extends StatelessWidget {
  final String? name;
  final String? imageUrl;
  final int? total;

  const FacilityItem({Key? key, this.name, this.imageUrl, this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(imageUrl.toString(), width: 32),
        SizedBox(
          height: 8,
        ),
        Text.rich(TextSpan(
            text: total.toString(),
            style: purpleTextStyle.copyWith(fontSize: 16),
            children: [
              TextSpan(
                  text: ' ${name.toString()}',
                  style: greyTextStyle.copyWith(fontSize: 16))
            ])),
      ],
    );
  }
}
