import 'package:flutter/material.dart';
class eco extends StatelessWidget {
   eco({super.key});

  List heading = [
    'Home Decor',
    'Pottery',
    'Carry Bags',
    'Clothing',
    'DIY',
  ];

  List descripion = [
    "Creating a plastic-free home starts with simple changes, and choosing plastic-free alternatives to the products you use\nFor example, one can replace their plastic toothbrushes with bamboo ones\n They are eco-friendly, easy to find, and very affordable\nChoose products that are packaged in paper, glass, or stainless steel rather than plastic.Consider metal or glass food containers. Use beeswax wraps instead of plastic ones\nThese plastic alternatives are easy to find, reusable, and last a long time\nIn fact, most plastic-free options are also perfect for sustainable living, as they will serve you for years and years.\nTheyre also made with recyclable or biodegradable materials, so when you need to finally dispose of them, they are not bad for the environment",
    " Planting pots based on biodegradable materials remove the necessity to transplant and hence, discard a container.\nPlanting pots made from industrial and agricultural solid waste, such as wood pulp, paper, or peat moss can be buried directly into the soil altogether with the plant and eventually the container will decompose\nSimilarly, pots based on biodegradable polymers will also biodegrade when placed in the ground.",
    " Reusable and paper bags have a huge environmental cost upfront, and plastic bags create greater negative effects after being used,\n it is hard to determine which type of bag is truly the most sustainable.\nTo have a comparable environmental footprint (which encompasses climate change as well as other environmental effects) to plastic bags, a cotton bag potentially has to be used thousands of times.\nThese carry bags don’t stay as they were made for ever. So, they don’t contribute to huge heaps of garbage that cannot be treated and managed for good. ",
    "We’ve become so accustomed to wearing synthetic materials over the years that many of us have been desensitized to its effects.\n Once you wake up and see the reality of the situation, the choice becomes clear: plastic-free clothing is the only way forward.\nBamboo fabrics are not only 100% chemical and plastic-free, but they also feel amazing on your skin and keep you operating at peak performance, no matter what athletic pursuits you choose.\nWhether you shop online or enjoy the in-person buying experience, get familiar with brands that are doing the right thing, and be a part of the sustainable revolution by saying yes to plastic-free clothing. ",
    "Share you ideas here!"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Plastic Free Life'
      ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: heading.length,
          itemBuilder: (context, i) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        heading[i],
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        descripion[i],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 5,
                  color: Colors.grey[700],
                ),
              ],
            );
          },
        ),
      ),

    );
  }
}
