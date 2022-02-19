import 'package:flutter/material.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(16)),
                      padding: const EdgeInsets.all(4),
                      width: double.infinity,
                      height: 120,
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset('assets/images/logo.png')),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              // color: Colors.amber,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Product Title',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 4.0),
                                    child: Text('Brand: Name'),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Price: 3000৳',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: StadiumBorder()),
                                          onPressed: () {},
                                          child: Text(
                                            'Buy now',
                                            style: TextStyle(fontSize: 11),
                                          ))
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
                      height: 10,
                    );
                  },
                  itemCount: 10),
            ),
          ],
        ),
      )),
    );
  }
}
