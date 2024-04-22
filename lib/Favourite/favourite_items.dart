import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/Favourite/favourite_provider.dart';
import 'package:provider_tutorials/Favourite/my_favourites.dart';

class FavouriteItem extends StatefulWidget {
  const FavouriteItem({super.key});

  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}


class _FavouriteItemState extends State<FavouriteItem> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Items List'),
        actions: [
          InkWell(
            onTap:() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyFavourites()));
            } ,
            child: Icon(Icons.favorite),
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1000,
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
