import 'dart:convert';
import 'dart:io';
import 'dart:core';
import 'package:crypto/crypto.dart';
import 'package:xdc3dart/xdc3dart.dart';

void main() async {
  /// createAccount Method.
  print('createAccount Method');
  var object = new Keys();
  // object.createAcount();
  var pair = object.createAcount();
  final public = pair.publicKey;
  final private = pair.privateKey;

  var private_key = private.hashCode.toString();
  var public_key = public.hashCode.toString();
  var bytes = utf8.encode(public_key); //Public
  var bytesPrivate = utf8.encode(private_key); //Private
  var sha1Result = sha1.convert(bytes);
  var sha256Result = sha256.convert(bytesPrivate);

  print('Address: xdc$sha1Result');
  print('Private Key : $sha256Result');

  /// We're calling the XRC20 Methods class here..
  var obj = new XRC20();
  void xrc20() async {
    /// Name Method
    print('--- Name Method ---');
    print("Enter Token address : ");
    String name_ = (stdin.readLineSync()!);
    var getName = await obj.name(name_);
    print('tokenName : $getName\n');

    /// Symbol Method
    print('--- Symbol Method---');
    print("Enter Token address: ");
    String symbol_ = (stdin.readLineSync()!);
    var getSymbol = await obj.symbol(symbol_);
    print('tokenSymbol : $getSymbol\n');
    print('---- Decimals Method ----');
    print("Enter Token address: ");

    /// Decimals Method
    String decimals_ = (stdin.readLineSync()!);
    var getdecimals = await obj.decimals(decimals_);
    print('decimals : $getdecimals\n');
    print('---- totalSupply Method ---- ');
    print("Enter Token address: ");

    /// totalSupply Method
    String totalSupply_ = (stdin.readLineSync()!);
    var getTotalSupply = await obj.totalSupply(totalSupply_);
    print('tokenTotalSupply : $getTotalSupply\n');

    /// Balance Method
    print('---- BalanceOf Method ---- ');
    print("Enter Token address: ");
    String contractAdd = (stdin.readLineSync()!);
    print("Enter owner address: ");
    String ownerAdd = (stdin.readLineSync()!);
    var getBalanceOf = await obj.balanceOf(contractAdd, ownerAdd);
    print('tokenBalanceOf : $getBalanceOf\n');

    /// Approve Method
    print('---- Approve Method ----');
    print('Enter Owner Private Key :');
    final String owner_PrivateKey = (stdin.readLineSync()!);
    print("Enter Token address: ");
    String contractadd = (stdin.readLineSync()!);
    print('Enter How much token you want to approve :');
    final int approve_value = int.parse(stdin.readLineSync()!);
    print("Enter Spender Address :");
    String spenderAdd = (stdin.readLineSync()!);
    var getApprove = await obj.approve(
        owner_PrivateKey, contractadd, spenderAdd, approve_value);
    print(
        'Permission granted to this account ( $spenderAdd ) to use upto $approve_value tokens from this Owner Account.');
    print('Hash : $getApprove\n');

    /// Allowance Method
    print(' ---- Allowance Method ----');
    print("Enter Owner Address :");
    String ownerAdd_ = (stdin.readLineSync()!);
    print("Enter Token address: ");
    String contractAdd_ = (stdin.readLineSync()!);
    print("Enter Spender Address :");
    String spenderAdd_ = (stdin.readLineSync()!);
    var getAllowance =
        await obj.allowance(ownerAdd_, contractAdd_, spenderAdd_);
    print('tokenAllowance : $getAllowance\n');

    /// Increase Allowance Method
    print(' ---- Increase Allowance Method ----');
    print('Enter Owner Private Key :');
    final String ownerPrivateKey = (stdin.readLineSync()!);
    print("Enter Token address: ");
    String contract_Add = (stdin.readLineSync()!);
    print("Enter Spender Address :");
    String spender_Add = (stdin.readLineSync()!);
    print('Enter value you want to increase : ');
    final BigInt value = BigInt.parse(stdin.readLineSync()!);
    var getIncreaseAllowance = await obj.increaseAllowance(
        ownerPrivateKey, contract_Add, spender_Add, value);
    print('Allowance increased by $value');
    print('tokenIncreaseAllowance : $getIncreaseAllowance\n');

    /// Decrease Allowance Method
    print(' ---- Decrease Allowance Method ----');
    print('Enter Owner Private Key :');
    final String ownerPrivateKey_ = (stdin.readLineSync()!);
    print("Enter Token address: ");
    String contract_Addr = (stdin.readLineSync()!);
    print("Enter Spender Address :");
    String spender_Addr = (stdin.readLineSync()!);
    print('Enter value you want to decrease : ');
    final BigInt value_ = BigInt.parse(stdin.readLineSync()!);
    var getDecreaseAllowance = await obj.decreaseAllowance(
        ownerPrivateKey_, contract_Addr, spender_Addr, value_);
    print('Allowance decreased by $value');
    print('tokenDecreaseAllowance : $getDecreaseAllowance\n');

    /// Transfer Method
    print('----Transfer Method----');
    print('Enter Owner Private Key :');
    final String _ownerPrivateKey = (stdin.readLineSync()!);
    print("Enter Token address: ");
    String _contractAddr = (stdin.readLineSync()!);
    print("Enter Owner Address :");
    String _ownerAdd = (stdin.readLineSync()!);
    print("Enter Receiver Address :");
    String receiverAdd = (stdin.readLineSync()!);
    print('Enter How much token you want to transfer! ');
    num transfer_value = int.parse(stdin.readLineSync()!);
    var getTransfer = await obj.transfer(_ownerPrivateKey, _contractAddr,
        _ownerAdd, receiverAdd, transfer_value);
    print('Hash : $getTransfer\n');

    /// TransferFrom Method
    print('----TransferFrom Method----');
    print("Enter Token address: ");
    String contractAddres_ = (stdin.readLineSync()!);
    print("Enter Spender Address :");
    String _spenderAddr = (stdin.readLineSync()!);
    print("Enter Receiver Address :");
    String receiver_Address = (stdin.readLineSync()!);
    print('Enter How much token you want to transfer! ');
    final int transferfrom_value = int.parse(stdin.readLineSync()!);
    print('Enter Spender Private Key :');
    final String SpenderPrivatekey = (stdin.readLineSync()!);
    print('Enter Owner Address');
    final String ownerAddress_ = (stdin.readLineSync()!);
    var getTransferForm = await obj.transferFrom(contractAddres_, _spenderAddr,
        receiver_Address, transferfrom_value, SpenderPrivatekey, ownerAddress_);
    print('Hash : $getTransferForm\n');

    /// Transfer XDC Method
    print('---- transfer XDC method ----');
    print('Enter Owner Private Key :');
    final String ownerPrivatekey = (stdin.readLineSync()!);
    print("Enter Receiver Address :");
    String receiver_Addr = (stdin.readLineSync()!);
    print('How much XDC you want to transfer :');
    final int xdc_value = int.parse(stdin.readLineSync()!);
    print("Enter Owner Address :");
    String ownerAddresss = (stdin.readLineSync()!);

    var getTransferXDC = await obj.transferXDC(
        ownerPrivatekey, receiver_Addr, xdc_value, ownerAddresss);
    print('Hash : $getTransferXDC\n');
  }

  xrc20();
}

