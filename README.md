# DLNavigationTransition
一行代码搞定右滑返回功能
## 效果图：
![image](https://github.com/qindeli/DLNavigationTransition/raw/master/效果图.gif)

### 只需要一行代码即可：

`
[DLNavigationTransition enableNavigationTransitionWithPanGestureBack];//开启右滑返回手势
`

#### 注意：
 1.一定要在appDelegate里面开启，并且在UINavigationController初始化之前，否则没有效果。<br>
 2.如果用的storyboard，直接在appDelegate类didFinishLaunchingWithOptions开启即可。
 
 具体用法看Demo
