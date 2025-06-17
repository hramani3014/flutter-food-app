import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:mobileappproject/detailpage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Map<String, dynamic>> itemList = [
    {
      'itemname': 'Masala Dhosa',
      'image': 'assets/images/masaladhosa2.jpeg',
      'price': 250.00,
      'souse': {
        'chese': 50.00,
        'non chese': 20.00,
      },
      'toping': {
        'chese': 50.00,
        'non chese': 20.00,
      },
    },
    {
      'itemname': 'Pavbhaji',
      'image': 'assets/images/pavbhaji.jpeg',
      'price': 50.00,
      'souse': {
        'chese': 50.00,
        'non chese': 20.00,
      },
      'toping': {
        'chese': 50.00,
        'non chese': 20.00,
      },
    },
    {
      'itemname': 'Dabeli',
      'image': 'assets/images/dabeli.jpeg',
      'price': 50.00,
      'souse': {
        'chese': 50.00,
        'non chese': 20.00,
      },
      'toping': {
        'chese': 50.00,
        'non chese': 20.00,
      },
    },
    {
      'itemname': 'Vadapav',
      'image': 'assets/images/vadapav.jpeg',
      'price': 50.00,
      'souse': {
        'chese': 50.00,
        'non chese': 20.00,
      },
      'toping': {
        'chese': 50.00,
        'non chese': 20.00,
      },
    },
    {
      'itemname': 'Pizza',
      'image': 'assets/images/pizza.jpeg',
      'price': 300.00,
      'souse': {
        'chese': 50.00,
        'non chese': 20.00,
      },
      'toping': {
        'chese': 50.00,
        'non chese': 20.00,
      },
    },
    {
      'itemname': 'Burger',
      'image': 'assets/images/burger.jpeg',
      'price': 300.00,
      'souse': {
        'chese': 50.00,
        'non chese': 20.00,
      },
      'toping': {
        'chese': 50.00,
        'non chese': 20.00,
      },
    },
    {
      'itemname': 'Menduvada',
      'image': 'assets/images/menduvada.jpeg',
      'price': 300.00,
      'souse': {
        'chese': 50.00,
        'non chese': 20.00,
      },
      'toping': {
        'chese': 50.00,
        'non chese': 20.00,
      },
    },
    {
      'itemname': 'Hotdog',
      'image': 'assets/images/burger.jpeg',
      'price': 300.00,
      'souse': {
        'chese': 50.00,
        'non chese': 20.00,
      },
      'toping': {
        'chese': 50.00,
        'non chese': 20.00,
      },
    },
    {
      'itemname': 'Thepala',
      'image': 'assets/images/thepala.jpeg',
      'price': 300.00,
      'souse': {
        'chese': 50.00,
        'non chese': 20.00,
      },
      'toping': {
        'chese': 50.00,
        'non chese': 20.00,
      },
    },
    {
      'itemname': 'Dhokla',
      'image': 'assets/images/dhokla.jpeg',
      'price': 300.00,
      'souse': {
        'chese': 50.00,
        'non chese': 20.00,
      },
      'toping': {
        'chese': 50.00,
        'non chese': 20.00,
      },
    }
  ];
  List<Map<String, dynamic>> filteredList = [];
  bool isSearching = false;
  bool isarrow = false;
  bool isnotification = false;
  // TextEditingController searchController = TextEditingController();
  // FocusNode searchFocusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredList = itemList;
    // searchFocusNode.addListener(() {
    //   if (!searchFocusNode.hasFocus) {
    //     setState(() {
    //       isSearching = false;
    //     });
    //   }
    // });
  }
  // @override
  // void dispose() {
  //   searchController.dispose();
  //   searchFocusNode.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            'Home',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 15),
            child: IconButton(
              icon: Icon(
                isnotification ? CupertinoIcons.bell_fill : CupertinoIcons.bell,
              ),
              onPressed: () {
                setState(() {
                  isnotification = !isnotification; // Toggle the like status
                });
              },
            ),
            // Icon(CupertinoIcons.bell),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SearchBar panel
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text('Home',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            //         IconButton(
            //
            //           icon: Icon(
            //             isnotification ? CupertinoIcons.bell_fill : CupertinoIcons.bell,
            //           ),
            //           onPressed: () {
            //             setState(() {
            //               isnotification = !isnotification;
            //             });
            //           },
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      isSearching = value.isNotEmpty;
                      List<Map<String, dynamic>> templist = [];
                      itemList.forEach((element) {
                        if (element['itemname']
                            .toString()
                            .toLowerCase()
                            .contains(value.toLowerCase())) {
                          templist.add(element);
                        }
                      });
                      filteredList = templist;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      isSearching ? CupertinoIcons.arrow_left : CupertinoIcons.search,
                      color: isSearching ? Colors.green : Colors.grey,
                    ),
                    hintText: 'Search on Kupa',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
              ),
            ),


            // Padding(
            //   padding: const EdgeInsets.all(15),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.grey[200],
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: TextField(
            //       controller: searchController,
            //       focusNode: searchFocusNode,
            //       onChanged: (value) {
            //         List<Map<String, dynamic>> templist = [];
            //         itemList.forEach((element) {
            //           if (element['itemname']
            //               .toString()
            //               .toLowerCase()
            //               .contains(value.toLowerCase())) {
            //             templist.add(element);
            //           }
            //         });
            //         setState(() {
            //           filteredList = templist;
            //           isSearching = value.isNotEmpty;
            //         });
            //       },
            //       onTap: () {
            //         setState(() {
            //           isSearching = true;
            //         });
            //       },
            //       decoration: InputDecoration(
            //         prefixIcon: Icon(
            //           isSearching ? CupertinoIcons.arrow_left : CupertinoIcons.search,
            //           color: isSearching ? Colors.green[700] : Colors.grey,
            //         ),
            //         hintText: isSearching ? '' : 'Search on Kupa',
            //         hintStyle: TextStyle(color: Colors.grey),
            //         border: InputBorder.none,
            //         contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            //       ),
            //     ),
            //   ),
            // ),

            // Delivery Location panel
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.shade100,
                      spreadRadius: -10,
                      offset: Offset(0, 12),
                      blurStyle: BlurStyle.solid,
                    )
                  ],
                ),
                child: Card(
                  color: Colors.green[700],
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery to Home',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                isarrow ? CupertinoIcons.left_chevron : CupertinoIcons.right_chevron,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  isarrow = !isarrow; // Toggle the like status
                                });
                              },
                            ),
                            // Icon(
                            //   CupertinoIcons.right_chevron,
                            //   color: Colors.white,
                            // ),
                          ],
                        ),
                        SizedBox(height: 3),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ultama Street No. 15, Rumbai',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 7),
                                child: Text(
                                  '2.5 KM',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.green[700],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Order cart
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: Text(
                            'Burger',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                              MediaQuery.of(context).size.width * 0.05,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 22, bottom: 15),
                          child: Text(
                            'Discount 25%',
                            style: TextStyle(
                              fontSize:
                              MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.green[700]),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: () {
                              _showConfirmationDialog();
                            },
                            child: Text(
                              'Order Now',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('assets/images/food2.jpg'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Top of Week
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 15, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Top of Week',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),

            // Menu (Horizontal ListView)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.34,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    return customCard(filteredList[index]);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 5, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seafood',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    return customListCard(filteredList[index]);
                  },
                ),
              ),
            ),
            // GridView
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 15),
            //   child: Container(
            //     //height: MediaQuery.of(context).size.height*1.14,
            //     child: DynamicHeightGridView(
            //       physics: NeverScrollableScrollPhysics(),
            //       itemCount: filteredList.length,
            //       shrinkWrap: true,
            //       crossAxisCount: 2,
            //       crossAxisSpacing: 10,
            //       mainAxisSpacing: 30,
            //       builder: (context, index) {
            //         return customGridCard(filteredList[index]);
            //       },
            //     ),
            //   ),
            // ),

          ],
        ),
      ),
    );
  }

  Widget customCard(Map<String, dynamic> itemList) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          enableDrag: true,
          context: context,
          elevation: 2,
          builder: (context) => DetailPage(
              souse: itemList['souse'],
              toping: itemList['toping'],
              image: itemList['image'],
              itemname: itemList['itemname'],
              price: itemList['price']),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 10),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.24,
              width: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(itemList['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Text(
              itemList['itemname'],
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Row(
              children: [
                Text(
                  'Rs. ',
                  style: TextStyle(
                      color: Colors.green[700], fontWeight: FontWeight.w600),
                ),
                Text(
                  itemList['price'].toString(),
                  style: TextStyle(color: Colors.green[700],fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget customListCard(Map<String, dynamic> itemList) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          enableDrag: true,
          context: context,
          elevation: 2,
          builder: (context) => DetailPage(
              souse: itemList['souse'],
              toping: itemList['toping'],
              image: itemList['image'],
              itemname: itemList['itemname'],
              price: itemList['price']),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 10),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(itemList['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Text(
              itemList['itemname'],
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Row(
              children: [
                Text(
                  'Rs. ',
                  style: TextStyle(
                      color: Colors.green[700], fontWeight: FontWeight.w600),
                ),
                Text(
                  itemList['price'].toString(),
                  style: TextStyle(color: Colors.green[700],fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  // gridview
  //  Widget customGridCard(Map<String, dynamic> itemList) {
  //    return GestureDetector(
  //      onTap: () {
  //        showModalBottomSheet(
  //          isScrollControlled: true,
  //          enableDrag: true,
  //          context: context,
  //          elevation: 2,
  //          builder: (context) => DetailPage(
  //              souse: itemList['souse'],
  //              toping: itemList['toping'],
  //              image: itemList['image'],
  //              itemname: itemList['itemname'],
  //              price: itemList['price']),
  //        );
  //      },
  //      child: Column(
  //        crossAxisAlignment: CrossAxisAlignment.start,
  //        children: [
  //          Container(
  //            height: MediaQuery.of(context).size.height * 0.2,
  //            width: MediaQuery.of(context).size.height * 0.3,
  //            decoration: BoxDecoration(
  //              borderRadius: BorderRadius.circular(10),
  //              image: DecorationImage(
  //                image: AssetImage(itemList['image']),
  //                fit: BoxFit.cover,
  //              ),
  //            ),
  //          ),
  //          Text(
  //            itemList['itemname'],
  //            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
  //          ),
  //          Row(
  //            children: [
  //              Text(
  //                'Rs. ',
  //                style:
  //                TextStyle(color: Colors.green[700], fontWeight: FontWeight.w600),
  //              ),
  //              Text(
  //                itemList['price'].toString(),
  //                style:
  //                TextStyle(color: Colors.green[700], fontWeight: FontWeight.w600),
  //              ),
  //            ],
  //          ),
  //        ],
  //      ),
  //    );
  //  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm Order',
            style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Are you sure you want to place this order?',
            style: TextStyle(color: Colors.grey),
          ),
          actions: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green[700]),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Confirm',
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}
