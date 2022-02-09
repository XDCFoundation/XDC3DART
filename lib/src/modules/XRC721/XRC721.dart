import 'package:web3dart/web3dart.dart';
import 'package:web3dart/credentials.dart';
import 'package:xdc3dart/xdc3dart.dart';

final String abiFile =
    '[{"constant":true,"inputs":[{"name":"interfaceId","type":"bytes4"}],"name":"supportsInterface","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"tokenId","type":"uint256"}],"name":"getApproved","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"to","type":"address"},{"name":"tokenId","type":"uint256"}],"name":"approve","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"totalSupply","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"from","type":"address"},{"name":"to","type":"address"},{"name":"tokenId","type":"uint256"}],"name":"transferFrom","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"owner","type":"address"},{"name":"index","type":"uint256"}],"name":"tokenOfOwnerByIndex","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"from","type":"address"},{"name":"to","type":"address"},{"name":"tokenId","type":"uint256"}],"name":"safeTransferFrom","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"index","type":"uint256"}],"name":"tokenByIndex","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"tokenId","type":"uint256"}],"name":"ownerOf","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"owner","type":"address"}],"name":"balanceOf","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"to","type":"address"},{"name":"approved","type":"bool"}],"name":"setApprovalForAll","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"from","type":"address"},{"name":"to","type":"address"},{"name":"tokenId","type":"uint256"},{"name":"_data","type":"bytes"}],"name":"safeTransferFrom","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"tokenId","type":"uint256"}],"name":"tokenURI","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_tokenId","type":"uint256"},{"name":"_uri","type":"string"}],"name":"mint","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"owner","type":"address"},{"name":"operator","type":"address"}],"name":"isApprovedForAll","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[{"name":"name","type":"string"},{"name":"symbol","type":"string"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"name":"from","type":"address"},{"indexed":true,"name":"to","type":"address"},{"indexed":true,"name":"tokenId","type":"uint256"}],"name":"Transfer","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"owner","type":"address"},{"indexed":true,"name":"approved","type":"address"},{"indexed":true,"name":"tokenId","type":"uint256"}],"name":"Approval","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"owner","type":"address"},{"indexed":true,"name":"operator","type":"address"},{"indexed":false,"name":"approved","type":"bool"}],"name":"ApprovalForAll","type":"event"}]';

class XRC721 {
// * Gets the Name of the specified address.
  Future<String> name(String token_address) async {
    final EthereumAddress contractAddr = EthereumAddress.fromHex(token_address);
    final contract =
        DeployedContract(ContractAbi.fromJson(abiFile, 'XRC721'), contractAddr);
    final tokenName = contract.function('name');
    final name =
        await client.call(contract: contract, function: tokenName, params: []);
    return '$name';
  }

  //  Gets the Symbol of the specified address.
  Future<String> symbol(String tokenAddress) async {
    final EthereumAddress contractAddr = EthereumAddress.fromHex(tokenAddress);

    final contract =
        DeployedContract(ContractAbi.fromJson(abiFile, 'XRC721'), contractAddr);

    final tokenSymbol = contract.function('symbol');
    final symbol = await client
        .call(contract: contract, function: tokenSymbol, params: []);
    // print('Symbol : ${symbol} ');
    return '$symbol';
  }

  // * Gets the totalSupply of the specified address.
  Future<String> totalSupply(String tokenAddr_) async {
    final EthereumAddress contractAddr = EthereumAddress.fromHex(tokenAddr_);

    final contract =
        DeployedContract(ContractAbi.fromJson(abiFile, 'XRC721'), contractAddr);
    final tokenTotalSupply = contract.function('totalSupply');

    final totalSupply = await client
        .call(contract: contract, function: tokenTotalSupply, params: []);
    return ('$totalSupply');
  }

// * Gets the balanceOf of the specified address.
// * contractAddr The address of the token.
// * ownerAddress The address to query the balance of.
  Future<String> balanceOf(
      String ___contractAdd___, String ___ownerAdd___) async {
    final EthereumAddress contractAddr =
        EthereumAddress.fromHex(___contractAdd___);

    final contract =
        DeployedContract(ContractAbi.fromJson(abiFile, 'XRC20'), contractAddr);
    final tokenBalanceOf = contract.function('balanceOf');
    final EthereumAddress ownerAddress =
        EthereumAddress.fromHex(___ownerAdd___);
    final balanceOf = await client.call(
        contract: contract, function: tokenBalanceOf, params: [ownerAddress]);

    return ('$balanceOf');
  }

