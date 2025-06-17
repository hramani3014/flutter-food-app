import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileappproject/thirdpage.dart';

class CartItem {
  final String image;
  final String itemName;
  final double price;
  final int quantity;
  final List<String> sauces;
  final List<String> toppings;

  CartItem({
    required this.image,
    required this.itemName,
    required this.price,
    required this.quantity,
    required this.sauces,
    required this.toppings,
  });
}

class Cart {
  static final List<CartItem> items = [];
}

class DetailPage extends StatefulWidget {
  final String image;
  final String itemname;
  final double price;
  final Map<String, double> souse;
  final Map<String, double> toping;

  DetailPage({
    super.key,
    required this.image,
    required this.itemname,
    required this.price,
    required this.souse,
    required this.toping,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int count = 1;
  double souseprice = 0.0;
  double topingprice = 0.0;
  List<String> Souse = [];
  List<bool> check = [];
  List<String> Toping = [];
  List<bool> topingcheck = [];
  double totalprice = 0.0;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    Souse = widget.souse.keys.toList();
    check = List.generate(Souse.length, (_) => false);

    Toping = widget.toping.keys.toList();
    topingcheck = List.generate(Toping.length, (_) => false);

    totalprice = widget.price;
    updatePrices();
  }

  void updatePrices() {
    souseprice = Souse.asMap().entries
        .where((entry) => check[entry.key])
        .map((entry) => widget.souse[entry.value]! * count)
        .fold(0.0, (a, b) => a + b);

    topingprice = Toping.asMap().entries
        .where((entry) => topingcheck[entry.key])
        .map((entry) => widget.toping[entry.value]! * count)
        .fold(0.0, (a, b) => a + b);

    setState(() {
      totalprice = widget.price * count + souseprice + topingprice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.8,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Container(
                      height: 2,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.itemname,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.09,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isLiked ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                        size: MediaQuery.of(context).size.width * 0.09,
                        color: isLiked ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Text(
                'Indian Food',
                style: TextStyle(color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 25),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Card.outlined(
                          color: Colors.white24,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (count > 1) count -= 1;
                                    updatePrices();
                                  });
                                },
                                icon: Icon(
                                  CupertinoIcons.minus_circle_fill,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                              ),
                              SizedBox(width: 7),
                              Text(
                                count.toString(),
                                style: TextStyle(fontSize: 25),
                              ),
                              SizedBox(width: 7),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    count += 1;
                                    updatePrices();
                                  });
                                },
                                icon: Icon(
                                  CupertinoIcons.add_circled_solid,
                                  color: Colors.green[700],
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Row(
                      children: [
                        Text(
                          'Rs. ',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.green[700],
                          ),
                        ),
                        Text(
                          totalprice.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.green[700],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(height: 1),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  'Souse',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: Souse.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Checkbox(
                                      checkColor: Colors.green[700],
                                      value: check[index],
                                      onChanged: (value) {
                                        setState(() {
                                          check[index] = value!;
                                          updatePrices();
                                        });
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      Souse[index].toString(),
                                      style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.height * 0.024,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0, bottom: 8, right: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      'Rs. ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: MediaQuery.of(context).size.height * 0.024,
                                      ),
                                    ),
                                    Text(
                                      widget.souse[Souse[index]].toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: MediaQuery.of(context).size.height * 0.024,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  'Add a Topping?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: Toping.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Checkbox(
                                      checkColor: Colors.green[700],
                                      value: topingcheck[index],
                                      onChanged: (value) {
                                        setState(() {
                                          topingcheck[index] = value!;
                                          updatePrices();
                                        });
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      Toping[index].toString(),
                                      style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.height * 0.024,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0, bottom: 8, right: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      'Rs. ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: MediaQuery.of(context).size.height * 0.024,
                                      ),
                                    ),
                                    Text(
                                      widget.toping[Toping[index]].toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: MediaQuery.of(context).size.height * 0.024,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green[700]),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                  onPressed: () {
                    final selectedSauces = Souse.asMap()
                        .entries
                        .where((entry) => check[entry.key])
                        .map((e) => e.value)
                        .toList();

                    final selectedToppings = Toping.asMap()
                        .entries
                        .where((entry) => topingcheck[entry.key])
                        .map((e) => e.value)
                        .toList();

                    Cart.items.add(
                      CartItem(
                        image: widget.image,
                        itemName: widget.itemname,
                        price: totalprice,
                        quantity: count,
                        sauces: selectedSauces,
                        toppings: selectedToppings,
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Item added to cart')),
                    );
                  },
                  child: Text(
                    'Add To Cart Rs. ${totalprice.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddToCartPage()),
                    );
                  },

                  child: Text(
                    'Go to Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
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
