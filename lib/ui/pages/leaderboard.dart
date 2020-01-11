import 'package:flutter/material.dart';

class LeaderBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          
           icon: Icon(Icons.arrow_back),
           onPressed: (){
             Navigator.pop(context);
           },
        ),
        title: Text(
          "Leaderboard",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              // padding: EdgeInsets.only(top: 10, left: 10.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 100.0,
                    margin: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                                radius: 30.0,
                                backgroundColor: Colors.blue,
                                child: Text(
                                  "2nd",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                )),
                            Text("S Khan")
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                                radius: 40.0,
                                backgroundColor: Colors.red,
                                child: Text(
                                  "1st",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                )),
                            Text("Maruf Hossen")
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                                radius: 30.0,
                                backgroundColor: Colors.amber,
                                child: Text(
                                  "3rd",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                )),
                            Text("P Tahsin")
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text("Ranking",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(

                    child: Container(
                     
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          index = index+1;
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    color: Colors.grey[100],
                                  ),
                                  padding: EdgeInsets.all(8.0),
                                  height: 50.0,
                                  child: Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 28.0,
                                        child: Text(
                                          index.toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.deepPurple,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Mr Maruf Hossen",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.0),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 0.0,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
              ),
            ]),
            height: 70.0,
            
            padding: EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.grey[100],
              ),
              padding: EdgeInsets.all(8.0),
              height: 50.0,
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 28.0,
                    child: Text(
                      "9",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Prity Tahsin",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), bottomLeft: Radius.circular(20.0)),
//                 color: Colors.yellow,
//               ),
//               height: 120.0,
//               //width: double.infinity,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text("Win 30\$", style: TextStyle(fontSize: 25.0, fontWeight:FontWeight.bold),),
//                     Text("Todays highest scorer wins", style: TextStyle(fontSize: 15.0),),
//                   ],
//                 ),
//               ),
//             ),