  /// tokenAddress The address of the token.
  /// tokenId The identifier for an NFT.
  /// String representing the address of the owner of the NFT .
  Future<String> ownerOf(BigInt tokenId, String _tokenAddr) async {
    final EthereumAddress contractAddr = EthereumAddress.fromHex(_tokenAddr);

    final contract =
        DeployedContract(ContractAbi.fromJson(abiFile, 'XRC721'), contractAddr);
    final ownerOf = contract.function('ownerOf');
    final ownerof = await client
        .call(contract: contract, function: ownerOf, params: [tokenId]);
    return ('$ownerof');
  }

  /// A distinct Uniform Resource Identifier (URI) for a given asset.
  /// tokenAddress The address of the token.
  /// tokenId The identifier for an NFT.
  ///  URI of a token.
  Future<String> tokenURI(BigInt token_id, String tokenAddr__) async {
    final EthereumAddress contractAddr = EthereumAddress.fromHex(tokenAddr__);

    final contract =
        DeployedContract(ContractAbi.fromJson(abiFile, 'XRC721'), contractAddr);
    final tokenURI = contract.function('tokenURI');
    final tokenuri = await client
        .call(contract: contract, function: tokenURI, params: [token_id]);
    return ('$tokenuri');
  }

  /// Query if a contract implements an interface
  /// tokenAddress An address for whom to query .
  /// interfaceId The interface identifier
  /// `true` if the contract implements `interfaceID` and
  /// `interfaceID` is not 0xffffffff, `false` otherwise .
  Future<String> supportInterface(interface_id, String tokenAddr__) async {
    final EthereumAddress contractAddr = EthereumAddress.fromHex(tokenAddr__);

    final contract =
        DeployedContract(ContractAbi.fromJson(abiFile, 'XRC721'), contractAddr);
    final supportsInterface = contract.function('supportsInterface');
    final supports_Interface = await client.call(
        contract: contract,
        function: supportsInterface,
        params: [interface_id]);
    return ('$supports_Interface');
  }

  /// Get the approved address for a single NFT
  ///  Throws if `tokenID` is not a valid NFT .
  /// _tokenAdd_ :  An address for whom to query .
  ///  _tokenAdd_  :    The identifier for an NFT .
  Future<String> getApproved(BigInt tokenId_, _tokenAdd_) async {
    final EthereumAddress contractAddr = EthereumAddress.fromHex(_tokenAdd_);

    final contract =
        DeployedContract(ContractAbi.fromJson(abiFile, 'XRC721'), contractAddr);
    final getApprove = contract.function('getApproved');
    final getApproved = await client
        .call(contract: contract, function: getApprove, params: [tokenId_]);
    return ('$getApproved');
  }

  /// Query if an address is an authorized operator for another address
  /// tokenAddress An address for whom to query .
  /// ownerAddress The address which owns the funds.
  /// operatorAddress The address that acts on behalf of the owner
  /// return True if `operatorAddress` is an approved operator for `ownerAddress`, False otherwise
  Future<bool> isApproved(
      String __tokenAdd_, String ownerr_Addr, String spender_addr__) async {
    final EthereumAddress contractAddr = EthereumAddress.fromHex(__tokenAdd_);
    final EthereumAddress ownerAddress = EthereumAddress.fromHex(ownerr_Addr);
    final EthereumAddress spender = EthereumAddress.fromHex(spender_addr__);

    final contract =
        DeployedContract(ContractAbi.fromJson(abiFile, 'XRC721'), contractAddr);
    final isApprove = contract.function('isApprovedForAll');
    final isApproved = await client.call(
        contract: contract,
        function: isApprove,
        params: [ownerAddress, spender]);
    final isApproveofAll = isApproved[0];
    return (isApproveofAll);
  }

