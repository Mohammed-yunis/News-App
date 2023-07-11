import 'package:flutter/material.dart';
import 'package:news_app/styles/colors.dart';

import '../../layout/webView/webView.dart';



Widget itemBuilder(list,context){
        return InkWell(
          onTap: (){navigateTo(context, WebView1(url: list['url']));},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image:list['urlToImage']==null?const AssetImage('assets/images/loading.gif'):NetworkImage('${list['urlToImage']}')as ImageProvider<Object> ,
                            fit: BoxFit.cover),
                      ),
                        ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text('${list['title']}',
                              style:Theme.of(context).textTheme.bodyLarge,maxLines: 3,overflow: TextOverflow.ellipsis,),
                          ),
                          Text('${list['publishedAt']}',
                              style:const TextStyle(color: Colors.grey) ,),

                        ],
                      ),
                    ),
                  ),
                ],

            ),
          ),
        );
      }

Widget divider(){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 13),
    child: Container(height: 2,
    width: double.infinity,
    color: Colors.grey,),
  );
}

Widget textfield(
    {
      String? hintstr,
      FormFieldValidator<String>? validator,
      IconData? prefix,
      IconData? suffix,
      TextEditingController? controller,
      ValueChanged<String>? onChange,
      TextInputType keyboard = TextInputType.text,
      double hintSize = 20,
      double radius = 20,
      FontWeight weight = FontWeight.bold}) {
  return TextFormField(
    decoration: InputDecoration(
      prefixIcon: Icon(prefix),
      suffixIcon: Icon(suffix),
      hintText: hintstr,
      hintStyle: TextStyle(fontSize: hintSize, fontWeight: weight,color: black),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
    keyboardType: keyboard,
    controller: controller,
    validator: validator,
    onChanged:onChange,
  );
}

void navigateTo(context,Widget){
   Navigator.push(context, MaterialPageRoute(builder:(context)=>Widget));
}