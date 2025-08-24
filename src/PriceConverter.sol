// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

// lib file

library PriceConverter {
    function getPrice(
        AggregatorV3Interface priceFeed
    ) internal view returns (uint256) {
        // contract address: 0x694AA1769357215DE4FAC081bf1f309aDC325306 //sepolia testnet
        // ABI
        //AggregatorV3Interface priceFeed = AggregatorV3Interface(
        //    0x694AA1769357215DE4FAC081bf1f309aDC325306
        //);
        (, int256 price, , , ) = priceFeed.latestRoundData();
        // Price of eth in USD, 4000.00000000 (no decimal)
        return uint256(price * 1e10);
    }

    function getConversionRate(
        uint256 ethAmount,
        AggregatorV3Interface priceFeed
    ) internal view returns (uint256) {
        uint256 ethPrice = getPrice(priceFeed);
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}
