import 'package:flutter/material.dart';

import 'home/radius_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: buildScaffold(),
    );
  }

  Scaffold buildScaffold() {
    const List<String> _images = [
      "https://www.krispykreme.com/App_Themes/krispykremenew/Content/images/loyalty/reward-doughnut.png",
      "https://freshaprilflours.com/wp-content/uploads/2020/03/praline-ice-cream-6.jpg",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Ice_cream_with_whipped_cream%2C_chocolate_syrup%2C_and_a_wafer_%28cropped%29.jpg/1200px-Ice_cream_with_whipped_cream%2C_chocolate_syrup%2C_and_a_wafer_%28cropped%29.jpg",
      "https://thumbs-prod.si-cdn.com/9UntNNzAE_MdZnUfB7h0OhRwX9o=/1072x720/filters:no_upscale()/https://public-media.si-cdn.com/filer/d5/24/d5243019-e0fc-4b3c-8cdb-48e22f38bff2/istock-183380744.jpg"
    ];
    return Scaffold(
      appBar: tabBar(),
      body: Column(
        children: [
          bodyTitle(),
          horizonalCardList(_images),
          populerTitle(),
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: _images.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => verticalCard(_images, index)),
          )
        ],
      ),
    );
  }

  Padding bodyTitle() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            bodyTitleText(),
            bodyTitleSearchButton(),
          ]),
        ],
      ),
    );
  }

  SizedBox bodyTitleText() {
    return SizedBox(
        child: Text(
      "What do you want to eat today ?",
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ));
  }

  Container bodyTitleSearchButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: SizedBox(
        width: 40,
        height: 40,
        child: IconButton(
          icon: Icon(Icons.search, color: Colors.black),
          onPressed: () {},
        ),
      ),
    );
  }

  AppBar tabBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: backButton(),
      actions: menuButton(),
    );
  }

  List<Widget> menuButton() {
    return [
      IconButton(
        icon: Icon(
          Icons.short_text,
          color: Colors.black,
        ),
        onPressed: () {},
      )
    ];
  }

  Builder backButton() {
    return Builder(builder: (BuildContext context) {
      return IconButton(
        icon: Icon(Icons.keyboard_arrow_left, color: Colors.black),
        onPressed: () {},
      );
    });
  }
}

SizedBox horizonalCardList(List<String> images) {
  return SizedBox(
    height: 200,
    child: ListView.builder(
      itemCount: images.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Column(
        children: [
          horizonalCard(images, index),
          Text("Category : 12 item", textAlign: TextAlign.left)
        ],
      ),
    ),
  );
}

Card horizonalCard(List<String> images, int index) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
    child: SizedBox(
      height: 135,
      child: horizonalCardImage(images, index),
    ),
  );
}

Container horizonalCardImage(List<String> images, int index) {
  return Container(
    width: 130,
    child: Expanded(child: RadiusImage(imageUrl: images[index])),
  );
}

Container populerTitle() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            heartIcon(),
            populerTitleAndSubTitle(),
            Spacer(flex: 1),
            forwardIcon(),
          ],
        )
      ],
    ),
  );
}

SizedBox forwardIcon() {
  return SizedBox(
    width: 40,
    height: 40,
    child: IconButton(
      icon: Icon(Icons.arrow_forward, color: Colors.black),
      onPressed: () {},
    ),
  );
}

Padding populerTitleAndSubTitle() {
  return Padding(
    padding: EdgeInsets.only(left: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Populer",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "Monggo, entekno duwemkul",
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    ),
  );
}

Container heartIcon() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.red[300],
      borderRadius: BorderRadius.circular(10),
    ),
    child: SizedBox(
      width: 40,
      height: 40,
      child: IconButton(
        icon: Icon(Icons.favorite, color: Colors.white),
        onPressed: () {},
      ),
    ),
  );
}

Card verticalCard(List<String> images, int index) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
    child: SizedBox(
      height: 90,
      child: Row(
        children: [
          Expanded(flex: 1, child: verticalCardImage(images, index)),
          Expanded(flex: 3, child: veritcalCardContent()),
        ],
      ),
    ),
  );
}

Container verticalCardImage(List<String> images, int index) {
  return Container(
    width: 130,
    child: Expanded(child: RadiusImage(imageUrl: images[index])),
  );
}

Padding veritcalCardContent() => Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "İtem Title",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  "Category1",
                  style: TextStyle(backgroundColor: Colors.blue[100]),
                ),
              ),
              Text(
                "Category2",
                style: TextStyle(backgroundColor: Colors.red[100]),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sub Title",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                "Rp.2000",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ],
      ),
    );
