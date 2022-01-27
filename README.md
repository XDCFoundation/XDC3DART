# XDC3DART

XDC DART SDK with support for XRC20.

## Example
```
Step by Step Process to use this repository.

        Step1 -> Clone this repository in Your project.
                            |
                            |
        Step2 -> Create a .dart file.
                            |
                            |
        step3 -> Import modoules as per required then call the class "XRC20"
                            |
                            |
        step4 -> From main fuction call name().
                            |
                            | 
        step5 -> Pass the arguments as fuction reqiured.
        
```

Available Operations in XRC20:- 1.getName 2.getSymbol 3.getDecimal 4.getTotalSupply 5.getBalanceOf 6.getAllowance 7.getApprove 8.increaseAllowance 9.decreaseAllowance 10.transferfrom 11.transferToken 12.transferXdc



## Installation

XDC3DART is available through [pub.dev](https://pub.dev). To install
it, simply add the following command to your project:

```
dart pub add XDC3DART
```

then import modules per required 
```
Import 'package:XDC3DART/XDC3DART.dart';
```

Create an instance of XDC3DART. This will provide you access to a set of functions interacting with the blockchain.
```
      final client = Web3Client(rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(wsUrl).cast<String>();

```

Now, we can interact with the XRC20 methods

XRC20 Read methods

name() → string Returns the name of the token.

    final name =
        await client.call(contract: contract, function: tokenName, params: []);
    return ('$name');
      
balanceOf(address token,address account) → uint256  Returns the amount of tokens owned by account.

     final balanceOf = await client.call(
        contract: contract, function: tokenBalanceOf, params: [ownerAddress]);
    return ('$balanceOf');
        
  


XRC20 Write methods

For write methods, we need token owner private keys

transfer(address token, address recipient, uint256 amount) → Moves amount tokens from the caller’s account to recipient. It will return a transaction hash.

```
      final transfer = await Transaction.callContract(
      from: ownAddress,
      contract: contract,
      function: tokenTransfer,
      parameters: [receiver, transfer_value],
    );

    final transferDetails = await client.sendTransaction(credentials, transfer,
        chainId: null, fetchChainIdFromNetworkId: true);
    return ('$transferDetails');
  
  
```
approve(address token, address spender, uint256 amount) → Sets amount as the allowance of spender over the caller’s tokens. It will return a transaction hash.

```
    final approve = await Transaction.callContract(
        contract: contract,
        function: tokenApprove,
        parameters: [spender, BigInt.from(approve_value)]);
    final approvel = await client.sendTransaction(credentials, approve,
        chainId: null, fetchChainIdFromNetworkId: true);
    return ('$approvel');

``` 

For increaseAllowance and decreaseAllowance we need an instance of XRC20 and private key of owner: 
 
increaseAllowance(XDCAccount account, address token, address owner, address spender, uint256 subtractedValue)
Automically increases the allowance granted to spender by the caller.

This is an alternative to approve.

Emits an Approval event indicating the updated allowance.

```
## Author

XDCFoundation, XFLW@xinfin.org

## License

XDC3DART is available under the MIT license. See the LICENSE file for more info.
