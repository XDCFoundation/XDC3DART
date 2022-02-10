# XDC3DART


XDC3DART SDK with support for smart contracts, XRC20 & XRC721.

## Usage
XDC3DART is available through [pub.dev](https://pub.dev). To install
it, simply add the following command to your project:

```
dart pub add xdc3dart
```

then import modules per required 
```
Import 'package:xdc3dart/xdc3dart.dart';
```


## This SDK supports following Read & Write operations:-
```
  |    XRC20 Token: Read methods                    |   XRC20 Token: Write methods                          |
  |     ---                                         |   ---                                                 | 
  |     name()                                      |   approve(receiverAddress , amount)                   |
  |     symbol()                                    |   transfer(recipient, amount)                         |
  |     decimal()                                   |   transferFrom(sender, recipient, amount)             |
  |     totalSupply()                               |   increaseAllowance(spender, addedValue)              |
  |     balanceOf(account)                          |   decreaseAllowance(spender, subtractedValue)         |
  |     allowance(owner, spender)                   |                                                       |
  |                                                 |                                                       |
                                            
  |    XRC721 Token: Read methods                   |   XRC721 Token: Write methods                         |
  |     ----                                        |   ----                                                |
  |     name()                                      |   setApprovalForAll(operatorAddress, booleanValue)    |
  |     symbol()                                    |   approve(receiverAddress , tokenId)                  |
  |     totalSupply()                               |   transferFrom(recipient, tokenId)                    |
  |     balanceOf(owner address)                    |   safeTransferFrom(spender, tokenId)                  |
  |     ownerOf(tokenId)                            |                                                       |
  |     tokenURI(tokenId)                           |                                                       |
  |     tokenByIndex(index)                         |                                                       |
  |     tokenOfOwnerByIndex(ownerAddress,index)     |                                                       |
  |     supportInterface(interfaceId)               |                                                       |
  |     getApproved(tokenId)                        |                                                       |
  |     isApprovedForAll(ownerAddress,operator)     |                                                       |
  |                                                 |                                                       |
             
```

Create an instance of XDC3DART. This will provide you access to a set of functions interacting with the blockchain.
```
      final client = Web3Client(rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(wsUrl).cast<String>();

```
## Example for XRC20
  name() → string Returns the name of the token.
  
```
 void main() async {
  var obj = new XRC20();
  print('--- Name Method ---');
  print("Enter Token address : ");
  String contractAdd = (stdin.readLineSync()!);
  var getName = await obj.name(contractAdd);
  print('tokenName : $getName\n');
}
  ```

This example returns name of the specified address.

## Example for XRC721
 name() → string Returns the name of the token.
 ```
void main() async {
  var obj = new XRC721();
  print('--- Name Method ---');
  print("Enter Token address : ");
  String name_ = (stdin.readLineSync()!);
  var getName = await obj.name(name_);
  print('tokenName : $getName\n');
}
 ```
 For other methods, you can take reference from the test folder. 
   

## Author
XDCFoundation, XFLW@xinfin.org

## License
- [x] XDC3DART is available under the MIT license. See the LICENSE file for more info.