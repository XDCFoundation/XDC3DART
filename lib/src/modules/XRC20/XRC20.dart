import 'dart:async';
import 'dart:math';

import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web3dart/credentials.dart';

/// Connection Import .
import 'package:xdc3dart/src/connection/connection.dart';

final String abiString =
    '[{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"spender","type":"address"},{"name":"tokens","type":"uint256"}],"name":"approve","outputs":[{"name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"totalSupply","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"from","type":"address"},{"name":"to","type":"address"},{"name":"tokens","type":"uint256"}],"name":"transferFrom","outputs":[{"name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"decimals","outputs":[{"name":"","type":"uint8"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"_totalSupply","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"tokenOwner","type":"address"}],"name":"balanceOf","outputs":[{"name":"balance","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"a","type":"uint256"},{"name":"b","type":"uint256"}],"name":"safeSub","outputs":[{"name":"c","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"to","type":"address"},{"name":"tokens","type":"uint256"}],"name":"transfer","outputs":[{"name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"a","type":"uint256"},{"name":"b","type":"uint256"}],"name":"safeDiv","outputs":[{"name":"c","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"a","type":"uint256"},{"name":"b","type":"uint256"}],"name":"safeMul","outputs":[{"name":"c","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"tokenOwner","type":"address"},{"name":"spender","type":"address"}],"name":"allowance","outputs":[{"name":"remaining","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"a","type":"uint256"},{"name":"b","type":"uint256"}],"name":"safeAdd","outputs":[{"name":"c","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"name":"from","type":"address"},{"indexed":true,"name":"to","type":"address"},{"indexed":false,"name":"tokens","type":"uint256"}],"name":"Transfer","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"tokenOwner","type":"address"},{"indexed":true,"name":"spender","type":"address"},{"indexed":false,"name":"tokens","type":"uint256"}],"name":"Approval","type":"event"}]';

final client = Web3Client(rpcUrl, Client(), socketConnector: () {
  return IOWebSocketChannel.connect(wsUrl).cast<String>();
});

/// Class for XRC20 Method.
class XRC20 {
  /// Gets the Name of the specified address.
  Future<String> name(String contractAdd) async {
    final EthereumAddress contractAddr = EthereumAddress.fromHex(contractAdd);
    final contract = DeployedContract(
        ContractAbi.fromJson(abiString, 'XRC20'), contractAddr);
    final tokenName = contract.function('name');
    final name =
        await client.call(contract: contract, function: tokenName, params: []);
    return '$name';
  }

  /// Gets the Symbol of the specified address.
  Future<String> symbol(String contractAdd) async {
    final EthereumAddress contractAddr = EthereumAddress.fromHex(contractAdd);
    final contract = DeployedContract(
        ContractAbi.fromJson(abiString, 'XRC20'), contractAddr);

    final tokenSymbol = contract.function('symbol');
    final symbol = await client
        .call(contract: contract, function: tokenSymbol, params: []);
    return '$symbol';
  }

  /// Gets the Decimal of the specified address.
  Future<String> decimals(String decimals_) async {
    final EthereumAddress contractAddr = EthereumAddress.fromHex(decimals_);
    final contract = DeployedContract(
        ContractAbi.fromJson(abiString, 'XRC20'), contractAddr);
    final tokenDecimals = contract.function('decimals');

    final decimals = await client
        .call(contract: contract, function: tokenDecimals, params: []);
    return ('$decimals');
  }

  /// Gets the totalSupply of the specified address.
  Future<String> totalSupply(String totalSupply_) async {
    final EthereumAddress contractAddr = EthereumAddress.fromHex(totalSupply_);
    final contract = DeployedContract(
        ContractAbi.fromJson(abiString, 'XRC20'), contractAddr);
    final tokenTotalSupply = contract.function('totalSupply');

    final totalSupply = await client
        .call(contract: contract, function: tokenTotalSupply, params: []);
    return ('$totalSupply');
  }

  /// Gets the balanceOf of the specified address.
  /// contractAddr : The address of the token.
  /// ownerAdd : The address to query the balance of.
  Future<BigInt> balanceOf(String contractAdd, ownerAdd) async {
    final EthereumAddress contractAddr = EthereumAddress.fromHex(contractAdd);
    final contract = DeployedContract(
        ContractAbi.fromJson(abiString, 'XRC20'), contractAddr);
    final tokenBalanceOf = contract.function('balanceOf');
    final EthereumAddress ownerAddress = EthereumAddress.fromHex(ownerAdd);
    final balanceOf = await client.call(
        contract: contract, function: tokenBalanceOf, params: [ownerAddress]);
    final response = balanceOf[0].toString();
    final res = BigInt.parse(response);
    print(res);
    final x = pow(10, 18);
    final u = x.toString();
    final BigInt h = BigInt.parse(u);
    print(x);
    final y = res ~/ h;
    return (y);
  }

