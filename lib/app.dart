import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_data_picker/flutter_cupertino_data_picker.dart';

class app extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GSTFormState();
  }
}

class _GSTFormState extends State<app> {
  //var _rates = ['5', '12', '18', '28'];
  final _padding = 20.0;
  var _itemSel;
  var _ra;
  TextEditingController priceCon = TextEditingController();
  var disp = '';
  List<bool> isSelected = List.generate(4, (_) => false);

  @override
  void initState() {
    // TODO: implement initState
    //isSelected = [true, false, ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
        backgroundColor: Colors.white,
        //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("No GST Calculator"),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
              /* image: DecorationImage(
              image: AssetImage("Images/eventse.png"),
              fit: BoxFit.cover,
            ), */
              ),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(_padding),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.black),
                  controller: priceCon,
                  decoration: InputDecoration(
                      labelText: 'MRP',
                      prefixIcon: Icon(Icons.panorama_vertical),
                      hintText: 'Enter the Final Price ',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 10.0),
                        borderRadius: BorderRadius.circular(15.0),
                      )),
                ),
              ),
              /*Center(
                child: Padding(
                  padding: EdgeInsets.all(_padding),
                  child: DropdownButton<String>(
                    hint: Text("GST Rates", style: TextStyle(color: Colors.yellow),),
                    style: TextStyle(color: Colors.yellow, fontSize: 20.0,fontWeight: FontWeight.w900),
                    items: _rates.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: _itemSel,
                    onChanged: (String newValueSelected) {
                      _onDrop(newValueSelected);
                    },
                  )
                ),
              ),*/
              Center(
                child: Text(
                  "GST Rates:",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              ratessss(),
              Padding(
                padding: EdgeInsets.all(_padding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 15,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          onPressed: () {
                            setState(() {
                              this.disp = _calc();
                            });
                          },
                          color: Colors.orange,
                          textColor: Theme.of(context).primaryColorDark,
                          child: Text(
                            'Calculate',
                            textScaleFactor: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: _showDataPicker,
                child: Text("Test"),
                color: Colors.red,
              ),
              Center(
                child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 3.5,
                    child: Card(
                      color: Color(0x90ffffff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(_padding),
                        child: Text(
                          disp,
                          style: TextStyle(
                            fontSize: 26.0,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ));
  }

/*  void _onDrop(String newValueSelected) {
    setState(() {
      this._itemSel = newValueSelected;
    });
  }*/

  String _calc() {
    double price = double.parse(priceCon.text);
/*    double rates = double.parse(_itemSel);

    double gstPrice = (price * (100 / (100 + rates)));
    double gst = (gstPrice * (rates / 100));*/

    double gstPrice1 = (price * (100 / (100 + _ra)));
    double gst1 = (gstPrice1 * (_ra / 100));
    double total1 = gst1 + gstPrice1;
    print(gstPrice1);
    print(gst1);
    print(total1);

/*   double total = gst + gstPrice;
    return 'Actual Price: $gstPrice \n\nGST Amount: $gst \n\nTotal Price: $total';*/
    return 'Actual Price: $gstPrice1 \n\nGST Amount: $gst1 \n\nTotal Price: $total1';
  }

  Widget ratessss() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Color(0xffffffff),
            child: ToggleButtons(
              borderColor: Colors.black,
              fillColor: Colors.orange,
              borderWidth: 0.5,
              color: Colors.black,
              selectedBorderColor: Colors.black,
              selectedColor: Colors.white,
              borderRadius: BorderRadius.circular(30),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '5%',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '8%',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '18%',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '28%',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    if (i == index) {
                      isSelected[i] = true;
                    } else {
                      isSelected[i] = false;
                    }
                  }
                  //isSelected[index] = !isSelected[index];
                });
                print(index);
                switch (index) {
                  case 0:
                    _ra = 5;
                    break;
                  case 1:
                    _ra = 8;
                    break;
                  case 2:
                    _ra = 18;
                    break;
                  case 3:
                    _ra = 28;
                    break;
                }
                print(_ra);
              },
              isSelected: isSelected,
            ),
          ),
        ],
      ),
    );
  }

  void _showDataPicker() {
    final bool showTitleActions = true;
    DataPicker.showDatePicker(
      context,
      showTitleActions: showTitleActions,
      locale: 'en',
      datas: ['5%', '8%', '18%', '28%'],
      title: 'GST Rate',
      onChanged: (data) {
        print(
            'onChanged date: ${data.toString().substring(0, data.toString().length - 1)}');
      },
      onConfirm: (data) {
        print(
            'onConfirm date: ${data.toString().substring(0, data.toString().length - 1)}');
      },
    );
  }
}
