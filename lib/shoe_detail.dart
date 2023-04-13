import 'package:flutter/material.dart';
import 'package:shoe/shoe_model.dart';

class ShoeDetail extends StatelessWidget {
  ShoeModel shoe;
  ShoeDetail({required this.shoe});

  Widget shoeSize(String name, bool selected) {
    return ChoiceChip(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      label: Text(name,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300)),
      selected: selected,
      backgroundColor: Colors.grey.shade100,
      selectedColor: Colors.grey.shade100,
      elevation: 0,
      onSelected: (value) {},
      side: BorderSide(color: selected ? Colors.black : Colors.grey.shade300),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 290,
              child: Stack(
                children: [
                  Positioned(
                      top: -size.width * .55,
                      right: -100,
                      child: Hero(
                        tag: shoe.name!,
                        child: Transform.rotate(
                          angle: .2,
                          child: Container(
                            width: MediaQuery.of(context).size.width + 200,
                            height: MediaQuery.of(context).size.height * .6,
                            decoration: BoxDecoration(
                              color: shoe.color,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(800),
                                bottomRight: Radius.circular(500),
                              ),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.favorite_outline,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    // top: 0,
                    bottom: -30,
                    left: 30,
                    right: 30,
                    child: Hero(
                      tag: shoe.image!,
                      child: Image.asset(
                        shoe.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    shoe.name!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "\$${shoe.price}",
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Meet the adventure-ready AF1. Weatherized leather and durable design add a tactile, utility feel to your creation—but it's not just for looks.",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "asset/three.jpeg",
                          height: 60,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          "asset/three.jpeg",
                          height: 60,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          "asset/three.jpeg",
                          height: 60,
                        ),
                      ),
                    ),
                  ],
                )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Select Size",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 10,
                children: [
                  shoeSize("UK 6", true),
                  shoeSize("UK 7", false),
                  shoeSize("UK 8", false),
                  shoeSize("UK 9", false),
                  shoeSize("UK 10", false),
                  shoeSize("UK 11", false),
                  shoeSize("UK 12", false),
                  shoeSize("UK 13", false),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(16),
                    elevation: 0,
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14))),
                child: Text(
                  "Add to bag",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
