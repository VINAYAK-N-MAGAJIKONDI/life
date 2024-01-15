import 'package:flutter/cupertino.dart';
import 'eco.dart';
import 'package:flutter/material.dart';
class art extends StatelessWidget {
  var height,width;
   art({Key? key}) : super(key: key);

   List imgData = [
    "https://www.amazinginteriordesign.com/wp-content/uploads/2015/04/fi54.jpg",
    "https://i1.wp.com/archpot.com/wp-content/uploads/2018/10/large-planters-pots-large-terracotta-pots-planter-garden-planter-pots.jpg?ssl=1",
    "https://images.unsplash.com/photo-1527385352018-3c26dd6c3916?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGp1dGUlMjBiYWdzfGVufDB8fDB8fHww",
    "https://th.bing.com/th/id/R.5007267fa912049a2fdd229ba1834a1a?rik=HNuOjAJ8OkQBCQ&riu=http%3a%2f%2fnewkilpatrickblog.typepad.com%2ffiles%2fclothblank.jpg&ehk=BcEVoQ2uiliVnytlA53LoJZYCVB8Rkumc28CTwj%2flxo%3d&risl=&pid=ImgRaw&r=0",
    "https://i0.wp.com/1.bp.blogspot.com/-Uk6d8QyrkBM/UIT9RyUYFmI/AAAAAAAAAeA/lCa4UeQ3YxI/s1600/ideas.jpg",
   ];

  List titles = [
    "Home Decor",
    "Pottery",
    "Carry Bags",
    "Clothing",
    "DIY",
  ];

  @override
  Widget build(BuildContext context) {
    height= MediaQuery.of(context).size.height;
    width= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Arts and crafts"+'\n'
            "Plastics-fee products"),
      ),
      body: Container(
        child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    mainAxisSpacing: 25,
                  ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: imgData.length,
                itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => eco()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.shade300,
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
                            Image.network(imgData[index],
                            width: 110,
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
    );
  }
}

