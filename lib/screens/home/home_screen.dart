import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// สร้าง List ของรูปภาพ โดยใช้ url ภายนอก
  final List<String> items = [
    "https://media.istockphoto.com/id/531370593/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/%E0%B9%82%E0%B8%84%E0%B8%A1%E0%B9%84%E0%B8%9F%E0%B8%88%E0%B8%B5%E0%B8%99.jpg?s=1024x1024&w=is&k=20&c=fg2Ui4eCfA6mW0qU0XABEzjJOEmc-sR7Rp3_-lcpeg0=",
    "https://media.istockphoto.com/id/967417694/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/%E0%B9%82%E0%B8%84%E0%B8%A1%E0%B9%84%E0%B8%9F%E0%B8%AA%E0%B8%B5%E0%B9%81%E0%B8%94%E0%B8%87%E0%B8%82%E0%B8%AD%E0%B8%87%E0%B8%A3%E0%B9%89%E0%B8%B2%E0%B8%99%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B9%83%E0%B8%99%E0%B8%8D%E0%B8%B5%E0%B9%88%E0%B8%9B%E0%B8%B8%E0%B9%88%E0%B8%99.jpg?s=2048x2048&w=is&k=20&c=MiXTq38He6SD6xsNoMh8xLZ-66qJvqoFccS9u_bH-3g=",
    "https://media.istockphoto.com/id/531370593/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/%E0%B9%82%E0%B8%84%E0%B8%A1%E0%B9%84%E0%B8%9F%E0%B8%88%E0%B8%B5%E0%B8%99.jpg?s=1024x1024&w=is&k=20&c=fg2Ui4eCfA6mW0qU0XABEzjJOEmc-sR7Rp3_-lcpeg0=",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Swiper(
            autoplay: true,
            loop: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              // call image from url
              return Image.network
              (items[index], fit: BoxFit.fill,);
            },
          ),
        )
      ],
    );
  }
}
