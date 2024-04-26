import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favourite_provider.dart';

class MyFavourites extends StatefulWidget {
  const MyFavourites({super.key});

  @override
  State<MyFavourites> createState() => _MyFavouritesState();
}

class _MyFavouritesState extends State<MyFavourites> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Items List'),
        actions: [
          InkWell(

            child: Icon(Icons.favorite),
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 1000,//provider.selectedItem.length,
                itemBuilder: (context, index){
                  return Consumer<FavouriteProvider>(
                    builder: (context,value,child){
                      return ListTile(
                        onTap: (){
                          if(value.selectedItem.contains(index)){
                            value.removeItem(index);
                          }
                          else{
                            value.addItem(index);
                          }
                        },
                        title: Text('Item '+ (index+1).toString()),
                        trailing: Icon(value.selectedItem.contains(index)? Icons.favorite:Icons.favorite_border_outlined),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
