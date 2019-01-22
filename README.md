# Flutter尝鲜

每天一点点，快乐多一点。

##### 热重载 

与webpack一样，修改后执行重新加载能快速在模拟机上看到。

## 环境布置 Flutter 到 AS 中

##### 1、配置Flutter全局变量

下载对应的Flutter,将以下目录地址添加到用户变量的Path中，如果用户变量有PUB_HOSTED_URL和FLUTTER_STORAGE_BASE_URL条目，同样添加上。

	flutter\bin

##### 2、AS中安装Flutter和Dart两个插件

##### 3、验证flutter设置

在对应的根目录下，打开flutter_console.bat，在打开的命令行窗口输入。

	flutter doctor

会根据情况显示配置环境信息，需要添加 licences ，这之前需要配置androidSDK的位置。

	../Android/sdk					配置到全局变量ANDROID_HOME中
	%ANDROID_HOME%\tools 			配置到用户变量Path中

在flutter命令行窗口输入代码完成许可证，输入后按步骤输入y 

	flutter doctor --android-licenses




### 部署遇到的问题：

问题1：初次启动项目，提示以下信息

	Finished with error: Please review your Gradle project setup in the android/folder.

需要全局变量ANDROID_HOME来设置地址，如果未配置，local.properties的路径会自动修改到默认路径。

问题2 Waiting for another flutter command to release the startup lock...

项目异常关闭后，启动会出现上面一行话，需要删除以下目录文件重新运行

 	flutter/bin/cache/lockfile

问题3 pubspec.yaml导入图片时，格式不正确造成导入失败

以下三个需要左对齐

    uses-material-design: true
    assets:
    - images/logo.png

Flutter中文网进度：https://flutterchina.club/tutorials/layout/
Flutter官网进度：https://flutter.io/docs/development/ui/layout/tutorial



