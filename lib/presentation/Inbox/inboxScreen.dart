// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

import 'create_message.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});
    

  // Function to handle BottomNavigationBar taps
 
  @override
  State<InboxScreen> createState() => _InboxScreenState();
}


class _InboxScreenState extends State<InboxScreen> {
   int _selectedIndex = 0;

  // List of pages for each tab
  final List<Widget> _pages = [
    const EmailScreen(),
    const NewMessageScreen(),
    const Center(
      child: Text(
        'Profile',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    ),
  ];

  // Function to handle BottomNavigationBar taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 6.h, // Adjust height if needed
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Semantics(
              label: 'Menu',
              button: true,
              child: IconButton(
                icon: Transform.rotate(
                  angle: 1.5707963267948966,
                  child:  Icon(
                    Icons.menu,
                    color: Color(0xFF7F7F7F),
                    size: 2.h,
                  ),
                ),
                onPressed: () {
                  // Handle menu button press
                },
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,

              children: [
      
                 SizedBox(width: 2.h),
                Semantics(
                  label: 'Favorites',
                  button: true,
                  child: IconButton(
                    icon:  Icon(
                      Icons.favorite_border,
                      color: Color(0xFF7F7F7F),
                      size: 2.5.h,
                    ),
                    onPressed: () {
                      // Handle favorites button press
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Semantics(
                  label: 'Profile',
                  button: true,
                  child: IconButton(
                    icon:  Icon(
                      Icons.history,
                      color: Color(0xFF7F7F7F),
                      size: 2.5.h,
                    ),
                    onPressed: () {
                      // Handle profile button press
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        automaticallyImplyLeading: false, // Disables default back button
      ),

      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        useLegacyColorScheme: false,
        elevation: 3,
        iconSize: 2.5.h,
        selectedLabelStyle: TextStyle(
          fontSize: 1.5.h
        ),
        unselectedItemColor: const Color(0xFF7F7F7F),
        type: BottomNavigationBarType.fixed,
        selectedItemColor:  const Color(0xFF146FFF),
        backgroundColor: const Color(0xFF0B0B0B),
        currentIndex: _selectedIndex, // Highlight the selected tab
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            
            icon: ImageIcon(AssetImage('assets/Logos/envelope.png')),
            label: 'E-mail',
            
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/Logos/file-edit.png')),
            label: 'New Mail',
          ),
 BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(
              'assets/Logos/user.png')),
            label: 'Profile',
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 1.2.h,),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 70.w,
            height: 5.h,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                decoration: BoxDecoration(
          color: Colors.transparent, 
          border: Border.all(
            width: 1,
            color: Color(0xFF7F7F7F),
          ),// Background color
          borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
             // Search icon
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                 
                  border: InputBorder.none
                  // Remove default border
                ),
              ),
            ),
            Semantics(
                    label: 'Search',
                    button: true,
                    child: IconButton(
                      icon:  Icon(
                        Icons.search,
                        color: Color(0xFF7F7F7F),
                        size: 2.5.h,
                      ),
                      onPressed: () {
                        // Handle search button press
                      },
                    ),
                  ),
          ],
                ),
              ),
        ),

          Image.asset('assets/images/voice tracker.gif'),
            Body(pages: _pages, selectedIndex: _selectedIndex),
          ],
      )
      );
    }
  }

class Body extends StatelessWidget {
  const Body({
    super.key,
    required List<Widget> pages,
    required int selectedIndex,
  }) : _pages = pages, _selectedIndex = selectedIndex;

  final List<Widget> _pages;
  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
        child: Column(
          children: [
           
              _pages[_selectedIndex],
            ],
          ),
        ),
    );
  }
}







