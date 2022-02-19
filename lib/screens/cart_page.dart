import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
            const Text('You have 3 item(s) in cart',
                style: TextStyle(
                  fontSize: 18,
                )),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
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
                              padding: EdgeInsets.all(8),
                              child: Image.asset('assets/images/logo.png')),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              // color: Colors.amber,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          onPressed: () {},
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
                  itemCount: 10),
            )
          ],
        ),
      )),
    );
  }
}
