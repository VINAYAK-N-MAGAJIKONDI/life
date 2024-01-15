import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class art extends StatefulWidget {
   art({Key? key}) : super(key: key);

   List imgData = [
    "https://www.amazinginteriordesign.com/wp-content/uploads/2015/04/fi54.jpg",
    "https://i1.wp.com/archpot.com/wp-content/uploads/2018/10/large-planters-pots-large-terracotta-pots-planter-garden-planter-pots.jpg?ssl=1",
    "https://images.unsplash.com/photo-1527385352018-3c26dd6c3916?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGp1dGUlMjBiYWdzfGVufDB8fDB8fHww",
    "https://th.bing.com/th/id/R.5007267fa912049a2fdd229ba1834a1a?rik=HNuOjAJ8OkQBCQ&riu=http%3a%2f%2fnewkilpatrickblog.typepad.com%2ffiles%2fclothblank.jpg&ehk=BcEVoQ2uiliVnytlA53LoJZYCVB8Rkumc28CTwj%2flxo%3d&risl=&pid=ImgRaw&r=0",
    "https://static.vecteezy.com/system/resources/previews/012/658/341/original/dollar-currency-icon-symbol-usd-sign-on-the-gold-format-png.png",
    "https://i0.wp.com/1.bp.blogspot.com/-Uk6d8QyrkBM/UIT9RyUYFmI/AAAAAAAAAeA/lCa4UeQ3YxI/s1600/ideas.jpg",
   ];

  List titles = [
    "Home Decor",
    "Pottery",
    "Carry Bags",
    "Clothing",
    "Sell Your Products",
    "DIY",
  ];

  @override
  State<art> createState() => _artState();
}

 class _artState extends State<art> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arts and crafts"),
      ),
      body: Container(
        color: Colors.indigo,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              height: 100,
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                        top: 35,
                        left: 20,
                        right: 20,
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.sort,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  ),
                  Padding(padding: EdgeInsets.only(
                    top: 20,
                  left: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Explore",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1,
                      ),
                      ),
                      SizedBox(height: 10),
                      Text("Eco-friendly products",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white54,
                        letterSpacing: 1,
                      ),
                      )
                    ],
                  ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              height: 100,
              width: 150,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    mainAxisSpacing: 25,
                  ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black26,
                            spreadRadius: 1,
                            blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(imgData[index],
                            width: 100,
                            ),
                            Text(
                              titles[index],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                },
                  ),
            ),
          ],
        ),
      ),

    );
  }
}

