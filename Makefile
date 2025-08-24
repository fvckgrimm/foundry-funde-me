-include .env

build:; forge build

test :; forge test

snapshot :; forge snapshot

format :; forge fmt


deploy:
	forge script script/DeployFundMe.s.sol:DeployFundMe $(NETWORK_ARGS)

NETWORK_ARGS := --fork-url http://localhost:8545 --account $(ACCOUNT) --sender $(SENDER_ADDRESS) --password-file .password --broadcast -vvvv

ifeq ($(findstring --network sepolia,$(ARGS)),--network sepolia)
	NETWORK_ARGS := --rpc-url $(SEPOLIA_RPC_URL) --account $(ACCOUNT) --broadcast -vvvv # --verify --etherscan-api-key (ETHERSCAN_API_KEY)
endif

deploy-sepolia:
	forge script script/DeployFundMe.s.sol:DeployFundMe $(NETWORK_ARGS)



# For deploying Interactions.s.sol:FundFundMe as well as for Interactions.s.sol:WithdrawFundMe we have to include a sender's address `--sender <ADDRESS>`
#SENDER_ADDRESS := 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
 
fund:
	forge script script/Interactions.s.sol:FundFundMe $(NETWORK_ARGS)

withdraw:
	forge script script/Interactions.s.sol:WithdrawFundMe $(NETWORK_ARGS)
