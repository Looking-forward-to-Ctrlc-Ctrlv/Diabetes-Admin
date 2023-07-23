import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Welcome Test_Admin',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold, // Make the statement bold
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        actions: [
          ProfileWidget(),
          SizedBox(width: 16),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Center(
          child: Text(
            'Home Page Content',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: SizedBox(
          height: 40,
          child: ElevatedButton.icon(
            onPressed: () {
              _showDoctorFormOverlay(context);
            },
            label: Text(
              'Add a New Doctor',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold, // Make the text bold
                fontSize: 14,
                color: Colors.white, // Change text color to white
              ),
            ),
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 18,
            ),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFF86851), // Change the button color to #F86851
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: Color(0xFF6373CC),
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.admin_panel_settings,
                size: 30,
              ),
              label: 'Admin',
            ),
          ],
        ),
      ),
    );
  }

  void _showDoctorFormOverlay(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DoctorFormOverlay();
      },
    );
  }
}

class DoctorFormOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Doctor Details',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6373CC),
                ),
              ),
              SizedBox(height: 16),
              _buildFormField('Name of the Doctor'),
              _buildFormField('Phone no'),
              _buildFormField('Email'),
              _buildFormField('Hospital Name'),
              _buildFormField('City'),
              ElevatedButton(
                onPressed: () {
                  // Add your logic here for adding a new doctor entry
                },
                child: Text(
                  'Add Entry',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold, // Make the text bold
                    fontSize: 14,
                    color: Colors.white, // Change text color to white
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary:
                      Color(0xFFF86851), // Change the button color to #F86851
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String fieldName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter the $fieldName',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            color: Color(0xFF6A696E),
          ),
          decoration: InputDecoration(
            fillColor: Color(0xFF6A696E).withOpacity(0.1),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showProfileOverlay(context);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
          image: DecorationImage(
            image: AssetImage('assets/profile_image.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void _showProfileOverlay(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('John Doe'),
          content: Text('Phone: 123-456-7890'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'App Drawer',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              // Add navigation logic for the Home page if needed
            },
          ),
          // Add more list tiles for other pages in your app, if any
        ],
      ),
    );
  }
}
