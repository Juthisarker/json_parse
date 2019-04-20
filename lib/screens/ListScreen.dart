import 'package:flutter/material.dart';
import '../Model/Article.dart';
import '../Service/ArticalService.dart';

class ListScreen extends StatefulWidget {
  
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

Widget build(BuildContext context){
  return Scaffold(
     appBar: AppBar(
        title: Text("News Web"),
      ),
      body:Container(
        child: FutureBuilder<Article>(
          future: ArticalService.getArticle(),
          builder: (BuildContext context,AsyncSnapshot snapshot)
          {
            if(snapshot.data!=null)
            {
            return ListView.builder(
             itemCount:snapshot.data.data.length,
             itemBuilder:(BuildContext context,int index)
             {
             return ListTile(
               title: Text(snapshot.data.data[index].firstName),
               );

             }
            );
            }
            else
            {
              return Container(
                child:Center(child: CircularProgressIndicator(),
                ),
                );
            }
          }

        ),
        )
  
  );
}
}
