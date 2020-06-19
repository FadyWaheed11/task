import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task1/widgets/carousel.dart';
import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data;
  List img;
  String title;
  String occasionDetail;
  String date;
  String address;
  String trainerImg;
  String trainerName;
  String resName;
  int count;
  int price;

  Future _getData() async {
    http.Response response = await http
        .get('https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34#');
    data = json.decode(response.body);
    setState(() {
      img = data["img"];
      title = data["title"];
      occasionDetail = data["occasionDetail"];
      date = data["date"];
      address = data["address"];
      trainerImg = data["trainerImg"];
      trainerName = data["trainerName"];
      resName = data["reservTypes"][0]["name"];
      count = data["reservTypes"][0]["count"];
      price = data["price"];
    });
  }

  _launchURL() async {
    const url = 'https://inovola.com/en/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: data == null
            ? Center(child: CircularProgressIndicator())
            : ListView(
          children: [
            ImageCarouselSlider(img),
            Container(
              margin: const EdgeInsets.only(top: 15.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '${title.trim()}#',
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    occasionDetail.toString(),
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    trailing: Icon(Icons.access_time),
                    title: Text(
                      date.toString(),
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    trailing: Icon(Icons.room),
                    title: Text(
                      address.toString(),
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    trailing: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'http://skillzycp.com/upload/trainer/389_BaseImage_636896408382239890.jpg'),
                    ),
                    title: Text(
                      '${trainerName.trim()}',
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Text(
                    'هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحة لقد تم توليد هذا النص من مولد النص العربي',
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'عن الدورة',
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحة لقد تم توليد هذا النص من مولد النض العربي, حيث يمكنك ان تولد مثل هذا النص او العديد من النصوص الأخري اضافة الي زيادة عدد النصوص التي يوفرها التطبيق.',
                    style: Theme.of(context).textTheme.bodyText1,
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Container(
              margin: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'تكلفة الدورة',
                    style: Theme.of(context).textTheme.headline2,
                    textDirection: TextDirection.rtl,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    trailing: Text(
                      'الاسم',
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    leading: Text(
                      resName.toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    trailing: Text(
                      'العدد',
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    leading: Text(
                      count.toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    trailing: Text(
                      'السعر',
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    leading: Text(
                      price.toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 55.0,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: InkWell(
                child: Center(
                  child: Text(
                    'قم بالحجز الآن',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                    ),
                  ),
                ),
                onTap: () =>_launchURL(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
