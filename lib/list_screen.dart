import 'package:flutter/material.dart';
import 'package:kuistpm2022/data_hotel.dart';
import 'package:kuistpm2022/detail_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Hotel"),
      ),
      body: HotelList(),
    );
  }
}

class HotelList extends StatefulWidget {
  const HotelList({Key? key}) : super(key: key);

  @override
  _HotelListState createState() => _HotelListState();
}

class _HotelListState extends State<HotelList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index){
          final DataHotel hotel = hotelList[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return DetailScreen(hotel: hotel,);
              }));
            },
            child: Container(
              height: 200,
              child: Card(
                child: Stack(
                  children: [
                    Container(
                      child: Image.network(
                        hotel.imageUrl[0],
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                hotel.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Container(
                              child: IconStar(),
                            ),
                            SizedBox(height: 8.0,),
                            Container(
                              child: Text(
                                hotel.roomPrice,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: hotelList.length,
    );
  }
}

class IconStar extends StatefulWidget {
  const IconStar({Key? key}) : super(key: key);

  @override
  _IconStarState createState() => _IconStarState();
}

class _IconStarState extends State<IconStar> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: Colors.white,
    );
  }
}


