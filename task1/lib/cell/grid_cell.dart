import 'package:flutter/material.dart';
import '../model/_products.dart';

class ProductCell extends StatelessWidget {
  final Products products;

  const ProductCell(this.products);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Hero(
                    tag: "images${products.id}",
                    child: products.thumbnailUrl.isNotEmpty
                        ? FadeInImage.assetNetwork(
                      placeholder: "assets/images/no_image.png", // Assuming the placeholder image is located in the assets/images directory
                      image: products.thumbnailUrl.isNotEmpty ? products.thumbnailUrl : "assets/images/no_image.png",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                        : Image.asset(
                      "images/no_image.png",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  products.title ?? '',
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
