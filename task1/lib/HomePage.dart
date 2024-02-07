import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1/grid_detail.dart';
import 'package:task1/model/_products.dart';
import 'package:task1/network/network_request.dart';

import 'cell/grid_cell.dart';

class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  gridView(AsyncSnapshot<List<Products>> snapshot) {
    if (snapshot.data == null) {
      // If snapshot.data is null, return an empty container or handle it as needed.
      return Container();
    }
    return Padding(
      padding: EdgeInsets.all(5),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: snapshot.data!.map((products) {
          return GestureDetector(
            child: GridTile(
              child: ProductCell(products),
            ),
            onTap: () {
              gotoDetailpage(context, products);
            },
          );
        }).toList(),
      ),
    );
  }


  gotoDetailpage(BuildContext context, Products products){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => GridDetails(products: products)
        )
    );
  }

  circularProgress(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grid View with API')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              child: FutureBuilder<List<Products>>(
                future: NetworkRequest.fetchProducts(),
                builder: (context, snapshot) {
                  if(snapshot.hasError){
                    return Text('Error ${snapshot.error}');
                  }
                  else if(snapshot.hasData){
                    return gridView(snapshot);
                  }
                  return circularProgress();
                },

              ))
        ],
      ),
    );
  }

}