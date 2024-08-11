import 'dart:convert';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_traning_01/config/app.dart';
import 'package:flutter_application_traning_01/models/banner_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<BannerModel> sliders = [];

  void fetchSliders() async {
    final response = await http.get(Uri.parse('$API_URL/api/banner.json'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        for (var banner in data) {
          sliders.add(BannerModel.fromJson(banner));
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSliders();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: Swiper(
            itemCount: sliders.length,
            // autoplay: true,
            itemBuilder: (context, index) {
              return Image.network(
                sliders[index].bannerTh,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ],
    );
  }
}
