import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class art extends StatefulWidget {
  const art({Key? key}) : super(key: key);

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
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
          GridView.builder(
            physics: const ScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2),
            itemBuilder: (context, index) =>
                SizedBox(
                  height: 206,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              'https://picsum.photos/id/$index/165/135',
                              width: 165,
                              height: 135,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              width: 32,
                              height: 32,
                              child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.more_horiz,
                                    size: 25,
                                  )),
                            ),
                          )
                        ]),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      Text(
                          'Suede Chukka Boots',
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleMedium),

                      Text(
                          'River Island',
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleMedium),
                      Text(
                          '79.00',
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleMedium),
                    ],
                  ),
                ),
          ),

        ],
      ),

    );
  }
}

