// ignore: file_names
import 'package:firebase_project/models/datamodels/restarunt_model.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// ignore: camel_case_types
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: const Color(0xFFf7f7f7),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Icon(
                        Icons.menu,
                      ),
                      height: size.height / 20,
                      width: size.height / 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 2.0,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        "assets/images/youth.png",
                        scale: size.height / 50,
                      ),
                      height: size.height / 20,
                      width: size.height / 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xfff7c748),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 2.0,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height / 100),
                const DropDownItem(),
                SizedBox(height: size.height / 200),
                Text(
                  "Food Delivery",
                  style: textTheme.headline5!.apply(
                      color: Colors.black,
                      fontWeightDelta: 3,
                      letterSpacingDelta: 0.0,
                      letterSpacingFactor: 1.0),
                ),
                SizedBox(height: size.height / 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                size: size.height / 30,
                                color: const Color(0xfffe7156),
                              ),
                              hintText: "Find for food or restaurant..",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                              ),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 16.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: size.height / 15,
                        width: size.height / 15,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(-1, 1),
                              blurRadius: 2.0,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.tune,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height / 70),
                DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      const TabBar(
                        tabs: [
                          Tab(
                            text: "Breakfast",
                          ),
                          Tab(
                            text: "Lunch",
                          ),
                          Tab(
                            text: "Dinner",
                          ),
                        ],
                        indicatorColor: Color(0xfffe7156),
                      ),
                      SizedBox(
                        height: size.height / 2,
                        child: TabBarView(
                          children: [
                            Container(
                              color: Colors.red,
                              child: const Center(
                                child: Text("Comming Soon"),
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Best Restaurants",
                                      style: TextStyle(
                                          fontSize:
                                              textTheme.headline6!.fontSize,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(
                                          () {},
                                        );
                                      },
                                      child: const Text(
                                        "View all",
                                        style: TextStyle(
                                          color: Color(0xfffe7156),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height / 70),
                                SizedBox(
                                  height: size.height / 2.5,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: restaurantModels.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return RestaurantCard(
                                          size: size,
                                          restaurantModel:
                                              restaurantModels[index],
                                        );
                                      }),
                                ),
                              ],
                            ),
                            Container(
                              color: Colors.blue,
                              child: const Center(
                                child: Text(
                                  "Comming Soon",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final RestaurantModel restaurantModel;

  const RestaurantCard({
    Key? key,
    required this.size,
    required this.restaurantModel,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        height: size.height / 2.5,
        width: size.height / 3.75,
        decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(restaurantModel.image),
              ),
            ),
            Container(
              height: size.height / 2.5,
              width: size.height / 3.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black,
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white.withOpacity(.3),
                        ),
                        height: size.height / 20,
                        width: size.height / 8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              restaurantModel.rating.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              width: size.width / 70,
                            ),
                            const Icon(
                              Icons.star,
                              size: 18,
                              color: Color(0xffe3c579),
                            ),
                            const Text(
                              "(50+)",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: size.width / 24,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.favorite,
                          color: const Color(0xfffe7156),
                          size: size.width / 20,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
                        height: size.height / 30,
                        width: size.height / 12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white.withOpacity(.4),
                        ),
                        child: const Center(
                          child: Text(
                            "AMERICAN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 10),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width / 50,
                      ),
                      Container(
                        height: size.height / 30,
                        width: size.height / 12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white.withOpacity(.4),
                        ),
                        child: const Center(
                          child: Text(
                            "FAST FOOD",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 80,
                  ),
                  Text(
                    restaurantModel.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: Theme.of(context).textTheme.headline5!.fontSize,
                      letterSpacing: 1.0,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 80,
                  ),
                  Text(
                    "Friends were here",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: Theme.of(context).textTheme.caption!.fontSize,
                      letterSpacing: 1.0,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 80,
                  ),
                  Row(children: [
                    friendsImage(size.height),
                    friendsImage(size.height),
                    friendsImage(size.height),
                  ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

friendsImage(h) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: Container(
      child: Image.asset(
        "assets/images/friend.png",
        scale: h / 35,
      ),
      height: h / 25,
      width: h / 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color(0xfff7c748),
      ),
    ),
  );
}

class DropDownItem extends StatefulWidget {
  const DropDownItem({Key? key}) : super(key: key);

  @override
  _DropDownItemState createState() => _DropDownItemState();
}

class _DropDownItemState extends State<DropDownItem> {
  String dropdownValue = "Where to Deliver?";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Deliver to'),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down, color: Color(0xfffe7156)),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Color(0xfffe7156)),
            underline: Container(
              height: 0,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>[
              'Where to Deliver?',
              'Elon Musk',
              'Bill Gates',
              'Mark Zuckerberg'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
