import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class hotel_page_four extends StatelessWidget {
  final String imageURL;

  hotel_page_four(this.imageURL, {Key? key}) : super(key: key);
  CollectionReference hotel = FirebaseFirestore.instance.collection('hotels');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              '25 Dolares',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              height: 45,
              child: MaterialButton(
                minWidth: 200,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Colors.orange,
                child: const Text(
                  'Seleccion Cuarto',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageURL), fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(12)),
                            width: 35,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StreamBuilder(
                      stream: hotel.doc('0VBi8MP4YZZQt3BkVBgl').snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              snapshot.data.data()['name'],
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.location_on,
                                size: 30,
                                color: Colors.white,
                              ),
                              Text(
                                'Direccion',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          StreamBuilder(
                            stream:
                                hotel.doc('0VBi8MP4YZZQt3BkVBgl').snapshots(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.active) {
                                return Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    snapshot.data.data()['address'],
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                );
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Detalles',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    StreamBuilder(
                      stream: hotel.doc('0VBi8MP4YZZQt3BkVBgl').snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              snapshot.data.data()['descripcion'],
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.wifi,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.ac_unit,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.restaurant,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.pool,
                        size: 40,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
