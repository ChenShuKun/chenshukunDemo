# chenshukunDemo
1、add  NSString+FontAwesome.h/.m and FontAwesome.ttf into your project         
2、step into .plist and add a row named "Fonts provided by application" ,under this add FontAwesome.ttf       
    3、 #import "NSString+FontAwesome.h" where you use it
4、creat a button  for example as usual

for example:      
[button setTitle:[NSString fontAwesomeIconStringForEnum:FAIconGlass] forState:UIControlStateNormal];
[button setTitle:[NSString fontAwesomeIconStringForEnum:FAIconMusic] forState:UIControlStateSelected];


 
 

