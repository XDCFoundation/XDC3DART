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
    final BigInt transfer_value = BigInt.parse(stdin.readLineSync()!);
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
    final BigInt transferfrom_value = BigInt.parse(stdin.readLineSync()!);
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
    var getTransferXDC =
        await obj.transferXDC(ownerPrivatekey, receiver_Addr, xdc_value);
    print('Hash : $getTransferXDC\n');
  }

  xrc20();
}
