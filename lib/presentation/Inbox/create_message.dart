
import 'package:flutter/material.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class NewMessageScreen extends StatelessWidget {
  const NewMessageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
       SizedBox(height: 1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Text(
                  'Create Message',
                  style: TextStyle(
                    color: Colors.grey[50],
                    fontSize: 3.h,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  semanticsLabel: 'New Message heading',
                ),
                Semantics(
                  label: 'Close button',
                  button: true,
                  child: IconButton(
                    icon:  Icon(
                      Icons.arrow_circle_up_outlined,
                      color: const Color(0xFF7F7F7F),
                      size: 4.h,
                    ),
                    onPressed: () {
                      // Handle close button press
                    },
                  ),
                ),
              ],
            ),
           SizedBox(height: 2.h),
            Form(
              child: Column(
                children: [

                  TextFormField(
                    decoration:  InputDecoration(
                      labelText: 'To:',
                      labelStyle: TextStyle(
                        color: const Color(0xFF8E8E93),
                        fontSize: 2.h,
                        fontFamily: 'Poppins',
                        letterSpacing: -0.15,
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFC7C7CC),
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
      
                   SizedBox(height: 1.5.h,),
                  TextFormField(
                    cursorColor: Colors.white,
                    
                    initialValue: 'Elvis04xe@blail.com',
                    decoration:  InputDecoration(
                      labelText: 'Cc/Bcc, From:',
                      labelStyle: TextStyle(
                        color: const Color(0xFF8E8E93),
                        fontSize: 2.h,
                        fontFamily: 'Poppins',
                        letterSpacing: -0.15,
                      ),

                      focusColor: Colors.white,
                      border: const UnderlineInputBorder(
                        
                        borderSide: BorderSide(
                          color: Color(0xFFC7C7CC),
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
      
                  SizedBox(height: 2.h,),
                  TextFormField(
                    decoration:  InputDecoration(
                      labelText: 'Subject:',
                      labelStyle: TextStyle(
                        color: const Color(0xFF8E8E93),
                        fontSize: 2.h,
                        fontFamily: 'Poppins',
                        letterSpacing: -0.15,
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFC7C7CC),
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),

                  SizedBox(height: 4.h),

                   TextFormField(
                    maxLines: 2,
                    
                    decoration:  InputDecoration(
                      labelText: 'Compose',
                      labelStyle: TextStyle(

                        color: const Color(0xFF8E8E93),
                        fontSize: 2.h,
                      
                        fontFamily: 'Poppins',
                        letterSpacing: -0.15,
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFC7C7CC),
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),

                ],
              ),
            ),
          
      SizedBox(height: 20.h,),
    
      
      FloatingActionButton.extended(
        onPressed: (){}, 
        extendedPadding: EdgeInsets.symmetric(horizontal: 120),
        label: Text('Send', style: TextStyle(
          fontSize: 2.5.h,
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: Colors.white,)
          ],
        ),
      )),
    );
  }
}
















