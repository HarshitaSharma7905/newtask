import 'package:flutter/material.dart';
import 'package:newtaskharshita/APIService.dart';
import 'package:newtaskharshita/Model.dart';
import 'Constant.dart';
import 'SearchBloc.dart';


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<User> totalEvents=[];
  @override
  void initState() {
    fetchEvents();
    super.initState();
  }

  //search
  void search(String searchQuery){
    List<User> searchResult=[];
    searchBloc.userController.sink.add([]);
    if(searchQuery.isEmpty){
      searchBloc.userController.sink.add(totalEvents);
      return;
    }
    totalEvents.forEach((user){
      if(user.name.toLowerCase().contains(searchQuery.toLowerCase())){
        searchResult.add(user);
      }
    });
    searchBloc.userController.sink.add(searchResult);
  }
  //fetching data from api

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text('Search',style: TextStyle(color: black),),
        bottom: PreferredSize(preferredSize: Size.fromHeight(35),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: TextField(
              onChanged: (value) => search(value),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Colors.black,),
                  hintText: 'Search Title',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3.1,color: Colors.red),
                    borderRadius: BorderRadius.circular(5),

                  )

              ),
            ),
          ),
        ),
      ),
      body: Container(child:  eventWidget()),
    );
  }
  Widget eventWidget(){
    return StreamBuilder(
      stream: searchBloc.userController.stream,
      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot){
        if(snapshot==null){
          return Center(child: CircularProgressIndicator(),);
        }
        return snapshot.connectionState==ConnectionState.waiting ? Center(child: CircularProgressIndicator())
            :ListView(
            children: snapshot.data!.map((eventData){
              return GestureDetector(
                onTap: () {

                },
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 1, // 80% of screen width
                    height: MediaQuery.of(context).size.height * 0.2, // 20% of screen height
                    margin: EdgeInsets.all(24),

                    child: Row(
                      children: [
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1.0, // Maintain a 1:1 aspect ratio
                            child: FractionallySizedBox(
                              widthFactor: 0.8, // Set the width factor to 80% of available space
                              heightFactor: 0.8, // Set the height factor to 80% of available space
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image.network(
                                    'data:image/jpeg;base64,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',
                                    fit: BoxFit.cover, // Ensure the image covers the entire container
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: AspectRatio(aspectRatio: 1.0,
                          child: FractionallySizedBox(
                              widthFactor: 0.8,
                              heightFactor: 0.8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(child: Text( eventData.name,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'Inter',color: toptextcolor)),),
                                  Container(child: Text(eventData.email,style: TextStyle(fontSize: 18,fontWeight:FontWeight.w500,fontFamily: 'Inter',color: black))),
                                ],
                              )),
                        ))
                      ],
                    )

                ),
              );

            }).toList());

      },
    );

  }
  Future<void> fetchEvents() async{

    try{
      List<User> eventData=await ApiService().getUsers();
      totalEvents=eventData;
      print(eventData);
    }catch(e){
      // Handle error
      print('Error fetching data: $e');
    }

    searchBloc.userController.sink.add(totalEvents);
  }
}