// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class fourthpage extends StatelessWidget {
//   const fourthpage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Padding(
//           padding: const EdgeInsets.only(top: 10),
//           child: Text(
//             'My Profile',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//           ),
//         ),
//       ),
//       // coment
//       // body: Form(
//       //     child: Column(
//       //   children: [
//       //     Padding(
//       //       padding: const EdgeInsets.all(10.0),
//       //       child: Container(
//       //         decoration: BoxDecoration(
//       //             borderRadius: BorderRadius.circular(10),
//       //             boxShadow: [
//       //               BoxShadow(
//       //                   color: Colors.green.shade100,
//       //                   // blurRadius: 30,
//       //                   spreadRadius: -10,
//       //                   offset: Offset(0, 12),
//       //                   blurStyle: BlurStyle.solid)
//       //             ]),
//       //         child: Card.filled(
//       //           color: Colors.green,
//       //           child: Padding(
//       //             padding: const EdgeInsets.only(
//       //                 left: 15, right: 15, top: 10, bottom: 10),
//       //             child: Column(
//       //               mainAxisSize: MainAxisSize.min,
//       //               children: [
//       //                 Row(
//       //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //                   children: [
//       //                     Text(
//       //                       'Delivery to Home',
//       //                       style: TextStyle(
//       //                           fontWeight: FontWeight.bold,
//       //                           fontSize: 18,
//       //                           color: Colors.white),
//       //                     ),
//       //                     Icon(
//       //                       CupertinoIcons.right_chevron,
//       //                       color: Colors.white,
//       //                     )
//       //                   ],
//       //                 ),
//       //                 SizedBox(
//       //                   height: 3,
//       //                 ),
//       //                 Row(
//       //                   crossAxisAlignment: CrossAxisAlignment.start,
//       //                   children: [
//       //                     Text(
//       //                       'ultama street no. 15, Rumbai',
//       //                       style: TextStyle(color: Colors.white),
//       //                     ),
//       //                   ],
//       //                 ),
//       //                 SizedBox(
//       //                   height: 7,
//       //                 ),
//       //                 Row(
//       //                   crossAxisAlignment: CrossAxisAlignment.start,
//       //                   children: [
//       //                     // TextButton(
//       //                     //     style: TextButton.styleFrom(
//       //                     //         foregroundColor: Colors.green,
//       //                     //         backgroundColor: Colors.white),
//       //                     //     onPressed: () {},
//       //                     //     child: Text(
//       //                     //       '2.5 KM',
//       //                     //     ))
//       //
//       //                     Card(
//       //                         child: Padding(
//       //                       padding: const EdgeInsets.only(
//       //                           left: 20, right: 20, top: 7, bottom: 7),
//       //                       child: Text(
//       //                         '2.5 KM',
//       //                         style:
//       //                             TextStyle(fontSize: 13, color: Colors.green),
//       //                       ),
//       //                     ))
//       //                   ],
//       //                 ),
//       //               ],
//       //             ),
//       //           ),
//       //         ),
//       //       ),
//       //     ),
//       //   ],
//       // )),
//     );
//   }
// }

import 'package:flutter/material.dart';

class fourthpage extends StatelessWidget {
  const fourthpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 2, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Harshit Ramani",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {},
                        heroTag: 'follow',
                        elevation: 0,
                        label: const Text("Follow"),
                        icon: const Icon(Icons.person_add_alt_1),
                      ),
                      const SizedBox(width: 16.0),
                      FloatingActionButton.extended(
                        onPressed: () {},
                        heroTag: 'mesage',
                        elevation: 0,
                        backgroundColor: Colors.red,
                        label: const Text("Message"),
                        icon: const Icon(Icons.message_rounded),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const _ProfileInfoRow()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({Key? key}) : super(key: key);

  final List<ProfileInfoItem> _items = const [
    ProfileInfoItem("Posts", 900),
    ProfileInfoItem("Followers", 120),
    ProfileInfoItem("Following", 200),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _items
            .map((item) => Expanded(
            child: Row(
              children: [
                if (_items.indexOf(item) != 0) const VerticalDivider(),
                Expanded(child: _singleItem(context, item)),
              ],
            )))
            .toList(),
      ),
    );
  }

  Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          item.value.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      Text(
        item.title,
        style: Theme.of(context).textTheme.bodySmall,
      )
    ],
  );
}

class ProfileInfoItem {
  final String title;
  final int value;
  const ProfileInfoItem(this.title, this.value);
}

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xff0043ba), Color(0xff006df1)]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/food2.jpg')
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