class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
       _buildConversationEntry(
   'https://media.istockphoto.com/id/1316604492/photo/profile-portrait-of-middle-aged-man-over-grey-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=zKLBo6kzptiN_TioRA__V-67rK0xndvyg7Ldx4bMqQY=',
   'Suzy Lami',
  '45 min ago',
  'Weekly update',
  'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  'https://img.freepik.com/free-vector/instagram-icon_1057-2227.jpg?semt=ais_hybrid',
  'weekly-update.teams'
),

  _buildConversationEntry(
    'https://media.istockphoto.com/id/1389361465/photo/profile-portrait-of-smiling-black-man-in-studio.webp?a=1&b=1&s=612x612&w=0&k=20&c=ivVIBsDAYmDXJMo2V6rm886E6utRCKPZY3B0npYx4E4=',
    'Suzy Lami',
  '45 min ago',
  'Weekly update',
  'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  'https://img.freepik.com/free-vector/new-twitter-logo-x-icon-black-background_1017-45427.jpg?ga=GA1.1.807243258.1738109013&semt=ais_hybrid',
  'weekly-update.teams'
),

  _buildConversationEntry(
    'https://images.unsplash.com/photo-1557862921-37829c790f19?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YSUyMG1hbiUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
    'Macmillain px',
  '45 min ago',
  'Fast Check',
  'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  'https://img.freepik.com/free-psd/whatsapp-icon-isolated-3d-render-illustration_47987-9785.jpg?ga=GA1.1.807243258.1738109013&semt=ais_hybrid',
  'weekly-update.teams'
),

  _buildConversationEntry(
       'https://media.istockphoto.com/id/1389361465/photo/profile-portrait-of-smiling-black-man-in-studio.webp?a=1&b=1&s=612x612&w=0&k=20&c=ivVIBsDAYmDXJMo2V6rm886E6utRCKPZY3B0npYx4E4=',
    'James Nv',
  '45 min ago',
  'Notice',
  'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  'https://img.freepik.com/free-photo/link-icon-right-side_187299-39509.jpg?ga=GA1.1.807243258.1738109013&semt=ais_hybrid',
  'weekly-update.teams'
),
       _buildConversationEntry(
   'https://media.istockphoto.com/id/1316604492/photo/profile-portrait-of-middle-aged-man-over-grey-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=zKLBo6kzptiN_TioRA__V-67rK0xndvyg7Ldx4bMqQY=',
   'Suzy Lami',
  '45 min ago',
  'Weekly update',
  'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  'https://img.freepik.com/free-vector/instagram-icon_1057-2227.jpg?semt=ais_hybrid',
  'weekly-update.teams'
),

  _buildConversationEntry(
    'https://media.istockphoto.com/id/1389361465/photo/profile-portrait-of-smiling-black-man-in-studio.webp?a=1&b=1&s=612x612&w=0&k=20&c=ivVIBsDAYmDXJMo2V6rm886E6utRCKPZY3B0npYx4E4=',
    'Suzy Lami',
  '45 min ago',
  'Weekly update',
  'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  'https://img.freepik.com/free-vector/new-twitter-logo-x-icon-black-background_1017-45427.jpg?ga=GA1.1.807243258.1738109013&semt=ais_hybrid',
  'weekly-update.teams'
),

  _buildConversationEntry(
    'https://images.unsplash.com/photo-1557862921-37829c790f19?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YSUyMG1hbiUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
    'Macmillain px',
  '45 min ago',
  'Fast Check',
  'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  'https://img.freepik.com/free-psd/whatsapp-icon-isolated-3d-render-illustration_47987-9785.jpg?ga=GA1.1.807243258.1738109013&semt=ais_hybrid',
  'weekly-update.teams'
),

  _buildConversationEntry(
       'https://media.istockphoto.com/id/1389361465/photo/profile-portrait-of-smiling-black-man-in-studio.webp?a=1&b=1&s=612x612&w=0&k=20&c=ivVIBsDAYmDXJMo2V6rm886E6utRCKPZY3B0npYx4E4=',
    'James Nv',
  '45 min ago',
  'Notice',
  'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  'https://img.freepik.com/free-photo/link-icon-right-side_187299-39509.jpg?ga=GA1.1.807243258.1738109013&semt=ais_hybrid',
  'weekly-update.teams'
),






        
      ],
    );
  }

  Widget _buildConversationEntry(
      String avatarUrl,
      String senderName,
      String time,
      String title,
      String description,
      String attachmentUrl,
      String attachmentName) {
    return ListTile(
      onTap: () {
        // Navigator.pushNamed(context, '/message');
      },
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          CircleAvatar(
  backgroundImage: NetworkImage(avatarUrl),
  radius: 2.h, // Adjust the size as needed
  child: ClipOval(
    child: Image.network(
      avatarUrl,
      width: 50, // Adjust size as needed
      height: 50,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            color: Color.fromARGB(255, 155, 155, 155),
            strokeWidth: 3,
          ),
        );
      },
    ),
  ),
),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        senderName,
                        style: TextStyle(
                          color: Color.fromRGBO(248, 250, 252, 0.8),
                          fontSize: 2.h,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        time,
                        style:  TextStyle(
                          color: Color.fromRGBO(127, 127, 127, 1),
                          fontSize: 1.6.h,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style:  TextStyle(
                          color: Color.fromRGBO(248, 250, 252, 1),
                          fontSize: 1.8.h,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      attachmentUrl.isNotEmpty
                          ? Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(20, 111, 255, 1),
                                shape: BoxShape.circle,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  const SizedBox(height: 4),
                  if (description.isNotEmpty)
                    Text(
                      description,
                      style: const TextStyle(
                        color: Color.fromRGBO(127, 127, 127, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  if (attachmentUrl.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(53, 55, 57, 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Image.network(
                              attachmentUrl,
                              width: 14,
                              height: 14,
                              loadingBuilder: (context, child, progress) {
                                return progress == null
                                    ? child
                                    : const Center(child: CircularProgressIndicator());
                              },
                            ),
                            const SizedBox(width: 8),
                            Text(
                              attachmentName,
                              style: const TextStyle(
                                color: Color.fromRGBO(145, 145, 145, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}







class SearchBar extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: "Search...",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
