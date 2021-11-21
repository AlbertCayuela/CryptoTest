import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application/providers/app_provider.dart';
import 'package:flutter_application/enums.dart';
import 'package:provider/src/provider.dart';
import '../constants.dart';

class SelectableCryptoWidget extends StatefulWidget {
  String name;
  String slug;
  double usdPrice;
  CryptoType cryptoType;

  SelectableCryptoWidget({
    Key? key,
    required this.name,
    required this.slug,
    required this.usdPrice,
    required this.cryptoType,
  }) : super(key: key);

  @override
  State<SelectableCryptoWidget> createState() => _SelectableCryptoWidgetState();
}

class _SelectableCryptoWidgetState extends State<SelectableCryptoWidget> {
  bool boxState = false;
  late int itemsSelected;

  @override
  void initState() {
    //watch items selected from provider

    super.initState();
  }

  void changeValue() {
    if (boxState) {
      //call substract function from provider
      context.read<AppProvider>().substractSelectedItems(widget.cryptoType);
      setState(() {
        boxState = false;
      });
    } else {
      if (itemsSelected < 2) {
        context.read<AppProvider>().addSelectedItem(widget.cryptoType);
        setState(() {
          boxState = true;
        });
      } else {
        log('already chosen 2 items');
        //SHOW DIALOG
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //watch items selected from app provider

    itemsSelected = context.watch<AppProvider>().selectedItems;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(darkGrayColor),
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: boxState,
            onChanged: (bool) {
              changeValue();
            },
            activeColor: Color(blueColor),
          ),
          Image.asset(
            'assets/${widget.slug}.png',
            height: 30,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Name: ',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    widget.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.white60),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Price: ',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    '${widget.usdPrice.toStringAsFixed(5)} \$',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.white60),
                  )
                ],
              )
            ],
          ),

          //SizedBox(width: 40),
        ],
      ),
    );
  }
}
