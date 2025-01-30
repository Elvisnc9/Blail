
import 'package:flutter/material.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class NewMessageScreen extends StatelessWidget {
  const NewMessageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
     SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'New Message',
                  style: TextStyle(
                    color: Colors.grey[50],
                    fontSize: 3.h,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  semanticsLabel: 'New Message heading',
                ),
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
                  initialValue: 'j.appleseed@icloud.com',
                  decoration:  InputDecoration(
                    labelText: 'Cc/Bcc, From:',
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
              ],
            ),
          ),




Padding(
  padding:  EdgeInsets.symmetric(vertical: 15.h),
  child: InkWell(
    onTap: () {
      // Action
    },
    child:  Container(
      width: 40.h,
              padding:  EdgeInsets.symmetric( vertical: 1.2.h),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(127, 127, 127, 1),
                  width: 0.8,
                ),
             
              ),
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            Icon(Icons.send, color: Color.fromRGBO(127, 127, 127, 1)),
            SizedBox(width: 10,), 
            Text('Send', style: TextStyle(color: Color.fromRGBO(127, 127, 127, 1))),
          ],
        ),
      ),
    ),
  ),
)
        ],
      ),
    );
  }
}



