import 'package:first_project/extras/Dimentions.dart';
import 'package:first_project/extras/colors.dart';
import 'package:first_project/widgets/smallText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({Key? key,required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String first;
  late String second;

  bool hiddenText = true;
  double textHeight = Dimentions.ScreenHeight/5.63;

  @override
  void initState(){
    super.initState();
    if(widget.text.length > textHeight){
      first = widget.text.substring(0,textHeight.toInt());
      second = widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }
    else{
      first = widget.text;
      second = "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: second.isEmpty?smallText(text: first):Column(
        children: [
          smallText(height: 1.5,size:Dimentions.font16,color:AppColors.titleColor,text: hiddenText?(first+"..."):(first+second)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                smallText(text: "See more",color: AppColors.mainColor,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: AppColors.mainColor,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
