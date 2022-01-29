import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);
  static const routeName = '/addProductScreen';

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _barcodeController = TextEditingController();

  final TextEditingController _descController = TextEditingController();

  final TextEditingController _quantityController = TextEditingController();

  final TextEditingController _priceController = TextEditingController();

  final TextEditingController _costController = TextEditingController();

  final TextEditingController _manufactureController = TextEditingController();

  final TextEditingController _expireController = TextEditingController();

  // hardcoded data for dropdown button
  String dropDownValue = '*Category';
  final List<String> dropDownList = ['one', 'two', 'three'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // top text
              const Text(
                'Add New Product',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              // barcode
              TextFieldWithButton(
                title: 'barcode',
                controller: _barcodeController,
                icon: Icons.qr_code_outlined,
                onPressed: null,
              ),

              const SizedBox(height: 10),
              // category
              CategoryCard(
                title: 'Catefory',
                value: dropDownValue,
                dropDownItems: dropDownList,
              ),
              const SizedBox(height: 10),
              // product name
              MainTextField(
                title: 'product name',
                controller: _nameController,
              ),
              const SizedBox(height: 10),
              // product desc
              MainTextField(
                title: 'product desc',
                controller: _descController,
              ),
              const SizedBox(height: 10),
              // quantity
              MainTextField(
                title: 'quantity',
                controller: _quantityController,
              ),
              const SizedBox(height: 10),
              // cost
              MainTextField(
                title: 'cost',
                controller: _costController,
              ),
              const SizedBox(height: 10),
              // price
              MainTextField(
                title: 'price',
                controller: _priceController,
              ),
              const SizedBox(height: 10),
              // manufacture date
              TextFieldWithButton(
                title: 'manufacture date',
                controller: _manufactureController,
                icon: Icons.date_range,
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              // expire date
              TextFieldWithButton(
                title: 'expire date',
                controller: _expireController,
                icon: Icons.date_range,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// this class builds main cards in the Add product screen
class MainTextField extends StatelessWidget {
  const MainTextField({Key? key, this.title, this.controller})
      : super(key: key);

  final String? title;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      height: 100,
      child: Card(
        color: Colors.grey[300],
        child: ListTile(
          title: Center(
            child: TextField(
              decoration: InputDecoration(
                hintText: title,
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
              ),
              controller: controller,
            ),
          ),
        ),
      ),
    );
  }
}

// cards with textfields for cards that have an icon button at the right side
class TextFieldWithButton extends StatelessWidget {
  const TextFieldWithButton(
      {Key? key,
      required this.title,
      required this.controller,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  final String? title;
  final TextEditingController? controller;
  final IconData? icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            child: Container(
          margin:
              const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
          width: double.infinity,
          height: 100,
          child: Card(
            color: Colors.grey[300],
            child: ListTile(
              title: Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: title,
                    hintStyle: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  controller: controller,
                ),
              ),
            ),
          ),
        )),
        InkWell(
          child: Icon(
            icon,
            size: 70,
          ),
          onTap: () {
            debugPrint("inkwell tapped");
          },
          splashColor: Colors.cyan,
        ),
      ],
    );
  }
}

// this card is for the category dropdown
class CategoryCard extends StatefulWidget {
  CategoryCard({
    Key? key,
    required this.title,
    // required this.controller,
    required this.value,
    required this.dropDownItems,
  }) : super(key: key);

  String title;
  // TextEditingController controller;
  String? value;

  List<String> dropDownItems;
  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      height: 100,
      child: Card(
        color: Colors.grey[300],
        child: Center(
          child: ListTile(
            // right side of nthe card
            title: Text(widget.value!),

            // left side of the card
            trailing: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                // underline: ,
                // value: widget.value,
                iconSize: 60,
                onChanged: (newValue) {
                  setState(() {
                    widget.value = newValue!;
                  });
                },
                items: widget.dropDownItems.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text('$item'),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
