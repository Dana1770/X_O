import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// ignore: non_constant_identifier_names
  List<String> display_x_o = ['', '', '', '', '', '', '', '', ''];
  bool onTurn = true;
  int ohScore=0;
  int xScore=0;
  int filledBoxes=0;
  var myTextStyle = const TextStyle(
      fontSize: 20,
      fontFamily: 'Tilt Neon',
      color: Color.fromARGB(248, 109, 55, 74));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const  Color.fromARGB(255, 252, 226, 235),
      body: Container(
      
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/pink.webp'))),
      
      child: Column(
            children: [
              Expanded(
                child: Center(
                  child: ColoredBox(
                    color:const Color.fromARGB(255, 253, 213, 226),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        const SafeArea(
                          child: Text(
                            'Score Board',
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Dancing Script',
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(248, 124, 54, 77)),
                          ),
                        ),
                    const    SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text('Player X', style: myTextStyle),
                                Text(xScore.toString(), style: myTextStyle),
          
                              ],
                            ),
                           const  SizedBox(
                              width: 50,
                            ),
                            Column(
                              children: [
                                Text('Player O', style: myTextStyle),
                                Text(ohScore.toString(), style: myTextStyle),
          
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: GridView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: 9,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _Tapped(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 2,
                                  color: const Color.fromARGB(252, 126, 50, 77))),
                          child: Center(
                            child: Text(
                              display_x_o[index],
                              style: const TextStyle(
                                  color: Color.fromARGB(248, 124, 54, 77),
                                  fontSize: 40),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Expanded(
                  child: Container(
                color:const Color.fromARGB(255, 252, 226, 235),
                child: Lottie.asset('assets/Animation - 1703935638699.json'),
              )),
            ],
          ),
      
      ));
   
  }

  // ignore: non_constant_identifier_names
  void _Tapped(index) {
    setState(() {
      if (onTurn && display_x_o[index] == '') {
        display_x_o[index] = 'X';
            filledBoxes+=1;

      } else if (!onTurn && display_x_o[index] == '') {
        display_x_o[index] = 'O';
            filledBoxes+=1;

      }
      onTurn = !onTurn;
      _checkWinner();
    });
  }

  // ignore: unused_element
  void _checkWinner() {
    if (display_x_o[0] == display_x_o[1] &&
        display_x_o[0] == display_x_o[2] &&
        display_x_o[0] != '') {
      _showDialog(display_x_o[0]);
    }
  else  if (display_x_o[3] == display_x_o[4] &&
        display_x_o[3] == display_x_o[5] &&
        display_x_o[3] != '') {
      _showDialog(display_x_o[3]);
    }
  else  if (display_x_o[6] == display_x_o[7] &&
        display_x_o[6] == display_x_o[8] &&
        display_x_o[6] != '') {
      _showDialog(display_x_o[6]);
    }
  else  if (display_x_o[0] == display_x_o[3] &&
        display_x_o[0] == display_x_o[6] &&
        display_x_o[0] != '') {
      _showDialog(display_x_o[0]);
    }
  else  if (display_x_o[1] == display_x_o[4] &&
        display_x_o[1] == display_x_o[7] &&
        display_x_o[1] != '') {
      _showDialog(display_x_o[1]);
    }
  else  if (display_x_o[2] == display_x_o[5] &&
        display_x_o[2] == display_x_o[8] &&
        display_x_o[2] != '') {
      _showDialog(display_x_o[2]);
    }
 else   if (display_x_o[6] == display_x_o[4] &&
        display_x_o[6] == display_x_o[2] &&
        display_x_o[6] != '') {
      _showDialog(display_x_o[6]);
    }
  else  if (display_x_o[0] == display_x_o[4] &&
        display_x_o[0] == display_x_o[8] &&
        display_x_o[0] != '') {
      _showDialog(display_x_o[0]);
    }
    else if(filledBoxes==9){
      _showRowDialog();
    }
  }

// ignore: unused_element
  void _showDialog(String winner) {
    if(winner=='X'){
      xScore+=1;
    }
    else if(winner=='O'){
      ohScore+=1;
    }
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Text(
              'Winner is  $winner',
              style: const TextStyle(color: Color.fromARGB(255, 92, 39, 66), fontFamily: 'Tilt Neon',),
            )),
            
          actions: [
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(248, 124, 54, 77))),
              onPressed: (){
                _clearBoard();
                Navigator.of(context).pop();
              },
             child:const Center(child: Text('Play Again',style:TextStyle(color: Colors.white))),
            )  ],
          );
     
     
        });
  }
void _clearBoard(){
  setState(() {
   for(int i=0;i<9;i++){
  display_x_o[i]='';
} 
  });
  filledBoxes=0;

}
void _showRowDialog(){

    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(
                child: Text(
              'DRAW',
              style:  TextStyle(color: Color.fromARGB(255, 92, 39, 66), fontFamily: 'Tilt Neon',),
            )),
            
          actions: [
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromARGB(248, 124, 54, 77))),
              onPressed: (){
                _clearBoard();
                Navigator.of(context).pop();
              },
             child:const Center(child: Text('Play Again',style:TextStyle(color: Colors.white))),
            )  ],
          );
     
     
        });
}
}
