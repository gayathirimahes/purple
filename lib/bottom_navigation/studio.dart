import 'package:flutter/material.dart';

class Tech {
  String label;
  // Color color;
  bool isSelected;

  var color;
  Tech(this.label, this.color, this.isSelected);
}

class Tech1 {
  String img;
  // Color color;

  Tech1(this.img);
}

class studio extends StatefulWidget {
  const studio({Key? key}) : super(key: key);

  @override
  State<studio> createState() => studio_screen();
}

class studio_screen extends State<studio> {
  bool selected = false;

  bool isSelected = false;
  List<Tech> _chipsList = [
    Tech("Best in lips", white, false),
    Tech("eye Makeup", white, false),
    Tech("Beauty Hacks", white, false),
    Tech("MakeupTips", white, false),
    Tech("Skin Care", white, false)
  ];
  List<Tech1> _chipsList1 = [
    Tech1(
      "assets/img/pro1.jpg",
    ),
    Tech1(
      "assets/img/pro2.jpg",
    ),
    Tech1(
      "assets/img/pro1.jpg",
    ),
    Tech1(
      "assets/img/pro2.jpg",
    ),
    Tech1(
      "assets/img/pro2.jpg",
    )
  ];

  List<String> selectedReportList = [];

  static var white;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.pink.shade100, Colors.white])),
      child: SafeArea(
        child: Scaffold(
            // By defaut, Scaffold background is white
            // Set its value to transparent
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 310),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: Container(
                      //color: Colors.yellow.shade600,
                      padding: const EdgeInsets.all(8),
                      // Change button text when light changes state.
                      child: Text(
                        "skip",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 12, right: 80),
                  child: Text(
                    "Choose Your Interest",
                    style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 12, bottom: 10),
                  child: Text(
                    "please select your choice",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                // MultiSelectChip(
                //   reportList,
                //   onSelectionChanged: (selectedList) {
                //     setState(() {
                //       selectedReportList = selectedList;
                //     });
                //   },
                //   // maxSelection: 2,
                // ),
                Container(
                    child: Wrap(
                  spacing: 8,
                  direction: Axis.vertical,
                  children: techChips(),
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40, right: 10),
                  child: Container(
                    width: 320,
                    height: 40,
                    child: FlatButton(
                      color: Colors.pink.shade400,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {},
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ),

                // alignment: Alignment.topCenter,
                // margin: EdgeInsets.only(top: 20),
                // child: Expanded(
                //     child: SizedBox(
                //         height: 200.0,
                //         child: ListView.builder(
                //             itemCount: reportList.length,
                //             itemBuilder: (BuildContext context, int index) {
                //               return FilterChip(
                //                 label: Text(reportList[index]),
                //                 showCheckmark: false,
                //                 selected: selected,
                //                 onSelected: (bool value) {
                //                   selected = value;
                //                   setState(() {});
                //                 },
                //               );
                //             })))
              ],
            )),
      ),
    );
  }

  List<Widget> techChips() {
    List<Widget> chips = [];
    for (int i = 0; i < _chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, top: 20, right: 5),
        child: FilterChip(
          avatar: Container(
              width: 190.0,
              height: 190.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage(
                        _chipsList1[i].img,
                      )))),
          selectedColor: Colors.white,
          showCheckmark: false,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: _chipsList[i].isSelected
                    ? Colors.pink.shade400
                    : Colors.white,
                width: 1.2),
            borderRadius: BorderRadius.circular(30),
          ),
          label: Padding(
              padding: const EdgeInsets.only(top: 13, bottom: 13, right: 10),
              child: Text(_chipsList[i].label)),
          labelStyle: TextStyle(color: Colors.black),
          backgroundColor: Colors.white,
          selected: _chipsList[i].isSelected,
          onSelected: (bool value) {
            setState(() {
              _chipsList[i].isSelected = value;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>)? onSelectionChanged;
  final Function(List<String>)? onMaxSelected;
  final int? maxSelection;

  MultiSelectChip(this.reportList,
      {this.onSelectionChanged, this.onMaxSelected, this.maxSelection});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = [];
  List<String> images = [
    "assets/img/brand.png",
    "assets/img/brand4.png",
    "assets/img/brands2.jpg",
    "assets/img/cart.png",
    "assets/img/cate.jpg"
  ];

  _buildChoiceList() {
    List<Widget> choices = [];

    widget.reportList.forEach((item) {
      choices.add(Container(
        // width: 100,
        //color: Colors.red,
        // height: 60,
        padding: const EdgeInsets.only(left: 20, top: 30, right: 100),
        child: ChoiceChip(
          selectedColor: Colors.white,
          labelStyle: TextStyle(color: Colors.black),
          avatar: Container(
              width: 190.0,
              height: 190.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage(
                        "assets/img/pro1.jpg",
                      )))),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: selectedChoices.contains(item)
                    ? Colors.pink.shade400
                    : Colors.white,
                width: 1.2),
            borderRadius: BorderRadius.circular(30),
          ),
          label: Padding(
              padding: const EdgeInsets.only(top: 13, bottom: 13, right: 10),
              child: Text(item)),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              //widget.onSelectionChanged?.call(selectedChoices);
            });
          },
        ),
      ));
    });

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
