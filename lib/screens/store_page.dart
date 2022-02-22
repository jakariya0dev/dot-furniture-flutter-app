import 'package:dot_furniture/screens/details_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  List<String> collectionName = [
    'top',
    'almirah',
    'alna',
    'chair',
    'mirror',
    'table'
  ];
  int selectedIndex = 0;
  List items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData('top');
  }

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
                          items.clear();
                          getData(collectionName[index]);
                          setState(() {});
                        },
                        child: Text(
                          catagoryList[index],
                          style: const TextStyle(color: Colors.black),
                        ));
                  }),
            ),
            Expanded(
              child: items.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                          item: items[index],
                                        )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(16)),
                            padding: const EdgeInsets.all(8),
                            width: double.infinity,
                            height: 120,
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: double.infinity,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.network(
                                    items[index]['image'],
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    // color: Colors.amber,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          items[index]['title'],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Text(
                                              'Catagory: ${items[index]['title']}'),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Price: ${items[index]['price']}৳',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    shape: StadiumBorder()),
                                                onPressed: () {
                                                  saveToCart(index);
                                                  showMsg(
                                                      'Successfully added to cart!');
                                                },
                                                child: Text(
                                                  'Buy now',
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: items.length),
            ),
          ],
        ),
      )),
    );
  }

  getData(String collectionName) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var data = await firestore.collection(collectionName).get();

    for (var item in data.docs) {
      setState(() {
        items.add({
          'catagory': item['catagory'],
          'description': item['description'],
          'image': item['image'],
          'price': item['price'],
          'rating': item['rating'],
          'title': item['title'],
        });
      });
    }
    // print(items);
    // print('items');
  }

  void saveToCart(int index) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection('users-cart').add(items[index]);
  }

  void showMsg(String msg) {
    showDialog(
        context: context,
        builder: (contxt) {
          return AlertDialog(
            title: Text(msg),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }
}
