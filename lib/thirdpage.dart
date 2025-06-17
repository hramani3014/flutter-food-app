import 'package:flutter/material.dart';
import 'package:mobileappproject/detailpage.dart';

class AddToCartPage extends StatelessWidget {
  const AddToCartPage({super.key});

  double getTotal() {
    return Cart.items.fold(0.0, (sum, item) => sum + item.price);
  }

  @override
  Widget build(BuildContext context) {
    final total = getTotal();

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
        backgroundColor: Colors.green[700],
        actions: [
          if (Cart.items.isNotEmpty)
            IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () {
                Cart.items.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Cart cleared")),
                );
                Navigator.pushReplacementNamed(context, '/addtocart');
              },
            ),
        ],
      ),
      body: Cart.items.isEmpty
          ? Center(
        child: Text(
          "Your cart is empty",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Cart.items.length,
              itemBuilder: (context, index) {
                final item = Cart.items[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        item.image,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      item.itemName,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Qty: ${item.quantity}"),
                        if (item.sauces.isNotEmpty)
                          Text("Sauces: ${item.sauces.join(', ')}"),
                        if (item.toppings.isNotEmpty)
                          Text("Toppings: ${item.toppings.join(', ')}"),
                      ],
                    ),
                    trailing: Text(
                      "Rs. ${item.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total:",
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    Text(
                      "Rs. ${total.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Confirm Order"),
                          content: Text("Are you sure you want to place the order?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text("Cancel"),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[700],
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(); // close dialog
                                Cart.items.clear(); // clear cart
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("✅ Order placed successfully!"),
                                    backgroundColor: Colors.green[600],
                                    behavior: SnackBarBehavior.floating,
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                Navigator.pushReplacementNamed(context, '/addtocart');
                              },
                              child: Text("Yes", style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        );
                      },
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Checkout",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