var obj = new XRC721();
void xrc721() async {
  // /// Name Method
  print('--- Name Method ---');
  print("Enter Token address : ");
  String token_address = (stdin.readLineSync()!);
  var getName = await obj.name(token_address);
  print('tokenName : $getName\n');

  // /// Symbol Method
  print('--- Symbol Method---');
  print("Enter Token address: ");
  String tokenAddress = (stdin.readLineSync()!);
  var getSymbol = await obj.symbol(tokenAddress);
  print('tokenSymbol : $getSymbol\n');

  // /// totalSupply Method
  print('--- totalSupply Method---');
  print("Enter Token address: ");
  String tokenAddr_ = (stdin.readLineSync()!);
  var getTotalSupply = await obj.totalSupply(tokenAddr_);
  print('tokenTotalSupply : $getTotalSupply\n');

  /// Balance Method
  print('---- BalanceOf Method ---- ');
  print("Enter Token address: ");
  String ___contractAdd___ = (stdin.readLineSync()!);
  print("Enter owner address: ");
  String ___ownerAdd___ = (stdin.readLineSync()!);
  var getBalanceOf = await obj.balanceOf(___contractAdd___, ___ownerAdd___);
  print('tokenBalanceOf : $getBalanceOf\n');

  // // /// ownerOf Method
  print('---- ownerOf Method ---- ');
  print("Enter Token address: ");
  String _tokenAddr = (stdin.readLineSync()!);
  print("Enter tokenID address: ");
  BigInt tokenID = BigInt.parse(stdin.readLineSync()!);
  var getownerOf = await obj.ownerOf(tokenID, _tokenAddr);
  print('tokenOwnerOf : $getownerOf\n');

  // /// tokenURI Method
  print('---- tokenURI Method ---- ');
  print("Enter Token address: ");
  String tokenAddr__ = (stdin.readLineSync()!);
  print("Enter tokenID address: ");
  BigInt token_id = BigInt.parse(stdin.readLineSync()!);
  var getTokenURI = await obj.tokenURI(token_id, tokenAddr__);
  print('tokenURI : $getTokenURI\n');

  // /// supportInterface Method
  print('---- supportInterface Method ---- ');
  print("Enter Token address: ");
  String token_add_ = (stdin.readLineSync()!);
  print("Enter interfaceId address: ");
  String interfaceId = stdin.readLineSync()!;
  final interface_id = utf8.encode(interfaceId);
  var supportInterface = await obj.supportInterface(interface_id, token_add_);
  print('supportsInterface : $supportInterface\n');

  // /// getApproved Method
  print('---- getApproved Method ---- ');
  print("Enter Token address: ");
  String _tokenAdd_ = (stdin.readLineSync()!);
  print("Enter tokenId : ");
  BigInt tokenId_ = BigInt.parse(stdin.readLineSync()!);
  var getApproved = await obj.getApproved(tokenId_, _tokenAdd_);
  print('getApproved : $getApproved');

  // / tokenByIndex Method
  print('---- tokenByIndex Method ---- ');
  print("Enter Token address: ");
  String _token_Add_ = (stdin.readLineSync()!);
  print("Enter token Index : ");
  BigInt index = BigInt.parse(stdin.readLineSync()!);
  var getTokenByIndex = await obj.tokenByIndex(index, _token_Add_);
  print('getTokenByIndex : $getTokenByIndex');

  /// tokenofOwnerByIndex Method
  print('---- tokenofOwnerByIndex Method ---- ');
  print("Enter Token address: ");
  String _token__Add_ = (stdin.readLineSync()!);
  print("Enter owner address: ");
  String ownerrAddr = (stdin.readLineSync()!);
  print("Enter token Index : ");
  BigInt index_ = BigInt.parse(stdin.readLineSync()!);
  var getTokenofOwnerByIndex =
      await obj.tokenofOwnerByIndex(index_, _token__Add_, ownerrAddr);
  print('getTokenByIndex : $getTokenofOwnerByIndex');

  // /// isApproved Method
  print('---- isApproved Method ---- ');
  print("Enter Token address: ");
  String __tokenAdd_ = (stdin.readLineSync()!);
  print("Enter owner address: ");
  String ownerr_Addr = (stdin.readLineSync()!);
  print("Enter spender address: ");
  String spender_addr__ = (stdin.readLineSync()!);
  var isApproved =
      await obj.isApproved(__tokenAdd_, ownerr_Addr, spender_addr__);
  print('getApproved : $isApproved');

  //   /// Approve Method
  print('---- Approve Method ----');
  print('Enter Owner Private Key :');
  final String owner_PrivateKey = (stdin.readLineSync()!);
  print("Enter Token address: ");
  String contractadd = (stdin.readLineSync()!);
  print('Enter token id :');
  final BigInt token__ID = BigInt.parse(stdin.readLineSync()!);
  print("Enter Spender Address :");
  String spenderAdd = (stdin.readLineSync()!);
  var getApprove =
      await obj.approve(owner_PrivateKey, contractadd, spenderAdd, token__ID);
  print('Hash : $getApprove\n');

  /// setApprove Method
  print('---- setApprove Method ----');
  print('Enter Owner Private Key :');
  final String owner___PrivateKey = (stdin.readLineSync()!);
  print("Enter Token address: ");
  String contract___add = (stdin.readLineSync()!);
  print('Enter bool value :');
  final bool boolValue = true;
  print("Enter Spender Address :");
  String spender___Add = (stdin.readLineSync()!);
  var setApprove = await obj.setApproveofAll(
      owner___PrivateKey, contract___add, spender___Add, boolValue);
  print('Hash : $setApprove\n');

  // / safeTransferFrom Method
  print('----safeTransferFrom Method----');
  print("Enter Token address: ");
  String contractAddres__ = (stdin.readLineSync()!);
  print("Enter Spender Address :");
  String __spenderAddr = (stdin.readLineSync()!);
  print("Enter Receiver Address :");
  String receiver__Address = (stdin.readLineSync()!);
  print('Enter token id : ');
  final BigInt token_id_ = BigInt.parse(stdin.readLineSync()!);
  print('Enter Spender Private Key :');
  final String Spender_Privatekey = (stdin.readLineSync()!);
  print('Enter Owner Address');
  final String ownerAddress__ = (stdin.readLineSync()!);
  var getsafeTransferForm = await obj.safetransferFrom(
      contractAddres__,
      __spenderAddr,
      receiver__Address,
      token_id_,
      Spender_Privatekey,
      ownerAddress__);
  print('Hash : $getsafeTransferForm\n');

  // / TransferFrom Method
  print('----TransferFrom Method----');
  print("Enter Token address: ");
  String _contractAddres__ = (stdin.readLineSync()!);
  print("Enter Spender Address :");
  String __spenderAddr_ = (stdin.readLineSync()!);
  print("Enter Receiver Address :");
  String receiver__Address_ = (stdin.readLineSync()!);
  print('Enter token id : ');
  final BigInt token_id__ = BigInt.parse(stdin.readLineSync()!);
  print('Enter Spender Private Key :');
  final String Spender__Privatekey = (stdin.readLineSync()!);
  print('Enter Owner Address');
  final String owner_Address__ = (stdin.readLineSync()!);
  var getTransferForm = await obj.transferFrom(
      _contractAddres__,
      __spenderAddr_,
      receiver__Address_,
      token_id__,
      Spender__Privatekey,
      owner_Address__);
  print('Hash : $getTransferForm\n');

  xrc721();
}
