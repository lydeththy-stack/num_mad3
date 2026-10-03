import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:num_mad3/apps/my_app.dart';
import 'package:num_mad3/providers/color_provider.dart';
import 'package:num_mad3/providers/theme_provider.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}
class _SettingScreenState extends ConsumerState<SettingScreen> {
   int _imageSelectedIndex = 0;
   final List<String> piclList = [
    "images/1.jfif",
    "images/2.jfif",
    "images/3.jfif",
    "images/4.jpg",
    "images/5.jpg",
    "images/6.jpg",
    "images/7.jpg",
    
  ];
  @override
  Widget build(BuildContext context) {
    bool dark=ref.watch(themeProvider);

     

    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(piclList[_imageSelectedIndex]),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primaryContainer,
                BlendMode.softLight,
              ),
            ),
          ),
          child: ListView(
            children:[_buildDarkModeSwitch(dark), _buildColorGridView(),_buildImageGridView()],
            ),
          
        ),
      );
  }


Widget _buildDarkModeSwitch( bool dark){
  return Card(
    child: SwitchListTile(
                title: Text("Dark Mode"),
                subtitle: Text("Currently in ${ dark ? "dark":"light"} mode"),
                value: dark,
                onChanged: (v){
                  ref.read(themeProvider.notifier).toggleDark();
                },
              ),
  );
}
Widget _buildImageGridView() {
  final double space = 8;
  
  return SizedBox(
      height: 150,
   child: Card(
    child: GridView.builder(
      padding: EdgeInsets.all(space),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics:AlwaysScrollableScrollPhysics(),

      itemCount: piclList.length,

      gridDelegate:
         SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: space,
        crossAxisSpacing: space,
        maxCrossAxisExtent: 150,
      ),

      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              _imageSelectedIndex = index;
            });
          },

          child: ClipRRect(
            borderRadius: BorderRadius.circular(space),
            child: Image.asset(
              piclList[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    ),),
  );
}
int _selectedIndex = 0;
Widget _buildColorGridView(){
  _selectedIndex = ref.watch(colorProvider);
  final double space = 8;
  return SizedBox(
      height: 100,
      child: Card(
    child: GridView.builder(
      padding: EdgeInsets.all(space),
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: colorList.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: space,
        crossAxisSpacing: space,
        maxCrossAxisExtent: 100,),
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              ref.read(colorProvider.notifier).changeIndex(index);
            },
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(space),
              child: Container(
                color: colorList[index],
                alignment: Alignment.center,
                child: _selectedIndex == index
                ? Container(width:30, height:30, color:Colors.white)
                : SizedBox(),),)
            
          );
        },
    ),),
  );
}
}            
              
          
      