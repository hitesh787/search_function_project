import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({Key? key}) : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CUSTOM STEPPER',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                StepperComponent(
                  currentIndex: _currentIndex,
                  index: 0,
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                    _pageController.jumpToPage(0);
                  },
                ),
                StepperComponent(
                  currentIndex: _currentIndex,
                  index: 1,
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                    _pageController.jumpToPage(1);
                  },
                ),
                StepperComponent(
                  currentIndex: _currentIndex,
                  index: 2,
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                    _pageController.jumpToPage(2);
                  },
                ),
                StepperComponent(
                  currentIndex: _currentIndex,
                  index: 3,
                  isLast: true,
                  onTap: () {
                    setState(() {
                      _currentIndex = 3;
                    });
                    _pageController.jumpToPage(3);
                  },
                ),
              ],
            ),
          ),
          Expanded(
              child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Text('Page ${index + 1}'),
                    );
                  })),
        ],
      ),
    );
  }
}

class StepperComponent extends StatelessWidget {
  // index describe the position of our bubble
  int index;

  //currentIndex is index that is gonna change on Tap
  int currentIndex;

  //onTap CallBack
  VoidCallback onTap;

  bool isLast;

  StepperComponent({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    //now let's remove the ligne at the end of the row but also we need to remove unnecessary padding thus we need to remove the expanded
    //widget
    return isLast
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  //this is the bubble
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: index == currentIndex
                            ? Colors.orange
                            : Colors.transparent,
                        border: Border.all(
                            color: currentIndex >= index
                                ? Colors.orange
                                : Colors.black12),
                      ),
                    ),
                  ),
                  //this the ligne
                  Container(
                    height: 2,
                    //why index+1 we want to turn the ligne orange that precede the active bubble
                    color: currentIndex >= index + 1
                        ? Colors.orange
                        : Colors.black12,
                  ),
                ],
              ),
              //index+1 we dont wanna show 0 in the screen since our index will start at 0
              Text('Page ${index + 1}'),
            ],
          )
        : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == currentIndex
                              ? Colors.orange
                              : Colors.transparent,
                          border: Border.all(
                              color: currentIndex >= index
                                  ? Colors.orange
                                  : Colors.black12),
                        ),
                        child: const Center(child: Text('1',style: TextStyle(fontSize: 20),)),
                      ),
                    ),
                    //this the ligne
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: 40,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Container(
                          height: 24,
                          //why index+1 we want to turn the ligne orange that precede the active bubble
                          color: currentIndex >= index + 1
                              ? Colors.orange
                              : Colors.black12,
                        ),
                      ),
                    ),
                  ],
                ),
                //index+1 we dont wanna show 0 in the screen since our index will start at 0
                Text('Page ${index + 1}'),
              ],
            ),
          );
  }
}