  /// Enumerate NFTs assigned to an owner
  /// tokenAddress An address for whom to query .
  /// IndexNO A counter less than `totalSupply()`
  /// The token identifier for the `index`th NFT assigned to `owner`
  Future<String> tokenByIndex(BigInt index, String _token_Add_) async {
    final EthereumAddress contractAddr = EthereumAddress.fromHex(_token_Add_);

    final contract =
        DeployedContract(ContractAbi.fromJson(abiFile, 'XRC721'), contractAddr);
    final getTokenbyIndex = contract.function('tokenByIndex');
    final tokenByIndex = await client
        .call(contract: contract, function: getTokenbyIndex, params: [index]);
    return ('$tokenByIndex');
  }

  /// Enumerate NFTs assigned to an owner
  /// Throws if `index` >= `balanceOf(owner)` or if `owner` is the zero address, representing invalid NFTs.
  /// tokenAddress An address for whom to query .
  /// IndexNO A counter less than `totalSupply()`
  /// ownerAddress The address which owns the funds.
  /// The token identifier for the `index`th NFT assigned to `owner`
  Future<String> tokenofOwnerByIndex(
      BigInt index_, String _token__Add_, String ownerrAddr) async {
    final EthereumAddress contractAddr = EthereumAddress.fromHex(_token__Add_);
    final EthereumAddress ownerAddress = EthereumAddress.fromHex(ownerrAddr);

    final contract =
        DeployedContract(ContractAbi.fromJson(abiFile, 'XRC721'), contractAddr);
    final getTokenbyIndex = contract.function('tokenOfOwnerByIndex');
    final tokenofOwnerByIndex = await client.call(
        contract: contract,
        function: getTokenbyIndex,
        params: [ownerAddress, index_]);
    return ('$tokenofOwnerByIndex');
  }

  /// Change or reaffirm the approved address for an NFT
  /// The zero address indicates there is no approved address.
  /// Throws unless `owner` is the current NFT owner, or an authorized
  /// tokenAddress An address for whom to query .
  /// ownerPrivateKey Owner Private key.
  /// recieverAddress The address to transfer to .
  /// tokenID The identifier for an NFT
  Future<String> approve(String owner_PrivateKey, String contractadd,
      String spenderadd, BigInt token__ID) async {
    final String privateKey = owner_PrivateKey;
    final credentials = await EthPrivateKey.fromHex(privateKey);

    final EthereumAddress contractAddr = EthereumAddress.fromHex(contractadd);

    final contract =
        DeployedContract(ContractAbi.fromJson(abiFile, 'XRC721'), contractAddr);
    final tokenApprove = contract.function('approve');
    final EthereumAddress spender = EthereumAddress.fromHex(spenderadd);
    final approve = await Transaction.callContract(
        contract: contract,
        function: tokenApprove,
        parameters: [spender, token__ID]);
    final approvel = await client.sendTransaction(credentials, approve,
        chainId: null, fetchChainIdFromNetworkId: true);

    return ('$approvel');
  }

  /// Enable or disable approval for a third party ("operator") to manage all of `Owner`'s assets
  /// Emits the ApprovalForAll event. The contract MUST allow multiple operators per owner.
  /// token_address An address for whom to query .
  /// operatorAddress An address for whoom you want to give to give Approve Status.
  /// approvedStatus true if the operator is approved, false to revoke approval
  /// ownerPrivateKey PrivateKey Of The Token Owner .
  /// tokenId The identifier for an NFT
  Future<String> setApproveofAll(String owner___PrivateKey,
      String contract___add, String spender___Add, bool boolValue) async {
    final String privateKey = owner___PrivateKey;
    final credentials = await EthPrivateKey.fromHex(privateKey);

    final EthereumAddress contractAddr =
        EthereumAddress.fromHex(contract___add);

    final contract =
        DeployedContract(ContractAbi.fromJson(abiFile, 'XRC721'), contractAddr);
    final tokenApprove = contract.function('setApprovalForAll');
    final EthereumAddress spender = EthereumAddress.fromHex(spender___Add);
    final setApprove = await Transaction.callContract(
        contract: contract,
        function: tokenApprove,
        parameters: [spender, boolValue]);
    final setapprovel = await client.sendTransaction(credentials, setApprove,
        chainId: null, fetchChainIdFromNetworkId: true);

    return ('$setapprovel');
  }

