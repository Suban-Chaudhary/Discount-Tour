import 'package:cached_network_image/cached_network_image.dart';
import 'package:discounttour/data/data.dart';
import 'package:discounttour/model/country_model.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String imgUrl;
  final String placeName;
  final double rating;
  Details({@required this.imgUrl, @required this.placeName, @required this.rating});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<CountryModel> country = List();

  @override
  void initState() {
    country = getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.network(
                    widget.imgUrl,
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 350,
                    color: Colors.black12,
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 27,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(width: 16),
                              Image.asset(
                                "assets/heart.png",
                                height: 24,
                                width: 24,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.only(left: 24, right: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.placeName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 12),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white70,
                                    size: 25,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "Koh Chang Tai, Thailand",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              RatingBar(widget.rating),
                              SizedBox(height: 16),
                            ],
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, 4),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FeaturesTile(
                    icon: Icon(Icons.wifi, color: Color(0xff5A6C64)),
                    label: "Free Wi-Fi",
                  ),
                  FeaturesTile(
                    icon: Icon(Icons.beach_access, color: Color(0xff5A6C64)),
                    label: "Sand Beach",
                  ),
                  FeaturesTile(
                    icon: Icon(Icons.card_travel, color: Color(0xff5A6C64)),
                    label: "First Coastline",
                  ),
                  FeaturesTile(
                    icon: Icon(Icons.local_drink, color: Color(0xff5A6C64)),
                    label: "Bar and Restaurant",
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DetailsCard(
                        title: "Booking",
                        numOfReveiws: "30",
                        rating: 8.5,
                        url: "assets/card1.png"),
                    DetailsCard(
                        title: "Booking",
                        numOfReveiws: "40",
                        rating: 8.5,
                        url: "assets/card2.png"),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: TextStyle(
                    height: 1.3,
                    letterSpacing: 0.8,
                    color: Color(0xff879D95),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 220,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: country.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ImageListTile(imgUrl: country[index].imgUrl);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  final String title;
  final String numOfReveiws;
  final double rating;
  final String url;
  DetailsCard({this.title, this.numOfReveiws, this.rating, this.url});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xffE9F4F9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xffD5E6F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(url, height: 30),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xff5A6C64),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "$rating/10",
                    style: TextStyle(
                      color: Color(0xff5A6C64),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "  Based on $numOfReveiws reviews",
            style: TextStyle(
              color: Color(0xff879D95),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturesTile extends StatelessWidget {
  final Icon icon;
  final String label;
  FeaturesTile({this.icon, this.label});
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff5A6C64)),
                    borderRadius: BorderRadius.circular(40)),
                child: icon),
            SizedBox(height: 8),
            Container(
              width: 70,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5A6C64),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final double rating;
  RatingBar(this.rating);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.star, color: rating >= 1 ? Colors.white : Colors.white70),
          SizedBox(width: 3),
          Icon(Icons.star, color: rating >= 2 ? Colors.white : Colors.white70),
          SizedBox(width: 3),
          Icon(Icons.star, color: rating >= 3 ? Colors.white : Colors.white70),
          SizedBox(width: 3),
          Icon(Icons.star, color: rating >= 4 ? Colors.white : Colors.white70),
          SizedBox(width: 3),
          Icon(Icons.star, color: rating >= 5 ? Colors.white : Colors.white70),
          SizedBox(width: 6),
          Text(
            "$rating",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17),
          ),
        ],
      ),
    );
  }
}

class ImageListTile extends StatelessWidget {
  final String imgUrl;

  ImageListTile({
    @required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          height: 240,
          width: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
