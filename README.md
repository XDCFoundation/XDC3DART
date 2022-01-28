# XDC3DART

XDC3DART SDK with support for smart contracts and XRC20.

## Usage

XDC3DART is available through [pub.dev](https://pub.dev). To install
it, run the following command from the terminal of your project:
```
dart pub add XDC3DART
```
Add the following import statement in the main file of your project.
```
Import 'package:XDC3DART/XDC3DART.dart';
```

This SDK supports following Read & Write operations in XRC20:-
```
  1.name 
  2.symbol 
  3.decimal 
  4.totalSupply 
  5.balanceOf 
  6.allowance 
  7.approve 
  8.increaseAllowance 
  9.decreaseAllowance 
  10.transferFrom 
  11.transferToken 
  12.transferXDC
```

## Network Connection Details

Open the connection file in the package and change it as per your requirements.
``` const String rpcUrl = 'https://rpc.apothem.network/';
    const String wsUrl = 'wss://ws.apothem.network/';
```

## Example
    import 'dart:io';
    import 'package:xdc3dart/xdc3dart.dart';
    
    var obj = new XRC20();
    void main async {     
        print("Enter Token address : ");
        String name_ = (stdin.readLineSync()!);
        var getName = await obj.name(name_);
        print('tokenName : $getName\n'); 
    }
    
This example returns name of the specified address.

The package has test methods (test/test.dart) for calling all XRC20 methods that you can refer.
