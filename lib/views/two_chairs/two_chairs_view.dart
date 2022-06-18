import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/utils/random.dart';
import 'package:single_house/views/two_chairs/dragger.dart';
// import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';

class TwoChairsView extends StatefulWidget {
  const TwoChairsView({Key? key}) : super(key: key);
  static const String name = 'TwoChairsView';
  static PageRoute route() => RouterCore.createRoute(
        const TwoChairsView._(),
      );

  const TwoChairsView._();

  @override
  State<TwoChairsView> createState() => _TwoChairsViewState();
}

class _TwoChairsViewState extends State<TwoChairsView> {
  List<Dragger> listOne = List.generate(3, (index) => Dragger(color: 0.8.randColor));
  List<Dragger> listTwo = List.generate(5, (index) => Dragger(color: 0.1.randColor));
  final ScrollController _rightController = ScrollController();
  final ScrollController _leftController = ScrollController();

  Widget container(BuildContext context) {
    return Container(
      child: const Center(
        child: Text(
          'Drag here',
          style: TextStyle(color: Colors.black),
        ),
      ),
      color: Colors.white,
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Two Chairs'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: SingleChildScrollView(
              controller: _leftController,
              child: Column(
                children: [
                  ReorderableListView.builder(
                    scrollController: _leftController,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 47),
                        key: ValueKey('$index'),
                        title: listOne[index],
                      );
                    },
                    itemCount: listOne.length,
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (newIndex > oldIndex) newIndex--;
                        final item = listOne.removeAt(oldIndex);
                        listOne.insert(newIndex, item);
                      });
                    },
                  ),
                  // ListView.builder(
                  //   scrollDirection: Axis.vertical,
                  //   shrinkWrap: true,
                  //   itemCount: listOne.length,
                  //   itemBuilder: (context, index) => listOne[index],
                  // ),
                  DragTarget<Color>(
                    builder: (context, candidateData, rejectedData) {
                      return container(context);
                    },
                    onWillAccept: (data) => true,
                    onAccept: (data) {
                      setState(() {
                        listOne.add(Dragger(color: data));
                        listTwo.removeWhere((element) => element.color == data);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 2,
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
                color: AppColors.lightBlue,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 3,
            child: SingleChildScrollView(
              controller: _rightController,
              child: Column(
                children: [
                  ReorderableListView.builder(
                    scrollController: _rightController,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 47),
                        key: ValueKey('$index'),
                        title: listTwo[index],
                      );
                    },
                    itemCount: listTwo.length,
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (newIndex > oldIndex) newIndex--;
                        final item = listTwo.removeAt(oldIndex);
                        listTwo.insert(newIndex, item);
                      });
                    },
                  ),
                  DragTarget<Color>(
                    builder: (context, candidateData, rejectedData) {
                      return container(context);
                    },
                    onWillAccept: (data) => true,
                    onAccept: (data) {
                      setState(() {
                        listTwo.add(Dragger(color: data));
                        listOne.removeWhere((element) => element.color == data);
                      });
                    },
                  ),

                  // ListView.builder(
                  //   scrollDirection: Axis.vertical,
                  //   shrinkWrap: true,
                  //   itemCount: listTwo.length,
                  //   itemBuilder: (context, index) => listTwo[index],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




//  late List<DragAndDropList> _list;

//   @override
//   void initState() {
//     _list = List.generate(2, (index) {
//       return DragAndDropList(
//         children: <DragAndDropItem>[
//           DragAndDropItem(
//             child: Container(
//               width: 100,
//               height: 100,
//               color: AppColors.white,
//             ),
//           ),
//           DragAndDropItem(
//             child: Container(
//               width: 100,
//               height: 100,
//               color: AppColors.grey,
//             ),
//           ),
//           DragAndDropItem(
//             child: Container(
//               width: 100,
//               height: 100,
//               color: AppColors.primary,
//             ),
//           ),
//         ],
//       );
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Two Chairs'),
//       ),
//       body: DragAndDropLists(
//         children: _list,
//         onItemReorder: _onItemReorder,
//         onListReorder: _onListReorder,
//       ),
//     );
//   }

//   _onItemReorder(int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
//     setState(() {
//       var movedItem = _list[oldListIndex].children.removeAt(oldItemIndex);
//       _list[newListIndex].children.insert(newItemIndex, movedItem);
//     });
//   }

//   _onListReorder(int oldListIndex, int newListIndex) {
//     setState(() {
//       var movedList = _list.removeAt(oldListIndex);
//       _list.insert(newListIndex, movedList);
//     });
//   }
// }