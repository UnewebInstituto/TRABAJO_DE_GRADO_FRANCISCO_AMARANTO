@echo off
"C:\\Program Files\\Microsoft\\jdk-17.0.18.8-hotspot\\bin\\java" ^
  --class-path ^
  "C:\\Users\\duque\\.gradle\\caches\\modules-2\\files-2.1\\com.google.prefab\\cli\\2.1.0\\aa32fec809c44fa531f01dcfb739b5b3304d3050\\cli-2.1.0-all.jar" ^
  com.google.prefab.cli.AppKt ^
  --build-system ^
  cmake ^
  --platform ^
  android ^
  --abi ^
  arm64-v8a ^
  --os-version ^
  24 ^
  --stl ^
  c++_shared ^
  --ndk-version ^
  27 ^
  --output ^
  "C:\\Users\\duque\\AppData\\Local\\Temp\\agp-prefab-staging11582394770850858283\\staged-cli-output" ^
  "C:\\Users\\duque\\.gradle\\caches\\8.13\\transforms\\a5eb6650aace0b6e4adedd8cab5789b7\\transformed\\react-android-0.83.1-debug\\prefab" ^
  "C:\\Users\\duque\\.gradle\\caches\\8.13\\transforms\\4813793d41f8849bc08bce0054980715\\transformed\\hermes-android-0.14.0-debug\\prefab" ^
  "C:\\Users\\duque\\.gradle\\caches\\8.13\\transforms\\5a4fa8ef8d2ea5d84d321a2c8a409ee0\\transformed\\fbjni-0.7.0\\prefab"
