
import 'package:flutter/material.dart';

class ListViewComponent extends StatelessWidget {
  final view_number;
  ListViewComponent({ Key key, this.view_number }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('list view component ($view_number)'),
      ),

      body: _numberList(),
    );
  }

  Widget _numberList() {
    print('try parse: ${this.view_number} ${int.parse(this.view_number) is int}');
    var my_number = int.parse(this.view_number) + 1;
    return ListView.separated(
      itemCount: my_number,
      itemBuilder:  (context, i) {
//          if(i.isOdd) return Divider();

          if(my_number > 1) {
            my_number--;
            return _buildRow(my_number);
          }
          return null;
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.lightGreen,
      ),
    );
  }

  Widget _buildRow(rownumber) {
    return ListTile(
      title: Text(
          '$rownumber'
      ),
    );
  }
}