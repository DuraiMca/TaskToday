import 'package:flutter/material.dart';

import '../Model/usermodel.dart';

class ExploreListItemView extends StatefulWidget {
  int index;

  List<Tasks> itemList;

  ExploreListItemView(this.itemList, this.index, {super.key});

  @override
  ExploreItemView createState() => ExploreItemView(itemList, index);
}

class ExploreItemView extends State<ExploreListItemView> {
  List<Tasks> itemList = <Tasks>[];
  int index;
  ExploreItemView(this.itemList, this.index);
  bool isFavt = false;
  String url = 'assets/favt.png';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavt = isFavt ? false : true;

          url = isFavt ? 'assets/red_favt.png' : 'assets/favt.png';

          print('IsFavt : $isFavt :  $url');
        });
      },
      child: Card(
        color: Colors.white,
        borderOnForeground: true,
        elevation: 10,
        child: Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
          // padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
                //  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: ExactAssetImage('assets/biryani.jpg'),
                        fit: BoxFit.cover),
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    //shade
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        // height: MediaQuery.of(context).size.height * 0.3,
                        //width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              stops: [0.3, 0.9],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Color.fromARGB(255, 11, 0, 8)
                              ]),
                        ),
                      ),
                    ),

                    //offer
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        color: Colors.transparent,
                        margin: const EdgeInsets.only(
                            top: 15, bottom: 10, left: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '60% OFF',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.0,
                                  color: Colors.white),
                            ),
                            Text(
                              'UPTO ₹100',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 8.0,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //ad
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(5.0),
                        color: Colors.transparent,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            SizedBox(
                              height: 15,
                              child: VerticalDivider(
                                color: Colors.white,
                                thickness: 2,
                                indent: 1,
                                endIndent: 1,
                                width: 10,
                              ),
                            ),
                            Text(
                              'AD',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.0,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //favt
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          url,
                          width: (isFavt ? 20.0 : 15.0),
                          height: (isFavt ? 20.0 : 15.0),
                        ),
                        /* Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ), */
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalDivider(
                color: Colors.white,
                thickness: 1,
                indent: 1,
                endIndent: 1,
                width: 10,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Big Bowl Company',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.0,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'North Indian Chinese, Tibeta...',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0,
                            color: Colors.black45),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Vadapalani . 8.5 km',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0,
                            color: Colors.black45),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
