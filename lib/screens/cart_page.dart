import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List cartDataList = [];
  int totalPrice = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCartData('users-cart');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10),
        constraints: const BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('You have ${cartDataList.length} item(s) in cart',
                style: TextStyle(
                  fontSize: 18,
                )),
            const SizedBox(height: 10),
            Expanded(
              child: cartDataList.isEmpty
                  ? Center(
                      child: Text('You have no item in cart'),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                  height: double.infinity,
                                  width: 120,
                                  padding: EdgeInsets.all(8),
                                  child: Image.network(
                                    cartDataList[index]['image'],
                                    fit: BoxFit.cover,
                                  )),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  // color: Colors.amber,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Product Title',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text('Quantity: 1'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('price: 800 Tk'),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: const StadiumBorder()),
                                              onPressed: () {
                                                totalPrice = 0;
                                                removeItem(
                                                    cartDataList[index]['id']);
                                              },
                                              child: const Text('Remove item'))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                      itemCount: cartDataList.length),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Total: ৳$totalPrice',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                MaterialButton(
                  shape: const StadiumBorder(),
                  color: Colors.green,
                  onPressed: () {},
                  child: const Text('Checkout'),
                )
              ],
            )
          ],
        ),
      )),
    );
  }

  getCartData(String collectionName) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var data = await firestore.collection(collectionName).get();

    for (var item in data.docs) {
      setState(() {
        cartDataList.add({
          'catagory': item['catagory'],
          'description': item['description'],
          'image': item['image'],
          'price': item['price'],
          'rating': item['rating'],
          'title': item['title'],
          'id': item.id,
        });

        totalPrice = totalPrice + int.parse(item['price']);
      });
    }
    print(cartDataList);
    print('cartDataList');
  }

  removeItem(documentId) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    firestore.collection('users-cart').doc(documentId).delete();
    cartDataList.clear();
    getCartData('users-cart');
    setState(() {});
  }
}
