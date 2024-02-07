import 'package:flutter/material.dart';
import 'package:task1/model/_products.dart';

class GridDetails extends StatefulWidget{
  final Products products;
  GridDetails({required this.products});

  @override
  _GridDetailsState createState() => _GridDetailsState();
}

class _GridDetailsState extends State<GridDetails>{
  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
              tag: "images${widget.products.id}",
              child: FadeInImage.assetNetwork(
                placeholder: "images/no_image.png", // Update the path to the placeholder image
                image: widget.products.url.isNotEmpty ? widget.products.url : "images/no_image.png", // Update the path to the placeholder image
              ),
          ),
          SizedBox(height: 30,),
          OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
              child:  Icon(Icons.close),)
        ],
      ),
    );
  }
}