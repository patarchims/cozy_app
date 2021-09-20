part of 'widgets.dart';

class SpaceCard extends StatelessWidget {
  final SpaceModel spaceModel;

  const SpaceCard({Key? key, required this.spaceModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      spaceModel: spaceModel,
                    )));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              height: 110,
              width: 130,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: spaceModel.imageUrl ?? '',
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                        child: Container(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator())),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  // Image.network(
                  //   spaceModel.imageUrl ?? '',
                  //   width: 130,
                  //   height: 110,
                  //   fit: BoxFit.cover,
                  // ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(36))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon_star.png',
                            width: 22,
                            height: 22,
                          ),
                          Text(
                            "${spaceModel.rating}/5",
                            style: whiteTextStyle.copyWith(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(spaceModel.name ?? 'No Name',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                  )),
              SizedBox(height: 2),
              Text.rich(TextSpan(
                  text: '\$${spaceModel.price}',
                  style: purpleTextStyle.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                        text: '/ month',
                        style: greyTextStyle.copyWith(fontSize: 16))
                  ])),
              SizedBox(height: 16),
              Text("${spaceModel.city}, ${spaceModel.country}",
                  style: greyTextStyle)
            ],
          )
        ],
      ),
    );
  }
}
