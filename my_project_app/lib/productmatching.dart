import 'package:flutter/material.dart';
import 'package:flutter_application_3/entity/product.dart';

class ProductMatchingPage extends StatefulWidget {
  @override
  _ProductMatchingPageState createState() => _ProductMatchingPageState();
}

class _ProductMatchingPageState extends State<ProductMatchingPage> {
  List<Product> draggedProducts = []; // รายการสินค้าที่ถูกลาก
  List<Product> matchedProducts = []; // รายการสินค้าที่แมตช์

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แมตช์สินค้า'),
      ),
      body: Column(
        children: [
          // แสดงสินค้าที่ถูกลาก
          if (draggedProducts.isNotEmpty)
            Row(
              children: draggedProducts
                  .map((product) => Draggable(
                        data: product,
                        child: ProductWidget(product: product),
                        feedback: ProductWidget(product: product),
                        childWhenDragging: Placeholder(),
                      ))
                  .toList(),
            ),

          // พื้นที่สำหรับแมตช์สินค้า
          DragTarget<Product>(
            builder: (context, accepted, rejected) {
              if (matchedProducts.isNotEmpty) {
                return Row(
                  children: matchedProducts
                      .map((product) => ProductWidget(product: product))
                      .toList(),
                );
              } else {
                return Text('ลากสินค้ามาแมตช์');
              }
            },
            onAccept: (product) {
              setState(() {
                matchedProducts.add(product);
              });
            },
          ),
        ],
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  final Product product;

  ProductWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      // แสดงข้อมูลสินค้า
      child: Text(product.productName),
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
    );
  }
}
