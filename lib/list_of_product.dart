// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListOfProduct extends StatefulWidget {
  const ListOfProduct({Key? key}) : super(key: key);

  @override
  _ListOfProductState createState() => _ListOfProductState();
}

class _ListOfProductState extends State<ListOfProduct> {
  TextEditingController _searchProduct = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Of Product"),
        centerTitle: true,
        backgroundColor: Colors.grey[400],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.circle,
          size: 50,
          color: Colors.red,
        ),
        onPressed: () {},
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  style: TextStyle(color: Colors.grey),
                  controller: _searchProduct,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    border: null,
                    label: Text("Search"),
                  ),
                ),
              )),
              Icon(Icons.search)
            ],
          ),
          show_product(),
          show_product(),
          show_product(),
          show_product(),
          show_product(),
          show_product(),
          show_product(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  show() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  right: -40.0,
                  top: -40.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.close),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                Row(
                     children: [
                       Icon(Icons.remove_red_eye,size: 20,),
                       SizedBox(width: 10,),
                       Text("250 views"),
                     ],
                   ),
               Column(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   
                  Text("barcode: "),
                  Text("Category: "),
                  Text("Product name: "),
                  Text("Product Desc: "),
                  Text("product_cost: "),
                  Text("product_price: "),
                  Text("manufacturing_data: "),
                  Text("expiration_date: "),

                 ],
               )
              ],
            ),
          );
        });
  }

  show_product() {
    return InkWell(
      onTap: (() {
        show();
      }),
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(10),
        color: Colors.grey[300],
        child: Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            actions: [
              IconSlideAction(
                caption: 'Delete',
                color: Colors.grey[300],
                icon: Icons.delete,
                onTap: () => print("delete"),
              )
            ],
            secondaryActions: [
              IconSlideAction(
                caption: 'Edit',
                color: Colors.grey[300],
                icon: Icons.edit,
                onTap: () => print("edit"),
              )
            ],
            child: Row(
              children: [
                Image.network(
                  "https://media.istockphoto.com/photos/red-wine-with-barrel-on-vineyard-in-green-tuscany-italy-picture-id1146711814?b=1&k=20&m=1146711814&s=170667a&w=0&h=wjDeHHxMW8wUiTSxqnw-fkUteCVqGoIt-MKSUIftVrg=",
                  width: 60,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text("Product_name:"),
                      Text("Product_category:"),
                    ],
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text("200"),
                )
              ],
            )),
      ),
    );
  }
}
