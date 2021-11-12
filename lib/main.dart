import 'package:flutter/material.dart';

void main() {
  runApp(visitMeApp);
}

final visitMeApp = MaterialApp(
  home: searchScreen,
);

final searchScreen = Scaffold(
  appBar: appBar,
  body: appBody,
);

AppBar get appBar => AppBar(
  backgroundColor: Colors.teal,
  title: TextFormField(
    decoration: const InputDecoration(
      hintText: "Search Places",
      hintStyle: TextStyle(
        color: Colors.white
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white
        )
      )
    ),
  ),
);

Widget get appBody => Container(
  child: Column(
    children: [
      recentSearchWidget,
      trendingWidget,
      advanceSearchWidget
    ],
  ),
);

List<String> recentSearchText = [
  "royal palace",
  "angkor wat",
  "sea",
  "temple",
  "pagoda",
  "pub street"
];

Widget get recentSearchWidget => Expanded(
  flex: 1,
  child:   Container(
    margin: const EdgeInsets.only(left: 15,top: 15),
    child: Column(
      children: [
        Row(
          children: const [
            Text("Recent Searchs",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff696969)
              ),
            ),
            SizedBox(width: 10,),
            Icon(Icons.access_time_outlined,
              color: Color(0xff696969),
            )
          ],
        ),
        const SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          child: Wrap(
            children: List.generate(
              recentSearchText.length,
                  (index) => Container(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                    margin: EdgeInsets.only(right: 5,top: 5),
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(recentSearchText[index],
                      style: const TextStyle(
                        fontSize: 15
                      ),
                    ),
                  ),
            ),
          ),
        ),
      ],
    ),
  ),
);

List<Map> placeData = [
  {
    "name" : "National Museum",
    "status" : "Just Now",
    "image" : "img_national_museum.jpg"
  },
  {
    "name" : "Central Market",
    "status" : "21m ago",
    "image" : "img_central_market.jpg"
  },
  {
    "name" : "Royal Palace",
    "status" : "3h ago",
    "image" : "img_royal_palace.jpg"
  },
  {
    "name" : "Royal Palace",
    "status" : "2s ago",
    "image" : "img_royal_palace_2.jpg"
  },
];

Widget get trendingWidget => Expanded(
  flex: 1,
  child:   Container(
    margin: const EdgeInsets.only(left: 15,top: 15),
    child: Column(
      children: [
        Row(
          children: const [
            Text("Trendings",
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff696969)
              ),
            ),
            SizedBox(width: 10,),
            Icon(Icons.trending_up_rounded,
              color: Color(0xff696969),
            )
          ],
        ),
        const SizedBox(height: 10,),
        Expanded(
          child: ListView.builder(
            itemCount: placeData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 10),
                width: 150,
                child: Column(
                  children: [
                    ClipRRect(
                      child: Image.asset("assets/images/${placeData[index]["image"]}",
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                    ),
                    Text(placeData[index]["name"],
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15
                      ),
                    ),
                    Text(placeData[index]["status"]),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  ),
);

Widget get advanceSearchWidget => Expanded(
  flex: 2,
  child: Container(
    margin: const EdgeInsets.only(left: 15,top: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text("Advance Search",
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff696969)
              ),
            ),
            SizedBox(width: 10,),
            Icon(Icons.search,
              color: Color(0xff696969),
            )
          ],
        ),
        const SizedBox(height: 15,),
        const Text("Can't find your desired place?",
          style: TextStyle(
              fontSize: 20,
              color: Color(0xff696969)
          ),
        ),
        const SizedBox(height: 15,),
        const Text("Try Advance Search",
          style: TextStyle(
              fontSize: 20,
              color: Colors.teal
          ),
        ),
      ],
    ),
  ),
);