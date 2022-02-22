import 'dart:ui';

import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.item}) : super(key: key);

  final Map item;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int quantity = 1;
  late TextEditingController editingController;
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    editingController = TextEditingController(text: '$quantity');
    return Scaffold(
      body: SafeArea(
          child: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                IconButton(
                  onPressed: () {
                    isFav = true;
                    setState(() {});
                  },
                  icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border_outlined),
                  color: Colors.red,
                )
              ],
            ),
            Image.network(widget.item['image']),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.item['title'],
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: const StadiumBorder()),
                          onPressed: null,
                          child: Text('★ ${widget.item['rating']}')),
                    ],
                  ),
                  Text(
                    'Catagory: ${widget.item['catgory']}',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Text(widget.item['description']),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Quantity: ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (quantity > 1) quantity--;
                          setState(() {});
                        },
                        child: const Text(
                          '-',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: const StadiumBorder(),
                        color: Colors.deepPurple,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: TextField(
                        textAlign: TextAlign.center,
                        controller: editingController,
                        decoration: const InputDecoration(
                            isDense: true, border: OutlineInputBorder()),
                      )),
                      const SizedBox(
                        width: 5,
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        child: const Text(
                          '+',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: const StadiumBorder(),
                        color: Colors.deepPurple,
                      )
                    ],
                  ),
                  const Divider(
                    height: 24,
                    thickness: 1.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '৳${widget.item['price']}',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MaterialButton(
                        shape: const StadiumBorder(),
                        color: Colors.green,
                        onPressed: () {},
                        child: const Text('Buy now'),
                      )
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
