import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';

class ImageViewPage extends StatefulWidget {
  const ImageViewPage({super.key});

  @override
  State<ImageViewPage> createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {
  var images = [
    "https://images.unsplash.com/photo-1674590818982-f38fd684a36e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "https://st3.depositphotos.com/1824224/14399/i/600/depositphotos_143993691-stock-photo-help-help-help.jpg",
    "https://st3.depositphotos.com/1824224/14399/i/600/depositphotos_143993691-stock-photo-help-help-help.jpg",
    "https://st3.depositphotos.com/1824224/14399/i/600/depositphotos_143993691-stock-photo-help-help-help.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "28813 of 288888",
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shortcut_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shortcut_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          ),
          PopupMenuButton(
            itemBuilder: (context) => <PopupMenuEntry<ListTile>>[],
          )
        ],
      ),
      body: Center(
        child: CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            );
          },
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.5,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
          ),
        ),
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColor,
        elevation: 4.0,
        child: ListTile(
          title: Text("TIKVAH-SPORT"),
          subtitle: Text("06.01.23 at 2:31 pm"),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          ),
        ),
      ),
    );
  }
}
