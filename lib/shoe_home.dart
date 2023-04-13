import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shoe/shoe_detail.dart';

import 'shoe_model.dart';

class ShoeHome extends StatefulWidget {
  ShoeHome({super.key});

  @override
  State<ShoeHome> createState() => _ShoeHomeState();
}

class _ShoeHomeState extends State<ShoeHome> {
  List chips = [
    {
      "name": "All",
      "selected": true,
    },
    {
      "name": "Air Max",
      "selected": false,
    },
    {
      "name": "Nike",
      "selected": false,
    },
    {
      "name": "Presto",
      "selected": false,
    },
    {
      "name": "Huarache",
      "selected": false,
    },
  ];

  final valueListener = ValueNotifier<double>(0.0);
  late PageController pageController;

  listener() {
    valueListener.value = pageController.page!;
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: .8);
    pageController.addListener(listener);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.removeListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black87,
        ),
        elevation: 0,
        actions: const [
          Icon(
            Icons.search,
            size: 28,
            color: Colors.black87,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Text(
              "Shoes",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: chips.length,
              itemBuilder: (context, index) {
                final chip = chips[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChoiceChip(
                    label: Text(chip["name"],
                        style: TextStyle(
                            color:
                                chip["selected"] ? Colors.white : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w300)),
                    selected: chip["selected"],
                    backgroundColor: Colors.grey.shade100,
                    selectedColor: Colors.black87,
                    elevation: 0,
                    onSelected: (value) {},
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                );
              },
            ),
          ),
          ValueListenableBuilder<double>(
              valueListenable: valueListener,
              builder: (context, value, _) {
                return Container(
                  height: 340,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: PageView.builder(
                    itemCount: shoes.length,
                    controller: pageController,
                    itemBuilder: (context, index) {
                      final shoe = shoes[index];

                      final percent = value - index;
                      double rotate = percent.abs().clamp(0.4, 1);
                      double perpective = percent.clamp(-.4, 0);
                      double rotateX = percent.clamp(-.1, 0);

                      return Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 500),
                                reverseTransitionDuration:
                                    const Duration(milliseconds: 500),
                                pageBuilder: (ctx, anim, _) {
                                  return FadeTransition(
                                    opacity: anim,
                                    child: ShoeDetail(shoe: shoe),
                                  );
                                }));
                          },
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Transform(
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, .001)
                                  ..rotateY(perpective)
                                  ..rotateX(rotateX),
                                // alignment: FractionalOffset.center,
                                child: Center(
                                  child: Hero(
                                    tag: shoe.name!,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          .9,
                                      height: 300,
                                      margin: const EdgeInsets.only(right: 30),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: shoe.color,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  left: 20,
                                  top: 20,
                                  child: Transform(
                                    transform: Matrix4.identity()
                                      ..setEntry(3, 2, .001)
                                      ..rotateY(perpective)
                                      ..rotateX(rotateX),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          shoe.name!,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                        Text(
                                          "\$ ${shoe.price}",
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(.5),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Container(
                                            height: 140,
                                            width: 1,
                                            color:
                                                Colors.white.withOpacity(.5)),
                                      ],
                                    ),
                                  )),
                              Positioned(
                                right: 4,
                                bottom: 0,
                                child: Hero(
                                  tag: shoe.image!,
                                  child: Transform(
                                    transform: Matrix4.identity()
                                      ..setEntry(3, 2, .001)
                                      ..rotateY(perpective.clamp(-.1, 0))
                                      ..rotateX(rotateX.clamp(-.1, 0)),
                                    child: Transform.rotate(
                                      angle: -rotate,
                                      child: Image.asset(
                                        shoe.image!,
                                        height: 320,
                                        width: 320,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              "243 options",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: shoes.length,
              padding: EdgeInsets.all(4),
              itemBuilder: (context, index) {
                final shoe = shoes[index];
                return Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        shoe.image!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            shoe.name!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "\$${shoe.price}",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
