import 'package:flutter/material.dart';
import 'package:weight_calculator/splashpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
    );
  }
}
class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result ="";
  var msg = "";
  var bgColor = Colors.indigo.shade500;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container( width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.line_weight, size: 200,),
                Text('calculate', style: TextStyle(
                  fontSize: 35, fontWeight: FontWeight.w700,


                ),),
                SizedBox(height: 20,),

                TextField( keyboardType: TextInputType.number,
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your Weight'),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                ),
                SizedBox(height: 15,),

                TextField( keyboardType: TextInputType.number,
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your Height(in feet)'),
                    prefixIcon: Icon(Icons.height)
                  ),
                ),
                SizedBox(height: 15,),
                TextField( keyboardType: TextInputType.number,
                  controller:inController,
                  decoration: InputDecoration(
                    label: Text('Enter your Height(In inch)'),
                    prefixIcon: Icon(Icons.height)
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt!=""&& ft!="" && inch!=""){
                    var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                    var iInch = int.parse(inch);
                    var tInch = (iFt=12) + iInch;
                    var tCm = tInch*2.54;
                    var  tM = tCm/100;
                    var bmi = iWt/(tM*tM);
                    var msg = "";

                    if(bmi>25){
                      msg = "you're OverWeight!!";
                          bgColor=Colors.orange.shade200;

                    }else if(bmi<18){ "you're UnderWeight!!";
                    bgColor=Colors.red.shade200;


                    }else
                      {
                        "you're Healthy!!";
                        bgColor=Colors.green.shade200;

                      }
                    setState(() {
                      result= "your BMI = ${bmi.toStringAsFixed(4)}";
                    });

                  } else{
                    setState(() {
                      result = "$msg \n please fill the blanks!!";
                    });
                  }

                },
                    child: Text('calculate',)),
                SizedBox(height: 19,),

                Text(result,style: TextStyle(fontSize: 20),)



              ],
            ),
          ),
        ),
      ),
    );
  }
}