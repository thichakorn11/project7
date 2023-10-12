import 'package:flutter/material.dart';

class OrderStatusPage extends StatefulWidget {
  @override
  _OrderStatusPageState createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  // สร้างเมธอดหรือโค้ดในการดึงข้อมูลสถานะการสั่งซื้อหรือปรับแต่งหน้าตามความเหมาะสม
  // ตัวอย่าง:
  List<Order> orders = [
    Order(orderId: 1, status: 'กำลังจัดส่ง'),
    Order(orderId: 2, status: 'จัดส่งเสร็จสิ้น'),
    // เพิ่มรายการสถานะการสั่งซื้ออื่น ๆ ตามความเหมาะสม
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สถานะการสั่งซื้อ'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return ListTile(
            title: Text('รายการสั่งซื้อ #${order.orderId}'),
            subtitle: Text('สถานะ: ${order.status}'),
            // ตัวอย่างการเพิ่มการนำทางไปยังรายละเอียดสถานะการสั่งซื้อเมื่อคลิกที่รายการ
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OrderDetailsPage(order: order),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// สร้างคลาส Order เพื่อเก็บข้อมูลสถานะการสั่งซื้อ
class Order {
  final int orderId;
  final String status;

  Order({required this.orderId, required this.status});
}

// สร้างหน้ารายละเอียดสถานะการสั่งซื้อ (หรือสถานะการสั่งซื้อเพิ่มเติม)
class OrderDetailsPage extends StatelessWidget {
  final Order order;

  OrderDetailsPage({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียดสถานะการสั่งซื้อ #${order.orderId}'),
      ),
      body: Center(
        child: Text('สถานะ: ${order.status}'),
      ),
    );
  }
}
