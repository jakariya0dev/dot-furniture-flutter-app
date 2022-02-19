import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  List<String> catagoryList = [
    'Top item',
    'Almirah',
    'Alna',
    'Chair',
    'Mirror',
    'Table'
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Best Furniture',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'Your perfect choice',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search here',
                filled: true,
                fillColor: Colors.grey.shade300,
                suffixIcon: const Icon(Icons.search),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              // color: Colors.blue,
              margin: const EdgeInsets.only(bottom: 5),
              height: 35,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: catagoryList.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 8,
                    );
                  },
                  itemBuilder: (context, index) {
                    return MaterialButton(
                        color: index == selectedIndex ? Colors.blue : null,
                        shape: const StadiumBorder(),
                        onPressed: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                        child: Text(
                          catagoryList[index],
                          style: const TextStyle(color: Colors.black),
                        ));
                  }),
            ),
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
