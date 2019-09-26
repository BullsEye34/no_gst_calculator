import 'package:flutter/material.dart';

class app extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GSTFormState();
  }
}

class _GSTFormState extends State<app>{
  var _rates = ['5', '12', '18', '28'];
  final _padding = 20.0;
  var _itemSel = "5";
  TextEditingController priceCon = TextEditingController();
  var disp = '';


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("No GST Calculator")
      ),
    body: Container(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(_padding),
            child: TextField(
              keyboardType: TextInputType.number,
              style: textStyle,
              controller: priceCon,
              decoration: InputDecoration(
                labelText: 'MRP',
                hintText: 'Enter the Final Price ',
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: EdgeInsets.all(_padding),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(_padding*4),
                    child: Text("GST Rates: ", style: textStyle,),
                  ),
                  DropdownButton<String>(
                    items: _rates.map((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: _itemSel,

                    onChanged: (String newValueSelected){
                      _onDrop(newValueSelected);

                    },
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(_padding),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: (){
                      setState(() {
                        this.disp = _calc();
                      });
                    },
                    color: Theme.of(context).accentColor,
                    textColor: Theme.of(context).primaryColorDark,
                    child: Text('Calculate', textScaleFactor: 1.5, ),
                  ),
                ),
              ],
            ),
          ),

          Center(
            child: Padding(
              padding: EdgeInsets.all(_padding),
              child: Text(disp, style: textStyle,),

            ),
          )

        ],
      ),
    )
    );
  }

  void _onDrop (String newValueSelected){
    setState(() {
      this._itemSel = newValueSelected;
    });
  }

  String _calc(){
    double price = double.parse(priceCon.text);
    double rates = double.parse(_itemSel);

    double gstPrice = (price * (100/(100+rates)));
    double gst = (gstPrice * ( rates/100 ));

    double total = gst+gstPrice;
    return 'Actual Price: $gstPrice \n\nGST Amount: $gst \n\nTotal Price: $total';
  }
}