  /// Gets how much allowance spender have from owner
  /// ownAdd_ : The address of the Token's owner.
  /// contractAddr_ : The address of the token.
  /// spenderAdd_ : The address of the Spender's address.
  /// An String representing the Allowance .
  Future<String> allowance(String ownerAdd_, contractAdd_, spenderAdd_) async {
    final EthereumAddress ownAddress = EthereumAddress.fromHex(ownerAdd_);
    final EthereumAddress contractAddr = EthereumAddress.fromHex(contractAdd_);
    final contract = DeployedContract(
        ContractAbi.fromJson(abiString, 'XRC20'), contractAddr);
    final tokenAllowance = contract.function('allowance');
    final EthereumAddress spender = EthereumAddress.fromHex(spenderAdd_);
    final allowance = await client.call(
        contract: contract,
        function: tokenAllowance,
        params: [ownAddress, spender]);
    return '$allowance';
  }

  /// Transfer tokens from one address to another
  /// _ownerPrivateKey : Owner's Private key.
  /// _contractAddr : Token Address.
  /// _ownerAdd :  Token Owner Address.
  /// recieverAdd : Reciever Address is The address which you want to transfer to.
  /// transfer_Value the amount of tokens to be transferred
  Future<String> transfer(_ownerPrivateKey, _contractAddr, _ownerAdd,
      receiverAdd, transfer_value) async {
    final String privateKey = _ownerPrivateKey;
    final credentials = await EthPrivateKey.fromHex(privateKey);
    final EthereumAddress contractAddr = EthereumAddress.fromHex(_contractAddr);
    final contract = DeployedContract(
        ContractAbi.fromJson(abiString, 'XRC20'), contractAddr);
    final tokenTransfer = contract.function('transfer');
    final EthereumAddress ownAddress = EthereumAddress.fromHex(_ownerAdd);
    final EthereumAddress receiver = EthereumAddress.fromHex(receiverAdd);
    final BigInt parsed_value = BigInt.parse('1000000000000000000');
    final transfer = await Transaction.callContract(
      from: ownAddress,
      contract: contract,
      function: tokenTransfer,
      parameters: [receiver, BigInt.from(transfer_value) * parsed_value],
    );
    final transferDetails = await client.sendTransaction(credentials, transfer,
        chainId: null, fetchChainIdFromNetworkId: true);
    return ('$transferDetails');
  }

  /// Approve the passed address to spend the specified amount of tokens on behalf of owner.
  /// owner_PrivateKey : Owner Private key.
  /// contractAdd : Token Address.
  /// spenderadd :  The address which will spend the funds.
  /// approve_value : The amount of tokens to be spent.
  Future<String> approve(
      String owner_PrivateKey, contractadd, spenderadd, approve_value) async {
    final String privateKey = owner_PrivateKey;
    final credentials = await EthPrivateKey.fromHex(privateKey);

    final EthereumAddress contractAddr = EthereumAddress.fromHex(contractadd);

    final contract = DeployedContract(
        ContractAbi.fromJson(abiString, 'XRC20'), contractAddr);
    final tokenApprove = contract.function('approve');
    final EthereumAddress spender = EthereumAddress.fromHex(spenderadd);
    final approve = await Transaction.callContract(
        contract: contract,
        function: tokenApprove,
        parameters: [spender, BigInt.from(approve_value)]);
    final approvel = await client.sendTransaction(credentials, approve,
        chainId: null, fetchChainIdFromNetworkId: true);

    return ('$approvel');
  }

  ///  Increase the amount of tokens that an owner allowed to a spender.
  ///  ownerPrivateKey : Owner Private key.
  ///  contract_Add : Token Address for which , allownce need to to increase.
  ///  spender_add : The address which will spend the funds.
  ///  value : The amount of tokens to increase the allowance by.

  Future<String> increaseAllowance(
      String ownerPrivateKey, contract_Add, spender_Add, value) async {
    final String privateKey = ownerPrivateKey;
    final credentials = await EthPrivateKey.fromHex(privateKey);
    final ownAddress = await credentials.extractAddress();

    final EthereumAddress contractAddr = EthereumAddress.fromHex(contract_Add);
    final contract = DeployedContract(
        ContractAbi.fromJson(abiString, 'XRC20'), contractAddr);
    final tokenAllowance = contract.function('allowance');
    final EthereumAddress spender = EthereumAddress.fromHex(spender_Add);
    final increase = await client.call(
        contract: contract,
        function: tokenAllowance,
        params: [ownAddress, spender]);

    var increase_amount = increase[0];
    var amount = increase_amount + value;

    final tokenApproveincrease = contract.function('approve');
    final increasedAllowance = await Transaction.callContract(
        contract: contract,
        function: tokenApproveincrease,
        parameters: [spender, amount]);
    final increasedAllowances = await client.sendTransaction(
        credentials, increasedAllowance,
        chainId: null, fetchChainIdFromNetworkId: true);

    return '$increasedAllowances';
  }

