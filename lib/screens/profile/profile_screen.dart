import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OpenFlutterScaffold(
        body: ProfileWrapper(),
        bottomMenuIndex: 4,
      ),
    );
  }
}

class ProfileWrapper extends StatefulWidget {
  @override
  _ProfileWrapperState createState() => _ProfileWrapperState();
}

class _ProfileWrapperState extends State<ProfileWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40.0,left: 10.0),
                  child: Container(
                    child: Text(
                      "My profile",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 34.0),
                    )
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                ListTile(
                  
                  leading: Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/profile/user-profile.jpeg"))),
                  ),
                  title: Text(
                    "Matilda Brown",
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "matildabrown@mail.com",
                    style: TextStyle(
                        color: AppColors.lightGray,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                InkWell(
                  child: ListTile(

                    title: Text(
                      "My orders",
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "Already Have 12 orders",
                      style: TextStyle(
                          color: AppColors.lightGray,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  onTap: () {},
                ),
                Divider(),
                InkWell(
                  child: ListTile(
                   
                       
                    title: Text(
                      "Shipping addresses",
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "3 addresses",
                      style: TextStyle(
                          color: AppColors.lightGray,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  onTap: () {},
                ),
                Divider(),
                InkWell(
                  child: ListTile(
                    
                    title: Text(
                      "Payments methods",
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "visa **34",
                      style: TextStyle(
                          color: AppColors.lightGray,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  onTap: () {},
                ),
                Divider(),
                InkWell(
                  child: ListTile(
                   
                    title: Text(
                      "Promocodes",
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "You hve special promocodes",
                      style: TextStyle(
                          color: AppColors.lightGray,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  onTap: () {},
                ),
                Divider(),
                InkWell(
                  child: ListTile(
                    
                    title: Text(
                      "My reviews",
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "review for 4 items",
                      style: TextStyle(
                          color: AppColors.lightGray,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  onTap: () {},
                ),
                Divider(),
                InkWell(
                  child: ListTile(
                    
                    title: Text(
                      "Settings",
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "Notification, Password",
                      style: TextStyle(
                          color: AppColors.lightGray,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  onTap: () {},
                )
              ],
            )
          ],
        ));
  }
}
