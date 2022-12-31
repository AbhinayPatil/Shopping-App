import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/models/order_model.dart';

class OrderItemWidget extends StatefulWidget {
  final OrderItem orders;
  const OrderItemWidget({super.key, required this.orders});

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  bool _expanded = false;
  String _btnLabel = 'Expand';
  IconData _iconData = Icons.keyboard_arrow_down_outlined;

  Widget _expandedContainer() {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: Column(
        children: [
          const Divider(),
          SizedBox(
            height: min(widget.orders.products.length * 50, 100),
            child: ListView.builder(
                itemBuilder: ((context, index) => _listTile(
                    widget.orders.products[index].title,
                    widget.orders.products[index].price,
                    widget.orders.products[index].qauntity)),
                itemCount: widget.orders.products.length),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _listTile(String title, double price, int quantity) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(
                    "Total: ${price * quantity}/-",
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    "$price/-",
                  ),
                  Text("${quantity}X"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, top: 16, left: 16),
      padding: const EdgeInsets.only(right: 16, top: 16, left: 16),
      decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: Theme.of(context).colorScheme.secondary),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date: ${DateFormat.yMMMd().format(widget.orders.time)}",
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    "Day: ${DateFormat.EEEE().format(widget.orders.time)}",
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    "Time: ${DateFormat.jm().format(widget.orders.time)}",
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "Amount: ${widget.orders.totalAmount}",
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                    if (_expanded == true) {
                      _btnLabel = 'Show less';
                      _iconData = Icons.keyboard_arrow_up_outlined;
                    } else if (_expanded == false) {
                      _btnLabel = 'Expand';
                      _iconData = Icons.keyboard_arrow_down_outlined;
                    }
                  });
                },
                child: Row(
                  children: [
                    Text(
                      _btnLabel,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    Icon(
                      _iconData,
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
            ],
          ),
          if (_expanded) _expandedContainer(),
        ],
      ),
    );
  }
}