  /// Transfer tokens from one address to another
  /// contractAddres_ : Token Address.
  /// _spenderAddr : Spender Address is The address which you want to send tokens from.
  /// reciever_Address : Reciever Address is The address which you want to transfer to.
  /// spenderPrivateKey:  Spender's Private key.
  /// ownerAddress : Token Owner Address.
  /// transferfrom_value : the amount of tokens to be transferred.

  Future<String> transferFrom(
      String contractAddres_,
      _spenderAddr,
      receiver_Address,
      transferfrom_value,
      SpenderPrivatekey,
      ownerAddress) async {
    final EthereumAddress contractAddr =
        EthereumAddress.fromHex(contractAddres_);

    final contract = DeployedContract(
        ContractAbi.fromJson(abiString, 'XRC20'), contractAddr);
    final tokenTransferFrom = contract.function('transferFrom');
    final EthereumAddress spender = EthereumAddress.fromHex(_spenderAddr);
    final EthereumAddress receiver = EthereumAddress.fromHex(receiver_Address);
    final EthereumAddress ownAddr = EthereumAddress.fromHex(ownerAddress);
    final BigInt parsed__value = BigInt.parse('1000000000000000000');

    final nonce = await client.getTransactionCount(spender);
    final gasPrice = await client.getGasPrice();
    final transferFrom = await Transaction.callContract(
      contract: contract,
      function: tokenTransferFrom,
      parameters: [
        ownAddr,
        receiver,
        BigInt.from(transferfrom_value) * parsed__value
      ],
      from: spender,
      gasPrice: gasPrice,
      nonce: nonce,
      maxFeePerGas: null,
      maxPriorityFeePerGas: null,
    );
    final String spender_privateKey = SpenderPrivatekey;

    final credentials = await EthPrivateKey.fromHex(spender_privateKey);

    final transferForms = await client.sendTransaction(
        credentials, transferFrom,
        chainId: null, fetchChainIdFromNetworkId: true);
    print('tokenAmount Tokens transfered successfully. ');
    return ('$transferForms');
  }

  /// Transfer XDC from one address to another
  /// ownerPrivatekey : Owner's Private key.
  /// reciever_Addr :  Reciever Address is The address which you want to transfer to.
  /// xdc_value :  the amount of tokens to be transferred
  /// ownerAddress : Token Owner Address.

  Future<String> transferXDC(
      String ownerPrivatekey, receiver_Addr, xdc_value, ownerAddresss) async {
    final privateKey = ownerPrivatekey;
    final credentials = await EthPrivateKey.fromHex(privateKey);
    final EthereumAddress receiver = EthereumAddress.fromHex(receiver_Addr);
    final EthereumAddress ownerAddress = EthereumAddress.fromHex(ownerAddresss);

    final transferXDC = await Transaction(
      to: receiver,
      value: EtherAmount.fromUnitAndValue(EtherUnit.ether, xdc_value),
      from: ownerAddress,
    );
    final transferedXDC = await client.sendTransaction(credentials, transferXDC,
        chainId: null, fetchChainIdFromNetworkId: true);

    print('tokenAmount Tokens transfered successfully. ');
    return ('$transferedXDC');
  }

  /// Decrease Allowance Method
  /// Decrease the amount of tokens that an owner allowed to a spender.
  /// ownerPrivateKey : Owner Private key
  /// contract_Add : Token Address for which , allownce need to to decrease.
  /// spender_Add :  The address which will spend the funds.
  /// value : The amount of tokens to increase the allowance by.
  /// ownAddress : Owner Address

  Future<String> decreaseAllowance(
      ownerPrivateKey, contract_Add, spender_Add, value_) async {
    final String privateKey = ownerPrivateKey;
    final credentials = await EthPrivateKey.fromHex(privateKey);
    final ownAddress = await credentials.extractAddress();

    final EthereumAddress contractAddr = EthereumAddress.fromHex(contract_Add);
    final contract = DeployedContract(
        ContractAbi.fromJson(abiString, 'XRC20'), contractAddr);
    final tokenAllowance = contract.function('allowance');
    final EthereumAddress spender = EthereumAddress.fromHex(spender_Add);
    final decrease = await client.call(
        contract: contract,
        function: tokenAllowance,
        params: [ownAddress, spender]);

    var decrease_amount = decrease[0];
    var amount = decrease_amount - value_;

    final tokenApprovedecrease = contract.function('approve');
    final decreasedAllowance = await Transaction.callContract(
        contract: contract,
        function: tokenApprovedecrease,
        parameters: [spender, amount]);
    final decreasedAllowances = await client.sendTransaction(
        credentials, decreasedAllowance,
        chainId: null, fetchChainIdFromNetworkId: true);

    return '$decreasedAllowances';
  }
}
