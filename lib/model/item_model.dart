class Item{
  String name;
  String barcode;
  int current_stock;
  int default_quantity;
  int quantity;
  Item({required this.name,required this.barcode,required this.current_stock,this.default_quantity=0,required this.quantity});
}