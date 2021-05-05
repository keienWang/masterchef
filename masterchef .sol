// File: @openzeppelin/contracts/token/ERC20/IERC20.sol


pragma solidity 0.6.12;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: @openzeppelin/contracts/math/SafeMath.sol

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}


/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin/contracts/access/Ownable.sol

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () internal {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

// token amount = sushi amount X sushi price / _token price
interface TokenAmountLike {
    function getTokenAmount(address _token, uint256 hkrAmount) external view returns (uint256);
}

// MasterChef is the master of Sushi. He can make Sushi and he is a fair guy.
//
// Note that it's ownable and the owner wields tremendous power. The ownership
// will be transferred to a governance smart contract once SUSHI is sufficiently
// distributed and the community can show to govern itself.
//
// Have fun reading it. Hopefully it's bug-free. God bless.
contract MasterChef is Ownable {
    using SafeMath for uint256;
   
    // Info of each user.
    struct UserInfo {
        uint256 amount;     // How many LP tokens the user has provided.
        uint256 rewardDebt; // Reward debt. See explanation below.
        //
        // We do some fancy math here. Basically, any point in time, the amount of SUSHIs
        // entitled to a user but is pending to be distributed is:
        //
        //   pending reward = (user.amount * pool.accSushiPerShare) - user.rewardDebt
        //
        // Whenever a user deposits or withdraws LP tokens to a pool. Here's what happens:
        //   1. The pool's `accSushiPerShare` (and `lastRewardBlock`) gets updated.
        //   2. User receives the pending reward sent to his/her address.
        //   3. User's `amount` gets updated.
        //   4. User's `rewardDebt` gets updated.
    }

    // Info of each pool.
    struct PoolInfo {
        IERC20 lpToken;           // Address of LP token contract.
        uint256 amount;     // How many LP tokens the pool has.
        uint256 rewardForEachBlock;    //Reward for each block
        uint256 lastRewardBlock;  // Last block number that SUSHIs distribution occurs.
        uint256 accSushiPerShare; // Accumulated SUSHIs per share, times 1e12. See below.
        uint256 startBlock; // Reward start block.
        uint256 endBlock;  // Reward end block.
        uint256 rewarded;// the total sushi has beed reward, including the dev and user harvest
        
        uint256 operationFee;// Charged when user operate the pool, only deposit firstly.
        address operationFeeToken;// empty reprsents charged with mainnet token.
        
        uint16 harvestFeeRatio;// Charged when harvest, div RATIO_BASE for the real ratio, like 100 for 10%
        address harvestFeeToken;// empty reprsents charged with mainnet token.
    }
    
    //address public constant MAINNET_WRAPPED_TOKEN = 0x5545153CCFcA01fbd7Dd11C0b23ba694D9509A6F;// WHT address for HECO mainnet
    address public constant MAINNET_WRAPPED_TOKEN = 0x7aF326B6351C8A9b8fb8CD205CBe11d4Ac5FA836;// WHT address for HECO testnet
    uint256 private constant ACC_SUSHI_PRECISION = 1e12;
    
    uint8 public constant ZERO = 0 ;
    uint16 public constant RATIO_BASE = 1000;
    
    uint8 public constant DEV1_RATIO = 68;
    uint8 public constant DEV2_RATIO = 48;
    uint8 public constant DEV3_RATIO = 34;
    uint16 public constant MINT_RATIO = 850;
    
    address public HAI_ADDRESS = 0x7663Bc3Ae9858cae71722aeDeE364E125C278bdf;
    address public HKR_ADDRESS = 0xA74b0514B403bdb573BF22dF0062d43F6498a164;
    
    uint16 public harvestFeeBuyRatio = 800;// the buy coefficient for harvest, div RATIO_BASE
    uint16 public harvestFeeDevRatio = 200;// the dev coefficient for harvest, div RATIO_BASE
    
    // The SUSHI TOKEN!
    IERC20 public sushi;
    // Dev address.
    address payable public dev1Address;
    address payable public dev2Address;
    address payable public dev3Address;
    
    address payable public buyAddress;// address for the fee to buy hkr
    
    TokenAmountLike public tokenAmountContract;
    // SUSHI tokens created per block.
    // uint256 public sushiPerBlock;
    
    // The migrator contract. It has a lot of power. Can only be set through governance (owner).
    // IMigratorChef public migrator;

    // Info of each pool.
    PoolInfo[] public poolInfo;
    // Info of each user that stakes LP tokens.
    mapping (uint256 => mapping (address => UserInfo)) public userInfo;
    // Total allocation poitns. Must be the sum of all allocation points in all pools.
    // uint256 public totalAllocPoint = 0;
    // The block number when SUSHI mining starts.
    // uint256 public startBlock;
    
    event Deposit(address indexed user, uint256 indexed pid, uint256 amount);
    event Withdraw(address indexed user, uint256 indexed pid, uint256 amount);
    event EmergencyWithdraw(address indexed user, uint256 indexed pid, uint256 amount);
    event Harvest(address indexed user, uint256 indexed pid, uint256 amount);
    event EmergencyStop(address indexed user, address to, uint256 amount);
    event Add(uint256 rewardForEachBlock, IERC20 lpToken, bool withUpdate, 
    uint256 startBlock, uint256 endBlock, uint256 operationFee, address operationFeeToken, 
    uint16 harvestFeeRatio, address harvestFeeToken);
    event SetPoolInfo(uint256 pid, uint256 rewardsOneBlock, bool withUpdate, uint256 startBlock, uint256 endBlock);
    event ClosePool(uint256 pid);
    event UpdateDev1Address(address payable dev1Address);
    event UpdateDev2Address(address payable dev2Address);
    event UpdateDev3Address(address payable dev3Address);
    event UpdateBuyAddress(address payable buyAddress);
    event AddRewardForPool(uint256 pid, uint256 _addSushiPerPool, uint256 _addSushiPerBlock);
    
    event SetPoolOperationFee(uint256 pid, uint256 operationFee, address operationFeeToken, bool feeUpdate, bool feeTokenUpdate);
    event SetPoolHarvestFee(uint256 pid, uint16 harvestFeeRatio, address harvestFeeToken, bool feeRatioUpdate, bool feeTokenUpdate);
    
    event SetTokenAmountContract(TokenAmountLike tokenAmountContract);
    
    event SetHarvestFeeRatio(uint16 harvestFeeBuyRatio, uint16 harvestFeeDevRatio);
    
    constructor(
        IERC20 _sushi,
        address payable _dev1Address,
        address payable _dev2Address,
        address payable _dev3Address,
        address payable _buyAddress,
        TokenAmountLike _tokenAmountContract
    ) public {
        sushi = _sushi;
        dev1Address = _dev1Address;
        dev2Address = _dev2Address;
        dev3Address = _dev3Address;
        buyAddress = _buyAddress;
        tokenAmountContract = _tokenAmountContract;
    }

    function poolLength() external view returns (uint256) {
        return poolInfo.length;
    }
    
    function setTokenAmountContract(TokenAmountLike _tokenAmountContract) public onlyOwner {
        require(_tokenAmountContract != TokenAmountLike(0), "tokenAmount can not be zero!");
        tokenAmountContract = _tokenAmountContract;
        emit SetTokenAmountContract(_tokenAmountContract);
    }
    
    // Update the harvest fee ratio
    function setHarvestFeeRatio(uint16 _harvestFeeBuyRatio, uint16 _harvestFeeDevRatio) public onlyOwner {
        require((harvestFeeBuyRatio + harvestFeeDevRatio) == RATIO_BASE, "The sum must be 1000!");
        harvestFeeBuyRatio = _harvestFeeBuyRatio;
        harvestFeeDevRatio = _harvestFeeDevRatio;
        emit SetHarvestFeeRatio(_harvestFeeBuyRatio, _harvestFeeDevRatio);
    }
    
    // Add a new lp to the pool. Can only be called by the owner.
    // XXX DO NOT add the same LP token more than once. Rewards will be messed up if you do.
    function add(uint256 _rewardForEachBlock, IERC20 _lpToken, bool _withUpdate, 
    uint256 _startBlock, uint256 _endBlock, uint256 _operationFee, address _operationFeeToken, 
    uint16 _harvestFeeRatio, address _harvestFeeToken) public onlyOwner {
        require(_lpToken != IERC20(0), "lpToken can not be zero!");
        require(_rewardForEachBlock > 0, "rewardForEachBlock must be greater than zero!");
        require(_startBlock < _endBlock, "start block must less than end block!");
        if (_withUpdate) {
            massUpdatePools();
        }
        poolInfo.push(PoolInfo({
            lpToken: _lpToken,
            amount: ZERO,
            rewardForEachBlock: _rewardForEachBlock,
            lastRewardBlock: block.number > _startBlock ? block.number : _startBlock,
            accSushiPerShare: ZERO,
            startBlock: _startBlock,
            endBlock: _endBlock,
            rewarded: ZERO,
            operationFee: _operationFee,
            operationFeeToken: _operationFeeToken,
            harvestFeeRatio: _harvestFeeRatio,
            harvestFeeToken: _harvestFeeToken
        }));
        emit Add(_rewardForEachBlock, _lpToken, _withUpdate, _startBlock, _endBlock, _operationFee, _operationFeeToken, _harvestFeeRatio, _harvestFeeToken);
    }

    // Update the given pool's pool info. Can only be called by the owner.
    function setPoolInfo(uint256 _pid, uint256 _rewardForEachBlock, bool _withUpdate, uint256 _startBlock, uint256 _endBlock) public onlyOwner {
        if (_withUpdate) {
            massUpdatePools();
        }
        PoolInfo storage pool = poolInfo[_pid];
        if(_startBlock > 0){
            if(_endBlock > 0){
                require(_startBlock < _endBlock, "start block must less than end block!");
            }else{
                require(_startBlock < pool.endBlock, "start block must less than end block!");
            }
            pool.startBlock = _startBlock;
        }
        if(_endBlock > 0){
            if(_startBlock <= 0){
                require(pool.startBlock < _endBlock, "start block must less than end block!");
            }
            pool.endBlock = _endBlock;
        }
        if(_rewardForEachBlock > 0){
            pool.rewardForEachBlock = _rewardForEachBlock;
        }
        
        emit SetPoolInfo(_pid, _rewardForEachBlock, _withUpdate, _startBlock, _endBlock);
    }
    
    function setAllPoolOperationFee(uint256 _operationFee, address _operationFeeToken, bool _feeUpdate, bool _feeTokenUpdate) public onlyOwner {
        uint256 length = poolInfo.length;
        for (uint256 pid = ZERO; pid < length; ++ pid) {
            setPoolOperationFee(pid, _operationFee, _operationFeeToken, _feeUpdate, _feeTokenUpdate);
        }
    }
    
    // Update the given pool's operation fee
    function setPoolOperationFee(uint256 _pid, uint256 _operationFee, address _operationFeeToken, bool _feeUpdate, bool _feeTokenUpdate) public onlyOwner {
        updatePool(_pid);
        PoolInfo storage pool = poolInfo[_pid];
        if(_feeUpdate){
            pool.operationFee = _operationFee;
        }
        if(_feeTokenUpdate){
            pool.operationFeeToken = _operationFeeToken;
        }
        emit SetPoolOperationFee(_pid, _operationFee, _operationFeeToken, _feeUpdate, _feeTokenUpdate);
    }
    
    function setAllPoolHarvestFee(uint16 _harvestFeeRatio, address _harvestFeeToken, bool _feeRatioUpdate, bool _feeTokenUpdate) public onlyOwner {
        uint256 length = poolInfo.length;
        for (uint256 pid = ZERO; pid < length; ++ pid) {
            setPoolHarvestFee(pid, _harvestFeeRatio, _harvestFeeToken, _feeRatioUpdate, _feeTokenUpdate);
        }
    }
    
    // Update the given pool's harvest fee
    function setPoolHarvestFee(uint256 _pid, uint16 _harvestFeeRatio, address _harvestFeeToken, bool _feeRatioUpdate, bool _feeTokenUpdate) public onlyOwner {
        updatePool(_pid);
        PoolInfo storage pool = poolInfo[_pid];
        if(_feeRatioUpdate){
        	pool.harvestFeeRatio = _harvestFeeRatio;
        }
        
        if(_feeTokenUpdate){
        	pool.harvestFeeToken = _harvestFeeToken;
        }
        emit SetPoolHarvestFee(_pid, _harvestFeeRatio, _harvestFeeToken, _feeRatioUpdate, _feeTokenUpdate);
    }
    
    // Return reward multiplier over the given _from to _to block.
    function getMultiplier(uint256 _from, uint256 _to) public pure returns (uint256) {
        if(_to > _from){
            return _to.sub(_from);
        }
        return 0;
    }

    // Update reward variables of the given pool to be up-to-date.
    function updatePool(uint256 _pid) public {
        PoolInfo storage pool = poolInfo[_pid];
        if (block.number <= pool.lastRewardBlock) {
            return;
        }
        if (block.number < pool.startBlock){
            return;
        }
        if (pool.lastRewardBlock >= pool.endBlock){
             return;
        }
        uint256 multiplier;
        if (block.number > pool.endBlock){
            multiplier = getMultiplier(pool.lastRewardBlock, pool.endBlock);
            pool.lastRewardBlock = pool.endBlock;
        }else{
            multiplier = getMultiplier(pool.lastRewardBlock, block.number);
            pool.lastRewardBlock = block.number;
        }
        uint256 lpSupply = pool.lpToken.balanceOf(address(this));
        if (lpSupply == ZERO) {
            return;
        }
        uint256 sushiReward = multiplier.mul(pool.rewardForEachBlock);
        if(sushiReward > 0){
            transferToDev(_pid, dev1Address, DEV1_RATIO, sushiReward);
            transferToDev(_pid, dev2Address, DEV2_RATIO, sushiReward);
            transferToDev(_pid, dev3Address, DEV3_RATIO, sushiReward);
            uint256 poolSushiReward = sushiReward.mul(MINT_RATIO).div(RATIO_BASE);
            pool.accSushiPerShare = pool.accSushiPerShare.add(poolSushiReward.mul(ACC_SUSHI_PRECISION).div(lpSupply));
        }
    }
    
    function transferToDev(uint256 _pid, address devAddr, uint16 devRatio, uint256 sushiReward) private returns (uint256 amount){
        PoolInfo storage pool = poolInfo[_pid];
        amount = sushiReward.mul(devRatio).div(RATIO_BASE);
        safeSushiTransfer(devAddr, amount);
        pool.rewarded = pool.rewarded.add(amount);
    }

    // View function to see pending SUSHIs on frontend.
    function pendingSushi(uint256 _pid, address _user) public view returns (uint256 sushiReward, uint256 fee) {
        PoolInfo storage pool =  poolInfo[_pid]; 
        UserInfo storage user = userInfo[_pid][_user];
        uint256 accSushiPerShare = pool.accSushiPerShare;
        uint256 lpSupply = pool.lpToken.balanceOf(address(this));
        if (block.number > pool.lastRewardBlock && lpSupply != 0){
            uint256 multiplier = 0;
            if (block.number > pool.endBlock){
                if(pool.lastRewardBlock < pool.endBlock){
                    multiplier = getMultiplier(pool.lastRewardBlock, pool.endBlock);
                }
            }else{
                multiplier = getMultiplier(pool.lastRewardBlock, block.number);
            }
            uint256 poolSushiReward = multiplier.mul(pool.rewardForEachBlock).mul(MINT_RATIO).div(RATIO_BASE);
            accSushiPerShare = pool.accSushiPerShare.add(poolSushiReward.mul(ACC_SUSHI_PRECISION).div(lpSupply));
        }
        sushiReward = user.amount.mul(accSushiPerShare).div(ACC_SUSHI_PRECISION).sub(user.rewardDebt);
        
        fee = getHarvestFee(pool, sushiReward);
    }
    
    function getHarvestFee(PoolInfo storage _pool, uint256 _sushiAmount) private view returns (uint256){
        uint256 fee = 0;
        if(_pool.harvestFeeRatio > 0){//charge for fee
            //TODO used for test, fixed 2.198
            //fee = 2198 * 10**5 * 10**5 * 10**5;
            fee = tokenAmountContract.getTokenAmount(_pool.harvestFeeToken, _sushiAmount).mul(_pool.harvestFeeRatio).div(RATIO_BASE);
        }
        return fee;
    }

    // Update reward vairables for all pools. Be careful of gas spending!
    function massUpdatePools() public {
        uint256 length = poolInfo.length;
        for (uint256 pid = ZERO; pid < length; ++pid) {
            updatePool(pid);
        }
    }
    
    // Deposit LP tokens to MasterChef for SUSHI allocation.
    function deposit(uint256 _pid, uint256 _amount) public {
        PoolInfo storage pool = poolInfo[_pid];
        require(block.number <= pool.endBlock, "this pool is end!");
        require(block.number >= pool.startBlock, "this pool is not start!");
        checkOperationFee(pool);
        UserInfo storage user = userInfo[_pid][msg.sender];
        harvest(_pid, msg.sender);
        pool.lpToken.transferFrom(address(msg.sender), address(this), _amount);
        pool.amount = pool.amount.add(_amount);
        user.amount = user.amount.add(_amount);
        user.rewardDebt = user.amount.mul(pool.accSushiPerShare).div(ACC_SUSHI_PRECISION);
        emit Deposit(msg.sender, _pid, _amount);
    }
    
    function checkOperationFee(PoolInfo storage _pool) private {
        if(_pool.operationFee > 0){// charge for fee
            uint256 dev1Amount = _pool.operationFee.mul(500).div(RATIO_BASE);
            uint256 dev2Amount = _pool.operationFee.mul(250).div(RATIO_BASE);
            uint256 dev3Amount = _pool.operationFee.sub(dev1Amount).sub(dev2Amount);
            if(isMainnetToken(_pool.operationFeeToken)){
                require(msg.value == _pool.operationFee, "Fee is not enough or too much!");
                dev1Address.transfer(dev1Amount);
                dev2Address.transfer(dev2Amount);
                dev3Address.transfer(dev3Amount);
            }else{
                IERC20 token = IERC20(_pool.operationFeeToken);
                uint feeBalance = token.balanceOf(address(msg.sender));
                require(feeBalance >= _pool.operationFee, "Fee is not enough!");
                //TODO Test, address or IERC20 type is better for pool.operationFeeToken
                token.transferFrom(address(msg.sender), address(this), _pool.operationFee);
                
                //TODO Test, need to test if the approve is needed.
                //token.approve(dev1Address, dev1Amount);
                //token.approve(dev2Address, dev2Amount);
                //token.approve(dev3Address, dev3Amount);
                
                token.transferFrom(address(this), dev1Address, dev1Amount);
                token.transferFrom(address(this), dev2Address, dev2Amount);
                token.transferFrom(address(this), dev3Address, dev3Amount);
            }
        }
    }
    
    function isMainnetToken(address _token) private pure returns (bool) {
        return _token == address(0) || _token == MAINNET_WRAPPED_TOKEN;
    }

    // Withdraw LP tokens from MasterChef.
    function withdraw(uint256 _pid, uint256 _amount) public {
        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = userInfo[_pid][msg.sender];
        require(block.number >= pool.startBlock,"this pool is not start!");
        require(user.amount >= _amount, "withdraw: not good");
        harvest(_pid, msg.sender);
        user.amount = user.amount.sub(_amount);
        user.rewardDebt = user.amount.mul(pool.accSushiPerShare).div(ACC_SUSHI_PRECISION);
        pool.lpToken.transfer(address(msg.sender), _amount);
        pool.amount = pool.amount.sub(_amount);
        emit Withdraw(msg.sender, _pid, _amount);
    }

    // Withdraw without caring about rewards. EMERGENCY ONLY.
    function emergencyWithdraw(uint256 _pid) public {
        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = userInfo[_pid][msg.sender];
        pool.lpToken.transfer(address(msg.sender), user.amount);
        pool.amount = pool.amount.sub(user.amount);
        uint256 oldAmount = user.amount;
        user.amount = ZERO;
        user.rewardDebt = ZERO;
        emit EmergencyWithdraw(msg.sender, _pid, oldAmount);
    }
    
    function harvest(uint256 _pid, address _to) public returns (bool success) {
        PoolInfo storage pool =  poolInfo[_pid]; 
        UserInfo storage user = userInfo[_pid][_to];
        updatePool(_pid);
        uint256 pending = user.amount.mul(pool.accSushiPerShare).div(ACC_SUSHI_PRECISION).sub(user.rewardDebt);
        if (pending != ZERO) {
            checkHarvestFee(pool, pending);
            
            success = true;
            safeSushiTransfer(_to, pending);
            pool.rewarded = pool.rewarded.add(pending);
            user.rewardDebt = user.amount.mul(pool.accSushiPerShare).div(ACC_SUSHI_PRECISION);
        } else{
            success = false; 
        }
        emit Harvest(_to, _pid, pending);
    }
    
    function checkHarvestFee(PoolInfo storage _pool, uint256 _sushiReward) private {
        uint256 fee = getHarvestFee(_pool, _sushiReward);
        if(fee > 0){
            uint256 devFee = fee.mul(harvestFeeDevRatio).div(RATIO_BASE);
            uint256 buyFee = fee.sub(devFee);
            
            uint256 dev1Amount = devFee.mul(500).div(RATIO_BASE);
            uint256 dev2Amount = devFee.mul(250).div(RATIO_BASE);
            uint256 dev3Amount = devFee.sub(dev1Amount).sub(dev2Amount);
            
            if(isMainnetToken(_pool.harvestFeeToken)){
                require(msg.value == fee, "Fee is not enough or too much!");
                dev1Address.transfer(dev1Amount);
                dev2Address.transfer(dev2Amount);
                dev3Address.transfer(dev3Amount);
                
                buyAddress.transfer(buyFee);
            }else{
                IERC20 token = IERC20(_pool.harvestFeeToken);
                uint feeBalance = token.balanceOf(address(msg.sender));
                require(feeBalance >= fee, "Fee is not enough!");
                //TODO Test, address or IERC20 type is better for pool.harvestFeeToken
                token.transferFrom(address(msg.sender), address(this), fee);
                
                //TODO Test, need to test if the approve is needed.
                //token.approve(dev1Address, dev1Amount);
                //token.approve(dev2Address, dev2Amount);
                //token.approve(dev3Address, dev3Amount);
                //token.approve(buyAddress, buyFee);
                
                token.transferFrom(address(this), dev1Address, dev1Amount);
                token.transferFrom(address(this), dev2Address, dev2Amount);
                token.transferFrom(address(this), dev3Address, dev3Amount);
                token.transferFrom(address(this), buyAddress, buyFee);
            }
        }
    }
    
    function emergencyStop(address payable _to) public onlyOwner {
        uint addrBalance = sushi.balanceOf(address(this));
        sushi.transfer(_to, addrBalance);
        if(addrBalance > 0){
            sushi.transfer(_to, addrBalance);
        }
        IERC20 hai = IERC20(HAI_ADDRESS);
        addrBalance = hai.balanceOf(address(this));
        if(addrBalance > 0){
            hai.transfer(_to, addrBalance);
        }
        IERC20 hkr = IERC20(HKR_ADDRESS);
        addrBalance = hkr.balanceOf(address(this));
        if(addrBalance > 0){
            hkr.transfer(_to, addrBalance);
        }
        
        //tranfer HT
        _to.transfer(address(this).balance);
        
        uint256 length = poolInfo.length;
        PoolInfo storage pool;
        for (uint256 pid = ZERO; pid < length; ++ pid) {
            closePool(pid);
            
            pool = poolInfo[pid];
            if(pool.operationFeeToken != address(0)){
                addrBalance = IERC20(pool.operationFeeToken).balanceOf(address(this));
                if(addrBalance > 0){
                    IERC20(pool.operationFeeToken).transfer(_to, addrBalance);
                }
            }
            if(pool.harvestFeeToken != address(0)){
                addrBalance = IERC20(pool.harvestFeeToken).balanceOf(address(this));
                if(addrBalance > 0){
                    IERC20(pool.harvestFeeToken).transfer(_to, addrBalance);
                }
            }
        }
        emit EmergencyStop(msg.sender, _to, addrBalance);
    }
    
    function closePool(uint256 _pid) public onlyOwner {
        PoolInfo storage pool = poolInfo[_pid];
        pool.endBlock = block.number;
        emit ClosePool(_pid);
    }
    
    // Safe sushi transfer function, just in case if rounding error causes pool to not have enough SUSHIs.
    function safeSushiTransfer(address _to, uint256 _amount) internal {
        uint256 sushiBal = sushi.balanceOf(address(this));
        if (_amount > sushiBal) {
            sushi.transfer(_to, sushiBal);
        } else {
            sushi.transfer(_to, _amount);
        }
    }

     // Update dev1 address by the previous dev.
    function updateDev1Address(address payable _dev1Address) public {
        require(msg.sender == dev1Address, "dev1: wut?");
        require(_dev1Address != address(0), "address can not be zero!");
        dev1Address = _dev1Address;
        emit UpdateDev1Address(_dev1Address);
    }
    
    // Update dev2 address by the previous dev.
    function updateDev2Address(address payable _dev2Address) public {
        require(msg.sender == dev2Address, "dev2: wut?");
        require(_dev2Address != address(0), "address can not be zero!");
        dev2Address = _dev2Address;
        emit UpdateDev2Address(_dev2Address);
    }
    
    // Update dev3 address by the previous dev.
    function updateDev3Address(address payable _dev3Address) public {
        require(msg.sender == dev3Address, "dev3: wut?");
        require(_dev3Address != address(0), "address can not be zero!");
        dev3Address = _dev3Address;
        emit UpdateDev3Address(_dev3Address);
    }
    
    // Update dev3 address by the previous dev.
    function updateBuyAddress(address payable _buyAddress) public {
        require(msg.sender == buyAddress, "buyAddress: wut?");
        require(_buyAddress != address(0), "address can not be zero!");
        buyAddress = _buyAddress;
        emit UpdateBuyAddress(_buyAddress);
    }
    
    // Add reward for pool from the current block or start block, anyone can add it
    function addRewardForPool(uint256 _pid, uint256 _addSushiPerPool, uint256 _addSushiPerBlock) public {
        require(_addSushiPerPool > 0 || _addSushiPerBlock > 0, "add sushi must be greater than zero!");
        PoolInfo storage pool = poolInfo[_pid];
        require(block.number <= pool.endBlock, "this pool is end!");
        updatePool(_pid);
        uint256 addSushiPerBlock = _addSushiPerBlock;
        uint256 addSushiPerPool = _addSushiPerPool;
        uint256 start = block.number;
        uint256 end = pool.endBlock;
        if(start < pool.startBlock){
            start = pool.startBlock;
        }
        uint256 blockNumber = end.sub(start).add(1);
        if(blockNumber <= 0){
            blockNumber = 1;
        }
        if(addSushiPerBlock <= 0){
            addSushiPerBlock = _addSushiPerPool.div(blockNumber);
        }
        addSushiPerPool = addSushiPerBlock.mul(blockNumber);
        pool.rewardForEachBlock = pool.rewardForEachBlock.add(addSushiPerBlock);
        sushi.transferFrom(address(msg.sender), address(this), addSushiPerPool);
        emit AddRewardForPool(_pid, addSushiPerPool, addSushiPerBlock);
    }
}
