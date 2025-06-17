import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:mobileappproject/detailpage.dart';
class secondpage extends StatefulWidget {
  secondpage({super.key});

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  int selectedindex = 0;
  bool isSearching = false;
  bool isnotification = false;
  List<Map<String, dynamic>> ItemList = [
    {
      'itemname': 'masala dosa',
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
      'itemname': 'pavbhaji',
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
      'itemname': 'dabeli',
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
      'itemname': 'vadapav',
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
      'itemname': 'pizza',
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
      'itemname': 'burger',
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
      'itemname': 'menduvada',
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
      'itemname': 'hotdog',
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
      'itemname': 'thepala',
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
      'itemname': 'dhokla',
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
  List<String> name = [
    'All',
    'Featured',
    'Top of Week',
    'Soup',
    'Seafood',
    'Starters',
    'Main Course'
  ];
  List<Map<String, dynamic>> filteredList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredList = ItemList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              'Menu',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 25, right: 15),
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
        body: Padding(
          padding:
          const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Our Food',
                style: TextStyle(color: Colors.black12, fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Special For You',
                  style: TextStyle(
                      color: Colors.green[700],
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       color: Colors.black12,
              //       borderRadius: BorderRadius.circular(5)),
              //   child: TextFormField(
              //     onChanged: (value) {
              //       List<Map<String, dynamic>> templist = [];
              //
              //       ItemList.forEach(
              //         (element) {
              //           if (element['itemname'].toString().toLowerCase().contains(value.toLowerCase())) {
              //             templist.add(element);
              //           }
              //         },
              //       );
              //       setState(() {
              //         filteredList = templist;
              //       });
              //     },
              //     decoration: InputDecoration(
              //         prefixIcon: Icon(CupertinoIcons.search),
              //         hintText: 'Search For Menu',
              //         hintStyle: TextStyle(color: Colors.black26),
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(5))),
              //   ),
              // ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  onChanged: (value) {
                    List<Map<String, dynamic>> templist = [];
                    ItemList.forEach((element) {
                      if (element['itemname']
                          .toString()
                          .toLowerCase()
                          .contains(value.toLowerCase())) {
                        templist.add(element);
                      }
                    });
                    setState(() {
                      isSearching = value.isNotEmpty;
                      filteredList = templist;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      isSearching ? CupertinoIcons.arrow_left : CupertinoIcons.search,
                      color: isSearching ? Colors.green[700] : Colors.grey,
                    ),
                    hintText: 'Search For Menu',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
              ),
              Container(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: name.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedindex = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                name[index],
                                style: selectedindex == index
                                    ? TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)
                                    : TextStyle(color: Colors.grey),
                              ),
                              selectedindex == index
                                  ? Container(
                                width: 10,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.green)),
                                ),
                              )
                                  : Container()
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: DynamicHeightGridView(
                      itemCount: filteredList.length,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 30,
                      builder: (ctx, index) {
                        return getListWidget(filteredList[index]);
                      }),
                ),
              ),
            ],
          ),
        ));
  }

  Widget getListWidget(Map<String, dynamic> itemList) {
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
          Column(
            children: [
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.25,
              //   width: 200,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     image: DecorationImage(image: AssetImage(itemList['image'])),
              //   ),
              // )
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.height * 0.3,
                // child: Image.asset(itemList['image']),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(itemList['image']),
                        fit: BoxFit.cover)),
              )
            ],
          ),
          Column(
            children: [
              Text(
                itemList['itemname'],
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Rs. ',
                    style: TextStyle(
                        color: Colors.green[700], fontWeight: FontWeight.w600),
                  ),
                  Text(
                    itemList['price'].toString(),
                    style: TextStyle(
                        color: Colors.green[700], fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
