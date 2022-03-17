import 'package:flutter/material.dart';
import 'package:kuistpm2022/data_hotel.dart';

class DetailScreen extends StatefulWidget {
  final DataHotel hotel;

  const DetailScreen({Key? key, required this.hotel}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.hotel.name,
          style: TextStyle(
            fontSize: 18
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: isFavorite ? Colors.blue : Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  padding: EdgeInsets.all(4.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: widget.hotel.imageUrl.map((url){
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                            child: Image.network(
                              url,
                              fit: BoxFit.cover,
                            )
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  child: Text(
                    widget.hotel.name,
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  child: Icon(
                          Icons.stars,
                        ),
                  // child: ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   itemBuilder: (context, index){
                  //     return Icon(
                  //       Icons.stars,
                  //     );
                  //   },
                  //   itemCount: int.parse(widget.hotel.stars),
                  // ),
                ),
                SizedBox(height: 8.0),
                Container(
                  child: Text(
                    widget.hotel.location,
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 6.0),
                Container(
                  child: Text(
                    "Harga Per Kamar : " + widget.hotel.roomPrice,
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 6.0),
                Container(
                  child: Text(
                    "Link Pemesanan :",
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 6.0),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.wifi),
                          SizedBox(height: 8.0),
                          Text(widget.hotel.facility[0])
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.local_parking),
                          SizedBox(height: 8.0),
                          Text(widget.hotel.facility[1])
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.pool),
                          SizedBox(height: 8.0),
                          Text(widget.hotel.facility[2])
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.restaurant),
                          SizedBox(height: 8.0),
                          Text(widget.hotel.facility[3])
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6.0),
                Container(
                  child: ElevatedButton(
                    child: Text('Halaman Website'),
                    onPressed: (){},
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