  /// Transfer ownership of an NFT -- THE CALLER IS RESPONSIBLE
  /// TO CONFIRM THAT `recieverAddress` IS CAPABLE OF RECEIVING NFTS OR ELSE THEY MAY BE PERMANENTLY LOST
  /// Throws unless `ownerAddress` is the current owner, an authorized .
  /// tokenAddress An address for whom to query .
  /// ownerAddress owner Of The Token .
  /// recieverAddress The address to transfer to
  /// tokenID The identifier for an NFT
  /// approvedPrivateKey Approved Address Private key.

  Future<String> transferFrom(
      String _contractAddres__,
      String __spenderAddr_,
      String receiver__Address_,
      BigInt token_id__,
      Spender__Privatekey,
      owner_Address__) async {
    final EthereumAddress contractAddr =
        EthereumAddress.fromHex(_contractAddres__);

    final contract =
        DeployedContract(ContractAbi.fromJson(abiFile, 'XRC721'), contractAddr);
    final tokenTransferFrom = contract.function('transferFrom');
    final EthereumAddress spender = EthereumAddress.fromHex(__spenderAddr_);
    final EthereumAddress receiver =
        EthereumAddress.fromHex(receiver__Address_);
    final EthereumAddress ownAddr = EthereumAddress.fromHex(owner_Address__);
    final nonce = await client.getTransactionCount(spender);
    final gasPrice = await client.getGasPrice();
    final transferFrom = await Transaction.callContract(
      contract: contract,
      function: tokenTransferFrom,
      parameters: [ownAddr, receiver, token_id__],
      from: spender,
      gasPrice: gasPrice,
      nonce: nonce,
      maxFeePerGas: null,
      maxPriorityFeePerGas: null,
    );
    final String spender__privateKey = Spender__Privatekey;

    final credentials = await EthPrivateKey.fromHex(spender__privateKey);

    final transferForms = await client.sendTransaction(
        credentials, transferFrom,
        chainId: null, fetchChainIdFromNetworkId: true);
    print('tokenAmount Tokens transfered successfully. ');
    return ('$transferForms');
  }

// Transfers the ownership of an NFT from one address to another address
  /// This works identically to the other function with an extra data parameter,
  /// except this function just sets data to "".
  /// tokenAddress An address for whom to query .
  /// ownerAddress owner Of The Token .
  /// recieverAddress    The address to transfer to
  /// tokenID      The identifier for an NFT
  /// approvedPrivateKey    Approved Address Private key.
  Future<String> safetransferFrom(
      String contractAddres__,
      String __spenderAddr,
      String receiver__Address,
      BigInt token_id_,
      String Spender_Privatekey,
      String ownerAddress__) async {
    final EthereumAddress contractAddr =
        EthereumAddress.fromHex(contractAddres__);

    final contract =
        DeployedContract(ContractAbi.fromJson(abiFile, 'XRC721'), contractAddr);
    final tokenTransferFrom = contract.function('transferFrom');
    final EthereumAddress spender = EthereumAddress.fromHex(__spenderAddr);
    final EthereumAddress receiver = EthereumAddress.fromHex(receiver__Address);
    final EthereumAddress ownAddr = EthereumAddress.fromHex(ownerAddress__);
    final nonce = await client.getTransactionCount(spender);
    final gasPrice = await client.getGasPrice();
    final transferFrom = await Transaction.callContract(
      contract: contract,
      function: tokenTransferFrom,
      parameters: [ownAddr, receiver, token_id_],
      from: spender,
      gasPrice: gasPrice,
      nonce: nonce,
      maxFeePerGas: null,
      maxPriorityFeePerGas: null,
    );
    final String spender_privateKey = Spender_Privatekey;

    final credentials = await EthPrivateKey.fromHex(spender_privateKey);

    final transferForms = await client.sendTransaction(
        credentials, transferFrom,
        chainId: null, fetchChainIdFromNetworkId: true);
    print('tokenAmount Tokens transfered successfully. ');
    return ('$transferForms');
  }
}
